local _ = require(script.Parent.types.actions);
local _ = require(script.Parent.types.reducers);
return function(v2, v3) --[[ Line: 9 ]]
    return function(v4, v5) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v3 (copy)
        if v4 == nil then
            v4 = v2;
        end;
        local v6 = v3[v5.type];
        if v6 then
            return v6(v4, v5);
        else
            return v4;
        end;
    end;
end;