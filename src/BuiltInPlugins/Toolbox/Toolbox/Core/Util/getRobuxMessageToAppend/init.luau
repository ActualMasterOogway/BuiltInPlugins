local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.Constants);
local v2 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: getRobuxMessageToAppend ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v3 > 0 then
        if v2() and v5 then
            return "\n" .. v4:getText("AssetConfig", "SomethingWentWrongMsgWithDashboardLink", {
                creatorDashboardLink = v1.CREATOR_DASHBOARD_LINK_PLACEHOLDER
            });
        else
            return "\n" .. v4:getText("AssetConfig", "CreateBundleNoRobuxDeducted");
        end;
    else
        return "";
    end;
end;