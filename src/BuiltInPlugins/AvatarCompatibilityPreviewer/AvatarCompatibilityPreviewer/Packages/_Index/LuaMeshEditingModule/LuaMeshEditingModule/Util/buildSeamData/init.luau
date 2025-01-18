local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local function v9(v2, v3, v4, v5, v6) --[[ Line: 20 ]] --[[ Name: addWithoutDuplicating ]]
    -- upvalues: v1 (copy)
    assert(v1(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
    for _, v8 in v2[v3][v4] do
        if v8.Index == v6 and v8.MeshName == v5 then
            return;
        end;
    end;
    table.insert(v2[v3][v4], {
        Index = v6, 
        MeshName = v5
    });
end;
local function v36(v10, v11, v12, v13) --[[ Line: 35 ]] --[[ Name: findSeams ]]
    -- upvalues: v1 (copy), v9 (copy)
    local v14 = {};
    local v15 = v11 == v12;
    local v16 = v10:getVertexData();
    local v17 = v16[v11];
    local v18 = v10:getMeshOrigin(v11);
    for v19, v20 in pairs(v17) do
        local v21 = v18 * v20;
        local v22 = math.floor(v21.X * 100);
        local v23 = math.floor(v21.Y * 100);
        local v24 = math.floor(v21.Z * 100);
        if not v14[v22] then
            v14[v22] = {};
        end;
        if not v14[v22][v23] then
            v14[v22][v23] = {};
        end;
        if not v14[v22][v23][v24] then
            v14[v22][v23][v24] = {};
        end;
        table.insert(v14[v22][v23][v24], v19);
    end;
    local v25 = v16[v12];
    local v26 = v10:getMeshOrigin(v12);
    for v27, v28 in pairs(v25) do
        local v29 = v26 * v28;
        local v30 = math.floor(v29.X * 100);
        local v31 = math.floor(v29.Y * 100);
        local v32 = math.floor(v29.Z * 100);
        local v33 = v14[v30] and v14[v30][v31] and v14[v30][v31][v32];
        if v33 then
            for _, v35 in ipairs(v33) do
                if not v15 or v15 and v35 ~= v27 then
                    if not v13[v11] then
                        v13[v11] = {};
                    end;
                    if not v13[v11][v35] then
                        v13[v11][v35] = {};
                    end;
                    if v1() then
                        v9(v13, v11, v35, v12, v27);
                    else
                        table.insert(v13[v11][v35], {
                            Index = v27, 
                            MeshName = v12
                        });
                    end;
                    if not v13[v12] then
                        v13[v12] = {};
                    end;
                    if not v13[v12][v27] then
                        v13[v12][v27] = {};
                    end;
                    if v1() then
                        v9(v13, v12, v27, v11, v35);
                    else
                        table.insert(v13[v12][v27], {
                            Index = v35, 
                            MeshName = v11
                        });
                    end;
                end;
            end;
        end;
    end;
end;
return function(v37, v38) --[[ Line: 112 ]]
    -- upvalues: v36 (copy)
    local v39 = {};
    for _, v41 in ipairs(v38) do
        local l_instance_0 = v41.instance;
        local v43 = if l_instance_0:IsA("MeshPart") then l_instance_0 else l_instance_0:FindFirstAncestorOfClass("MeshPart");
        if v43 then
            v36(v37, l_instance_0.Name, l_instance_0.Name, v39);
            local l_Motor6D_0 = v43:FindFirstChildOfClass("Motor6D");
            if l_Motor6D_0 then
                local l_Part0_0 = l_Motor6D_0.Part0;
                if l_Part0_0 then
                    local l_BaseWrap_0 = l_Part0_0:FindFirstChildWhichIsA("BaseWrap");
                    if l_BaseWrap_0 then
                        v36(v37, l_instance_0.Name, l_BaseWrap_0.Name, v39);
                    end;
                end;
            end;
        end;
    end;
    return v39;
end;