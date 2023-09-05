codeunit 50101 "Event Subscription"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnBeforeInsertGLEntry', '', false, false)]
    local procedure OnPostGLAccOnBeforeInsertGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GenJournalLine.TestField(Training);
        GLEntry.Training := GenJournalLine.Training;
        GLEntry."Tax Sum" := GenJournalLine."Sum of Tax";

    end;

}
