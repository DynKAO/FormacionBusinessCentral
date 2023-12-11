codeunit 50100 "BZ Purchase Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure c90_OnBeforePostPurchaseDoc(var IsHandled: Boolean)
    // var
    //     vText: Text;
    begin
        IsHandled := true;

        // IsolatedStorage.Get('#KAO_001', vText);
        // MESSAGE(vText);
        // IsolatedStorage.Delete('#KAO_001');
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
            PurchaseHeader.TestField("Vendor Shipment No.");//TODO DEBUG no funciona
    end;

    // [TryFunction]
    // local procedure MyProcedure()
    // var
    //     purchHeader: record "Purchase Header";
    // begin
    //     if purchHeader.GET() then;

    //     // IsolatedStorage.Set('#KAO_001', purchHeader.GetFilters());
    // end;
}