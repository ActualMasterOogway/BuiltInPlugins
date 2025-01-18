local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4) --[[ Line: 8 ]] --[[ Name: useForm ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v5 = v4:getTool();
    local v6, v7 = l_useState_0(v5:form());
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v7 (copy), v5 (copy)
        local v9 = v4.OnToolChanged:Connect(function(v8) --[[ Line: 13 ]]
            -- upvalues: v7 (ref)
            v7(v8:form());
        end);
        local v10 = v5.OnGizmoChanged:Connect(function() --[[ Line: 17 ]]
            -- upvalues: v7 (ref), v5 (ref)
            v7(v5:form());
        end);
        local v11 = v5.OnInternalsChanged:Connect(function() --[[ Line: 21 ]]
            -- upvalues: v7 (ref), v5 (ref)
            v7(v5:form());
        end);
        local v12 = v5.OnShortcutChanged:Connect(function() --[[ Line: 25 ]]
            -- upvalues: v7 (ref), v5 (ref)
            v7(v5:form());
        end);
        return function() --[[ Line: 29 ]]
            -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
            v9:Disconnect();
            v10:Disconnect();
            v11:Disconnect();
            v12:Disconnect();
        end;
    end, {
        v5
    });
    return v6, function(v13) --[[ Line: 37 ]] --[[ Name: saveForm ]]
        -- upvalues: v4 (copy), v7 (copy), v5 (copy)
        v4:getTool():saveForm(v13);
        v7(v5:form());
    end;
end;