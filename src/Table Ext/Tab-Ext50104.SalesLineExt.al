tableextension 50104 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50100; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DataClassification = ToBeClassified;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                PurchPay: Record "Purchases & Payables Setup";
                Item: Record Item;
            begin
                if Type = Type::Item then
                    Item.Get("No.");
                "Tax Amount" := Quantity * (Item."Unit Price" * (13 / 100)) + Item."Unit Price";
            end;

        }
    }

}
