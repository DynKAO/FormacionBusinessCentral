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

    local procedure CopyAccountSchedule(pCompanySelected: Text[30]; pSourceFinancialReportCode: Code[10]; pNewFinancialReport: Code[10])
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

        if pCompanySelected <> '' then begin
            destAccSchLine.ChangeCompany(pCompanySelected);
            destColumnLayout.ChangeCompany(pCompanySelected);
            destColumnLayoutName.ChangeCompany(pCompanySelected);
            destAccSchName.ChangeCompany(pCompanySelected);
        end;
        if sourceAccSchName.Get(pSourceFinancialReportCode) and (sourceAccSchName."Financial Report Column Group" <> '') then
            if not destColumnLayoutName.Get(sourceAccSchName."Financial Report Column Group") then begin
                if sourceColumnLayoutName.Get(sourceAccSchName."Financial Report Column Group") then;
                destColumnLayoutName.Init();
                destColumnLayoutName.Copy(sourceColumnLayoutName);
                destColumnLayoutName.Insert();
                destColumnLayout.Reset();
                destColumnLayout.SetRange("Column Layout Name", sourceAccSchName."Financial Report Column Group");
                if destColumnLayout.IsEmpty then begin
                    sourceColumnLayout.Reset();
                    sourceColumnLayout.SetRange("Column Layout Name", sourceAccSchName."Financial Report Column Group");
                    if sourceColumnLayout.FindSet() then
                        repeat
                            destColumnLayout.Init();
                            destColumnLayout.Copy(sourceColumnLayout);
                            destColumnLayout.Insert();
                        until sourceColumnLayout.Next() = 0;
                end;
            end;
        if not destAccSchName.get(pNewFinancialReport) then begin
            destAccSchName.Init();
            destAccSchName.TransferFields(sourceAccSchName, false);
            destAccSchName.Name := pNewFinancialReport;
            destAccSchName.Insert();

            sourceAccSchLine.Reset();
            sourceAccSchLine.SetRange("Schedule Name", pNewFinancialReport);
            if sourceAccSchLine.FindSet() then
                repeat
                    if not destAccSchLine.get(pNewFinancialReport, sourceAccSchLine."Line No.") then begin
                        destAccSchLine.Init();
                        destAccSchLine.TransferFields(sourceAccSchLine, false);
                        destAccSchLine."Schedule Name" := pNewFinancialReport;
                        destAccSchLine."Line No." := sourceAccSchLine."Line No.";
                        destAccSchLine.Insert();
                    end;
                until sourceAccSchLine.Next() = 0;
        end;
    end;
}