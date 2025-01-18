local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals);
local v2 = {};
v1.afterEach(function() --[[ Line: 9 ]]
    -- upvalues: v2 (ref)
    local l_v2_0 = v2;
    v2 = {};
    for v4 = #l_v2_0, 1, -1 do
        l_v2_0[v4]();
    end;
end);
return function(v5) --[[ Line: 18 ]] --[[ Name: onTestEnd ]]
    -- upvalues: v2 (ref)
    table.insert(v2, v5);
end;