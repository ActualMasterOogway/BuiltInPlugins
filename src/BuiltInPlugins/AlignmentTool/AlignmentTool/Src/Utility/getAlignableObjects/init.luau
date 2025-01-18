local l_Workspace_0 = game:GetService("Workspace");
return function(v1) --[[ Line: 10 ]]
    -- upvalues: l_Workspace_0 (copy)
    local v2 = table.create(64);
    local v3 = {};
    local v4 = table.create(64);
    local v5 = {};
    local l_Terrain_0 = l_Workspace_0.Terrain;
    local function _(v7) --[[ Line: 18 ]] --[[ Name: addAlignable ]]
        -- upvalues: v3 (copy), v2 (copy)
        if not v3[v7] then
            table.insert(v2, v7);
            v3[v7] = true;
        end;
    end;
    local function _(v9) --[[ Line: 25 ]] --[[ Name: addPart ]]
        -- upvalues: v5 (copy), v4 (copy)
        if not v5[v9] then
            table.insert(v4, v9);
            v5[v9] = true;
        end;
    end;
    for _, v12 in ipairs(v1) do
        if v12:IsA("BasePart") and v12 ~= l_Terrain_0 then
            if not v3[v12] then
                table.insert(v2, v12);
                v3[v12] = true;
            end;
            if not v5[v12] then
                table.insert(v4, v12);
                v5[v12] = true;
            end;
        elseif v12:IsA("Model") then
            if not v3[v12] then
                table.insert(v2, v12);
                v3[v12] = true;
            end;
            for _, v14 in ipairs(v12:GetDescendants()) do
                if v14:IsA("BasePart") and not v5[v14] then
                    table.insert(v4, v14);
                    v5[v14] = true;
                end;
            end;
        end;
    end;
    return v2, v4;
end;