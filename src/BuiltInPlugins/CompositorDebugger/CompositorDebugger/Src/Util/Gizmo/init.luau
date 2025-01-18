local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg"
};
local v3 = {
    Head = "UpperTorso", 
    UpperTorso = "LowerTorso", 
    LeftHand = "LeftLowerArm", 
    LeftLowerArm = "LeftUpperArm", 
    LeftUpperArm = "UpperTorso", 
    RightHand = "RightLowerArm", 
    RightLowerArm = "RightUpperArm", 
    RightUpperArm = "UpperTorso", 
    LeftFoot = "LeftLowerLeg", 
    LeftLowerLeg = "LeftUpperLeg", 
    LeftUpperLeg = "LowerTorso", 
    RightFoot = "RightLowerLeg", 
    RightLowerLeg = "RightUpperLeg", 
    RightUpperLeg = "LowerTorso"
};
local v4 = {};
v4.__index = v4;
local function _(v5) --[[ Line: 60 ]] --[[ Name: getGizmosFolder ]]
    -- upvalues: v1 (copy)
    local v6 = v5 and v5:FindFirstChild(v1.FOLDERS.CompositorDebugger);
    return v6 and v6:FindFirstChild(v1.FOLDERS.Gizmos);
end;
v4.new = function(v8, v9) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v10 = setmetatable({}, v4);
    local v11 = v8 and v8:FindFirstChild(v1.FOLDERS.CompositorDebugger);
    local v12 = v11 and v11:FindFirstChild(v1.FOLDERS.Gizmos);
    v11 = v8 and v8:FindFirstChild("HumanoidRootPart");
    if not v12 or not v11 then
        return nil;
    else
        v10.gizmoInstance = if v12 then v12:FindFirstChild(v9) else nil;
        if not v10.gizmoInstance then
            local l_WireframeHandleAdornment_0 = Instance.new("WireframeHandleAdornment");
            l_WireframeHandleAdornment_0.Name = v9;
            l_WireframeHandleAdornment_0.Parent = v12;
            l_WireframeHandleAdornment_0.Adornee = v11;
            l_WireframeHandleAdornment_0.AlwaysOnTop = true;
            v10.gizmoInstance = l_WireframeHandleAdornment_0;
        end;
        v10.commands = {};
        return v10;
    end;
end;
local function v22(v14, v15, v16, v17) --[[ Line: 91 ]] --[[ Name: drawCircle ]]
    local v18 = v17 or Vector3.yAxis;
    local v19 = CFrame.lookAlong(v15, v18);
    local v20 = {};
    for v21 = 1, 12 do
        table.insert(v20, (v19:PointToWorldSpace(Vector3.new(math.cos(v21 * 0.5235987755982988), math.sin(v21 * 0.5235987755982988), 0) * v16)));
    end;
    v14:AddPath(v20, true);
end;
v4.DrawLine = function(v23, v24, v25) --[[ Line: 106 ]] --[[ Name: DrawLine ]]
    table.insert(v23.commands, function() --[[ Line: 107 ]]
        -- upvalues: v23 (copy), v24 (copy), v25 (copy)
        v23.gizmoInstance:AddLine(v24, v25);
    end);
end;
v4.DrawSphere = function(v26, v27, v28) --[[ Line: 112 ]] --[[ Name: DrawSphere ]]
    -- upvalues: v22 (copy)
    table.insert(v26.commands, function() --[[ Line: 113 ]]
        -- upvalues: v27 (copy), v22 (ref), v26 (copy), v28 (copy)
        local v29 = if typeof(v27) == "Vector3" then CFrame.new(v27) else v27;
        v22(v26.gizmoInstance, v29.Position, v28, v29.Rotation * Vector3.xAxis);
        v22(v26.gizmoInstance, v29.Position, v28, v29.Rotation * Vector3.yAxis);
        v22(v26.gizmoInstance, v29.Position, v28, v29.Rotation * Vector3.zAxis);
    end);
end;
v4.DrawPose = function(v30, v31, v32) --[[ Line: 121 ]] --[[ Name: DrawPose ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    if not v31 then
        return;
    else
        for _, v34 in v2 do
            local l_v31_ArticulatedJoint_0 = v31:GetArticulatedJoint(v34, v32);
            if l_v31_ArticulatedJoint_0 then
                v30:DrawSphere(l_v31_ArticulatedJoint_0.ModelCFrame, v1.GIZMOS.SphereRadius);
            end;
        end;
        for v36, v37 in v3 do
            local l_v31_ArticulatedJoint_1 = v31:GetArticulatedJoint(v36, v32);
            local l_v31_ArticulatedJoint_2 = v31:GetArticulatedJoint(v37, v32);
            if l_v31_ArticulatedJoint_1 and l_v31_ArticulatedJoint_2 then
                v30:DrawLine(l_v31_ArticulatedJoint_1.ModelCFrame.Position, l_v31_ArticulatedJoint_2.ModelCFrame.Position);
            end;
        end;
        return;
    end;
end;
v4.SetColor = function(v40, v41) --[[ Line: 141 ]] --[[ Name: SetColor ]]
    if v40.gizmoInstance then
        v40.gizmoInstance.Color3 = v41;
    end;
end;
v4.Update = function(v42) --[[ Line: 147 ]] --[[ Name: Update ]]
    if v42.gizmoInstance then
        v42.gizmoInstance:Clear();
        for _, v44 in v42.commands do
            v44();
        end;
    end;
    v42.commands = {};
end;
v4.Destroy = function(v45) --[[ Line: 157 ]] --[[ Name: Destroy ]]
    if v45.gizmoInstance then
        v45.gizmoInstance:Destroy();
    end;
    v45.gizmoInstance = nil;
end;
return v4;