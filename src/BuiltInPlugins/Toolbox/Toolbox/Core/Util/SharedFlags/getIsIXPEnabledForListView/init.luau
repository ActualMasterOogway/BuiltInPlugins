local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.getIsIXPVariableEnabled);
local v2 = require(l_Util_0.SharedFlags.getFFlagToolboxEnableAssetRows);
game:DefineFastFlag("ToolboxListViewEnabledForAll", false);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    if game:GetFastFlag("ToolboxListViewEnabledForAll") then
        return v2();
    else
        return v3 and v2() and v1(v3, "MarketplaceModelsListView", "MarketplaceModelsListViewEnabled");
    end;
end;