table 50100 "Header Table"
{
    Caption = 'Header Table';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Header List";
    LookupPageId = "Header List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSerMgt: Codeunit NoSeriesManagement;
            begin
                if Rec."No." <> xRec."No." then
                    SalesSetup.Get();
                SalesSetup.TestField(SalesSetup.salenoseries);
                NoSerMgt.SetSeries("No.");

            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No." where(Blocked = filter(<> 'All'));
            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                if Cust.Get("Customer No.") then begin
                    "Customer Name" := Cust.Name;
                    "Customer Address" := Cust.Address;
                end
                else begin
                    "Customer Name" := '';
                    "Customer Address" := '';
                end;

            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(4; "Customer Address"; Text[150])
        {
            Caption = 'Customer Address';
            Editable = false;
        }
        field(5; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Sale Line"."Line Total" where("Document No." = field("No.")));
            Editable = false;
        }
        field(6; "Payment Type"; Option)
        {
            OptionMembers = "","Cash","Esewa","Khalti","Credit";

            Caption = 'Payment Method';
            trigger OnValidate()
            begin
                case "Payment Type" of
                    "Payment Type"::Cash:
                        "Member Type" := "Member Type"::Platinum;
                    "Payment Type"::Esewa:
                        "Member Type" := "Member Type"::Gold;
                    "Payment Type"::Khalti:
                        "Member Type" := "Member Type"::Silver;
                    "Payment Type"::Credit:
                        "Member Type" := "Member Type"::Bronze;
                end;




            end;
        }
        field(7; "Member Type"; Enum "Member Type")
        {
            Caption = 'Member Type';
            Editable = false;
        }
        field(8; "saleno"; Code[20])
        {



        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSerMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup.salenoseries);
            Clear(NoSerMgt);
            //NoSerMgt.InitSeries(SalesSetup.salenoseries, xRec.saleno, 0D, "No.", Rec.saleno);
            NoSerMgt.InitSeries(SalesSetup.salenoseries, xRec.saleno, 0D, "No.", Rec.saleno);
        end;

    end;
}
