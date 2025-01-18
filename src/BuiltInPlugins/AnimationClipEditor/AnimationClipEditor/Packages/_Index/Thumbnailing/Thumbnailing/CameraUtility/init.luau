local v0 = {};
local v1 = require(script.Parent.CFrameUtility);
local v2 = require(script.Parent.VectorUtility);
v0.DefaultHeadMarginScale = 1.1;
v0.DefaultBodyMarginScale = 1.1;
v0.DefaultBodyPartMarginScale = 1.2;
v0.XRotForFullBody = 15;
v0.XRotForCloseup = 0;
v0.DistanceScaleForFullBody = 1;
v0.GetCameraCFrame = function(v3, v4) --[[ Line: 36 ]]
    local v5 = v3 * v4;
    return CFrame.lookAt(v5, v3.Position);
end;
v0.CreateThumbnailCamera = function() --[[ Line: 48 ]]
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Name = "ThumbnailCamera";
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = workspace:GetChildren()[1];
    return l_Camera_0;
end;
v0.CalculateBaseDistanceToCamera = function(v7, v8, v9, v10) --[[ Line: 64 ]]
    local v11 = math.max((v9.X - v8.X) / 2, (v9.Y - v8.Y) / 2);
    local v12 = math.tan(v7 / 2);
    return v11 * v10 / v12;
end;
v0.SetupCamera = function(v13, v14) --[[ Line: 95 ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    if v14.optFieldOfView then
        v13.FieldOfView = v14.optFieldOfView;
    end;
    local v15 = v14.optFieldOfViewForDistanceScale or v13.FieldOfView;
    local v16 = v0.CalculateBaseDistanceToCamera(math.rad(v15), v14.minExtent, v14.maxExtent, v14.extentScale);
    if v14.optCameraDistanceScale then
        v16 = v16 * v14.optCameraDistanceScale;
    end;
    local v17 = v1.AdjustTargetCFrameWithExtents(v14.targetCFrame, v14.minExtent, v14.maxExtent);
    local v18 = v14.optCameraXRot or 0;
    local v19 = v14.optCameraYRot or 0;
    local v20 = v2.Vector3FromXYRotPlusDistance(v18, v19, v16);
    v13.CFrame = v0.GetCameraCFrame(v17, v20);
end;
return v0;