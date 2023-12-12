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

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnBeforeInitPostingDescription, '', false, false)]
    local procedure t38_OnBeforeInitPostingDescription(var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Invoice then begin
            IsHandled := true;
            PurchaseHeader."Posting Description" := CopyStr(Format(PurchaseHeader."Document Type") + ': ' + PurchaseHeader."Vendor Invoice No." + ' - ' + PurchaseHeader."Pay-to Name",
                                                            1,
                                                            MaxStrLen(PurchaseHeader."Posting Description"));
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Buy-from Vendor No.', false, false)]
    local procedure t38_OnAfterValidateEvent_BuyFromVendorNo(var Rec: Record "Purchase Header")
    begin
        if Rec."Document Type" = Rec."Document Type"::Invoice then
            Rec."Posting Description" := CopyStr(Format(Rec."Document Type") + ': ' + Rec."Vendor Invoice No." + ' - ' + Rec."Pay-to Name",
                                                 1,
                                                 MaxStrLen(Rec."Posting Description"));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Pay-to Vendor No.', false, false)]
    local procedure t38_OnAfterValidateEvent_PayToVendorNo(var Rec: Record "Purchase Header")
    begin
        if Rec."Document Type" = Rec."Document Type"::Invoice then
            Rec."Posting Description" := CopyStr(Format(Rec."Document Type") + ': ' + Rec."Vendor Invoice No." + ' - ' + Rec."Pay-to Name",
                                                 1,
                                                 MaxStrLen(Rec."Posting Description"));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Vendor Invoice No.', false, false)]
    local procedure t38_OnAfterValidateEvent_VendorInvoiceNo(var Rec: Record "Purchase Header")
    begin
        if Rec."Document Type" = Rec."Document Type"::Invoice then
            Rec."Posting Description" := CopyStr(Format(Rec."Document Type") + ': ' + Rec."Vendor Invoice No." + ' - ' + Rec."Pay-to Name",
                                                 1,
                                                 MaxStrLen(Rec."Posting Description"));
    end;
}