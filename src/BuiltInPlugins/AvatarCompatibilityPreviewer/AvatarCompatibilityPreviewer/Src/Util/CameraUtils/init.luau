local v1 = {
    getCuboidDiameter = function(v0) --[[ Line: 5 ]] --[[ Name: getCuboidDiameter ]]
        return (math.sqrt(v0.X ^ 2 + v0.Y ^ 2 + v0.Z ^ 2));
    end
};
v1.fitBoundingBoxToCamera = function(v2, v3, v4) --[[ Line: 13 ]] --[[ Name: fitBoundingBoxToCamera ]]
    -- upvalues: v1 (copy)
    local v5 = v1.getCuboidDiameter(v2) / 2;
    return v1.fitSphereToCamera(v5, v3, v4);
end;
v1.fitSphereToCamera = function(v6, v7, v8) --[[ Line: 26 ]] --[[ Name: fitSphereToCamera ]]
    local v9 = 0.5 * math.rad(v7);
    if v8 < 1 then
        v9 = math.atan(v8 * math.tan(v9));
    end;
    return v6 / math.sin(v9);
end;
v1.getZoomedCFrame = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: getZoomedCFrame ]]
    -- upvalues: v1 (copy)
    local l_v11_BoundingBox_0, v14 = v11:GetBoundingBox();
    local v15 = v1.fitBoundingBoxToCamera(v14, v10.FieldOfView, v12);
    return v10.CFrame.Rotation + l_v11_BoundingBox_0.Position - v10.CFrame.LookVector * v15;
end;
v1.getAngledAndZoomedCFrame = function(v16, v17, v18) --[[ Line: 41 ]] --[[ Name: getAngledAndZoomedCFrame ]]
    -- upvalues: v1 (copy)
    local l_v17_BoundingBox_0, v20 = v17:GetBoundingBox();
    local v21 = v1.fitBoundingBoxToCamera(v20, v16.FieldOfView, v18);
    local v22 = CFrame.lookAt(l_v17_BoundingBox_0.Position + v20.Magnitude * l_v17_BoundingBox_0.LookVector * 2 - v20.Magnitude * l_v17_BoundingBox_0.RightVector * 1 + v20.Magnitude * l_v17_BoundingBox_0.UpVector * 0.5, l_v17_BoundingBox_0.Position);
    return v22.Rotation + l_v17_BoundingBox_0.Position - v22.LookVector * v21;
end;
v1.zoomToExtents = function(v23, v24, v25) --[[ Line: 54 ]] --[[ Name: zoomToExtents ]]
    -- upvalues: v1 (copy)
    local l_v24_BoundingBox_0 = v24:GetBoundingBox();
    v23.CameraType = Enum.CameraType.Fixed;
    v23.CFrame = v1.getZoomedCFrame(v23, v24, v25);
    v23.Focus = l_v24_BoundingBox_0;
end;
v1.zoomIsRequired = function(v27, v28) --[[ Line: 62 ]] --[[ Name: zoomIsRequired ]]
    local _, v30 = v27:WorldToScreenPoint(v28:GetBoundingBox().Position);
    return not v30;
end;
return v1;