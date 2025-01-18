local v0 = {};
local function _() --[[ Line: 4 ]] --[[ Name: initExtents ]]
    return Vector3.new(1e999, 1e999, 1e999, 0), (Vector3.new(-1e999, -1e999, -1e999, 0));
end;
local function _(v2, v3, v4, v5, v6) --[[ Line: 18 ]] --[[ Name: makeRotatedCorner ]]
    return v6 * Vector3.new(v2 * v5.X, v3 * v5.Y, v4 * v5.Z);
end;
local function v11(v8, v9, v10) --[[ Line: 27 ]] --[[ Name: growExtentsToIncludePoint ]]
    return Vector3.new(math.min(v10.X, v8.X), math.min(v10.Y, v8.Y), (math.min(v10.Z, v8.Z))), (Vector3.new(math.max(v10.X, v9.X), math.max(v10.Y, v9.Y), (math.max(v10.Z, v9.Z))));
end;
local function v26(v12, v13, v14, v15, v16, v17) --[[ Line: 45 ]] --[[ Name: growExtentsToInclude ]]
    -- upvalues: v11 (copy)
    local v18 = v14.Size / 2;
    local v19 = nil;
    for v20 = -1, 1, 2 do
        for v21 = -1, 1, 2 do
            for v22 = -1, 1, 2 do
                v19 = v14.CFrame * Vector3.new(v20 * v18.X, v21 * v18.Y, v22 * v18.Z);
                if v16 and v17 then
                    local v23 = v16:Inverse() * v19;
                    v19 = v16 * Vector3.new(v23.X, math.max(v17, v23.Y), v23.Z);
                end;
                v19 = v15 * v19;
                local v24, v25 = v11(v12, v13, v19);
                v12 = v24;
                v13 = v25;
            end;
        end;
    end;
    return v12, v13;
end;
local function v32(v27) --[[ Line: 83 ]] --[[ Name: getHeadAttachments ]]
    local v28 = {};
    local l_Head_0 = v27:FindFirstChild("Head");
    if l_Head_0 then
        for _, v31 in pairs(l_Head_0:GetChildren()) do
            if v31:IsA("Attachment") then
                v28[v31.Name] = true;
            end;
        end;
    end;
    return v28;
end;
v0.CalculateHeadExtents = function(v33, v34) --[[ Line: 96 ]] --[[ Name: CalculateHeadExtents ]]
    -- upvalues: v26 (copy), v32 (copy)
    local v35 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v36 = Vector3.new(-1e999, -1e999, -1e999, 0);
    local l_Head_1 = v33:FindFirstChild("Head");
    if not l_Head_1 then
        return v35, v36;
    else
        local v38 = v34:Inverse();
        local v39 = -l_Head_1.Size.Y / 2;
        local v40, v41 = v26(v35, v36, l_Head_1, v38);
        v35 = v40;
        v36 = v41;
        v40 = v32(v33);
        for _, v43 in pairs(v33:GetChildren()) do
            if v43:IsA("Accoutrement") then
                local l_Handle_0 = v43:FindFirstChild("Handle");
                if l_Handle_0 then
                    local l_Attachment_0 = l_Handle_0:FindFirstChildWhichIsA("Attachment");
                    if not l_Attachment_0 or v40[l_Attachment_0.Name] then
                        local v46, v47 = v26(v35, v36, l_Handle_0, v38, l_Head_1.CFrame, v39);
                        v35 = v46;
                        v36 = v47;
                    end;
                end;
            end;
        end;
        return v35, v36;
    end;
end;
return v0;