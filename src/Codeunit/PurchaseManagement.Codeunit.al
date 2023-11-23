codeunit 50100 "BZ Purchase Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure c90_OnBeforePostPurchaseDoc(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Buy-from Vendor No.', false, false)]
    local procedure t38_OnAfterValidateEvent_BuyFromVendorNo()
    begin
        Message('');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnBeforeSendToPosting, '', false, false)]
    local procedure t38_OnBeforeSendToPosting(var PurchaseHeader: Record "Purchase Header")
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        if PurchasesPayablesSetup.Get() and PurchasesPayablesSetup."BZ Vendor Shipment Required" then
            PurchaseHeader.TestField("Vendor Shipment No.");
    end;
}