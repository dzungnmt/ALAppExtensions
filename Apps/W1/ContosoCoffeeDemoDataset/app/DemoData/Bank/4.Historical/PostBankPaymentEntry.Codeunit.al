#pragma warning disable AA0247
codeunit 5667 "Post Bank Payment Entry"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    trigger OnRun()
    var
        GenJournalLine: Record "Gen. Journal Line";
        CreateGenJournalTemplate: Codeunit "Create Gen. Journal Template";
        CreateBankJnlBatch: Codeunit "Create Bank Jnl. Batches";
    begin
        GenJournalLine.SetRange("Journal Template Name", CreateGenJournalTemplate.General());
        GenJournalLine.SetRange("Journal Batch Name", CreateBankJnlBatch.Daily());
        if GenJournalLine.FindFirst() then
            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post Batch", GenJournalLine);
    end;
}
