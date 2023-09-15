pageextension 50103 "Gen Ledger Entry Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {
            field(Test; Rec.Test)
            {
                ApplicationArea = All;
            }
            field("Tax Sum"; Rec."Tax Sum")
            {
                ApplicationArea = All;

            }
            field(Training; Rec.Training)
            {
                ApplicationArea = All;
            }
        }
    }
}
