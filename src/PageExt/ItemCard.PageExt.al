pageextension 50101 "BZ Item Card" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
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