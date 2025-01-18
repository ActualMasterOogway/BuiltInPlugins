local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_append_0 = v1.append;
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v6 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock()
};
return function(v7, v8) --[[ Line: 24 ]]
    -- upvalues: l_TestHelpers_0 (copy), l_append_0 (copy), v6 (copy), l_ContextServices_0 (copy)
    assert(type(v7) == "table", "Expected children to be a table");
    return l_TestHelpers_0.provideMockContext(l_append_0(v6, {
        l_ContextServices_0.Store.new(v8)
    }), v7);
end;