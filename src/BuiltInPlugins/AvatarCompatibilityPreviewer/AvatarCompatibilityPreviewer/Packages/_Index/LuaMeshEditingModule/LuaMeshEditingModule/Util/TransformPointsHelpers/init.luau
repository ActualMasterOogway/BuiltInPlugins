local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v2 = {};
local function v15(v3, v4, v5, v6) --[[ Line: 13 ]] --[[ Name: getTransformedPoints ]]
    local v7 = {};
    for v8, v9 in pairs(v5) do
        local v10 = v3:getMeshOrigin(v8);
        if not v7[v8] then
            v7[v8] = {};
        end;
        for v11, v12 in pairs(v9) do
            local v13 = v4[v8][v11];
            if v13 then
                local v14 = v6(v10, v13, v12);
                v7[v8][v11] = v14;
            end;
        end;
    end;
    return v7;
end;
local function _(v16, v17) --[[ Line: 31 ]] --[[ Name: reflectPointThroughPlane ]]
    return v16 - 2 * (v16:Dot(v17) / v17:Dot(v17)) * v17;
end;
v2.transformControlPoints = function(v19, v20, v21, v22, v23) --[[ Line: 37 ]] --[[ Name: transformControlPoints ]]
    -- upvalues: v15 (copy)
    local v24 = v15(v19, v20, v22, v23);
    for v25, v26 in pairs(v24) do
        local v27 = v21[v25];
        for v28, v29 in pairs(v26) do
            v27[v28] = v29;
        end;
    end;
end;
v2.transformVertices = function(v30, v31, v32, v33) --[[ Line: 53 ]] --[[ Name: transformVertices ]]
    -- upvalues: v15 (copy)
    v30:updateVertexData((v15(v30, v31, v32, v33)));
end;
v2.translatePoint = function(v34, v35, v36, v37) --[[ Line: 58 ]] --[[ Name: translatePoint ]]
    -- upvalues: v1 (copy)
    if v1() and v37 < 0 then
        local l_RightVector_0 = v36.RightVector;
        local l_new_0 = CFrame.new;
        local l_Position_0 = v35.Position;
        v35 = l_new_0(l_Position_0 - 2 * (l_Position_0:Dot(l_RightVector_0) / l_RightVector_0:Dot(l_RightVector_0)) * l_RightVector_0) * v35.Rotation;
        v37 = -v37;
    end;
    local v41 = v35 - v35.p + v35.p * v37;
    return v36:inverse() * (v41 * (v36 * v34));
end;
v2.scalePoint = function(v42, v43, v44, v45, v46) --[[ Line: 72 ]] --[[ Name: scalePoint ]]
    local v47 = Vector3.new((1 - v43.X) * (1 - v46) + v43.X, (1 - v43.Y) * (1 - v46) + v43.Y, (1 - v43.Z) * (1 - v46) + v43.Z);
    local v48 = v44:inverse() * (v45 * v42);
    return v45:inverse() * v44 * (v47 * v48);
end;
v2.rotatePoint = function(v49, v50, v51, v52, v53, v54) --[[ Line: 83 ]] --[[ Name: rotatePoint ]]
    v51 = v51 * v54;
    local v55 = CFrame.fromAxisAngle(v50, v51);
    local v56 = v53 * v49 - v52;
    return v53:inverse() * (v55 * v56 + v52);
end;
return v2;