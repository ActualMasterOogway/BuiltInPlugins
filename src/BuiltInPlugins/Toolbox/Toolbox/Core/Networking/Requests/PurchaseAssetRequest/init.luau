local l_GuiService_0 = game:GetService("GuiService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_Packages_0 = l_Parent_0.Packages;
local l_deepCopy_0 = require(l_Packages_0.Framework).Util.deepCopy;
local v7 = require(l_Util_0.DebugFlags);
local v8 = require(l_Util_0.FiatUtil);
local v9 = require(l_Util_0.ToolboxUtilities);
local v10 = require(l_Parent_0.Core.Actions.NetworkError);
local v11 = require(l_Parent_0.Core.Actions.EnqueueSubsequentDialog);
local v12 = require(l_Parent_0.Core.Actions.SetExcessiveTransactionUserId);
local v13 = require(l_Parent_0.Core.Actions.SetOwnsAsset);
local v14 = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local v15 = require(l_Parent_0.Core.Actions.UpdateAssetData);
local v16 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v17 = require(l_Parent_0.Core.Networking.Requests.GetRobuxBalance);
local v18 = require(l_Parent_0.Core.Types.PurchaseStatus);
local v19 = require(l_Parent_0.Core.Types.ProductPurchaseResponseReasons);
local v20 = require(l_Parent_0.Core.Types.PurchaseTransactionStatus);
local v21 = require(l_Parent_0.Core.Types.SubsequentDialogStatus);
local v22 = v9.getOwnershipPollingMaxRetries();
local v23 = v9.getOwnershipPollingWaitTimeInSec();
local function v30(v24, v25, v26) --[[ Line: 53 ]] --[[ Name: onAddToInventory ]]
    -- upvalues: l_MemStorageService_0 (copy), v7 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
        -- upvalues: l_MemStorageService_0 (ref), v24 (copy), v25 (copy), v26 (copy), v7 (ref)
        if l_MemStorageService_0 then
            local v27 = v24:jsonEncode({
                assetId = v25, 
                assetTypeId = v26
            });
            l_MemStorageService_0:Fire("AddToolboxAssetToInventory", v27);
            return;
        else
            if v7.shouldDebugUrls() then
                warn("MemStorageService not found!");
            end;
            return;
        end;
    end);
    if not l_status_0 and v7.shouldDebugWarnings() then
        warn(("Asset id %s was not added to inventory after purchase. Error: "):format(v25), l_result_0);
    end;
    return l_status_0, l_result_0;
end;
local function v40(_, v32, v33, v34, v35) --[[ Line: 71 ]]
    -- upvalues: l_StudioService_0 (copy), v7 (copy)
    local v36, v37 = v35(v32, v34, v33);
    local v38 = v32 and v32.Asset and v32.Asset.Id;
    local v39 = (v32 and v32.Asset and v32.Asset.TypeId) == Enum.AssetType.Plugin.Value;
    if v36 and v39 then
        l_StudioService_0:UpdatePluginManagement();
    end;
    if not v36 and v7.shouldDebugWarnings() then
        warn(("Asset id %s was not inserted correctly after purchase. Error: "):format(v38), v37);
    end;
    return v36;
end;
local function v51(v41, v42, v43, v44, v45, v46, v47, v48, v49) --[[ Line: 85 ]]
    -- upvalues: v30 (copy), v13 (copy), v40 (copy), v11 (copy), v21 (copy), v14 (copy), v18 (copy)
    v30(v42, v43, v45);
    v41:dispatch(v13(true, v43));
    v40(v42, v44, v46, v48, v47);
    if not v49 then
        v41:dispatch(v11(v44, v21.PurchaseSuccess));
    end;
    local v50 = v41:getState();
    if v50.assets and v50.assets.previewAssetId == v43 then
        v41:dispatch(v14(v18.Success));
    end;
end;
local function _(v52, v53) --[[ Line: 114 ]]
    local v54 = if v52.purchase and v52.purchase.cachedOwnedAssets then v52.purchase.cachedOwnedAssets else nil;
    if v54 then
        return v54[tostring(v53)];
    else
        return false;
    end;
end;
local function _(v56, v57) --[[ Line: 121 ]]
    -- upvalues: v14 (copy), v18 (copy)
    local v58 = v56:getState();
    if v58.assets and v58.assets.previewAssetId == v57 then
        v56:dispatch(v14(v18.Failed));
    end;
end;
local function v68(v60, v61, v62) --[[ Line: 129 ]]
    -- upvalues: v22 (copy), v23 (copy), v16 (copy)
    local v63 = 0;
    local v64 = v60:getState();
    local v65 = if v64.purchase and v64.purchase.cachedOwnedAssets then v64.purchase.cachedOwnedAssets else nil;
    local v66 = if v65 then v65[tostring(v62)] else false;
    while not v66 and v63 < v22 do
        wait(v23);
        v65 = v60:getState();
        v60:dispatch(v16(v61, v62)):andThen(function(v67) --[[ Line: 136 ]]
            -- upvalues: v66 (ref), v63 (ref)
            v66 = v67;
            v63 = v63 + 1;
        end);
    end;
    return v66;
end;
return function(v69, v70, v71, v72, v73, v74, v75, v76, v77, v78) --[[ Line: 145 ]]
    -- upvalues: v7 (copy), v14 (copy), v18 (copy), v8 (copy), v11 (copy), v21 (copy), v10 (copy), v20 (copy), l_GuiService_0 (copy), v68 (copy), v51 (copy), l_deepCopy_0 (copy), v15 (copy), v12 (copy), v19 (copy), v13 (copy), v17 (copy), v30 (copy), v40 (copy)
    return function(v79) --[[ Line: 157 ]]
        -- upvalues: v77 (ref), v70 (copy), v7 (ref), v73 (ref), v74 (ref), v14 (ref), v18 (ref), v75 (copy), v8 (ref), v72 (copy), v11 (ref), v21 (ref), v10 (ref), v69 (copy), v20 (ref), l_GuiService_0 (ref), v68 (ref), v51 (ref), v76 (copy), v78 (copy), l_deepCopy_0 (ref), v15 (ref), v12 (ref), v71 (copy), v19 (ref), v13 (ref), v17 (ref), v30 (ref), v40 (ref)
        local v80 = nil;
        local v81 = nil;
        local v82 = v79:getState();
        local l_assets_0 = v82.assets;
        local v84 = if l_assets_0 then l_assets_0.idToAssetMap else {};
        v77 = if v77 then v77 else v84[v70];
        if not v77 and v7.shouldDebugWarnings() then
            warn(("Asset data for id %s was not found in the idToAssetMap."):format(v70));
        end;
        v73 = if v77 and v77.Asset then v77.Asset.TypeId else nil;
        v74 = if v82.pageInfo then v82.pageInfo.searchId else nil;
        v81 = if l_assets_0 then l_assets_0.previewSwimlaneName else nil;
        local v85 = if v82.assets then v82.assets.previewPluginData else nil;
        v80 = if v85 then v85.versionId else nil;
        v79:dispatch(v14(v18.Waiting));
        local v86 = if v75 then {
            expectedPrice = v75, 
            productKey = {
                productNamespace = "PRODUCT_NAMESPACE_CREATOR_MARKETPLACE_ASSET", 
                productType = v8.convertAssetTypeToProductType(v73), 
                productTargetId = tostring(v70)
            }
        } else {
            expectedPrice = v72, 
            assetId = v70, 
            assetType = v73, 
            searchId = v74
        };
        local function v92(v87) --[[ Line: 192 ]]
            -- upvalues: v7 (ref), v75 (ref), v70 (ref), v80 (ref), v79 (copy), v11 (ref), v77 (ref), v21 (ref), v14 (ref), v18 (ref), v10 (ref)
            if v7.shouldDebugWarnings() then
                local v88 = v75 and "fiat" or "robux";
                warn(("Could not purchase using %s assetID %s versionID %s"):format(v88, v70, v80), v87);
            end;
            v79:dispatch(v11(v77, v21.PurchaseFailed));
            local l_v79_0 = v79;
            local l_v70_0 = v70;
            local v91 = l_v79_0:getState();
            if v91.assets and v91.assets.previewAssetId == l_v70_0 then
                l_v79_0:dispatch(v14(v18.Failed));
            end;
            v79:dispatch(v10(v87));
        end;
        if v75 then
            return v69:purchaseAsset(nil, v86, v73):andThen(function(v93) --[[ Line: 213 ]]
                -- upvalues: v20 (ref), l_GuiService_0 (ref), v68 (ref), v79 (copy), v69 (ref), v70 (ref), v51 (ref), v77 (ref), v73 (ref), v80 (ref), v76 (ref), v81 (ref), v78 (ref), l_deepCopy_0 (ref), v15 (ref), v11 (ref), v21 (ref), v14 (ref), v18 (ref), v12 (ref), v92 (copy)
                local l_responseBody_0 = v93.responseBody;
                local l_checkoutUrl_0 = l_responseBody_0.checkoutUrl;
                local l_purchaseTransactionStatus_0 = l_responseBody_0.purchaseTransactionStatus;
                if l_purchaseTransactionStatus_0 == v20.Success then
                    if l_checkoutUrl_0 then
                        l_GuiService_0:OpenBrowserWindow(l_checkoutUrl_0);
                        spawn(function() --[[ Line: 220 ]]
                            -- upvalues: v68 (ref), v79 (ref), v69 (ref), v70 (ref), v51 (ref), v77 (ref), v73 (ref), v80 (ref), v76 (ref), v81 (ref), v78 (ref)
                            if v68(v79, v69, v70) then
                                v51(v79, v69, v70, v77, v73, v80, v76, v81, v78);
                            end;
                        end);
                        return;
                    else
                        v51(v79, v69, v70, v77, v73, v80, v76, v81, v78);
                        return;
                    end;
                elseif l_purchaseTransactionStatus_0 == v20.AlreadyOwned then
                    v51(v79, v69, v70, v77, v73, v80, v76, v81, v78);
                    return;
                else
                    if l_purchaseTransactionStatus_0 == v20.PriceChanged then
                        local l_actualPrice_0 = l_responseBody_0.actualPrice;
                        if l_actualPrice_0 and v77.FiatProduct then
                            v77 = l_deepCopy_0(v77);
                            v77.FiatProduct.PurchasePrice = l_actualPrice_0;
                            v79:dispatch(v15(v70, v77));
                        end;
                        v79:dispatch(v11(v77, v21.PriceChanged));
                        local l_v79_1 = v79;
                        local l_v70_1 = v70;
                        local v100 = l_v79_1:getState();
                        if v100.assets and v100.assets.previewAssetId == l_v70_1 then
                            l_v79_1:dispatch(v14(v18.Failed));
                            return;
                        end;
                    elseif l_purchaseTransactionStatus_0 == v20.ExcessiveTransactions then
                        local v101 = if v77.Creator and v77.Creator.Id then v77.Creator.Id else nil;
                        if v101 then
                            v79:dispatch(v12(v101));
                        end;
                        v79:dispatch(v11(v77, v21.ExcessiveTransactions));
                        local l_v79_2 = v79;
                        local l_v70_2 = v70;
                        local v104 = l_v79_2:getState();
                        if v104.assets and v104.assets.previewAssetId == l_v70_2 then
                            l_v79_2:dispatch(v14(v18.Failed));
                            return;
                        end;
                    else
                        v92();
                    end;
                    return;
                end;
            end, v92);
        else
            return v69:purchaseAsset(v71, v86, v73):andThen(function(v105) --[[ Line: 284 ]]
                -- upvalues: v19 (ref), v79 (copy), v13 (ref), v70 (ref), v17 (ref), v69 (ref), v30 (ref), v73 (ref), v40 (ref), v77 (ref), v80 (ref), v81 (ref), v76 (ref), v21 (ref), v11 (ref), v14 (ref), v18 (ref)
                local l_purchased_0 = v105.responseBody.purchased;
                local l_reason_0 = v105.responseBody.reason;
                if l_purchased_0 or l_reason_0 == v19.AlreadyOwned then
                    v79:dispatch(v13(true, v70));
                    v79:dispatch(v17(v69));
                    v30(v69, v70, v73);
                    v40(v69, v77, v80, v81, v76);
                end;
                local v108 = if l_purchased_0 then v21.PurchaseSuccess else v21.PurchaseFailed;
                v79:dispatch(v11(v77, v108));
                v79:dispatch(v14(if l_purchased_0 then v18.Success else v18.Failed));
            end, v92);
        end;
    end;
end;