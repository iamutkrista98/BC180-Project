report 50100 "Sales Report "
{
    ApplicationArea = All;
    Caption = 'Sales Report ';
    UsageCategory = ReportsAndAnalysis;
    // DefaultLayout = RDLC;
    // PreviewMode = PrintLayout;
    // RDLCLayout = 'src/Report/RDLC/SalesReport.rdl';
    ProcessingOnly = true;
    PreviewMode = PrintLayout;
    DefaultLayout = RDLC;

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
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            trigger OnAfterGetRecord()
            var
                PostedSaleHdr: Record "Posted Sale Header";
                PostedSaleLine: Record "Posted Sale Line";
                Cust: Record Customer;

            begin
                if PSaleHdr = '' then
                    Error('Enter the doc you want to update');
                PostedSaleHdr.Reset();
                PostedSaleHdr.SetRange("No.", PSaleHdr);
                if PostedSaleHdr.FindFirst() then begin
                    if CustNo <> '' then begin
                        PostedSaleHdr.SetRange("Customer No.", CustNo);
                        if Cust.Get(CustNo) then begin
                            PostedSaleHdr."Customer Name" := Cust.Name;
                            PostedSaleHdr."Customer No." := Cust."No.";
                            "PostedSaleHdr"."Customer Address" := Cust.Address;
                        end;
                    end;
                    PostedSaleHdr.Modify();
                end;
                Message('Done');

            end;
        }
    }
    requestpage
    {
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
                    field(PSaleHdr; PSaleHdr)
                    {
                        ApplicationArea = All;
                        TableRelation = "Posted Sale Header";
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
        PSaleHdr: Code[20];
}
