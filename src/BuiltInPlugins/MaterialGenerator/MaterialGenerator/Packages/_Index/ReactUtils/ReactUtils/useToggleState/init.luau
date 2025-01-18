local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 6 ]] --[[ Name: useToggleState ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(v2);
    local v5 = v1.useCallback(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        v4(true);
    end, {});
    local v6 = v1.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy)
        v4(false);
    end, {});
    return {
        enabled = v3, 
        enable = v5, 
        disable = v6
    };
end;