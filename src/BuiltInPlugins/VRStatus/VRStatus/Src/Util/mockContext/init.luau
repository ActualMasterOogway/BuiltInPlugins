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
return function(v6, v7) --[[ Line: 23 ]]
    -- upvalues: v5 (copy), l_TestHelpers_0 (copy)
    assert(type(v6) == "table", "Expected story to be a table");
    local v8 = table.clone(v5);
    for _, v10 in v7 do
        table.insert(v8, v10);
    end;
    return l_TestHelpers_0.provideMockContext(v8, v6);
end;