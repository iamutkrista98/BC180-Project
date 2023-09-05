table 50103 "Posted Sale Line"
{
    Caption = 'Posted Sale Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Option)
        {
            OptionMembers = "","Item","GL";
            Caption = 'Type';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';

        }
        field(5; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(6; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(7; Quantity; Integer)
        {
            Caption = 'Quantity';

        }
        field(8; "Line Total"; Decimal)
        {
            Caption = 'Total';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
