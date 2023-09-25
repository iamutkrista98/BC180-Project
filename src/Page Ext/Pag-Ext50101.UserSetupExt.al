pageextension 50101 "User Setup Ext" extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Allow Posting Permission"; Rec."Allow Posting Permission")
            {
                ApplicationArea = All;
            }
            field("Journal Template Name"; Rec."Journal Template Name")
            {
                ApplicationArea = All;
            }
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
