local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local function v10(v4) --[[ Line: 8 ]] --[[ Name: getSelectedMeshParts ]]
    local v5 = {};
    for _, v7 in v4:Get() do
        if v7:IsA("MeshPart") then
            table.insert(v5, v7);
        end;
        for _, v9 in (v7:GetDescendants()) do
            if v9:IsA("MeshPart") then
                table.insert(v5, v9);
            end;
        end;
    end;
    return v5;
end;
return function() --[[ Line: 25 ]] --[[ Name: useSelectedMeshParts ]]
    -- upvalues: v3 (copy), v2 (copy), v10 (copy), v1 (copy)
    local v11 = v3:use():get();
    local v12, v13 = v2.useState(function() --[[ Line: 27 ]]
        -- upvalues: v10 (ref), v11 (copy)
        return (v10(v11));
    end);
    local v14, v15 = v2.useState(v12);
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v11 (copy), v10 (ref), v13 (copy), v1 (ref)
        local v18 = v11.SelectionChanged:Connect(function() --[[ Line: 36 ]]
            -- upvalues: v10 (ref), v11 (ref), v13 (ref), v1 (ref)
            local v16 = v10(v11);
            v13(function(v17) --[[ Line: 38 ]]
                -- upvalues: v1 (ref), v16 (copy)
                if v1.shallowEqual(v17, v16) then
                    return v17;
                else
                    return v16;
                end;
            end);
        end);
        return function() --[[ Line: 51 ]]
            -- upvalues: v18 (copy)
            v18:Disconnect();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v12 (copy)
        v15(v12);
        local v19 = {};
        local v20 = {};
        for _, v22 in v12 do
            v20[v22] = v22.Orientation;
            table.insert(v19, v22.Changed:Connect(function() --[[ Line: 66 ]]
                -- upvalues: v20 (ref), v22 (copy), v15 (ref)
                if v20[v22] ~= v22.Orientation then
                    v20[v22] = v22.Orientation;
                    v15(table.clone);
                end;
            end));
            table.insert(v19, v22.DescendantAdded:Connect(function(v23) --[[ Line: 76 ]]
                -- upvalues: v15 (ref)
                if v23:IsA("SurfaceAppearance") then
                    v15(table.clone);
                end;
            end));
            local l_SurfaceAppearance_0 = v22:FindFirstChildOfClass("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                table.insert(v19, l_SurfaceAppearance_0.Changed:Connect(function(_) --[[ Line: 87 ]]
                    -- upvalues: v15 (ref)
                    v15(table.clone);
                end));
            end;
        end;
        return function() --[[ Line: 94 ]]
            -- upvalues: v19 (copy), v20 (ref)
            for _, v27 in v19 do
                v27:Disconnect();
            end;
            v20 = {};
        end;
    end, {
        v12
    });
    if table.isfrozen(v14) then
        return v14;
    else
        return (table.freeze(v14));
    end;
end;