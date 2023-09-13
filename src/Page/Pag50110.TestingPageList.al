page 50110 "Testing Page List"
{
    ApplicationArea = All;
    Caption = 'Testing Page List';
    PageType = List;
    SourceTable = "Testing Table";
    UsageCategory = Lists;
    CardPageId = "Testing Page Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address field.';
                }
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(GetData)
    //         {
    //             ApplicationArea = All;
    //             Image = GetEntries;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             var
    //                 PostedSaleHdr: Record "Posted Sale Header";
    //                 PostedSaleLine: Record "Posted Sale Line";
    //                 TestTable: Record "Testing Table";

    //             begin
    //                 TestTable.Init();
    //                 if TestTable.FindLast() then
    //                     TestTable."Entry No." += 1
    //                 else
    //                     TestTable."Entry No." := 1;

    //                 TestTable."Document No." := PostedSaleLine."Document No.";
    //                 TestTable."Customer No." := PostedSaleLine."Document No.";
    //                 TestTable.Insert(true);

    //             end;

    //         }
    //     }
    // }
}
