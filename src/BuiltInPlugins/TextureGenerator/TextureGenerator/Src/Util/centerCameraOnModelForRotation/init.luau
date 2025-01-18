local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v2, v3, v4, v5) --[[ Line: 7 ]] --[[ Name: centerCameraOnModelForRotation ]]
    -- upvalues: v1 (copy)
    local l_v2_ExtentsSize_0 = v2:GetExtentsSize();
    local v7 = (v5 or l_v2_ExtentsSize_0.Magnitude) * v1.CAMERA_DISTANCE_SCALE;
    local v8, v9, v10 = v3:ToEulerAnglesYXZ();
    local v11 = CFrame.lookAt(Vector3.new(), -v1.INITIAL_FOCUS_DIRECTION);
    local v12 = CFrame.fromEulerAnglesYXZ(-v8, -v9, -v10) * v11;
    local v13 = v7 * -v12.LookVector;
    local v14 = CFrame.new(v4 or Vector3.new());
    return CFrame.new(v14.Position + v13) * v12, v14;
end;