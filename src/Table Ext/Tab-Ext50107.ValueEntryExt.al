tableextension 50107 ValueEntryExt extends "Value Entry"
{
    fields
    {
        field(50100; "Line Tax Amt."; Decimal)
        {
            Caption = 'Line Tax Amt.';
            DataClassification = ToBeClassified;
        }
        modify("Entry Type")
        {
            Caption = 'Entry Designation';
        }
    }

}
