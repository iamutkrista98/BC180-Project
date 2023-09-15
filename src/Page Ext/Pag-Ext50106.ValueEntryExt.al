pageextension 50106 ValueEntryExt extends "Value Entries"
{
    layout
    {
        addafter("Document Type")
        {
            field("Line Tax Amt."; Rec."Line Tax Amt.")
            {
                ApplicationArea = All;

            }
        }
    }
}
