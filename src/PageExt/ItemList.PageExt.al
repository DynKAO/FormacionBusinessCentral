pageextension 50102 "BZ Item List" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Beer Category Code"; rec."BZ Beer Category Code")
            {
                ApplicationArea = All;
                ToolTip = 'Beer Category Code';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}