local l_Selection_0 = game:GetService("Selection");
local function v15(v1, v2) --[[ Line: 13 ]] --[[ Name: weldInstances ]]
    local v3 = OverlapParams.new();
    v3.FilterType = Enum.RaycastFilterType.Include;
    v3.Tolerance = 0.001;
    v3.FilterDescendantsInstances = v2;
    local v4 = false;
    for _, v6 in v2 do
        if v6:IsA("BasePart") then
            local l_workspace_PartsInPart_0 = workspace:GetPartsInPart(v6, v3);
            local l_v6_ConnectedParts_0 = v6:GetConnectedParts();
            local v9 = {};
            for _, v11 in l_v6_ConnectedParts_0 do
                v9[v11] = true;
            end;
            for _, v13 in l_workspace_PartsInPart_0 do
                if not v9[v13] then
                    local v14 = Instance.new(v1);
                    v14.Part0 = v6;
                    v14.Part1 = v13;
                    v14.Parent = v6;
                    v4 = true;
                end;
            end;
        end;
    end;
    return v4;
end;
local function _(v16, v17, v18) --[[ Line: 52 ]] --[[ Name: createWeld ]]
    local v19 = Instance.new(v16);
    v19.Part0 = v17;
    v19.Part1 = v18;
    v19.Parent = v17;
end;
return function(v21) --[[ Line: 59 ]]
    -- upvalues: l_Selection_0 (copy), v15 (copy)
    local v22 = l_Selection_0:Get();
    if #v22 == 2 and v22[1]:IsA("BasePart") and v22[2]:IsA("BasePart") then
        local v23 = v22[1];
        local v24 = v22[2];
        local v25 = Instance.new(v21);
        v25.Part0 = v23;
        v25.Part1 = v24;
        v25.Parent = v23;
        return true, true;
    else
        if #v22 > 0 and v21 ~= "NoCollisionConstraint" then
            local v26 = {};
            for v27 = 1, #v22 do
                local v28 = v22[v27];
                if v28:IsA("Model") then
                    for _, v30 in v28:GetDescendants() do
                        if v30:IsA("BasePart") then
                            table.insert(v26, v30);
                        end;
                    end;
                elseif v28:IsA("BasePart") then
                    table.insert(v26, v28);
                end;
            end;
            local v31 = v15(v21, v26);
            if #v26 >= 2 then
                return true, v31;
            end;
        end;
        return false, false;
    end;
end;