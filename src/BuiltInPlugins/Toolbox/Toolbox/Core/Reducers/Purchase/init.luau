local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
local _ = require(l_Actions_0.DequeueSubsequentDialog);
local _ = require(l_Actions_0.EnqueueSubsequentDialog);
local v8 = require(l_Parent_0.Core.Actions.SetPurchaseDialogVisibility);
local v9 = require(l_Actions_0.SetRobuxBalance);
local v10 = require(l_Actions_0.SetExcessiveTransactionUserId);
local v11 = require(l_Actions_0.SetOwnsAsset);
local v12 = require(l_Actions_0.SetPurchaseStatus);
local v13 = require(l_Actions_0.SetBuyerStatus);
local v14 = require(l_Actions_0.ClearPurchaseFlow);
local v15 = require(l_Parent_0.Core.Types.PurchaseStatus);
local _ = require(l_Parent_0.Core.Types.BuyerStatus);
return v4.createReducer({
    buyerStatus = nil, 
    robuxBalance = 0, 
    status = v15.None, 
    cachedOwnedAssets = {}, 
    assetId = nil, 
    excessiveTransactionUserIds = {}, 
    isPurchaseDialogVisible = false
}, {
    [v9.name] = function(v17, v18) --[[ Line: 48 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v17, {
            robuxBalance = v18.robuxBalance
        });
    end, 
    [v14.name] = function(v19, v20) --[[ Line: 54 ]]
        -- upvalues: v3 (copy), v15 (copy)
        local l_assetId_0 = v20.assetId;
        return v3.Dictionary.join(v19, {
            assetId = l_assetId_0, 
            status = v15.None
        });
    end, 
    [v11.name] = function(v22, v23) --[[ Line: 62 ]]
        -- upvalues: v3 (copy)
        local l_ownsAsset_0 = v23.ownsAsset;
        local l_assetId_1 = v23.assetId;
        local v26 = v3.Dictionary.join(v22.cachedOwnedAssets, {
            [tostring(l_assetId_1)] = l_ownsAsset_0
        });
        return v3.Dictionary.join(v22, {
            cachedOwnedAssets = v26
        });
    end, 
    [v12.name] = function(v27, v28) --[[ Line: 73 ]]
        -- upvalues: v3 (copy)
        local l_status_0 = v28.status;
        return v3.Dictionary.join(v27, {
            status = l_status_0
        });
    end, 
    [v10.name] = function(v30, v31) --[[ Line: 80 ]]
        -- upvalues: v3 (copy)
        local l_userId_0 = v31.userId;
        local v33 = v3.Dictionary.join(v30.excessiveTransactionUserIds, {
            [l_userId_0] = true
        });
        return v3.Dictionary.join(v30, {
            excessiveTransactionUserIds = v33
        });
    end, 
    [v8.name] = function(v34, v35) --[[ Line: 90 ]]
        -- upvalues: v3 (copy)
        local l_isVisible_0 = v35.isVisible;
        return v3.Dictionary.join(v34, {
            isPurchaseDialogVisible = l_isVisible_0
        });
    end, 
    [v13.name] = v1() and function(v37, v38) --[[ Line: 98 ]]
        -- upvalues: v3 (copy)
        local l_status_1 = v38.status;
        return v3.Dictionary.join(v37, {
            buyerStatus = l_status_1
        });
    end or nil
});