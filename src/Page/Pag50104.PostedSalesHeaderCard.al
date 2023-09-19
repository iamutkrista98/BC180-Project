page 50104 "Posted Sales Header Card"
{
    Caption = 'Posted Sales Header Card';
    PageType = Card;
    SourceTable = "Posted Sale Header";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
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
            group("Posted Sale Line")
            {
                part("Posted Sale Line Entries"; "Posted Sale Line List")
                {
                    ApplicationArea = All;
                    SubPageLink = "Document No." = field("No.");
                    UpdatePropagation = Both;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Generate Report")
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PostedHdr: Record "Posted Sale Header";
                begin
                    PostedHdr.SetRange("No.", Rec."No.");
                    if PostedHdr.FindFirst() then
                        Report.Run(Report::"Sales Report ", true, true, PostedHdr);
                end;
            }
        }
    }
}
