page 50101 "BZ Select Company"
{
    PageType = StandardDialog;
    UsageCategory = None;
    Caption = 'Select company';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Company Name"; vCompanyName)
                {
                    ApplicationArea = All;
                    Caption = 'Company';
                    ToolTip = 'Déjalo en blanco si quieres copiarlo en la misma empresa', Locked = true;
                    TableRelation = Company;
                }
                field("Financial Report Name"; vFinancialReportName)
                {
                    ApplicationArea = All;
                    Caption = 'Financial Report Name';
                    ToolTip = 'Financial Report Name';
                    trigger OnDrillDown()
                    var
                        FinancialReport: Record "Financial Report";
                    begin
                        if vCompanyName <> '' then
                            FinancialReport.ChangeCompany(vCompanyName);
                        if page.RunModal(0, FinancialReport) = Action::LookupOK then
                            vFinancialReportName := FinancialReport.Name;
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        vCompanyName: Text[30];
        vFinancialReportName: Code[10];

    procedure SetFinancialReportName(SourceName: Code[10])
    begin
        vFinancialReportName := SourceName;
    end;

    procedure GetValues(var FinancialReportName: Code[10]; var CompanyName: Text[30])
    begin
        FinancialReportName := vFinancialReportName;
        CompanyName := vCompanyName;
    end;
}