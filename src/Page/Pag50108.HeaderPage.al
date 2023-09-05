page 50108 "Header Page"
{
    APIGroup = 'custom';
    APIPublisher = 'utkrista';
    APIVersion = 'v2.0';
    Caption = 'headerPage';
    DelayedInsert = true;
    EntityName = 'headers';
    EntitySetName = 'header';
    PageType = API;
    SourceTable = "Header Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(customerAddress; Rec."Customer Address")
                {
                    Caption = 'Customer Address';
                }
                field(totalAmount; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                }
                field(paymentType; Rec."Payment Type")
                {
                    Caption = 'Payment Method';
                }
                field(memberType; Rec."Member Type")
                {
                    Caption = 'Member Type';
                }
            }
        }
    }
}
