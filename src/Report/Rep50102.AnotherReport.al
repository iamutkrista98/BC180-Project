report 50102 AnotherReport
{
    ApplicationArea = All;
    Caption = 'AnotherReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Report/RDLC/AnotherReport.rdl';
    dataset
    {
        dataitem("Posted Sale Header"; "Posted Sale Header")
        {
            PrintOnlyIfDetail = true;
            column(No_; "No.")
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Member_Type; "Member Type")
            {

            }
            column(CompAddr; CompInfo.Address)
            {

            }
            column(CompPhone; CompInfo."Phone No.")
            {

            }
            column(CompLogo; CompInfo.Picture)
            {

            }

            dataitem("Posted Sale Line"; "Posted Sale Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Item_No_; "Item No.")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Type; Type)
                {

                }
                column(Line_Total; "Line Total")
                {

                }
                column(ItemDes; Itm.Description)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Itm.Get("Item No.")
                end;
            }


            //for sales header

            trigger OnPreDataItem()
            begin
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
                if DocNo <> '' then begin
                    "Posted Sale Header".SetRange("No.", DocNo);
                end
                else
                    Error('Document No is mandatory!');

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(FilterOptions)
                {
                    Caption = 'Filterr Options';
                    field(DocNo; DocNo)
                    {
                        ApplicationArea = All;
                        TableRelation = "Posted Sale Header"."No.";
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
        DocNo: Code[20];
        CompInfo: Record "Company Information";
        Itm: Record Item;
}
