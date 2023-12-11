#if UNTIL17
#else
#if onprem
pageextension 7190105 "BZ Financial Reports" extends "Financial Reports"
#else
pageextension 50105 "BZ Financial Reports" extends "Financial Reports"
#endif
{
    actions
    {
        addbefore(CopyFinancialReport)
        {
            action("BZ Copy Financial Reports")
            {
                ApplicationArea = All;
                Caption = 'Copy Financial Reports';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create a copy of the current financial report.';
                Ellipsis = true;
                Image = InsuranceRegisters;

                trigger OnAction()
                var
                    AccScheduleMgt: Codeunit "BZ Account Schedule Management";
                begin
                    AccScheduleMgt.CopyFinancialReport(rec.Name);
                end;
            }
        }
    }
}
#endif