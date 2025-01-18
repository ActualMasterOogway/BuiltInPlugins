local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.reduce);
return function(v2, v3) --[[ Line: 34 ]] --[[ Name: frequencies ]]
    -- upvalues: v1 (copy)
    return v1(v2, function(v4, v5, v6) --[[ Line: 38 ]]
        -- upvalues: v3 (copy)
        local v7 = if v3 then v3(v5, v6) else v5;
        if v4[v7] == nil then
            v4[v7] = 1;
            return v4;
        else
            v4[v7] = v4[v7] + 1;
            return v4;
        end;
    end, {});
end;