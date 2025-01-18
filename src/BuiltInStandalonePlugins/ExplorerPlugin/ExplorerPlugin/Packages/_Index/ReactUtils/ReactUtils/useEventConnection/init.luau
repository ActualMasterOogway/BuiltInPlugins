local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: useEventConnection ]]
    -- upvalues: v1 (copy)
    local v5 = v1.useMemo(function() --[[ Line: 8 ]]
        -- upvalues: v3 (copy)
        return v3;
    end, v4);
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v2 (copy), v5 (copy)
        local v6 = v2:Connect(v5);
        return function() --[[ Line: 15 ]]
            -- upvalues: v6 (copy)
            v6:Disconnect();
        end;
    end, {
        v2, 
        v5
    });
end;