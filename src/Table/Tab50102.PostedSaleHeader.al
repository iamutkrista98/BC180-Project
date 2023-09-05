table 50102 "Posted Sale Header"
{
    Caption = 'Posted Sale Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";

        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';

        }
        field(4; "Customer Address"; Text[150])
        {
            Caption = 'Customer Address';
        }
        field(5; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';

        }
        field(6; "Payment Type"; Option)
        {
            OptionMembers = "","Cash","Esewa","Khalti","Credit";

            Caption = 'Payment Method';
        }
        field(7; "Member Type"; Enum "Member Type")
        {
            Caption = 'Member Type';
        }
        field(8; "saleno"; Code[20])
        {

        }


    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


}
