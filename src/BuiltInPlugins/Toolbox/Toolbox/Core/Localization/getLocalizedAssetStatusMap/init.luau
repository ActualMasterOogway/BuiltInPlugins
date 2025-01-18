local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.AssetConfigConstants);
return function(v2) --[[ Line: 5 ]] --[[ Name: getLocalizedAssetStatusMap ]]
    -- upvalues: v1 (copy)
    return {
        [v1.ASSET_STATUS.ReviewPending] = v2:getText("General", "StatusReviewPending"), 
        [v1.ASSET_STATUS.Moderated] = v2:getText("General", "StatusModerated"), 
        [v1.ASSET_STATUS.ReviewApproved] = v2:getText("General", "StatusReviewApproved"), 
        [v1.ASSET_STATUS.OnSale] = v2:getText("General", "StatusOnSale"), 
        [v1.ASSET_STATUS.OffSale] = v2:getText("General", "StatusOffSale"), 
        [v1.ASSET_STATUS.DelayedRelease] = v2:getText("General", "StatusDelayedRelease"), 
        [v1.ASSET_STATUS.Free] = v2:getText("General", "Free")
    };
end;