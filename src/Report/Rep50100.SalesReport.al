report 50100 "Sales Report "
{
    ApplicationArea = All;
    Caption = 'Sales Report ';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    RDLCLayout = 'src/Report/RDLC/SalesReport.rdl';

    dataset
    {
        dataitem("Posted Sale Header"; "Posted Sale Header")
        {
            PrintOnlyIfDetail = true;
            DataItemTableView = sorting("No.");
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Customer_Address; "Customer Address")
            {

            }
            column(No_; "No.")
            {

            }
            column(serialno; serialno)
            {

            }
            column(CompName; CompInfo.Name)
            {

            }
            column(CompAddress; CompInfo.Address)
            {

            }
            column(CompImage; CompInfo.Picture)
            {

            }

            dataitem("Posted Sale Line"; "Posted Sale Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") //where(Type = const(Item));
                ;

                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Line_Total; "Line Total")
                {

                }
                column(Type; Type)
                {

                }


            }
            trigger OnPreDataItem()
            begin
                serialno := 0;
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
                if (CustNo <> '') then begin
                    "Posted Sale Header".SetRange("Posted Sale Header"."Customer No.", CustNo);
                end
                else
                    // "Posted Sale Header".Reset();
                    if not "Posted Sale Header".FindSet() then
                        Error('Record Not Found!');
            end;

            trigger OnAfterGetRecord()
            begin
                serialno += 1;

            end;



        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group("Sale Filter")
                {
                    field("Customer No"; "CustNo")
                    {
                        TableRelation = Customer."No.";
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        CustNo: Code[20];
        serialno: Integer;
        CompInfo: Record "Company Information";
}
