// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "BZ CustomerList" extends "Customer List"
{
    layout
    {
        addbefore("Balance (LCY)")
        {
            field(BZ_nombre; rec.Balance)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance field.';
            }
        }
    }
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}