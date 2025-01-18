local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v5 = require(l_Hooks_0.useMaterialVariants);
local v6 = require(l_Hooks_0.useSelectedParts);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
return function(v8) --[[ Line: 27 ]] --[[ Name: PreviewProvider ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy), l_LUAU_ANALYZE_ERROR_0 (copy), v1 (copy), v7 (copy)
    local v9, v10 = v2.useState(nil);
    local v11 = v6();
    local v12 = v2.useRef(false);
    v5();
    local v13 = v2.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v12 (copy)
        v12.current = false;
    end, {});
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v8 (copy), v9 (copy), v11 (copy), l_LUAU_ANALYZE_ERROR_0 (ref), v1 (ref), v12 (copy)
        if not v8.enabled then
            return;
        elseif not v9 or #v11 == 0 then
            return function() --[[ Line: 44 ]]

            end;
        else
            assert(v9 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            local v16 = v9:GetPropertyChangedSignal("BaseMaterial"):Connect(function() --[[ Line: 51 ]]
                -- upvalues: v11 (ref), v9 (ref)
                for _, v15 in v11 do
                    v15.Material = v9.BaseMaterial;
                end;
            end);
            local v19 = v9:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 57 ]]
                -- upvalues: v11 (ref), v9 (ref)
                for _, v18 in v11 do
                    v18.MaterialVariant = v9.Name;
                end;
            end);
            local v22 = v1.map(v11, function(v20) --[[ Line: 63 ]]
                -- upvalues: v9 (ref)
                local v21 = {
                    part = v20, 
                    material = v20.Material, 
                    materialVariant = v20.MaterialVariant
                };
                v20.Material = v9.BaseMaterial;
                v20.MaterialVariant = v9.Name;
                return v21;
            end);
            v12.current = true;
            return function() --[[ Line: 77 ]]
                -- upvalues: v16 (copy), v19 (copy), v12 (ref), v22 (copy)
                v16:Disconnect();
                v19:Disconnect();
                if v12.current and v22 and #v22 > 0 then
                    for _, v24 in v22 do
                        local l_part_0 = v24.part;
                        l_part_0.Material = v24.material;
                        l_part_0.MaterialVariant = v24.materialVariant;
                    end;
                end;
            end;
        end;
    end, {
        v8.enabled, 
        v9, 
        v11
    });
    local v26 = {
        selectedMaterial = v9, 
        setSelectedMaterial = v10, 
        applySelectedMaterial = v13
    };
    return v2.createElement(v7.Provider, {
        value = v26
    }, v8.children);
end;