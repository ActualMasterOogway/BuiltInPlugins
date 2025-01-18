local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local function v15(v2) --[[ Line: 5 ]] --[[ Name: Deserialize ]]
    local v3 = {};
    local function v4(v5) --[[ Line: 8 ]] --[[ Name: deserializeSubsettings ]]
        -- upvalues: v4 (copy)
        local v6 = {};
        for v7, v8 in v5 do
            if typeof(v8) ~= "table" or not v8.serializedType then
                v6[v7] = v8;
            elseif v8.serializedType == "CFrame" then
                local v9 = Vector3.new(v8.x, v8.y, v8.z);
                local v10 = Vector3.new(v8.r00, v8.r10, v8.r20);
                local v11 = Vector3.new(v8.r01, v8.r11, v8.r21);
                local v12 = Vector3.new(v8.r02, v8.r12, v8.r22);
                v6[v7] = CFrame.fromMatrix(v9, v10, v11, v12);
            elseif v8.serializedType == "Vector3" then
                v6[v7] = Vector3.new(v8.x, v8.y, v8.z);
            elseif v8.serializedType == "Vector2" then
                v6[v7] = Vector2.new(v8.x, v8.y);
            elseif v8.serializedType == "Material" then
                v6[v7] = Enum.Material[v8.name];
            elseif v8.serializedType == "table" then
                v6[v7] = v4(v8.value);
            elseif v8.serializedType then
                error((("Undefined serialized type %*"):format(v8.serializedType)));
            end;
        end;
        return v6;
    end;
    for v13, v14 in v2 do
        v3[v13] = v4(v14);
    end;
    return v3;
end;
local function v26(v16) --[[ Line: 43 ]] --[[ Name: DEPRECATED_Deserialize ]]
    local v17 = {};
    for v18, v19 in v16 do
        v17[v18] = {};
        for v20, v21 in v19 do
            if typeof(v21) ~= "table" or not v21.serializedType then
                v17[v18][v20] = v21;
            elseif v21.serializedType == "CFrame" then
                local v22 = Vector3.new(v21.x, v21.y, v21.z);
                local v23 = Vector3.new(v21.r00, v21.r10, v21.r20);
                local v24 = Vector3.new(v21.r01, v21.r11, v21.r21);
                local v25 = Vector3.new(v21.r02, v21.r12, v21.r22);
                v17[v18][v20] = CFrame.fromMatrix(v22, v23, v24, v25);
            elseif v21.serializedType == "Vector3" then
                v17[v18][v20] = Vector3.new(v21.x, v21.y, v21.z);
            elseif v21.serializedType == "Material" then
                v17[v18][v20] = Enum.Material[v21.name];
            elseif v21.serializedType then

            end;
        end;
    end;
    return v17;
end;
if v1() then
    return v15;
else
    return v26;
end;