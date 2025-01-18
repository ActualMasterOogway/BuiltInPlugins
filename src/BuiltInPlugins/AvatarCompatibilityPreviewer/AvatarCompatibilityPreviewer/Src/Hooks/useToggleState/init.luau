local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 6 ]] --[[ Name: useToggleState ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(v2);
    local v5 = v1.useCallback(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy)
        v4(true);
    end, {});
    local v6 = v1.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy)
        v4(false);
    end, {});
    local v8 = v1.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        v4(function(v7) --[[ Line: 23 ]]
            return not v7;
        end);
    end, {});
    return {
        enabled = v3, 
        enable = v5, 
        disable = v6, 
        toggle = v8
    };
end;