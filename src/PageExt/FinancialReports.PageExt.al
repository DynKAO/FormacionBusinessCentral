pageextension 50105 "BZ Financial Reports" extends "Financial Reports"
{
    actions
    {
        addbefore(EditColumnGroup)
        {
            action("BZ Copy Financial Reports")
            {
                ApplicationArea = All;
                Caption = 'Copy Financial Reports';
                ToolTip = 'Copy Financial Reports';
                Ellipsis = true;
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Category4;

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