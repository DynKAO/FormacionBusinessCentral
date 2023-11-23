tableextension 50101 "BZ Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "BZ Vendor Shipment Required"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Order Required';
        }
    }
}