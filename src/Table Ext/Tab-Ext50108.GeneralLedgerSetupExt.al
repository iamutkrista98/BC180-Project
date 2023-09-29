tableextension 50108 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    fields
    {
        field(50100; "Cust Jnl Template"; Code[20])
        {
            Caption = 'Cust Jnl Template';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50101; "Cust Jnl Batch"; Code[20])
        {
            Caption = 'Cust Jnl Batch';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Cust Jnl Template"));
        }
        field(50102; "Cust Account No."; Code[20])
        {
            Caption = 'Cust Account No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(50103; "Cust Bal Account No."; Code[20])
        {
            Caption = 'Cust Bal Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }
}
