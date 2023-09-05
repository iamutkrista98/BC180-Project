page 50109 Operator
{
    Caption = 'Operator';
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;


    actions
    {
        area(Processing)
        {
            action(ProgressBar)
            {
                ApplicationArea = All;
                Caption = 'Progress Window';
                Image = Action;

                trigger OnAction()
                var
                    ProgressWindow: Dialog;
                    Cnt: Integer;
                    Message: Label 'Processing...';

                begin
                    Clear(Cnt);
                    if not GuiAllowed then exit;
                    ProgressWindow.Open(Message);
                    for Cnt := 0 to 100 do begin
                        ProgressWindow.Update(1, Cnt);
                        Sleep(70);
                    end;
                    ProgressWindow.Close();
                end;
            }
            action(GetLocation)
            {
                Caption = 'Get Location';
                Image = Map;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetLoc: Codeunit Geolocation;
                    Long: Decimal;
                    Lat: Decimal;
                begin
                    GetLoc.SetHighAccuracy(true);
                    GetLoc.RequestGeolocation();
                    GetLoc.GetGeolocation(Lat, Long);
                    Message('The Latitude is %1, and longitude is %1', Lat, Long);
                end;



            }
            action(SetRangePractice)
            {
                Caption = 'SetRange';
                Image = Action;
                ApplicationArea = All;

                Promoted = true;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    Cust.SetRange(Cust."No.", BillToCust);
                    Cust.SetRange("Date Filter", 0D, StartDate - 1);
                    OriginalBalance := 0;
                    if Cust.FindSet() then
                        repeat
                            OriginalBalance += Cust."Balance (LCY)";
                        until Cust.Next() = 0;
                    Message('The opening balance is: %1', OriginalBalance);
                end;

            }
        }
    }


    var
        StartDate: Date;
        BillToCust: Code[20];
        OriginalBalance: Decimal;

    trigger OnOpenPage()
    begin
        StartDate := 20230101D;
        BillToCust := '10000';
    end;


}
