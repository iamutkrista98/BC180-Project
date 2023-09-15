tableextension 50103 GenLedEntry extends "G/L Entry"
{
    fields
    {
        field(50100; Training; Text[20])
        {
            Caption = 'Training';
            DataClassification = ToBeClassified;
        }
        field(50101; "Tax Sum"; Decimal)
        {
            Caption = 'Tax Sum';
            DataClassification = ToBeClassified;
        }
        field(50102; Test; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Sale Line"."Line Total" where(Type = const(GL), "Item No." = field("G/L Account No.")));
        }

    }
}
