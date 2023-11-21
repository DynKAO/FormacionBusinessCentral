table 50100 "BZ Beer Category"
{
    DataClassification = ToBeClassified;
    LookupPageId = "BZ Beer Category List";
    DrillDownPageId = "BZ Beer Category List";

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; Category; Enum "BZ Beer Category Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Category';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}