local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: useKeyedState ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState({});
    local v8 = v1.useCallback(function(v6) --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v3 (copy), v2 (copy)
        v5(function(v7) --[[ Line: 13 ]]
            -- upvalues: v3 (ref), v6 (copy), v2 (ref)
            v7 = table.clone(v7);
            v7[v3] = if v7[v3] == nil then v6(v2(v3)) else v6(v7[v3]);
            return v7;
        end);
    end, {
        v3, 
        v2
    });
    return if v4[v3] == nil then v2(v3) else v4[v3], v8;
end;