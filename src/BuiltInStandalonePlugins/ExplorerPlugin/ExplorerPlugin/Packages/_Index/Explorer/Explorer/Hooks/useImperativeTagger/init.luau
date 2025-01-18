local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 7 ]] --[[ Name: useImperativeTagger ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef({});
    local v8 = v1.useCallback(function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_current_0 = v2.current;
        local v7 = v3.current[v4];
        if v7 == v5 then
            return;
        else
            if l_current_0 ~= nil and v7 ~= nil then
                l_current_0:RemoveTag(v7);
            end;
            v3.current[v4] = v5;
            if l_current_0 ~= nil and v5 ~= nil then
                l_current_0:AddTag(v5);
            end;
            return;
        end;
    end, {
        v2
    });
    v1.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_current_1 = v2.current;
        if l_current_1 == nil then
            return;
        else
            for _, v11 in v3.current do
                assert(v11 ~= nil, "Luau");
                l_current_1:AddTag(v11);
            end;
            return;
        end;
    end, {
        v2.current
    });
    return v8;
end;