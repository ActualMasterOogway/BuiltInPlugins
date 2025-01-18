local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local v6 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.GenericDialog);
local v7 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.PurchaseSuccessDialog);
local v8 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local _ = require(l_script_FirstAncestor_0.Core.Util.Images);
local _ = require(l_script_FirstAncestor_0.Core.Util.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local _ = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v15 = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v17 = require(l_Actions_0.DequeueSubsequentDialog);
return function() --[[ Line: 34 ]] --[[ Name: SubsequentDialogController ]]
    -- upvalues: l_Stylizer_0 (copy), l_ContextServices_0 (copy), v4 (copy), v5 (copy), v3 (copy), v17 (copy), v8 (copy), v2 (copy), v15 (copy), v6 (copy), v7 (copy)
    local v18 = l_Stylizer_0:use();
    local v19 = l_ContextServices_0.Localization:use();
    local v20 = v4();
    local v22 = v5(function(v21) --[[ Line: 39 ]]
        if v21.dialog and v21.dialog.subsequentDialogQueue then
            return v21.dialog.subsequentDialogQueue[1];
        else
            return nil;
        end;
    end);
    local v24 = v5(function(v23) --[[ Line: 44 ]]
        if v23.purchase then
            return v23.purchase.robuxBalance;
        else
            return nil;
        end;
    end);
    local v26 = v3.useCallback(function(_) --[[ Line: 48 ]]
        -- upvalues: v20 (copy), v17 (ref)
        v20(v17());
    end, {
        v20
    });
    if not v22 then
        return;
    else
        local l_assetData_0 = v22.assetData;
        local l_status_0 = v22.status;
        local v29 = if l_assetData_0 then l_assetData_0.Asset else nil;
        local v30 = if l_assetData_0 then l_assetData_0.FiatProduct else nil;
        local v31 = nil;
        local v32 = nil;
        if v30 then
            v32 = v30 and v30.PurchasePrice;
            v31 = v30 and v8.isFree(v32);
        elseif not v2() and l_assetData_0 then
            v31 = (l_assetData_0.Product and l_assetData_0.Product.Price or 0) == 0;
        end;
        local v33 = if v29 then v29.Name else "";
        if l_status_0 == v15.ExcessiveTransactions then
            return v3.createElement(v6, {
                Description = v19:getText("Purchase", "ExcessiveTransactionsDetails"), 
                Header = v19:getText("Purchase", "ExcessiveTransactionsHeader"), 
                Image = v18.dialog.errorIcon, 
                OnClose = v26
            });
        elseif l_status_0 == v15.PriceChanged then
            return v3.createElement(v6, {
                Description = v19:getText("Purchase", "PriceChangedDetails", {
                    name = v33, 
                    price = if v32 then v8.displayStringFromMoney(v32) else ""
                }), 
                Header = v19:getText("Purchase", "FailedHeader"), 
                Image = v18.dialog.errorIcon, 
                OnClose = v26
            });
        elseif l_status_0 == v15.PurchaseFailed then
            return v3.createElement(v6, {
                Description = v19:getText("Purchase", "FailedDetails", {
                    name = v33
                }), 
                Header = v19:getText("Purchase", "FailedHeader"), 
                Image = v18.dialog.errorIcon, 
                OnClose = v26
            });
        elseif l_status_0 == v15.PurchaseSuccess then
            if v32 then
                local v34 = if v31 then v19:getText("Purchase", "FreeTitle") else v19:getText("Purchase", "BuyTitle");
                local v35 = if v31 then v19:getText("Purchase", "FreeSuccessHeader") else v19:getText("Purchase", "SuccessHeader");
                return v3.createElement(v6, {
                    Description = v19:getText("Purchase", "SuccessDetails", {
                        name = v33
                    }), 
                    Header = v35, 
                    OnClose = v26, 
                    Title = v34
                });
            else
                return v3.createElement(v7, {
                    Balance = v24, 
                    IsFree = v31, 
                    Name = v33, 
                    OnClose = v26
                });
            end;
        else
            return;
        end;
    end;
end;