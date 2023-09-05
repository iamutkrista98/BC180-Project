pageextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field(salenoseries; Rec.salenoseries)
            {
                ApplicationArea = All;
            }
        }
    }
}
