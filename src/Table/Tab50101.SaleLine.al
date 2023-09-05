table 50101 "Sale Line"
{
    Caption = 'Sale Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Option)
        {
            OptionMembers = "","Item","GL";
            Caption = 'Type';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = if (Type = const(Item)) Item."No."
            else
            if (Type = const(GL)) "G/L Account"."No.";

            trigger OnValidate()
            var
                Itm: Record Item;
                GL: Record "G/L Account";
                SL: Record "Sale Line";
            begin
                case Type of
                    Type::GL:
                        begin
                            SL.Reset();
                            SL.SetRange(SL."Document No.", Rec."Document No.");
                            SL.SetRange(SL.Type, Type::GL);
                            SL.SetRange(SL."Item No.", Rec."Item No.");
                            if SL.FindSet() then
                                // repeat
                                //     if SL."Item No." = "Item No." then
                                        Error('GL Entry already exist!');
                            // until SL.Next() = 0;
                            if GL.Get("Item No.") then begin
                                Description := GL.Name;
                                "Unit Price" := GL.Balance;

                            end;

                        end;
                    Type::Item:
                        begin
                            SL.Reset();
                            SL.SetRange(SL."Document No.", Rec."Document No.");
                            SL.SetRange(SL.Type, Type::Item);
                            SL.SetRange(SL."Item No.", Rec."Item No.");
                            if SL.FindSet() then
                                // repeat
                                //     if SL."Item No." = "Item No." then
                                        Error('Item Entry already exist!');
                            // until SL.Next() = 0;
                            if Itm.Get("Item No.") then begin
                                Description := Itm.Description;
                                "Unit Price" := Itm."Unit Price";
                            end;

                        end;

                end;

            end;




        }
        field(5; Description; Text[150])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
        }
        field(7; Quantity; Integer)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                "Line Total" := Quantity * "Unit Price";
            end;
        }
        field(8; "Line Total"; Decimal)
        {
            Caption = 'Total';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
