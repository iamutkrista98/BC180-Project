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
        }
    }
}
