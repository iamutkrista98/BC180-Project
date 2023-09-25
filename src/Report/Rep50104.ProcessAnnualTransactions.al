report 50104 ProcessAnnualTransactions
{
    ApplicationArea = All;
    Caption = 'ProcessAnnualTransactions';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Customer; "Customer")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }

            trigger OnAfterGetRecord()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filters)
                {
                    field(ExpenseGLAcc; ExpenseGLAcc)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(FeesIncomeGLAcc; FeesIncomeGLAcc)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(TaxGLAcc; TaxGLAcc)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(PaymentGLAcc; PaymentGLAcc)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
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
        ExpenseGLAcc: Code[20];
        FeesIncomeGLAcc: Code[20];
        TaxGLAcc: Code[20];
        PaymentGLAcc: Code[20];
}
