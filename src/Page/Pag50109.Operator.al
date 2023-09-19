page 50109 Operator
{
    Caption = 'Operator';
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            group("TestVisibility")
            {
                Visible = Visibility;

                field(field1; field1)
                {
                    ApplicationArea = All;

                }
                field(field2; field2)
                {
                    ApplicationArea = All;

                }
                field(field3; field3)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

            }
        }
    }


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
            action(DateAddition)
            {
                Caption = 'Date Addition';
                Image = Calendar;
                ApplicationArea = All;
                Promoted = true;
                trigger OnAction()
                begin
                    Message('The date is %1', StartDate + 33);
                end;
            }
            action(CalculateTotal)
            {
                Caption = 'Calculate Total';
                Image = Totals;
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    PSL: Record "Posted Sale Line";
                    trs: Decimal;
                    rdate: Date;
                begin
                    rdate := CalcDate('<1Y+1M+1D>', StartDate);
                    Message('The new date is: %1', rdate);


                end;
            }
            action(FindingLast)
            {
                ApplicationArea = All;
                Image = Find;
                Promoted = true;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    Cust.SetFilter(Cust."Location Code", 'YELLOW');
                    Cust.SetFilter(Cust.Name, '@R*');
                    if Cust.FindLast() then
                        Message('The name is: %1 and Address is: %2', Cust.Name, Cust.Address)
                    else
                        Message('No Such Record Found!');



                end;
            }
            action(MakeVisibile)
            {
                ApplicationArea = All;
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Visibility := True;
                end;
            }
            action(GetUser)
            {
                ApplicationArea = All;
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                begin
                    if UserSetup.Get(UserId) then
                        Message('The current user is: %1 and you have the permission status %2', UserId, UserSetup."Allow Posting Permission")
                    else
                        Message('Some Unexpected Error Getting The Current User!');
                end;
            }
        }
    }
    var
        StartDate: Date;
        BillToCust: Code[20];
        OriginalBalance: Decimal;

        field1: Code[20];
        field2: Code[20];
        Visibility: Boolean;
        field3: Text[10];

    trigger OnOpenPage()
    begin
        StartDate := 20230101D;
        BillToCust := '10000';
        Visibility := False;
    end;
}
