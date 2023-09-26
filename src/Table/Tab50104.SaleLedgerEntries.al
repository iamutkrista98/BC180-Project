table 50104 "Sale Ledger Entries"
{
    Caption = 'Sale Ledger Entries';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No';
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(4; "Quantity"; Integer)
        {
            Caption = 'Quantity';
        }
        field(5; Total; Decimal)
        {
            Caption = 'Total';
        }
        field(6; "Total Inc. VAT"; Decimal)
        {
            Caption = 'Total Inc. VAT';
        }
        field(7; Type; Option)
        {
            OptionMembers = "","Item","GL";


        }
        field(8; Inventory; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = sum("Posted Sale Line".Quantity where("Item No." = field("Item No.")));

        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
