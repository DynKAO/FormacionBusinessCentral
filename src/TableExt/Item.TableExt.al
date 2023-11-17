tableextension 50100 "DynES BZ Item" extends Item
{

    fields
    {
        field(50101; "DynES BZ Beer Category Enum"; Enum "DynES BZ Beer Category")
        {
            Caption = 'Beer Category';
        }
    }

    local procedure MyProcedure()
    var
        beerCategoryEnum: Enum "DynES BZ Beer Category";
    begin
        if beerCategoryEnum = enum::"DynES BZ Beer Category"::Blank then exit;

        MESSAGE(varMsg, beerCategoryEnum::Blank, beerCategoryEnum::"Opcion 1", beerCategoryEnum::"Opcion 2");
        ERROR(varErr);

    end;

    var
        varMsg: Label '%1 %2 %3', Comment = '%1 = Blank, %2 = Opc1, %3 = Opc2', Locked = true;
        varErr: Label 'Algo en español', Locked = true;
        vara: Label 'English text, translate please';

}