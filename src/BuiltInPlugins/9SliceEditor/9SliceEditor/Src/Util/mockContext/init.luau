local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = require(l_Parent_0.Src.Resources.MakeTheme);
local v5 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v4(true)
};
return function(v6) --[[ Line: 22 ]]
    -- upvalues: l_TestHelpers_0 (copy), v5 (copy)
    assert(type(v6) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v5, v6);
end;