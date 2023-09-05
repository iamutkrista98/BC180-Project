page 50103 "Posted Sales Header List"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Header List';
    PageType = List;
    SourceTable = "Posted Sale Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Posted Sales Header Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
        }
    }
}
