tableextension 50101 "User Setup Ext" extends "User Setup"
{
    fields
    {
        field(50100; "Allow Posting Permission"; Boolean)
        {
            Caption = 'Allow Posting Permission';
            DataClassification = ToBeClassified;
        }
        field(50101; "Journal Template Name"; Code[20])
        {

            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(50102; "Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch";

        }

    }
}
