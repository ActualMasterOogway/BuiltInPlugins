local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v6 = setmetatable({
        a = v3, 
        b = v4, 
        c = v5, 
        area = 0
    }, v2);
    v6:updateArea();
    return v6;
end;
local function v11(v7, v8) --[[ Line: 21 ]] --[[ Name: distance2 ]]
    local v9 = 0;
    for v10 = 1, #v7 do
        v9 = v9 + (v7[v10] - v8[v10]) * (v7[v10] - v8[v10]);
    end;
    return v9;
end;
v2.updateArea = function(v12) --[[ Line: 33 ]] --[[ Name: updateArea ]]
    -- upvalues: v11 (copy)
    local v13 = v11(v12.a, v12.b);
    local v14 = v11(v12.a, v12.c);
    local v15 = v11(v12.b, v12.c);
    local v16 = v13 + v14 - v15;
    v12.area = 4 * v13 * v14 - v16 * v16;
end;
return v2;