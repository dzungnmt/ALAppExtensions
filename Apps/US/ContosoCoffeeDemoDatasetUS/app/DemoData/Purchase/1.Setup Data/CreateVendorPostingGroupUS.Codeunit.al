#pragma warning disable AA0247
codeunit 10517 "Create Vendor Posting Group US"
{
    SingleInstance = true;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Posting Group", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnInsertRecord(var Rec: Record "Vendor Posting Group")
    var
        CreateVendorPostingGroup: Codeunit "Create Vendor Posting Group";
        CreateUSGLAccounts: Codeunit "Create US GL Accounts";
    begin
        case Rec.Code of
            CreateVendorPostingGroup.Domestic():
                ValidateRecordFields(Rec, CreateUSGLAccounts.AccountsPayableDomestic(), CreateUSGLAccounts.PurchaseDiscounts(), CreateUSGLAccounts.PayableInvoiceRounding(), CreateUSGLAccounts.PayableInvoiceRounding(), CreateUSGLAccounts.PayableInvoiceRounding(), CreateUSGLAccounts.PayableInvoiceRounding(), CreateUSGLAccounts.PayableInvoiceRounding(), CreateUSGLAccounts.PurchaseDiscounts(), CreateUSGLAccounts.InterestIncome(), CreateUSGLAccounts.InterestIncome(), '');
        end;
    end;

    local procedure ValidateRecordFields(var VendorPostingGroup: Record "Vendor Posting Group"; PayablesAccount: Code[20]; PaymentDiscDebitAcc: Code[20]; InvoiceRoundingAccount: Code[20]; DebitCurrApplnRndgAcc: Code[20]; CreditCurrApplnRndgAcc: Code[20]; DebitRoundingAccount: Code[20]; CreditRoundingAccount: Code[20]; PaymentDiscCreditAcc: Code[20]; PaymentToleranceDebitAcc: Code[20]; PaymentToleranceCreditAcc: Code[20]; ServiceChargeAcc: Code[20])
    begin
        VendorPostingGroup.Validate("Payables Account", PayablesAccount);
        VendorPostingGroup.Validate("Service Charge Acc.", ServiceChargeAcc);
        VendorPostingGroup.Validate("Payment Disc. Debit Acc.", PaymentDiscDebitAcc);
        VendorPostingGroup.Validate("Invoice Rounding Account", InvoiceRoundingAccount);
        VendorPostingGroup.Validate("Debit Curr. Appln. Rndg. Acc.", DebitCurrApplnRndgAcc);
        VendorPostingGroup.Validate("Credit Curr. Appln. Rndg. Acc.", CreditCurrApplnRndgAcc);
        VendorPostingGroup.Validate("Debit Rounding Account", DebitRoundingAccount);
        VendorPostingGroup.Validate("Credit Rounding Account", CreditRoundingAccount);
        VendorPostingGroup.Validate("Payment Disc. Credit Acc.", PaymentDiscCreditAcc);
        VendorPostingGroup.Validate("Payment Tolerance Debit Acc.", PaymentToleranceDebitAcc);
        VendorPostingGroup.Validate("Payment Tolerance Credit Acc.", PaymentToleranceCreditAcc);
    end;
}
