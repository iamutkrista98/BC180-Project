pageextension 50102 GeneralJournalExt extends "General Journal"
{
    layout
    {
        addafter(Amount)
        {
            field(Training; Rec.Training)
            {
                ApplicationArea = All;
            }
            field("Sum of Tax"; Rec."Sum of Tax")
            {
                ApplicationArea = All;
            }

        }
    }
}
