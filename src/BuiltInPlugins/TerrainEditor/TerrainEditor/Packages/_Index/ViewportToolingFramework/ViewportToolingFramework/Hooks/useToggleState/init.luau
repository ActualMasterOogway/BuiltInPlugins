local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
return function(v3) --[[ Line: 17 ]] --[[ Name: useToggleState ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4, v5 = v1.useState(if v2() then v3 or false else v3);
    local v6 = v1.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy)
        v5(true);
    end, {});
    local v7 = v1.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v5 (copy)
        v5(false);
    end, {});
    local v9 = if v2() then v1.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v5 (copy)
        v5(function(v8) --[[ Line: 31 ]]
            return not v8;
        end);
    end, {}) else nil;
    return {
        enabled = v4, 
        enable = v6, 
        disable = v7, 
        toggle = v9
    };
end;