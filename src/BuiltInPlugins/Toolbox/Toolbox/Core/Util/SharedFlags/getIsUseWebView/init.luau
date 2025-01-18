local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.getIsIXPVariableEnabled);
local v2 = require(l_Util_0.SharedFlags.getFFlagToolboxEnableWebView);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2() and v1(v3, "StoreWebViews", "StoreWebViewsEnabled");
end;