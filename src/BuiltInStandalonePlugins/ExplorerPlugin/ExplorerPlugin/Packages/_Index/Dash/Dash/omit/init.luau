local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.collectSet);
local v2 = require(l_Parent_0.forEach);
return function(v3, v4) --[[ Line: 12 ]] --[[ Name: omit ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = {};
    local v6 = v1(v4);
    v2(v3, function(_, v8) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v5 (copy), v3 (copy)
        if not v6[v8] then
            v5[v8] = v3[v8];
        end;
    end);
    return v5;
end;