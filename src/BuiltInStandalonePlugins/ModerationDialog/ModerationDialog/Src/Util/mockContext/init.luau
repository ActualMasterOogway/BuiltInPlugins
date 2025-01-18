local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock()
};
return function(v5) --[[ Line: 20 ]]
    -- upvalues: l_TestHelpers_0 (copy), v4 (copy)
    assert(type(v5) == "table", "Expected children to be a table");
    return l_TestHelpers_0.provideMockContext(v4, v5);
end;