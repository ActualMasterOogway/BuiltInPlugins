local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Util.getMockContextMap);
local l_TestHelpers_0 = v1.TestHelpers;
return function(v5, v6) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), v3 (copy), l_TestHelpers_0 (copy)
    assert(type(v5) == "table", "Expected story to be a table");
    local v7 = if v6 then v2.values(v6) else v2.values(v3());
    return l_TestHelpers_0.provideMockContext(v7, v5);
end;