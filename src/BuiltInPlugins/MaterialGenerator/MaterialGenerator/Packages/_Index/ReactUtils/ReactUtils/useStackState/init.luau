local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_LUAU_ANALYZE_ERROR_0 = l_script_FirstAncestor_0.LUAU_ANALYZE_ERROR;
return function(v3) --[[ Line: 8 ]] --[[ Name: useStackState ]]
    -- upvalues: v1 (copy), l_LUAU_ANALYZE_ERROR_0 (copy)
    local v4 = v1.useRef(v3 or {});
    assert(v4.current ~= nil, l_LUAU_ANALYZE_ERROR_0);
    local v5, v6 = v1.useState(#v4.current);
    local v8 = v1.useCallback(function(v7) --[[ Line: 20 ]]
        -- upvalues: v4 (copy), v6 (copy)
        table.insert(v4.current, v7);
        v6(#v4.current);
    end, {});
    local v10 = v1.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v4 (copy), v6 (copy)
        local v9 = table.remove(v4.current);
        v6(#v4.current);
        return v9;
    end, {});
    local v11 = v1.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v4 (copy)
        return v4.current[#v4.current];
    end, {});
    local v12 = v1.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v4 (copy), v6 (copy)
        table.clear(v4.current);
        v6(0);
    end, {});
    return {
        push = v8, 
        pop = v10, 
        getTop = v11, 
        clear = v12, 
        size = v5
    };
end;