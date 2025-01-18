local l_Parent_0 = script.Parent.Parent.Parent;
local l_TestHelpers_0 = require(l_Parent_0.Packages.Framework).TestHelpers;
local v2 = {
    require(l_Parent_0.Src.Resources.MakeTheme)(true)
};
return function(v3) --[[ Line: 20 ]]
    -- upvalues: l_TestHelpers_0 (copy), v2 (copy)
    assert(type(v3) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v2, v3);
end;