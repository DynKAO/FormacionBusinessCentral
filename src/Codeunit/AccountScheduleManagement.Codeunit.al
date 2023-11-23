codeunit 50101 "BZ Account Schedule Management"
{
    procedure CopyFinancialReport(FinancialReportCode: Code[10])
    var
        financialReport: Record "Financial Report";
        notFoundErr: Label '%1 was not found', Comment = '%1 Financial Report TableCaption';
    begin
        if FinancialReportCode = '' then
            Error(notFoundErr, financialReport.TableCaption());
        financialReport.Get(FinancialReportCode);
        //to-do
    end;
}