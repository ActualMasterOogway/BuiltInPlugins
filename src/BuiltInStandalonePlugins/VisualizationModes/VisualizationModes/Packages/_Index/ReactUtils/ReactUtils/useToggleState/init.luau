local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = game:DefineFastFlag("UseToggleStateImprovements", false);
return function(v3) --[[ Line: 9 ]] --[[ Name: useToggleState ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4, v5 = v1.useState(v3 or false);
    local v6 = v1.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        v5(true);
    end, {});
    local v7 = v1.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy)
        v5(false);
    end, {});
    local v8 = nil;
    if v2 then
        v8 = v1.useCallback(function() --[[ Line: 28 ]]
            -- upvalues: v5 (copy)
            v5(function(v9) --[[ Line: 29 ]]
                return not v9;
            end);
        end, {});
    end;
    return {
        enabled = v4, 
        enable = v6, 
        disable = v7, 
        toggle = if v2 then v8 else nil, 
        set = if v2 then v5 else nil
    };
end;