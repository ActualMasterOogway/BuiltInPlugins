local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 12 ]] --[[ Name: useIncrementedState ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(v2 or 0);
    local v6 = v1.useCallback(function() --[[ Line: 15 ]]
        -- upvalues: v4 (copy)
        v4(function(v5) --[[ Line: 16 ]]
            return v5 + 1;
        end);
    end, {});
    local v8 = v1.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v4 (copy)
        v4(function(v7) --[[ Line: 22 ]]
            return v7 - 1;
        end);
    end, {});
    return {
        amount = v3, 
        increment = v6, 
        decrement = v8
    };
end;