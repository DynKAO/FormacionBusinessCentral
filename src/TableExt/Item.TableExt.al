tableextension 50100 "BZ Item" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50100; "BZ Beer Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BZ Beer Category".Code;
            Caption = 'Beer Category Code';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

}