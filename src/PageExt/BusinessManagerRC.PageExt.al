pageextension 50103 "BZ Business Manager RC" extends "Business Manager Role Center"
{
    actions
    {
        // Add changes to page actions here
        addlast(reporting)
        {
            action("BZ Beer Category List")
            {
                ApplicationArea = All;
                Caption = 'Beer Category List';
                Image = SetupList;
                RunObject = page "BZ Beer Category List";
                ToolTip = 'Open the beer category list page';
            }
        }
    }
}