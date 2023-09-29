//codeunit for posting
codeunit 50100 "Purchase Management"
{
    procedure PostPurchToPostedPurch(PurchCode: Code[20])
    var
        SaleHdr: Record "Header Table";
        SaleLine: Record "Sale Line";
        PostedSaleHdr: Record "Posted Sale Header";
        PostedSaleLine: Record "Posted Sale Line";
        totalAmount: Decimal;


    begin
        if checkUserPermission(UserId) = false then
            Error('You lack the privileges for the current action!');
        if SaleHdr.Get(PurchCode) then begin
            SaleHdr.TestField("Customer Name");
            if (SaleHdr."Member Type" = SaleHdr."Member Type"::Bronze) then
                Error('Bronze Member Record Can''t be posted!');
            PostedSaleHdr.Init();
            PostedSaleHdr.TransferFields(SaleHdr);
            PostedSaleHdr.Insert(true);
            SaleLine.Reset();
            SaleLine.SetRange("Document No.", SaleHdr."No.");
            if SaleLine.FindSet() then
                repeat
                    PostedSaleLine.Init();
                    PostedSaleLine.TransferFields(SaleLine);
                    PostedSaleLine.Insert(true);
                    totalAmount += SaleLine."Line Total";
                    InsertIntoSaleLedger(SaleLine);
                until SaleLine.Next() = 0;
            PostedSaleHdr."Total Amount" := totalAmount;
            PostedSaleHdr.Modify();
            SaleLine.DeleteAll();
            SaleHdr.Delete();
            if not Confirm('Would you like to open the posted sales document?', false) then
                exit;
            Page.Run(Page::"Posted Sales Header Card", PostedSaleHdr);


        end;



    end;

    local procedure CalculateVatTotal(var vatTotal: Decimal; LineTotal: Decimal)
    begin
        vatTotal := LineTotal + 0.13 * LineTotal;
    end;

    local procedure checkUserPermission(UserId: Text): Boolean
    var
        Perm: Record "User Setup";
    begin
        if Perm.Get(UserId) then begin
            if Perm."Allow Posting Permission" = true then
                exit(true)
            else
                exit(false);
        end;
    end;

    local procedure InsertIntoSaleLedger(SaleLine: Record "Sale Line")
    var
        SaleLedger: Record "Sale Ledger Entries";
        vatTotal: Decimal;
        Itm: Record Item;
        Line: Record "Gen. Journal Line";
        GJLine: Record "Gen. Journal Line";
        GenJnlPost: Codeunit "Gen. Jnl.-Post Line";
        lineNo: Integer;
        GLSetup: Record "General Ledger Setup";
        custNo: Code[20];



    begin
        SaleLedger.Init();
        if SaleLedger.FindLast() then
            SaleLedger."Entry No." += 1
        else
            SaleLedger."Entry No." := 1;
        SaleLedger."Document No" := SaleLine."Document No.";
        SaleLedger."Item No." := SaleLine."Item No.";
        SaleLedger.Quantity := SaleLine.Quantity;
        SaleLedger.Total := SaleLine."Line Total";
        SaleLedger.Type := SaleLine.Type;
        CalculateVatTotal(vatTotal, SaleLine."Line Total");
        SaleLedger."Total Inc. VAT" := vatTotal;
        SaleLedger.Insert(true);
        GLSetup.Get();
        lineNo := 0;


        GJLine.Reset();
        GJLine.SetRange("Journal Template Name", GLSetup."Cust Jnl Template");
        GJLine.SetRange("Journal Batch Name", GLSetup."Cust Jnl Batch");
        if GJLine.FindLast() then
            lineNo := GJLine."Line No." + 10000
        else
            lineNo := 10000;

        //debit line
        Line.Init();
        Line.Validate("Line No.", lineNo);
        Line.Validate(Line."Journal Template Name", GLSetup."Cust Jnl Template");
        Line.Validate(Line."Journal Batch Name", GLSetup."Cust Jnl Batch");
        Line.Validate("Posting Date", Today);
        Line.Validate("Document No.", SaleLedger."Document No");
        getCustomerNoFromSaleLedger(SaleLedger."Document No", custNo);
        Line.Validate("Account Type", Line."Account Type"::Customer);
        Line.Validate("Account No.", custNo);
        Line.Validate(Amount, SaleLine."Line Total");
        Line.Training := 'Training';
        Line.Insert(true);
        GenJnlPost.RunWithCheck(Line);

        //credit line
        Line.Init();
        Line.Validate("Line No.", lineNo + 10000);
        Line.Validate(Line."Journal Template Name", GLSetup."Cust Jnl Template");
        Line.Validate(Line."Journal Batch Name", GLSetup."Cust Jnl Batch");
        Line.Validate("Posting Date", Today);
        Line.Validate("Document No.", SaleLedger."Document No");
        Line.Validate("Account Type", Line."Account Type"::"G/L Account");
        Line.Validate("Account No.", GLSetup."Cust Bal Account No.");
        Line.Validate(Amount, -SaleLine."Line Total");
        Line.Training := 'Training';
        Line.Insert(true);
        GenJnlPost.RunWithCheck(Line);


        // Line.Init();
        // Line.Validate("Line No.", lineNo + 10000);
        // Line.Validate("Posting Date", Today);
        // Line.Validate("Document Type", Line."Document Type"::" ");
        // Line.Validate("Document No.", SaleLine."Document No.");
        // Line.Validate("Account Type", Line."Account Type"::"G/L Account");
        // Line.Validate("Account No.", GLSetup."Cust Bal Account No.");
        // Line.Validate(Amount, -SaleLine."Line Total");
        // Line.Insert(true);
        // Line.Training := 'Training';


    end;

    local procedure getCustomerNoFromSaleLedger(DocumentNo: Code[20]; var CustNo: Code[20])
    var
        SaleHdr: Record "Header Table";
    begin
        if SaleHdr.Get(DocumentNo) then
            CustNo := SaleHdr."Customer No.";
    end;
}
