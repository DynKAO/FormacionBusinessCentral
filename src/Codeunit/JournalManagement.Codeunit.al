codeunit 50102 "BZ Journal Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", OnBeforeShowPostResultMessage, '', false, false)]
    local procedure c231_OnBeforeShowPostResultMessage(TempJnlBatchName: Code[10]; var GenJnlLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    var
        GLEntry: Record "G/L Entry";
        JournalErrorsMgt: Codeunit "Journal Errors Mgt.";
        Text003Lbl: Label 'The journal lines were successfully posted. The transaction no. is %1', Comment = '%1 = GLEntry.Transaction No.';
        Text004Lbl: Label 'The journal lines were successfully posted. You are now in the %1 journal. The transaction no. is %2', Comment = '%1 = GenJnlLine."Journal Batch Name", %2 = GLEntry.Transaction No.';
    begin
        if GenJnlLine."Line No." = 0 then
            Message(JournalErrorsMgt.GetNothingToPostErrorMsg())
        else begin
            GLEntry.Reset();
            if GLEntry.FindLast() then;
            if TempJnlBatchName = GenJnlLine."Journal Batch Name" then
                Message(StrSubstNo(Text003Lbl, GLEntry."Transaction No."))
            else
                Message(StrSubstNo(Text004Lbl, GenJnlLine."Journal Batch Name", GLEntry."Transaction No."));
        end;
        IsHandled := true;
    end;
}