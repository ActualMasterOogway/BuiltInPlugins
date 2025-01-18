local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.ReviewStatus);
return {
    isApprovedAsset = function(v2) --[[ Line: 7 ]]
        -- upvalues: v1 (copy)
        if v2.isModerated then
            return false;
        else
            local v3 = true;
            if v2.reviewStatus ~= v1.Finished then
                v3 = v2.reviewStatus == v1.DoesNotRequire;
            end;
            return v3;
        end;
    end, 
    getModerationTooltip = function(v4, v5) --[[ Line: 15 ]]
        -- upvalues: v1 (copy)
        if v5.reviewStatus == v1.Pending then
            return v4:getText("AssetItem", "PendingModerationTooltip");
        elseif v5.isModerated then
            return v4:getText("AssetItem", "FailedModerationTooltip");
        else
            return;
        end;
    end
};