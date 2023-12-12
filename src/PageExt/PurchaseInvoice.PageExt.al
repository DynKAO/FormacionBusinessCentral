pageextension 50106 "BZ Purchase Invoice" extends "Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        modify("Posting Description")
        {
            Visible = true;
        }
    }
}