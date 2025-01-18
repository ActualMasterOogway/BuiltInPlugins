local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = require(l_Parent_0.Src.Resources.MakeTheme);
local v5 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v6 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v4(true), 
    v5.new()
};
return function(v7) --[[ Line: 25 ]]
    -- upvalues: l_TestHelpers_0 (copy), v6 (copy)
    assert(type(v7) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v6, v7);
end;