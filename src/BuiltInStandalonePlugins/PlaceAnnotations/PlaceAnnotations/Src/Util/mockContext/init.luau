local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Contexts.UsernameContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createMockPlugin);
local v6 = require(l_script_FirstAncestor_0.Packages.Dash);
local v7 = {
    l_ContextServices_0.Plugin.new(v5()), 
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v4.new()
};
return function(v8, v9) --[[ Line: 24 ]]
    -- upvalues: v6 (copy), v7 (copy), l_TestHelpers_0 (copy)
    assert(type(v8) == "table", "Expected children to be a table");
    local v10 = v6.append(v7, v9);
    return l_TestHelpers_0.provideMockContext(v10, v8);
end;