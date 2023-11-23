pageextension 50104 "BZ Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            group("BZ Others")
            {
                Caption = 'Others';
                field("BZ Vendor Shipment Required"; Rec."BZ Vendor Shipment Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specify that the vendor shipment is required';
                }
            }
        }
    }
}