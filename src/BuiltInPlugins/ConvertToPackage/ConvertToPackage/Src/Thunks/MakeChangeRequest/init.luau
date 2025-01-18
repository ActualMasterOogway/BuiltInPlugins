local l_Actions_0 = script.Parent.Parent.Parent.Src.Actions;
local v1 = require(l_Actions_0.AddChange);
local v2 = require(l_Actions_0.ClearChange);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (ref), v3 (copy), v1 (ref)
        if v4 == v5 then
            v6:dispatch(v2(v3));
            return;
        else
            v6:dispatch(v1(v3, v5));
            return;
        end;
    end;
end;