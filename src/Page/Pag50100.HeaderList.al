page 50100 "Header List"
{
    ApplicationArea = All;
    Caption = 'Header List';
    PageType = List;
    SourceTable = "Header Table";
    UsageCategory = Lists;
    CardPageId = "Header Card";

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

    // trigger OnOpenPage()
    // var
    //     Item: Record "Header Table";
    //     FilterPage: FilterPageBuilder;
    //     FilterPageCaption: TextConst ENU = 'Sale Header Filter';

    // begin
    //     FilterPage.AddTable(Item.TableCaption(), Database::"Header Table");
    //     FilterPage.AddRecord(Item.TableCaption(), Item);
    //     FilterPage.AddField(Item.TableCaption(), Item."Customer No.", '>100');
    //     FilterPage.PageCaption := FilterPageCaption;
    //     FilterPage.RunModal();


    // end;
}
