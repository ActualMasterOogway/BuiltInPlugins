local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local function v15(v2) --[[ Line: 5 ]] --[[ Name: Serialize ]]
    local v3 = {};
    local function v4(v5) --[[ Line: 8 ]] --[[ Name: serializeSubsettings ]]
        -- upvalues: v4 (copy)
        local v6 = {};
        for v7, v8 in v5 do
            if typeof(v8) == "CFrame" then
                local l_Position_0 = v8.Position;
                local l_XVector_0 = v8.XVector;
                local l_YVector_0 = v8.YVector;
                local l_ZVector_0 = v8.ZVector;
                v6[v7] = {
                    x = l_Position_0.X, 
                    y = l_Position_0.Y, 
                    z = l_Position_0.Z, 
                    r00 = l_XVector_0.X, 
                    r10 = l_XVector_0.Y, 
                    r20 = l_XVector_0.Z, 
                    r01 = l_YVector_0.X, 
                    r11 = l_YVector_0.Y, 
                    r21 = l_YVector_0.Z, 
                    r02 = l_ZVector_0.X, 
                    r12 = l_ZVector_0.Y, 
                    r22 = l_ZVector_0.Z, 
                    serializedType = "CFrame"
                };
            elseif typeof(v8) == "Vector3" then
                v6[v7] = {
                    x = v8.X, 
                    y = v8.Y, 
                    z = v8.Z, 
                    serializedType = "Vector3"
                };
            elseif typeof(v8) == "Vector2" then
                v6[v7] = {
                    x = v8.X, 
                    y = v8.Y, 
                    serializedType = "Vector2"
                };
            elseif typeof(v8) == "EnumItem" then
                v6[v7] = {
                    name = v8.Name, 
                    serializedType = tostring(v8.EnumType)
                };
            elseif typeof(v8) == "table" then
                v6[v7] = {
                    value = v4(v8), 
                    serializedType = "table"
                };
            elseif typeof(v8) ~= "Instance" then
                v6[v7] = v8;
            end;
        end;
        return v6;
    end;
    for v13, v14 in v2 do
        v3[v13] = v4(v14);
    end;
    return v3;
end;
local function v29(v16) --[[ Line: 77 ]] --[[ Name: DEPRECATED_Serialize ]]
    local v17 = {};
    for v18, v19 in v16 do
        v17[v18] = {};
        for v20, v21 in v19 do
            if typeof(v21) == "CFrame" then
                local l_Position_1 = v21.Position;
                local l_XVector_1 = v21.XVector;
                local l_YVector_1 = v21.YVector;
                local l_ZVector_1 = v21.ZVector;
                local v26 = {
                    x = l_Position_1.X, 
                    y = l_Position_1.Y, 
                    z = l_Position_1.Z, 
                    r00 = l_XVector_1.X, 
                    r10 = l_XVector_1.Y, 
                    r20 = l_XVector_1.Z, 
                    r01 = l_YVector_1.X, 
                    r11 = l_YVector_1.Y, 
                    r21 = l_YVector_1.Z, 
                    r02 = l_ZVector_1.X, 
                    r12 = l_ZVector_1.Y, 
                    r22 = l_ZVector_1.Z, 
                    serializedType = "CFrame"
                };
                v17[v18][v20] = v26;
            elseif typeof(v21) == "Vector3" then
                local v27 = {
                    x = v21.X, 
                    y = v21.Y, 
                    z = v21.Z, 
                    serializedType = "Vector3"
                };
                v17[v18][v20] = v27;
            elseif typeof(v21) == "EnumItem" then
                local v28 = {
                    name = v21.Name, 
                    serializedType = tostring(v21.EnumType)
                };
                v17[v18][v20] = v28;
            else
                v17[v18][v20] = v21;
            end;
        end;
    end;
    return v17;
end;
if v1() then
    return v15;
else
    return v29;
end;