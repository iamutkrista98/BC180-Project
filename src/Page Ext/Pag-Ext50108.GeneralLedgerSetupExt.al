pageextension 50108 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field("Cust Jnl Template"; Rec."Cust Jnl Template")
            {
                ApplicationArea = All;
            }
            field("Cust Jnl Batch"; Rec."Cust Jnl Batch")
            {
                ApplicationArea = All;
            }
            field("Cust Account No."; Rec."Cust Account No.")
            {
                ApplicationArea = All;
            }
            field("Cust Bal Account No."; Rec."Cust Bal Account No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
