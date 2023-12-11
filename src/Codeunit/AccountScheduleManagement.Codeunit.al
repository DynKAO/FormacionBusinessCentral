codeunit 50101 "BZ Account Schedule Management"
{
    procedure CopyFinancialReport(FinancialReportCode: Code[10])
    var
        financialReport: Record "Financial Report";
        selectCompany: Page "BZ Select Company";
        notFoundErr: Label '%1 was not found', Comment = '%1 Financial Report TableCaption';
        companySelected: Text[30];
        newFinancialReport: Code[10];
    begin
        if FinancialReportCode = '' then
            Error(notFoundErr, financialReport.TableCaption());
        financialReport.Get(FinancialReportCode);
        selectCompany.SetFinancialReportName(FinancialReportCode);
        if selectCompany.RunModal() = Action::OK then begin
            selectCompany.GetValues(newFinancialReport, companySelected);
            Message('Esquema ' + newFinancialReport + ' en empresa ' + companySelected); //TODO SEGUIR
        end;


    end;
}