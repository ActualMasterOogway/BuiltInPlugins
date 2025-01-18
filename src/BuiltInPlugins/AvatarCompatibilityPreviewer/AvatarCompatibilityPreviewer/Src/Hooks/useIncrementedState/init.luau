local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function() --[[ Line: 12 ]] --[[ Name: useIncrementedState ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.useState(0);
    local v5 = v1.useCallback(function() --[[ Line: 15 ]]
        -- upvalues: v3 (copy)
        v3(function(v4) --[[ Line: 16 ]]
            return v4 + 1;
        end);
    end, {});
    local v7 = v1.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v3 (copy)
        v3(function(v6) --[[ Line: 22 ]]
            return v6 - 1;
        end);
    end, {});
    return {
        amount = v2, 
        increment = v5, 
        decrement = v7
    };
end;