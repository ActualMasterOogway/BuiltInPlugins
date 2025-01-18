local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: useEventConnection ]]
    -- upvalues: v1 (copy)
    local v5 = v1.useMemo(function() --[[ Line: 6 ]]
        -- upvalues: v3 (copy)
        return v3;
    end, v4);
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v2 (copy), v5 (copy)
        local v6 = v2:Connect(v5);
        return function() --[[ Line: 13 ]]
            -- upvalues: v6 (copy)
            v6:Disconnect();
        end;
    end, {
        v2, 
        v5
    });
end;