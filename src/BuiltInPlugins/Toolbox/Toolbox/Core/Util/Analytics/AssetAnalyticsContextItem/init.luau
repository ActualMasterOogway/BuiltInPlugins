local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_ContextItem_0 = require(l_Packages_0.Framework).ContextServices.ContextItem;
local v3 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v4 = l_ContextItem_0:extend("AssetAnalytics");
v4.new = function(v5) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v6 = {
        assetAnalytics = v5 or v3.new()
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.get = function(v7) --[[ Line: 22 ]] --[[ Name: get ]]
    return v7.assetAnalytics;
end;
return v4;