page 50101 "Header Card"
{
    Caption = 'Header Card';
    PageType = Card;
    SourceTable = "Header Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Visible = Visibility;
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';



                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ShowMandatory = Rec."Customer No." = '';
                }

                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Type field.';
                }


            }
            group("Sales Line")
            {
                part("SaleLine"; "Sale Line")
                {
                    SubPageLink = "Document No." = field("No.");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                    Caption = 'Sales Line Per Order';

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Post;

                trigger OnAction()
                var
                    PurchMgt: Codeunit "Purchase Management";
                    SaleHdr: Record "Header Table";
                begin
                    if Confirm('Are you sure you want to post?', true) then begin
                        PurchMgt.PostPurchToPostedPurch(Rec."No.");
                        Message('Posted Successfully, Posting Action Run By: %1', UserId);
                        CurrPage.Close();

                    end

                    else
                        Error('Posting Process Cancelled by End User!');

                end;

            }
            action(MakeVisible)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = ShowList;

                trigger OnAction()
                begin
                    Visibility := True;
                end;


            }
            action(CalcSum)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = Totals;
                trigger OnAction()
                var
                    SaleLine: Record "Sale Line";
                    sumamt: Decimal;
                begin
                    SaleLine.Reset();
                    sumamt := 0;
                    SaleLine.SetRange("Document No.", Rec."No.");
                    if SaleLine.FindSet() then
                        repeat
                            sumamt += SaleLine."Line Total";
                        until SaleLine.Next() = 0;
                    Message('The total sum is %1', sumamt);



                end;
            }
            action(CalculateSalesAmount)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    PostedSaleHdr: Record "Posted Sale Header";
                    tot: Decimal;
                begin
                    PostedSaleHdr.Reset();
                    PostedSaleHdr.SetRange("Member Type", "Member Type"::Gold);
                    PostedSaleHdr.SetFilter("Customer No.", '%1', '01445544');
                    if PostedSaleHdr.FindSet() then
                        repeat
                            tot += PostedSaleHdr."Total Amount";
                        until PostedSaleHdr.Next() = 0;
                    Message('The total of gold member is %1', tot);


                end;
            }
        }
    }

    var
        Visibility: Boolean;


        field1: Code[20];
        field2: Code[20];


    trigger OnOpenPage()
    begin
        // if CompanyName = 'Utkrista' then
        //     Visibility := True
        // else
        //     Visibility := False;
        Visibility := False;
    end;


}
