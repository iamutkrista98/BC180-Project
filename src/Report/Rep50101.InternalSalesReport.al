report 50101 "Internal Sales Report"
{
    ApplicationArea = All;
    Caption = 'Internal Sales Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Report/RDLC/InternalSalesReport.rdl';
    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }

            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Order_No_; "Order No.")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(sno; sno)
            {

            }
            column(CompPicture; CompInfo.Picture)
            {

            }
            column(CompName; CompInfo.Name)
            {

            }
            column(CompAddress; CompInfo.Address)
            {

            }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Sales Shipment Header";
                // DataItemTableView = sorting("Document No.", "Location Code");

                column(ItemNo; "No.")
                {

                }
                column(Description; "Sales Invoice Line".Description)
                {

                }
                column(Quantity; "Sales Invoice Line".Quantity)
                {

                }
                column(Shipment_Date; "Sales Invoice Line"."Shipment Date")
                {

                }



                // trigger OnPreDataItem()
                // begin
                //     if (RequestType = '') then
                //         Error('Request Type in Report Filter not Applied!')
                //     else
                //         "Sales Invoice Line".SetRange(Type, Type::Item);

                // end;


            }

            //for sale shipment header
            trigger OnPreDataItem()
            begin
                sno := 0;
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                sno += 1;
            end;

        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(FilterPage)
                {
                    // field(RequestType; RequestType)
                    // {
                    //     ApplicationArea = All;
                    //     TableRelation = "Sales Shipment Line".Type;

                    // }
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
        RequestType: Text;
        sno: Integer;
        CompInfo: Record "Company Information";
}
