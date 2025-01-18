local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2, v3) --[[ Line: 21 ]] --[[ Name: map ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for v5, v6 in v2 do
        local v7 = v3(v6, v5);
        v1(v7 == nil, false, "Returned nil from a Dash.map handler");
        v4[v5] = v7;
    end;
    return v4;
end;