local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.AssetConfigConstants);
return function(v2) --[[ Line: 5 ]] --[[ Name: getLocalizedSideTabsMap ]]
    -- upvalues: v1 (copy)
    return {
        [v1.SIDE_TABS.Sales] = v2:getText("General", "SideTabSales"), 
        [v1.SIDE_TABS.Versions] = v2:getText("General", "SideTabVersions"), 
        [v1.SIDE_TABS.General] = v2:getText("General", "SideTabGeneral"), 
        [v1.SIDE_TABS.Permissions] = v2:getText("General", "SideTabPermissions")
    };
end;