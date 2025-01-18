local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2, v3, v4) --[[ Line: 10 ]] --[[ Name: useInstanceSetting ]]
    -- upvalues: v1 (copy)
    local v6 = v1.useCallback(function() --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v3 (copy), v4 (copy)
        if v2 == nil or v3 == nil then
            return v4;
        else
            local v5 = v2[v3];
            if typeof(v5) == typeof(v4) then
                return v5;
            else
                return v4;
            end;
        end;
    end, {
        v2, 
        v3, 
        v4
    });
    local v7, v8 = v1.useState(v6);
    v1.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v3 (copy), v2 (copy), v6 (copy), v7 (copy), v8 (copy)
        if v3 == nil or v2 == nil then
            return;
        else
            if v6() ~= v7 then
                v8(v7);
            end;
            return;
        end;
    end, {
        v6
    });
    v1.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v2 (copy), v3 (copy), v8 (copy)
        if v2 == nil or v3 == nil then
            return nil;
        else
            local l_v2_0 = v2;
            local v10 = l_v2_0:GetPropertyChangedSignal(v3):Connect(function() --[[ Line: 46 ]]
                -- upvalues: v8 (ref), l_v2_0 (copy), v3 (ref)
                v8(l_v2_0[v3]);
            end);
            return function() --[[ Line: 50 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        end;
    end, {
        v2, 
        v3
    });
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v3 (copy), v2 (copy), v7 (copy)
        if v3 == nil or v2 == nil then
            return;
        else
            v2[v3] = v7;
            return;
        end;
    end, {
        v7, 
        v3
    });
    return v7, v8;
end;