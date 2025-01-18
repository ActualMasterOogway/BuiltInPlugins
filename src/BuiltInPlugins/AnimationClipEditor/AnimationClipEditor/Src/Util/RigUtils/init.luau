local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local v7 = game:DefineFastFlag("AnimationClipEditorRemoveThumbnailing", false);
local v8 = require(l_script_FirstAncestor_0.Packages.Thumbnailing);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = v6.Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v13 = if v7 then require(l_script_FirstAncestor_0.Src.Util.CharacterUtility) else v8.CharacterUtility;
local v14 = if v7 then require(l_script_FirstAncestor_0.Src.Util.CFrameUtility) else v8.CFrameUtility;
local v15 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Adorn);
local _ = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v19 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v20 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v21 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v34 = {
    canUseFaceControlsEditor = function(v22) --[[ Line: 42 ]] --[[ Name: canUseFaceControlsEditor ]]
        -- upvalues: v19 (copy)
        if not v22 then
            return false;
        elseif not v22:FindFirstChildOfClass("Humanoid") then
            return false;
        elseif v19.getFaceControls(v22) == nil then
            return false;
        else
            return true;
        end;
    end, 
    getJoints = function(v23, v24) --[[ Line: 60 ]] --[[ Name: getJoints ]]
        -- upvalues: v19 (copy), v20 (copy), v21 (copy)
        local v25 = {};
        local v26 = v19.getRigInfo(v24);
        local l_PartNameToMotor_0 = v26.PartNameToMotor;
        local l_PartNameToAnimConstraint_0 = v26.PartNameToAnimConstraint;
        local l_BoneNameToBone_0 = v26.BoneNameToBone;
        for _, v31 in ipairs(v23) do
            local l_Name_0 = v31.Name;
            if l_PartNameToMotor_0[l_Name_0] then
                table.insert(v25, {
                    Type = v20.JOINT_TYPES.Motor6D, 
                    Part0 = l_PartNameToMotor_0[l_Name_0].Part0, 
                    Part1 = l_PartNameToMotor_0[l_Name_0].Part1, 
                    C0 = l_PartNameToMotor_0[l_Name_0].C0, 
                    C1 = l_PartNameToMotor_0[l_Name_0].C1
                });
            elseif l_BoneNameToBone_0[l_Name_0] then
                table.insert(v25, {
                    Type = v20.JOINT_TYPES.Bone, 
                    Bone = l_BoneNameToBone_0[l_Name_0]
                });
            elseif v21() then
                local v33 = l_PartNameToAnimConstraint_0[l_Name_0];
                if v33 and v33.Attachment0 and v33.Attachment1 then
                    table.insert(v25, {
                        Type = v20.JOINT_TYPES.AnimationConstraint, 
                        Part0 = v19.getPart0(v33), 
                        Part1 = v19.getPart1(v33), 
                        C0 = v33.Attachment0.CFrame, 
                        C1 = v33.Attachment1.CFrame
                    });
                end;
            end;
        end;
        return v25;
    end
};
v34.resetAllFacsValuesInFaceControls = function(v35) --[[ Line: 98 ]] --[[ Name: resetAllFacsValuesInFaceControls ]]
    -- upvalues: v34 (copy), v19 (copy), v20 (copy)
    if not v34.canUseFaceControlsEditor(v35) then
        return;
    else
        local v36 = v19.getFaceControls(v35);
        if v36 ~= nil then
            for _, v38 in pairs(v20.FacsNames) do
                v36[v38] = 0;
            end;
        end;
        return;
    end;
end;
v34.stepRigAnimation = function(v39, v40, v41) --[[ Line: 111 ]] --[[ Name: stepRigAnimation ]]
    -- upvalues: v19 (copy), v21 (copy), v15 (copy), v20 (copy), l_RunService_0 (copy)
    local v42 = v19.getAnimator(v39);
    local v43 = v19.getRigInfo(v39);
    local l_Parts_0 = v43.Parts;
    local l_PartNameToMotor_1 = v43.PartNameToMotor;
    local l_PartNameToAnimConstraint_1 = v43.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v43.BoneNameToBone;
    local v48 = if v39:IsA("Model") then v39:GetScale() else 1;
    for _, v50 in ipairs(l_Parts_0) do
        local v51 = l_PartNameToMotor_1[v50.Name] or l_BoneNameToBone_1[v50.Name] or v21() and l_PartNameToAnimConstraint_1[v50.Name];
        if v51 then
            local v52 = v40.Tracks[v50.Name];
            if v52 then
                local v53 = v15.getValue(v52, v41);
                v51.Transform = v53.Rotation + v53.Position * v48;
            else
                v51.Transform = CFrame.new();
            end;
        end;
    end;
    local v54 = v19.getFaceControls(v39);
    if v54 ~= nil then
        for _, v56 in pairs(v20.FacsNames) do
            if v40 and v40.Tracks ~= nil then
                local v57 = v40.Tracks[v56];
                if v57 and v57.Type == v20.TRACK_TYPES.Facs then
                    v54[v56] = v15.getValue(v57, v41);
                else
                    v54[v56] = 0;
                end;
            else
                v54[v56] = 0;
            end;
        end;
    end;
    if v42 and not l_RunService_0:IsRunning() then
        v42:StepAnimations(0);
    end;
end;
v34.clearPose = function(v58) --[[ Line: 159 ]] --[[ Name: clearPose ]]
    -- upvalues: v19 (copy), v21 (copy), l_RunService_0 (copy)
    local v59 = v19.getAnimator(v58);
    local v60 = v19.getRigInfo(v58);
    local l_Parts_1 = v60.Parts;
    local l_PartNameToMotor_2 = v60.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v60.PartNameToAnimConstraint;
    local l_BoneNameToBone_2 = v60.BoneNameToBone;
    for _, v66 in ipairs(l_Parts_1) do
        local v67 = l_PartNameToMotor_2[v66.Name] or l_BoneNameToBone_2[v66.Name] or v21() and l_PartNameToAnimConstraint_2 and l_PartNameToAnimConstraint_2[v66.Name];
        if v67 then
            v67.Transform = CFrame.new();
        end;
    end;
    if v59 and not l_RunService_0:IsRunning() then
        v59:StepAnimations(0);
    end;
end;
v34.findOrCreateServerAnimSaves = function() --[[ Line: 181 ]] --[[ Name: findOrCreateServerAnimSaves ]]
    -- upvalues: l_ServerStorage_0 (copy), v20 (copy)
    local l_l_ServerStorage_0_FirstChild_0 = l_ServerStorage_0:FindFirstChild(v20.FOLDERS.AnimSaves);
    if not l_l_ServerStorage_0_FirstChild_0 then
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = v20.FOLDERS.AnimSaves;
        l_Model_0.Parent = l_ServerStorage_0;
        l_l_ServerStorage_0_FirstChild_0 = l_Model_0;
    end;
    return l_l_ServerStorage_0_FirstChild_0;
end;
v34.getAnimSavesFolder = function(v70, _) --[[ Line: 192 ]] --[[ Name: getAnimSavesFolder ]]
    -- upvalues: v34 (copy)
    if not v70 then
        return nil, nil;
    else
        local l_AnimSaves_0 = v70:FindFirstChild("AnimSaves");
        if not l_AnimSaves_0 or not l_AnimSaves_0:IsA("ObjectValue") then
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Name = "AnimSaves";
            l_ObjectValue_0.Parent = v70;
            if l_AnimSaves_0 then
                for _, v75 in l_AnimSaves_0:GetChildren() do
                    v75.Parent = l_ObjectValue_0;
                end;
                l_AnimSaves_0:Destroy();
            end;
            l_AnimSaves_0 = l_ObjectValue_0;
        end;
        local v76 = v34.findOrCreateServerAnimSaves();
        local l_Value_0 = l_AnimSaves_0.Value;
        if l_Value_0 and not l_Value_0.Parent then
            l_Value_0.Parent = v76;
        end;
        if not l_Value_0 or not l_Value_0:IsA("ObjectValue") or l_Value_0.Value ~= v70 then
            local l_ObjectValue_1 = Instance.new("ObjectValue");
            l_ObjectValue_1.Name = v70.Name;
            l_ObjectValue_1.Parent = v76;
            l_ObjectValue_1.Value = v70;
            l_Value_0 = l_ObjectValue_1;
            l_AnimSaves_0.Value = l_Value_0;
        end;
        return l_Value_0, l_AnimSaves_0;
    end;
end;
v34.getAnimSaves = function(v79) --[[ Line: 239 ]] --[[ Name: getAnimSaves ]]
    -- upvalues: v34 (copy)
    local v80, v81 = v34.getAnimSavesFolder(v79);
    local v82 = {};
    local function v88(v83, v84) --[[ Line: 243 ]] --[[ Name: listAnimations ]]
        -- upvalues: v82 (copy)
        if v83 then
            local l_v83_Children_0 = v83:GetChildren();
            for _, v87 in ipairs(l_v83_Children_0) do
                if v87:IsA("KeyframeSequence") or v87:IsA("CurveAnimation") then
                    table.insert(v82, {
                        animation = v87, 
                        isLegacyAnimSaves = v84
                    });
                end;
            end;
        end;
    end;
    v88(v80, false);
    v88(v81, true);
    return v82;
end;
v34.focusCamera = function(v89) --[[ Line: 258 ]] --[[ Name: focusCamera ]]
    -- upvalues: l_Workspace_0 (copy), v19 (copy)
    local l_Camera_0 = l_Workspace_0:FindFirstChildOfClass("Camera");
    if l_Camera_0 then
        local l_v89_ExtentsSize_0 = v89:GetExtentsSize();
        local v92 = math.max(l_v89_ExtentsSize_0.X, l_v89_ExtentsSize_0.Z);
        local l_CFrame_0 = v19.findRootPart(v89).CFrame;
        local v94 = l_CFrame_0.Position + l_CFrame_0.LookVector * (v92 * 2);
        l_Camera_0.CFrame = CFrame.new(v94, l_CFrame_0.Position);
        l_Camera_0.Focus = l_CFrame_0;
    end;
end;
v34.focusCameraOnFace = function(v95) --[[ Line: 272 ]] --[[ Name: focusCameraOnFace ]]
    -- upvalues: v19 (copy), l_Workspace_0 (copy), v14 (copy), v13 (copy)
    if not v95 then
        return;
    else
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v97 = v19.getFaceControls(v95);
        if v97 ~= nil then
            local l_Parent_0 = v97.Parent;
            local v99 = nil;
            local l_Neck_0 = l_Parent_0:FindFirstChild("Neck");
            if l_Neck_0 and l_Neck_0:IsA("Motor6D") and l_Neck_0.Part1 == l_Parent_0 then
                v99 = l_Neck_0.Part0;
            else
                l_Neck_0 = l_Parent_0:FindFirstChildOfClass("Motor6D");
                if l_Neck_0 and l_Neck_0.Part1 == l_Parent_0 then
                    v99 = l_Neck_0.Part0;
                elseif v99 == nil and l_Parent_0.Parent and l_Parent_0.Parent ~= l_Workspace_0 then
                    local l_Descendants_0 = l_Parent_0.Parent:GetDescendants();
                    for _, v103 in pairs(l_Descendants_0) do
                        if v103:IsA("Motor6D") and v103.Part1 == l_Parent_0 and v103.Parent and v103.Parent:IsA("BasePart") then
                            v99 = v103.Parent;
                            break;
                        end;
                    end;
                end;
            end;
            if v99 ~= nil then
                local v104 = 1;
                local v105 = 1;
                local v106 = v14.CalculateTargetCFrame(l_Parent_0.CFrame);
                local v107, v108 = v13.CalculateHeadExtents(v95, v106);
                local v109 = Vector3.new(v107.X, v107.Y, v107.Z);
                local v110 = Vector3.new(v108.X, v108.Y, v108.Z) - v109;
                headHeight = l_Parent_0.Size.Y;
                v105 = math.min(v110.X, v110.Z) + 0.25;
                v104 = v105;
                if l_CurrentCamera_0.FieldOfView ~= 70 then
                    v104 = v105 / (l_CurrentCamera_0.FieldOfView / 70);
                end;
                local v111 = l_Parent_0.Position + v99.CFrame.LookVector * (v104 * 1.5);
                l_CurrentCamera_0.CFrame = CFrame.lookAt(v111, l_Parent_0.CFrame.Position);
                l_CurrentCamera_0.Focus = l_Parent_0.CFrame;
            end;
        end;
        return;
    end;
end;
return v34;