local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_TestHelpers_0 = v2.TestHelpers;
local v5 = require(l_Parent_0.Context.StudioServices);
local v6 = require(l_Parent_0.Resources.Theme);
local v7 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v5.mock(), 
    v6.mock()
};
return function(v8) --[[ Line: 25 ]]
    -- upvalues: l_TestHelpers_0 (copy), v7 (copy)
    assert(type(v8) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v7, v8);
end;