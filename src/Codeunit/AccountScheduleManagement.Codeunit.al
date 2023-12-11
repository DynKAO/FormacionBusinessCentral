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
            CopyAccountSchedule(companySelected, FinancialReportCode, newFinancialReport);
        end;
    end;

    local procedure CopyAccountSchedule(pCompanySelected: Text[30]; pFinancialReportCode: Code[10]; pNewFinancialReport: Code[10])
    var
#if UNTIL21
        sourceAccSchName: Record "Acc. Schedule Name";
        destAccSchName: Record "Acc. Schedule Name";
#else
        sourceAccSchName: Record "Financial Report";
        destAccSchName: Record "Financial Report";
#endif
        sourceAccSchLine: record "Acc. Schedule Line";
        destAccSchLine: record "Acc. Schedule Line";

        sourceColumnLayout: record "Column Layout";
        destColumnLayout: record "Column Layout";

        sourceColumnLayoutName: record "Column Layout Name";
        destColumnLayoutName: record "Column Layout Name";
    begin
        if pNewFinancialReport = '' then exit;

        // if pCompanySelected <> '' then begin
        //     sourceAccSchLine.ChangeCompany(pCompanySelected);
        //     destAccSchLine.ChangeCompany(pCompanySelected);
        //     sourceColumnLayout.ChangeCompany(pCompanySelected);
        //     destColumnLayout.ChangeCompany(pCompanySelected);
        //     sourceColumnLayoutName.ChangeCompany(pCompanySelected);
        //     destColumnLayoutName.ChangeCompany(pCompanySelected);
        //     sourceAccSchName.ChangeCompany(pCompanySelected);
        //     destAccSchName.ChangeCompany(pCompanySelected);
        // end;



    end;
}