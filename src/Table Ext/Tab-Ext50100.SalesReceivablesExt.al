tableextension 50100 "Sales & Receivables Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; salenoseries; Code[20])
        {
            Caption = 'salenoseries';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
