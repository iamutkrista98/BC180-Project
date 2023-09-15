pageextension 50105 ItemLedgerEntryExt extends "Item Ledger Entries"
{
    layout
    {
        addafter("Entry Type")
        {
            field("Line Tax Amt"; Rec."Line Tax Amt")
            {
                ApplicationArea = All;

            }
        }
    }
}
