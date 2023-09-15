pageextension 50107 "Sales Line Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter(Type)
        {
            field("Tax Amount"; Rec."Tax Amount")
            {
                ApplicationArea = All;

            }
        }
    }
}
