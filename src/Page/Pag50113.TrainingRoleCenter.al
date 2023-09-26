page 50113 "Training Role Center"
{
    Caption = 'Training Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            group("Training Group ")
            {

                part(PostedSales; "Posted Sale Line List")
                {

                }
            }
        }
    }

}
profile Training
{
    ProfileDescription = 'Training';
    RoleCenter = "Training Role Center";
    Caption = 'Training';

}
