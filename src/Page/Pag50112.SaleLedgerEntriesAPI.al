page 50112 SaleLedgerEntriesAPI
{
    APIGroup = 'custom';
    APIPublisher = 'utkrista';
    APIVersion = 'v2.0';
    Caption = 'saleLedgerEntriesAPI';
    DelayedInsert = true;
    EntityName = 'saleledgers';
    EntitySetName = 'saleledger';
    PageType = API;
    SourceTable = "Sale Ledger Entries";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No';
                }
                field(documentNo; Rec."Document No")
                {
                    Caption = 'Document No';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(total; Rec.Total)
                {
                    Caption = 'Total';
                }
                field(totalIncVAT; Rec."Total Inc. VAT")
                {
                    Caption = 'Total Inc. VAT';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
            }
        }
    }
}
