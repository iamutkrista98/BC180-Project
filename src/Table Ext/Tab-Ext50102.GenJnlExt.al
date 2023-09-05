tableextension 50102 GenJnlExt extends "Gen. Journal Line"
{
    fields
    {
        field(50100; Training; Text[20])
        {
            Caption = 'Training';
            DataClassification = ToBeClassified;
        }
        field(50101; "Sum of Tax"; Decimal)
        {
            Caption = 'Sum of Tax';
            DataClassification = ToBeClassified;
        }
    }
}
