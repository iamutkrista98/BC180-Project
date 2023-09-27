page 50102 "Sale Line"
{
    Caption = 'Sale Line';
    PageType = ListPart;
    SourceTable = "Sale Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemRec: Record Item;
                        GLRec: Record "G/L Account";
                    begin
                        case Rec.Type of
                            Rec.Type::GL:
                                if Page.RunModal(Page::"G/L Account List", GLRec) = Action::LookupOK then begin
                                    Rec."Item No." := GLRec."No.";
                                    Rec.Description := GLRec.Name;

                                end;

                            Rec.Type::Item:
                                if Page.RunModal(Page::"Item List", ItemRec) = Action::LookupOK then begin
                                    Rec."Item No." := ItemRec."No.";
                                    Rec.Description := ItemRec.Description;
                                end;
                        end;
                    end;


                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemRec: Record Item;
                    begin
                        ItemRec.Reset();
                        if Page.RunModal(Page::"Item List", ItemRec) = Action::LookupOK then
                            Rec.Quantity := ItemRec.Inventory;
                    end;
                }
                field("Line Total"; Rec."Line Total")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Total field.';
                }
            }
        }
    }
}
