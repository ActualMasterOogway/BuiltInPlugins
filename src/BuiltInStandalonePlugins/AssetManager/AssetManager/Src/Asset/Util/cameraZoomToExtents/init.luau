local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagZoomToExtentsApi);
local function _(v2, v3) --[[ Line: 6 ]] --[[ Name: getCameraOffset ]]
    local l_ViewportSize_0 = v3.ViewportSize;
    local v5 = math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y);
    local v6 = math.atan(math.tan((math.rad(v3.FieldOfView / 2))) * v5);
    return v2.Magnitude / 2 / math.sin(v6);
end;
local function v21(v8) --[[ Line: 16 ]] --[[ Name: calculateBoundingBox ]]
    local v9 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v10 = Vector3.new(-1e999, -1e999, -1e999, 0);
    local function v16(v11) --[[ Line: 21 ]] --[[ Name: updateBoundingBox ]]
        -- upvalues: v9 (ref), v10 (ref)
        local v12 = if v11:IsA("Model") then v11:GetPivot() else v11.CFrame;
        local v13 = (if v11:IsA("Model") then v11:GetExtentsSize() else v11.Size) * 0.5;
        local v14 = v12.Position + Vector3.new(-v13.X, -v13.Y, -v13.Z);
        local v15 = v12.Position + Vector3.new(v13.X, v13.Y, v13.Z);
        v9 = Vector3.new(math.min(v9.X, v14.X), math.min(v9.Y, v14.Y), (math.min(v9.Z, v14.Z)));
        v10 = Vector3.new(math.max(v10.X, v15.X), math.max(v10.Y, v15.Y), (math.max(v10.Z, v15.Z)));
    end;
    for _, v18 in v8 do
        if v18:IsA("Model") or v18:IsA("BasePart") or v18:IsA("MeshPart") then
            v16(v18);
        end;
    end;
    if v9 == Vector3.new(1e999, 1e999, 1e999, 0) and v10 == Vector3.new(-1e999, -1e999, -1e999, 0) then
        return CFrame.new(), (Vector3.new());
    else
        local v19 = (v9 + v10) * 0.5;
        local v20 = v10 - v9;
        return CFrame.new(v19), v20;
    end;
end;
return function(v22, v23) --[[ Line: 67 ]] --[[ Name: cameraZoomToExtents ]]
    -- upvalues: v21 (copy), v1 (copy)
    local v24, v25 = v21(v23);
    if v25 == Vector3.new() then
        return;
    elseif v1() then
        v22:ZoomToExtents(v24, v25);
        return;
    else
        local l_ViewportSize_1 = v22.ViewportSize;
        local v27 = math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y);
        local v28 = math.atan(math.tan((math.rad(v22.FieldOfView / 2))) * v27);
        local v29 = v25.Magnitude / 2 / math.sin(v28);
        l_ViewportSize_1 = v22.CFrame;
        v22.CFrame = CFrame.new(v24.p - l_ViewportSize_1.LookVector * v29);
        v22.Focus = v24;
        return;
    end;
end;