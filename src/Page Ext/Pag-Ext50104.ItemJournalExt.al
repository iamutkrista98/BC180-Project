pageextension 50104 ItemJournalExt extends "Item Journal"
{
    layout
    {
        addafter(Amount)
        {
            field("Tax Amt"; Rec."Tax Amt")
            {
                ApplicationArea = All;
            }
        }
    }
}
