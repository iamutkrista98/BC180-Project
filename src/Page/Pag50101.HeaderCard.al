page 50101 "Header Card"
{
    Caption = 'Header Card';
    PageType = Card;
    SourceTable = "Header Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Visible = Visibility;
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';



                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ShowMandatory = Rec."Customer No." = '';
                }

                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Type field.';
                }


            }
            group("Sales Line")
            {
                part("SaleLine"; "Sale Line")
                {
                    SubPageLink = "Document No." = field("No.");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                    Caption = 'Sales Line Per Order';

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Post;

                trigger OnAction()
                var
                    PurchMgt: Codeunit "Purchase Management";
                    SaleHdr: Record "Header Table";
                begin
                    if Confirm('Are you sure you want to post?', true) then begin
                        PurchMgt.PostPurchToPostedPurch(Rec."No.");
                        Message('Posted Successfully, Posting Action Run By: %1', UserId);

                    end

                    else
                        Error('Posting Process Cancelled by End User!');

                end;

            }
            action(MakeVisible)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = ShowList;

                trigger OnAction()
                begin
                    Visibility := True;
                end;


            }
        }
    }

    var
        Visibility: Boolean;


        field1: Code[20];
        field2: Code[20];


    trigger OnOpenPage()
    begin
        // if CompanyName = 'Utkrista' then
        //     Visibility := True
        // else
        //     Visibility := False;
        Visibility := False;
    end;


}
