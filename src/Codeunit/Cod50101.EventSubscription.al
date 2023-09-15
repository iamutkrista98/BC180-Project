codeunit 50101 "Event Subscription"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnBeforeInsertGLEntry', '', false, false)]
    local procedure OnPostGLAccOnBeforeInsertGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GenJournalLine.TestField(Training);
        GLEntry.Training := GenJournalLine.Training;
        GLEntry."Tax Sum" := GenJournalLine."Sum of Tax";

    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    var
        SalesLine: Record "Sales Line";
        SumAmt: Decimal;
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                SumAmt += SalesLine."Tax Amount";
            until SalesLine.Next() = 0;
        GenJournalLine."Sum of Tax" := SumAmt;
        GenJournalLine.Training := 'Test';


    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."Tax Amt" := SalesLine."Tax Amount";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."Line Tax Amt" := ItemJournalLine."Tax Amt";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', false, false)]
    local procedure OnBeforeInsertValueEntry(ItemJournalLine: Record "Item Journal Line"; var ValueEntry: Record "Value Entry")
    begin
        ValueEntry."Line Tax Amt." := ItemJournalLine."Tax Amt";

    end;

}
