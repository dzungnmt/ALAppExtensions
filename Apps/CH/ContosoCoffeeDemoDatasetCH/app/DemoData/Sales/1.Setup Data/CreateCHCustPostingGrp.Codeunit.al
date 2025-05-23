#pragma warning disable AA0247
codeunit 11593 "Create CH Cust. Posting Grp"
{
    SingleInstance = true;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Table, Database::"Customer Posting Group", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertCustomerPostingGrp(var Rec: Record "Customer Posting Group")
    var
        CreateCHGLAccounts: Codeunit "Create CH GL Accounts";
        CreateCustomerPostingGrp: Codeunit "Create Customer Posting Group";
    begin
        case Rec.Code of
            CreateCustomerPostingGrp.Domestic():
                ValidateCustomerPostingGroup(Rec, CreateCHGLAccounts.CustomerCreditDomestic(), CreateCHGLAccounts.ConsultancyEarnings(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.RoundingDifferencesSales(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts());
            CreateCustomerPostingGrp.EU():
                ValidateCustomerPostingGroup(Rec, CreateCHGLAccounts.CustomerCreditEu(), CreateCHGLAccounts.ConsultancyEarnings(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.RoundingDifferencesSales(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts());
            CreateCustomerPostingGrp.Foreign():
                ValidateCustomerPostingGroup(Rec, CreateCHGLAccounts.CustomerCreditForeign(), CreateCHGLAccounts.ConsultancyEarnings(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.RoundingDifferencesSales(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.Discounts(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.RoundingDifferencesPurchase(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts(), CreateCHGLAccounts.CashDiscounts());
        end;
    end;

    local procedure ValidateCustomerPostingGroup(var CustomerPostingGroup: Record "Customer Posting Group"; ReceivablesAccount: Code[20]; ServiceChargeAcc: Code[20]; PaymentDiscDebitAcc: Code[20]; InvoiceRoundingAccount: Code[20]; AdditionalFeeAccount: Code[20]; InterestAccount: Code[20]; DebitCurrApplnRndgAcc: Code[20]; CreditCurrApplnRndgAcc: Code[20]; DebitRoundingAccount: Code[20]; CreditRoundingAccount: Code[20]; PaymentDiscCreditAcc: Code[20]; PaymentToleranceDebitAcc: Code[20]; PaymentToleranceCreditAcc: Code[20])
    begin
        CustomerPostingGroup.Validate("Receivables Account", ReceivablesAccount);
        CustomerPostingGroup.Validate("Service Charge Acc.", ServiceChargeAcc);
        CustomerPostingGroup.Validate("Payment Disc. Debit Acc.", PaymentDiscDebitAcc);
        CustomerPostingGroup.Validate("Invoice Rounding Account", InvoiceRoundingAccount);
        CustomerPostingGroup.Validate("Additional Fee Account", AdditionalFeeAccount);
        CustomerPostingGroup.Validate("Interest Account", InterestAccount);
        CustomerPostingGroup.Validate("Debit Curr. Appln. Rndg. Acc.", DebitCurrApplnRndgAcc);
        CustomerPostingGroup.Validate("Credit Curr. Appln. Rndg. Acc.", CreditCurrApplnRndgAcc);
        CustomerPostingGroup.Validate("Debit Rounding Account", DebitRoundingAccount);
        CustomerPostingGroup.Validate("Credit Rounding Account", CreditRoundingAccount);
        CustomerPostingGroup.Validate("Payment Disc. Credit Acc.", PaymentDiscCreditAcc);
        CustomerPostingGroup.Validate("Payment Tolerance Debit Acc.", PaymentToleranceDebitAcc);
        CustomerPostingGroup.Validate("Payment Tolerance Credit Acc.", PaymentToleranceCreditAcc);
    end;
}
