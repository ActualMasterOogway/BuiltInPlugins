local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.AddChange);
local v2 = require(l_Actions_0.ClearChange);
return function(v3, v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v4 (copy), v5 (copy), v2 (ref), v3 (copy), v1 (ref)
        local _ = nil;
        if if v6 then v6(v4, v5) else v4 == v5 then
            v7:dispatch(v2(v3));
            return;
        else
            v7:dispatch(v1(v3, v5));
            return;
        end;
    end;
end;