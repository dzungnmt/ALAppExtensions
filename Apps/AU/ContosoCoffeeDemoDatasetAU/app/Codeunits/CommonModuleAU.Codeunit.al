#pragma warning disable AA0247
codeunit 17109 "Common Module AU"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Contoso Demo Tool", 'OnAfterGeneratingDemoData', '', false, false)]
    local procedure LocalizationVATPostingSetup(Module: Enum "Contoso Demo Data Module"; ContosoDemoDataLevel: Enum "Contoso Demo Data Level")
    var
        ContosoPostingSetup: Codeunit "Contoso Posting Setup";
        CommonPostingGroup: Codeunit "Create Common Posting Group";
        CommonGLAccount: Codeunit "Create Common GL Account";
        LocalStandardVATPercentage: Decimal;
    begin
        if Module = Enum::"Contoso Demo Data Module"::"Common Module" then
            if ContosoDemoDataLevel = Enum::"Contoso Demo Data Level"::"Setup Data" then begin
                LocalStandardVATPercentage := 10;
                ContosoPostingSetup.SetOverwriteData(true);
                ContosoPostingSetup.InsertVATPostingSetup(CommonPostingGroup.Domestic(), CommonPostingGroup.StandardVAT(), CommonGLAccount.SalesVATStandard(), CommonGLAccount.PurchaseVATStandard(), CommonPostingGroup.StandardVAT(), LocalStandardVATPercentage, Enum::"Tax Calculation Type"::"Normal VAT");
                ContosoPostingSetup.SetOverwriteData(false);
            end;
    end;
}
