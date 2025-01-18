local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v6 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local v7 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.BuyAssetDialog);
local v8 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.PluginPurchaseFlow);
local v9 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v10 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v11 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v16 = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
local v17 = require(l_script_FirstAncestor_0.Core.Actions.EnqueueSubsequentDialog);
local v18 = require(l_script_FirstAncestor_0.Core.Networking.Requests.PurchaseAssetRequest);
local v19 = require(l_script_FirstAncestor_0.Core.Actions.SetPurchaseDialogVisibility);
local v20 = Vector2.new(150, 150);
return function(v21) --[[ Line: 45 ]] --[[ Name: PurchaseFlowWrapper ]]
    -- upvalues: l_Stylizer_0 (copy), l_ContextServices_0 (copy), v14 (copy), v5 (copy), v4 (copy), v2 (copy), v10 (copy), v6 (copy), v3 (copy), v19 (copy), v9 (copy), v17 (copy), v16 (copy), v18 (copy), v11 (copy), v20 (copy), v7 (copy), v8 (copy)
    local _ = l_Stylizer_0:use();
    local _ = l_ContextServices_0.Localization:use();
    local l_networkInterface_0 = v14.use().networkInterface;
    local v25 = v5();
    local v26 = if v21.AssetData ~= v4.None then v21.AssetData else nil;
    local v27 = if v26 then v26.Asset else nil;
    local v28 = if v26 then v26.FiatProduct else nil;
    local v29 = if v28 then v28.Purchasable else nil;
    local v30 = if v28 then v28.PurchasePrice else nil;
    local v31 = if v2() then nil else if v26 and v26.Product then v26.Product.Price else 0;
    local v32 = if v30 then v10.isFree(v30) else v31 == 0;
    local v34 = v6(function(v33) --[[ Line: 61 ]]
        if v33.purchase then
            return v33.purchase.isPurchaseDialogVisible;
        else
            return nil;
        end;
    end);
    local v35 = v3.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v25 (copy), v19 (ref), v21 (copy)
        v25(v19(false));
        if v21.OnClose then
            v21.OnClose();
        end;
    end, {
        v25, 
        v21.OnClose
    });
    local v39 = v3.useCallback(function(v36, v37, v38) --[[ Line: 72 ]]
        -- upvalues: v21 (copy)
        return v21.TryInsert(v36, false, "PreviewClickInsertButton", v37, v38);
    end, {
        v25, 
        v21.TryInsert
    });
    local v45 = v3.useCallback(function(v40) --[[ Line: 78 ]]
        -- upvalues: v26 (copy), v30 (copy), v9 (ref), v25 (copy), v17 (ref), v16 (ref), v2 (ref), v18 (ref), l_networkInterface_0 (copy), v39 (copy), v35 (copy)
        if v40 then
            local l_Id_0 = v26.Asset.Id;
            if not v30 and not v26.Product then
                if v9.shouldDebugWarnings() then
                    warn("Attempted to purchase asset without neither robux nor fiat Product: " .. tostring(l_Id_0), v26);
                end;
                v25(v17(v26, v16.PurchaseFailed));
                return;
            else
                local v42 = nil;
                local v43 = nil;
                if not v2() then
                    local l_Product_0 = v26.Product;
                    v43 = l_Product_0 and l_Product_0.Price or 0;
                    v42 = l_Product_0 and l_Product_0.ProductId;
                end;
                v25(v18(l_networkInterface_0, l_Id_0, v42, v43, nil, nil, v30, v39, v26));
                v35();
                return;
            end;
        else
            v35();
            return;
        end;
    end, {
        v26, 
        v25, 
        v30, 
        l_networkInterface_0, 
        v35, 
        v39
    });
    if not v34 or not v26 then
        return;
    elseif v32 then
        v45(true);
        return;
    elseif v30 then
        if v30 and v29 then
            local v46 = v11.constructAssetThumbnailUrl(v27.Id, v20.X, v20.Y);
            return v3.createElement(v7, {
                Name = v27.Name, 
                CreatorName = v26.Creator.Name, 
                OnClose = v35, 
                OnButtonClicked = v45, 
                Price = v10.displayStringFromMoney(v30), 
                Thumbnail = v46
            });
        elseif v9.shouldDebugWarnings() then
            warn("Fiat asset is not purchaseable");
            return;
        else
            return;
        end;
    else
        return v3.createElement(v8, {
            AssetData = v26, 
            Cancel = v35, 
            OnPurchaseClicked = v45
        });
    end;
end;