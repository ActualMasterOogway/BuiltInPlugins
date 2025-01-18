local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_DraggerFramework_0.Utility.getBoundingBoxScale);
local v4 = require(l_DraggerFramework_0.Utility.PartMover);
local v5 = require(l_DraggerFramework_0.Utility.AttachmentMover);
local v6 = require(l_script_FirstAncestor_0.Src.Util.RigIK);
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local l_Workspace_0 = game:GetService("Workspace");
local v10 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v11 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v12 = {};
v12.__index = v12;
v12.new = function(v13, v14, v15) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v4 (copy), v5 (copy), v10 (copy), v12 (copy)
    return (setmetatable({
        _draggerContext = v13, 
        _ikTransformFunction = v14, 
        _partMover = if not v11() then v4.new() else nil, 
        _attachmentMover = if not v11() then v5.new() else nil, 
        _motordata = if v10() then nil else {}, 
        _motorData = {}, 
        _animConstraintData = {}, 
        _tool = v15
    }, v12));
end;
local function _(v16) --[[ Line: 32 ]] --[[ Name: getLastJoint ]]
    if v16 then
        return v16[#v16];
    else
        return;
    end;
end;
v12.beginDrag = function(v18, _, v20) --[[ Line: 41 ]] --[[ Name: beginDrag ]]
    -- upvalues: v7 (copy), v2 (copy), v10 (copy), v11 (copy), v6 (copy)
    local v21, _ = v20:getObjectsToTransform();
    v18._hasPartsToMove = #v21 > 0;
    v18._draggerContext.AddWaypoint();
    v18._partsToMove = v21;
    v18._jointsToOrigPart1CFrame = {};
    v18._jointsToOrigBoneTransformedWorldCFrame = {};
    v18._jointsToOrigBoneCFrame = {};
    v18._originalTransform = {};
    v18._joints = v7.getJoints(v18._partsToMove, v18._draggerContext.RootInstance);
    for _, v24 in ipairs(v18._joints) do
        if v24.Type == v2.JOINT_TYPES.Bone then
            v18._jointsToOrigBoneTransformedWorldCFrame[v24] = v24.Bone.TransformedWorldCFrame;
            v18._jointsToOrigBoneCFrame[v24] = v24.Bone.CFrame;
            v18._originalTransform[v24] = v24.Bone.Transform;
        elseif not v10() or v24.Type == v2.JOINT_TYPES.Motor6D or v24.Type == v2.JOINT_TYPES.AnimationConstraint then
            v18._jointsToOrigPart1CFrame[v24] = v24.Part1.CFrame;
            if v11() then
                v18._originalTransform[v24] = (v24.Part0.CFrame * v24.C0):Inverse() * (v24.Part1.CFrame * v24.C1);
            end;
        end;
    end;
    if v18:_shouldSolveConstraints() then
        local l__joints_0 = v18._joints;
        v18._effectorCFrame = (if l__joints_0 then l__joints_0[#l__joints_0] else nil).Part1.CFrame;
        local v26, v27 = v6.ikDragStart(v18._draggerContext.RootInstance, v21[1], v18._draggerContext.IKMode == v2.IK_MODE.BodyPart, v18._draggerContext.StartingPose, v18._draggerContext.PinnedParts);
        v18._motorData = v26;
        v18._animConstraintData = v27;
    end;
    v18._lastGoodGeometricTransform = CFrame.new();
    local _ = nil;
    local _ = nil;
    local v30, v31, v32 = v20:getBoundingBox();
    v18._boundingBoxSize = v32;
    v18._centerPoint = v30 * CFrame.new(v31);
end;
local function _(v33) --[[ Line: 88 ]] --[[ Name: getTransformedParent ]]
    local l_Parent_0 = v33.Parent;
    if l_Parent_0 then
        if l_Parent_0:IsA("Bone") then
            return l_Parent_0.TransformedWorldCFrame;
        elseif l_Parent_0:IsA("BasePart") then
            return l_Parent_0.CFrame;
        end;
    end;
    return CFrame.new();
end;
local function _(v36, v37) --[[ Line: 100 ]] --[[ Name: getWorldPivot ]]
    local l_Parent_1 = v36.Bone.Parent;
    return (if l_Parent_1 then if l_Parent_1:IsA("Bone") then l_Parent_1.TransformedWorldCFrame else if l_Parent_1:IsA("BasePart") then l_Parent_1.CFrame else CFrame.new() else CFrame.new()) * v37;
end;
v12.applyWorldTransformToPart = function(v40, v41, v42) --[[ Line: 104 ]] --[[ Name: applyWorldTransformToPart ]]
    return (v42.Part0.CFrame * v42.C0):toObjectSpace(v41 * (v40._jointsToOrigPart1CFrame[v42] * v42.C1));
end;
v12.applyWorldTransformToBone = function(v43, v44, v45) --[[ Line: 111 ]] --[[ Name: applyWorldTransformToBone ]]
    local v46 = v43._jointsToOrigBoneCFrame[v45];
    local l_Parent_2 = v45.Bone.Parent;
    return ((if l_Parent_2 then if l_Parent_2:IsA("Bone") then l_Parent_2.TransformedWorldCFrame else if l_Parent_2:IsA("BasePart") then l_Parent_2.CFrame else CFrame.new() else CFrame.new()) * v46):toObjectSpace(v44 * v43._jointsToOrigBoneTransformedWorldCFrame[v45]);
end;
v12.updateDrag = function(v48, v49) --[[ Line: 124 ]] --[[ Name: updateDrag ]]
    -- upvalues: v11 (copy), v2 (copy), v8 (copy), l_Workspace_0 (copy)
    if v48._draggerContext.IsPlaying then
        return CFrame.new();
    else
        v48._globalTransform = v49;
        if not v48:_shouldSolveConstraints() then
            local v50 = nil;
            local v51 = nil;
            local v52 = {};
            if v11() then
                if next(v48._joints) then
                    referenceJoint = v48._joints[#v48._joints];
                    if referenceJoint.Type == v2.JOINT_TYPES.Bone then
                        local v53, v54 = v48:applyWorldTransformToBone(v49, referenceJoint);
                        delta = v54;
                        v52[referenceJoint.Bone.Name] = v53;
                        v51 = v48._originalTransform[referenceJoint]:Inverse() * referenceJoint.Bone.Transform;
                    else
                        v50 = v48:applyWorldTransformToPart(v49, referenceJoint);
                        v52[referenceJoint.Part1.Name] = v50;
                        v51 = (v48._jointsToOrigPart1CFrame[referenceJoint] * referenceJoint.C1):Inverse() * (referenceJoint.Part1.CFrame * referenceJoint.C1);
                    end;
                    for _, v56 in v48._joints do
                        if v56 ~= referenceJoint then
                            if v56.Type == v2.JOINT_TYPES.Bone then
                                v52[v56.Bone.Name] = v51 * v48._originalTransform[v56];
                            else
                                v52[v56.Part1.Name] = v51 * v48._originalTransform[v56];
                            end;
                        end;
                    end;
                end;
            else
                for _, v58 in ipairs(v48._joints) do
                    if v58.Type == v2.JOINT_TYPES.Bone then
                        v50 = v48:applyWorldTransformToBone(v49, v58);
                        v52[v58.Bone.Name] = v50;
                    else
                        v50 = v48:applyWorldTransformToPart(v49, v58);
                        v52[v58.Part1.Name] = v50;
                    end;
                end;
            end;
            if v52 ~= nil then
                v48._draggerContext.OnManipulateJoints("Root", v52);
                return v49;
            end;
        elseif v48._tool == Enum.RibbonTool.Move and v48._effectorCFrame then
            local v59 = v49 * v48._effectorCFrame;
            local l__joints_1 = v48._joints;
            local v61 = if l__joints_1 then l__joints_1[#l__joints_1] else nil;
            local v62 = (v8.findRootPart(v48._draggerContext.RootInstance).CFrame.p - v59.p).Magnitude <= v2.MIN_EFFECTOR_DISTANCE;
            local v63 = v62 and v2.MIN_TRANSLATION_STIFFNESS or v2.MIN_TRANSLATION_STIFFNESS;
            local v64 = v62 and v2.MIN_ROTATION_STIFFNESS or v2.MIN_ROTATION_STIFFNESS;
            l_Workspace_0:IKMoveTo(v61.Part1, v59, v63, v64, Enum.IKCollisionsMode.NoCollisions);
            return v61.Part1.CFrame * v48._effectorCFrame:Inverse();
        elseif v48._tool == Enum.RibbonTool.Rotate and v48._effectorCFrame then
            local v65 = v49 * v48._effectorCFrame;
            local l__joints_2 = v48._joints;
            local v67 = if l__joints_2 then l__joints_2[#l__joints_2] else nil;
            l_Workspace_0:IKMoveTo(v67.Part1, v65, v2.TRANSLATION_STIFFNESS, v2.ROTATION_STIFFNESS, Enum.IKCollisionsMode.NoCollisions);
            return v67.Part1.CFrame * v48._effectorCFrame:Inverse();
        end;
        return v49;
    end;
end;
v12.endDrag = function(v68) --[[ Line: 225 ]] --[[ Name: endDrag ]]
    -- upvalues: v6 (copy)
    if v68:_shouldSolveConstraints() then
        local v69 = v6.ikDragEnd(v68._draggerContext.RootInstance, v68._motorData, v68._animConstraintData);
        v68._draggerContext.OnManipulateJoints("Root", v69);
    end;
end;
v12.render = function(_, _) --[[ Line: 236 ]] --[[ Name: render ]]
    return nil;
end;
v12._toLocalTransform = function(v72, v73) --[[ Line: 240 ]] --[[ Name: _toLocalTransform ]]
    return v72._centerPoint:Inverse() * v73 * v72._centerPoint;
end;
v12._shouldSolveConstraints = function(v74) --[[ Line: 244 ]] --[[ Name: _shouldSolveConstraints ]]
    return v74._draggerContext.IKEnabled and v74._hasPartsToMove;
end;
return v12;