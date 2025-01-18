local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v8 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = {};
local function v22(v12) --[[ Line: 24 ]] --[[ Name: calculateFrameRate ]]
    -- upvalues: v4 (copy), l_Math_0 (copy)
    local l_v12_Keyframes_0 = v12:GetKeyframes();
    table.sort(l_v12_Keyframes_0, function(v14, v15) --[[ Line: 26 ]]
        return v14.Time < v15.Time;
    end);
    local v16 = nil;
    local v17 = 0;
    for _, v19 in pairs(l_v12_Keyframes_0) do
        local v20 = v19.Time - v17;
        if v20 ~= 0 and (not v16 or v20 < v16) then
            v16 = v20;
        end;
        v17 = v19.Time;
    end;
    local l_DEFAULT_FRAMERATE_0 = v4.DEFAULT_FRAMERATE;
    if v16 and v16 > 0 then
        l_DEFAULT_FRAMERATE_0 = l_Math_0.round(1 / v16);
    end;
    if v4.FRAMERATES.FPS_30 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_30;
    elseif v4.FRAMERATES.FPS_24 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_24;
    elseif v4.FRAMERATES.FPS_60 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_60;
    end;
    return (math.clamp(l_DEFAULT_FRAMERATE_0, 1, v4.MAX_FRAMERATE));
end;
local function v23(v24, v25) --[[ Line: 62 ]] --[[ Name: traversePoses ]]
    -- upvalues: v4 (copy), v23 (copy)
    local v26 = {};
    if v24:IsA("Keyframe") then
        v26 = v24:GetPoses();
    elseif v24:IsA("PoseBase") or v24:IsA("Folder") and v24.Name == v4.FACE_CONTROLS_FOLDER then
        v26 = v24:GetChildren();
    end;
    for _, v28 in pairs(v26) do
        if v28:IsA("PoseBase") then
            v25(v28);
        end;
        v23(v28, v25);
    end;
end;
local function v33(v29, v30) --[[ Line: 81 ]] --[[ Name: traverseKeyframeMarkers ]]
    for _, v32 in pairs(v29:GetChildren()) do
        if v32:IsA("KeyframeMarker") then
            v30(v32);
        end;
    end;
end;
local function v34(v35, v36) --[[ Line: 89 ]] --[[ Name: traverseFolders ]]
    -- upvalues: v34 (copy)
    local l_v35_Children_0 = v35:GetChildren();
    for _, v39 in pairs(l_v35_Children_0) do
        if v39:IsA("Folder") then
            v36(v39);
            v34(v39, v36);
        end;
    end;
end;
local function v55(v40, v41, v42, v43) --[[ Line: 102 ]] --[[ Name: createPathMap ]]
    -- upvalues: v9 (copy), v4 (copy), v1 (copy)
    local v44 = {};
    local v45 = nil;
    local function v52(v46) --[[ Line: 106 ]] --[[ Name: getPartPath ]]
        -- upvalues: v41 (copy), v42 (copy), v43 (copy), v9 (ref)
        local v47 = {};
        local l_v46_0 = v46;
        while l_v46_0 ~= nil do
            local v49 = v41[l_v46_0];
            local v50 = v42[l_v46_0];
            local v51 = v43 and v43[l_v46_0];
            if v49 then
                l_v46_0 = v49.Part0.Name;
            elseif v50 then
                l_v46_0 = v50.Parent.Name;
            elseif v9() and v51 then
                l_v46_0 = v51.Attachment0.Parent.Name;
            else
                break;
            end;
            table.insert(v47, 1, l_v46_0);
        end;
        return v47;
    end;
    for v53, v54 in pairs(v40) do
        if v54.Type == v4.TRACK_TYPES.CFrame then
            v44[v53] = v52(v53);
        elseif v54.Type == v4.TRACK_TYPES.Facs then
            if v45 == nil then
                v45 = v1.List.join(v52(v4.R15_PARTS.Head), {
                    v4.R15_PARTS.Head
                });
            end;
            v44[v53] = v1.List.join(v45, {
                v4.FACE_CONTROLS_FOLDER
            });
        end;
    end;
    return v44;
end;
local function _(v56, v57) --[[ Line: 145 ]] --[[ Name: createKeyframeInstance ]]
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Time = v57;
    l_Keyframe_0.Parent = v56;
    return l_Keyframe_0;
end;
local function v71(v60, v61, v62, v63, v64) --[[ Line: 152 ]] --[[ Name: makePoseChain ]]
    -- upvalues: v4 (copy)
    local v65 = v64[v61];
    if v65 == nil then
        return;
    else
        local l_v60_0 = v60;
        for _, v68 in ipairs(v65) do
            local l_l_v60_0_FirstChild_0 = l_v60_0:FindFirstChild(v68);
            if l_l_v60_0_FirstChild_0 == nil then
                if v68 == v4.FACE_CONTROLS_FOLDER then
                    l_l_v60_0_FirstChild_0 = Instance.new("Folder", l_v60_0);
                else
                    l_l_v60_0_FirstChild_0 = Instance.new("Pose", l_v60_0);
                    l_l_v60_0_FirstChild_0.Weight = 0;
                end;
                l_l_v60_0_FirstChild_0.Name = v68;
            end;
            l_v60_0 = l_l_v60_0_FirstChild_0;
        end;
        local l_l_v60_0_FirstChild_1 = l_v60_0:FindFirstChild(v61);
        if v62 == v4.TRACK_TYPES.Facs then
            l_l_v60_0_FirstChild_1 = l_l_v60_0_FirstChild_1 or Instance.new("NumberPose", l_v60_0);
            l_l_v60_0_FirstChild_1.Value = v63.Value;
        elseif v62 == v4.TRACK_TYPES.CFrame then
            l_l_v60_0_FirstChild_1 = l_l_v60_0_FirstChild_1 or Instance.new("Pose", l_v60_0);
            l_l_v60_0_FirstChild_1.CFrame = v63.Value;
        end;
        l_l_v60_0_FirstChild_1.Name = v61;
        l_l_v60_0_FirstChild_1.Weight = 1;
        l_l_v60_0_FirstChild_1.EasingStyle = v63.EasingStyle.Name;
        l_l_v60_0_FirstChild_1.EasingDirection = v63.EasingDirection.Name;
        return;
    end;
end;
local function v79(v72, v73, v74) --[[ Line: 195 ]] --[[ Name: makeFolderChain ]]
    local v75 = v74[v73];
    if v75 == nil then
        return;
    else
        local l_v72_0 = v72;
        for _, v78 in ipairs(v75) do
            l_v72_0 = l_v72_0:FindFirstChild(v78) or Instance.new("Folder", l_v72_0);
            l_v72_0.Name = v78;
        end;
        return l_v72_0;
    end;
end;
fillFloatCurve = function(v80, v81) --[[ Line: 213 ]] --[[ Name: fillFloatCurve ]]
    -- upvalues: v4 (copy)
    if v80 then
        local v82 = nil;
        for _, v84 in ipairs(v80.Keyframes) do
            local v85 = v80.Data[v84];
            local v86 = v84 / v4.TICK_FREQUENCY;
            local v87 = FloatCurveKey.new(v86, v85.Value, v85.InterpolationMode or Enum.KeyInterpolationMode.Cubic);
            if v82 and v82.InterpolationMode == Enum.KeyInterpolationMode.Cubic and v85.LeftSlope then
                v87.LeftTangent = v85.LeftSlope * v4.TICK_FREQUENCY;
            else
                v87.LeftTangent = nil;
            end;
            if v85.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
                v87.RightTangent = v85.RightSlope and v85.RightSlope * v4.TICK_FREQUENCY or nil;
            end;
            v81:InsertKey(v87);
            v82 = v85;
        end;
    end;
end;
fillQuaternionCurve = function(v88, v89) --[[ Line: 240 ]] --[[ Name: fillQuaternionCurve ]]
    -- upvalues: v4 (copy)
    local v90 = nil;
    for _, v92 in ipairs(v88.Keyframes) do
        local v93 = v88.Data[v92];
        local v94 = v92 / v4.TICK_FREQUENCY;
        local v95 = RotationCurveKey.new(v94, v93.Value, v93.InterpolationMode);
        if v90 and v90.InterpolationMode == Enum.KeyInterpolationMode.Cubic and v93.LeftSlope then
            v95.LeftTangent = v93.LeftSlope * v4.TICK_FREQUENCY;
        else
            v95.LeftTangent = nil;
        end;
        if v93.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
            v95.RightTangent = v93.RightSlope and v93.RightSlope * v4.TICK_FREQUENCY or nil;
        end;
        v89:InsertKey(v95);
        v90 = v93;
    end;
end;
makeVector3Curve = function(v96) --[[ Line: 264 ]] --[[ Name: makeVector3Curve ]]
    -- upvalues: v4 (copy)
    if v96 then
        local l_Vector3Curve_0 = Instance.new("Vector3Curve");
        fillFloatCurve(v96.Components[v4.PROPERTY_KEYS.X], l_Vector3Curve_0:X());
        fillFloatCurve(v96.Components[v4.PROPERTY_KEYS.Y], l_Vector3Curve_0:Y());
        fillFloatCurve(v96.Components[v4.PROPERTY_KEYS.Z], l_Vector3Curve_0:Z());
        return l_Vector3Curve_0;
    else
        return;
    end;
end;
makeQuaternionCurve = function(v98) --[[ Line: 275 ]] --[[ Name: makeQuaternionCurve ]]
    if v98 then
        local l_RotationCurve_0 = Instance.new("RotationCurve");
        fillQuaternionCurve(v98, l_RotationCurve_0);
        return l_RotationCurve_0;
    else
        return;
    end;
end;
makeEulerCurve = function(v100) --[[ Line: 284 ]] --[[ Name: makeEulerCurve ]]
    -- upvalues: v4 (copy)
    if v100 then
        local l_EulerRotationCurve_0 = Instance.new("EulerRotationCurve");
        l_EulerRotationCurve_0.RotationOrder = v100.EulerAnglesOrder;
        fillFloatCurve(v100.Components[v4.PROPERTY_KEYS.X], l_EulerRotationCurve_0:X());
        fillFloatCurve(v100.Components[v4.PROPERTY_KEYS.Y], l_EulerRotationCurve_0:Y());
        fillFloatCurve(v100.Components[v4.PROPERTY_KEYS.Z], l_EulerRotationCurve_0:Z());
        return l_EulerRotationCurve_0;
    else
        return;
    end;
end;
makeRotationCurve = function(v102) --[[ Line: 296 ]] --[[ Name: makeRotationCurve ]]
    -- upvalues: v4 (copy)
    if v102 then
        if v102.Type == v4.TRACK_TYPES.Quaternion then
            return makeQuaternionCurve(v102);
        else
            return makeEulerCurve(v102);
        end;
    else
        return;
    end;
end;
makeFacsCurve = function(v103) --[[ Line: 306 ]] --[[ Name: makeFacsCurve ]]
    if v103 then
        local l_FloatCurve_0 = Instance.new("FloatCurve");
        fillFloatCurve(v103, l_FloatCurve_0);
        return l_FloatCurve_0;
    else
        return;
    end;
end;
local function _(v105) --[[ Line: 315 ]] --[[ Name: isR15Humanoid ]]
    if not v105 or not v105:IsA("Humanoid") or v105.RigType ~= Enum.HumanoidRigType.R15 then
        return false;
    else
        local l_Parent_0 = v105.Parent;
        if not l_Parent_0 or not l_Parent_0:IsA("Model") then
            return false;
        else
            return true;
        end;
    end;
end;
local function v113(v108, v109, v110) --[[ Line: 326 ]] --[[ Name: addAnimationRigToAnimationClip ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_0 = v109:FindFirstChildOfClass("Humanoid");
    if v6.isR15Humanoid(v109) then
        local v112 = Instance.new("AnimationRigData", v110);
        if not v112:LoadFromHumanoid(l_Humanoid_0) then
            v112:Destroy();
            return;
        else
            v112.Name = v109.Name .. "AnimationRigData";
            v108.Metadata.AnimationRig = v112;
        end;
    end;
end;
readCurve = function(v114, v115, v116) --[[ Line: 343 ]] --[[ Name: readCurve ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v7 (copy)
    local v117 = 0;
    local v118 = 0;
    v114.IsCurveTrack = true;
    if v116 == v4.TRACK_TYPES.Number or v116 == v4.TRACK_TYPES.Angle or v116 == v4.TRACK_TYPES.Facs or v116 == v4.TRACK_TYPES.Quaternion then
        v114.Keyframes = {};
        v114.Data = {};
        local l_v115_Keys_0 = v115:GetKeys();
        for _, v121 in ipairs(l_v115_Keys_0) do
            local v122 = v5.getNearestTick(v121.Time * v4.TICK_FREQUENCY);
            if v117 < v122 then
                v117 = v122;
            end;
            local v123 = v121.LeftTangent and v121.LeftTangent / v4.TICK_FREQUENCY or nil;
            local v124 = v121.RightTangent and v121.RightTangent / v4.TICK_FREQUENCY or nil;
            local v125 = {
                Value = v121.Value, 
                InterpolationMode = v121.Interpolation, 
                LeftSlope = v123, 
                RightSlope = v124
            };
            v3.addKeyframe(v114, v122, v125);
        end;
        return v117;
    else
        v114.Components = {};
        for _, v127 in ipairs(v4.COMPONENT_TRACK_TYPES[v116]._Order) do
            local v128 = nil;
            local l_v115_FirstChild_0 = v115:FindFirstChild(v127);
            if l_v115_FirstChild_0 ~= nil then
                v128 = if l_v115_FirstChild_0.ClassName == "RotationCurve" then v4.TRACK_TYPES.Quaternion else if l_v115_FirstChild_0.ClassName == "EulerRotationCurve" then v4.TRACK_TYPES.EulerAngles else v4.COMPONENT_TRACK_TYPES[v116][v127];
                local v130 = v7.track(v128);
                v130.IsCurveTrack = true;
                v118 = readCurve(v130, l_v115_FirstChild_0, v128);
                v114.Components[v127] = v130;
                if v117 < v118 then
                    v117 = v118;
                end;
            end;
        end;
        if v116 == v4.TRACK_TYPES.EulerAngles then
            v114.EulerAnglesOrder = v115.RotationOrder;
        end;
        return v117;
    end;
end;
readFacsCurves = function(v131, v132) --[[ Line: 415 ]] --[[ Name: readFacsCurves ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v133 = 0;
    local l_v132_Children_0 = v132:GetChildren();
    for _, v136 in pairs(l_v132_Children_0) do
        if v136:IsA("FloatCurve") then
            local l_Name_0 = v136.Name;
            local v138 = v3.addTrack(v131, l_Name_0, v4.TRACK_TYPES.Facs);
            local v139 = readCurve(v138, v136, v4.TRACK_TYPES.Facs);
            if v133 < v139 then
                v133 = v139;
            end;
        end;
    end;
    return v133;
end;
v11.fromKeyframeSequence = function(v140) --[[ Line: 435 ]] --[[ Name: fromKeyframeSequence ]]
    -- upvalues: v22 (copy), v3 (copy), v4 (copy), v5 (copy), v23 (copy), v33 (copy)
    local v141 = v22(v140);
    local l_v140_Keyframes_0 = v140:GetKeyframes();
    local v143 = 0;
    local v144 = nil;
    local v145 = v3.new(v140.Name, v4.INSTANCE_TYPES.Rig, v140.Guid);
    local v146 = 0;
    local v147 = 0;
    local l_Tracks_0 = v145.Instances.Root.Tracks;
    for _, v150 in pairs(l_v140_Keyframes_0) do
        local l_Time_0 = v150.Time;
        local v152 = v5.getNearestTick(l_Time_0 * v4.TICK_FREQUENCY);
        v23(v150, function(v153) --[[ Line: 452 ]]
            -- upvalues: v4 (ref), l_Tracks_0 (copy), v3 (ref), v152 (copy), v146 (ref)
            local l_Name_1 = v153.Name;
            local v155 = v153:IsA("Pose") and v4.TRACK_TYPES.CFrame or v4.TRACK_TYPES.Facs;
            if l_Name_1 ~= "HumanoidRootPart" and v153.Weight ~= 0 then
                if l_Tracks_0[l_Name_1] == nil then
                    v3.addTrack(l_Tracks_0, l_Name_1, v155, false, v4.TRACK_TYPES.Quaternion, nil);
                end;
                local v156 = l_Tracks_0[l_Name_1];
                local v157 = {
                    Value = v153:IsA("Pose") and v153.CFrame or v153.Value, 
                    EasingStyle = v153.EasingStyle, 
                    EasingDirection = v153.EasingDirection
                };
                v3.addKeyframe(v156, v152, v157);
                v146 = v146 + 1;
            end;
        end);
        v33(v150, function(v158) --[[ Line: 475 ]]
            -- upvalues: v3 (ref), v145 (copy), v152 (copy), v147 (ref)
            v3.addEvent(v145.Events, v152, v158.Name, v158.Value);
            v147 = v147 + 1;
        end);
        if v143 < l_Time_0 then
            v144 = v150;
            v143 = math.max(v143, v150.Time);
        end;
        if v150.Name ~= v4.DEFAULT_KEYFRAME_NAME then
            v3.setKeyframeName(v145, v152, v150.Name);
        end;
    end;
    local v159 = v5.getNearestTick(v143 * v4.TICK_FREQUENCY);
    if v144 and #v144:GetChildren() == 0 then
        for _, v161 in pairs(l_Tracks_0) do
            local v162 = v161.Keyframes[#v161.Keyframes];
            local l_Value_0 = v161.Data[v162].Value;
            v3.addKeyframe(v161, v159, {
                Value = l_Value_0, 
                EasingStyle = Enum.PoseEasingStyle.Linear, 
                EasingDirection = Enum.PoseEasingDirection.In
            });
        end;
    end;
    v145.Metadata.EndTick = v159;
    v145.Metadata.Priority = v140.Priority;
    v145.Metadata.Looping = v140.Loop;
    v145.Metadata.Name = v140.Name;
    v145.Metadata.Guid = v140.Guid;
    local l_AnimationRigData_0 = v140:FindFirstChildOfClass("AnimationRigData");
    if l_AnimationRigData_0 then
        v145.Metadata.AnimationRig = l_AnimationRigData_0;
    end;
    return v145, v141, #l_v140_Keyframes_0, v146, v147;
end;
v11.toKeyframeSequence = function(v165, v166) --[[ Line: 524 ]] --[[ Name: toKeyframeSequence ]]
    -- upvalues: v6 (copy), v4 (copy), v55 (copy), v71 (copy), v113 (copy)
    assert(v165 ~= nil, "No data table was provided.");
    assert(v166 ~= nil, "Exporting to KeyframeSequence requires a reference rig.");
    local l_Metadata_0 = v165.Metadata;
    local l_Events_0 = v165.Events;
    local l_NamedKeyframes_0 = l_Events_0.NamedKeyframes;
    local l_KeyframeSequence_0 = Instance.new("KeyframeSequence");
    l_KeyframeSequence_0.Name = l_Metadata_0.Name;
    l_KeyframeSequence_0.Loop = l_Metadata_0.Looping;
    l_KeyframeSequence_0.Priority = l_Metadata_0.Priority;
    l_KeyframeSequence_0.Guid = l_Metadata_0.Guid or "";
    local v171 = 0;
    local v172 = 0;
    local v173 = v6.getRigInfo(v166);
    local _ = v173.Parts;
    local l_PartNameToMotor_0 = v173.PartNameToMotor;
    local _ = v173.PartNameToConstraint;
    local l_PartNameToAnimConstraint_0 = v173.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v173.BoneNameToBone;
    local v179 = {};
    local l_Root_0 = v165.Instances.Root;
    assert(l_Root_0.Type == v4.INSTANCE_TYPES.Rig, "Can only export Rig animations to KeyframeSequence.");
    local l_Tracks_1 = l_Root_0.Tracks;
    local v182 = v55(l_Tracks_1, l_PartNameToMotor_0, l_BoneNameToBone_0, l_PartNameToAnimConstraint_0);
    for v183, v184 in pairs(l_Tracks_1) do
        for _, v186 in pairs(v184.Keyframes) do
            local v187 = v186 / v4.TICK_FREQUENCY;
            local v188 = v179[v186];
            if not v188 then
                local l_Keyframe_1 = Instance.new("Keyframe");
                l_Keyframe_1.Time = v187;
                l_Keyframe_1.Parent = l_KeyframeSequence_0;
                v188 = l_Keyframe_1;
                v179[v186] = v188;
            end;
            local l_Type_0 = v184.Type;
            local v191 = v184.Data[v186];
            v71(v188, v183, l_Type_0, v191, v182);
            if l_NamedKeyframes_0[v186] then
                v188.Name = l_NamedKeyframes_0[v186];
            end;
            v171 = v171 + 1;
        end;
    end;
    for _, v193 in ipairs(l_Events_0.Keyframes) do
        local v194 = l_Events_0.Data[v193];
        for v195, v196 in pairs(v194) do
            local v197 = v193 / v4.TICK_FREQUENCY;
            local v198 = v179[v193];
            if not v198 then
                local l_Keyframe_2 = Instance.new("Keyframe");
                l_Keyframe_2.Time = v197;
                l_Keyframe_2.Parent = l_KeyframeSequence_0;
                v198 = l_Keyframe_2;
                v179[v193] = v198;
            end;
            local v200 = Instance.new("KeyframeMarker", v198);
            v200.Name = v195;
            v200.Value = v196;
            v172 = v172 + 1;
        end;
    end;
    v113(v165, v166, l_KeyframeSequence_0);
    return l_KeyframeSequence_0, #l_KeyframeSequence_0:GetKeyframes(), v171, v172;
end;
v11.fromCurveAnimation = function(v201) --[[ Line: 603 ]] --[[ Name: fromCurveAnimation ]]
    -- upvalues: v3 (copy), v4 (copy), v34 (copy), v8 (copy), v5 (copy)
    local v202 = false;
    if v201 ~= nil then
        v202 = false;
        if typeof(v201) == "Instance" then
            v202 = v201.ClassName == "CurveAnimation";
        end;
    end;
    assert(v202, "Expected a CurveAnimation for the AnimationData.");
    local v203 = v3.new(v201.Name, v4.INSTANCE_TYPES.Rig, v201.Guid);
    v202 = v203.Instances.Root.Tracks;
    local v204 = 0;
    local v205 = 0;
    local v206 = 0;
    local v207 = 0;
    v34(v201, function(v208) --[[ Line: 616 ]]
        -- upvalues: v4 (ref), v202 (copy), v3 (ref), v206 (ref), v205 (ref), v8 (ref), v204 (ref)
        local v209 = 0;
        if v208.Name == v4.FACE_CONTROLS_FOLDER then
            v209 = readFacsCurves(v202, v208);
        else
            local l_v208_FirstChild_0 = v208:FindFirstChild(v4.PROPERTY_KEYS.Position);
            local l_v208_FirstChild_1 = v208:FindFirstChild(v4.PROPERTY_KEYS.Rotation);
            if l_v208_FirstChild_0 or l_v208_FirstChild_1 then
                local v212 = nil;
                if l_v208_FirstChild_1 then
                    if l_v208_FirstChild_1.ClassName == "RotationCurve" then
                        v212 = v4.TRACK_TYPES.Quaternion;
                    elseif l_v208_FirstChild_1.ClassName == "EulerRotationCurve" then
                        v212 = v4.TRACK_TYPES.EulerAngles;
                    end;
                end;
                local v213 = v3.addTrack(v202, v208.Name, v4.TRACK_TYPES.CFrame, true, v212);
                v209 = readCurve(v213, v208, v4.TRACK_TYPES.CFrame);
                v206 = v206 + 1;
                v205 = v205 + v8.countKeyframes(v213);
            end;
        end;
        if v204 < v209 then
            v204 = v209;
        end;
    end);
    local l_v201_Children_0 = v201:GetChildren();
    for _, v216 in ipairs(l_v201_Children_0) do
        if v216:IsA("MarkerCurve") then
            local l_v216_Markers_0 = v216:GetMarkers();
            for _, v219 in ipairs(l_v216_Markers_0) do
                local v220 = v5.getNearestTick(v219.Time * v4.TICK_FREQUENCY);
                if v204 < v220 then
                    v204 = v220;
                end;
                if v216.Name == v4.NAMED_KEYFRAMES_CHANNEL then
                    v3.setKeyframeName(v203, v220, v219.Value);
                else
                    v3.addEvent(v203.Events, v220, v216.Name, v219.Value);
                    v207 = v207 + 1;
                end;
            end;
        end;
    end;
    local l_Metadata_1 = v203.Metadata;
    l_Metadata_1.Name = v201.Name;
    l_Metadata_1.Looping = v201.Loop;
    l_Metadata_1.Priority = v201.Priority;
    l_Metadata_1.EndTick = v204;
    l_Metadata_1.IsChannelAnimation = true;
    l_Metadata_1.Guid = v201.Guid;
    local l_AnimationRigData_1 = v201:FindFirstChildOfClass("AnimationRigData");
    if l_AnimationRigData_1 then
        l_Metadata_1.AnimationRig = l_AnimationRigData_1;
    end;
    return v203, v205, v206, v207;
end;
v11.toCurveAnimation = function(v223, v224) --[[ Line: 687 ]] --[[ Name: toCurveAnimation ]]
    -- upvalues: v6 (copy), v4 (copy), v55 (copy), v79 (copy), v8 (copy), v113 (copy)
    assert(v223 ~= nil, "No data table was provided.");
    assert(v224 ~= nil, "Exporting to CurveAnimation requires a reference rig.");
    local l_Metadata_2 = v223.Metadata;
    local l_CurveAnimation_0 = Instance.new("CurveAnimation");
    l_CurveAnimation_0.Name = l_Metadata_2.Name;
    l_CurveAnimation_0.Loop = l_Metadata_2.Looping;
    l_CurveAnimation_0.Priority = l_Metadata_2.Priority;
    l_CurveAnimation_0.Guid = l_Metadata_2.Guid or "";
    local v227 = v6.getRigInfo(v224);
    local l_PartNameToMotor_1 = v227.PartNameToMotor;
    local l_PartNameToAnimConstraint_1 = v227.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v227.BoneNameToBone;
    local v231 = 0;
    local v232 = 0;
    local v233 = 0;
    local l_Root_1 = v223.Instances.Root;
    assert(l_Root_1.Type == v4.INSTANCE_TYPES.Rig, "Can only export Rig animations to CurveAnimation.");
    local l_Tracks_2 = l_Root_1.Tracks;
    local v236 = v55(l_Tracks_2, l_PartNameToMotor_1, l_BoneNameToBone_1, l_PartNameToAnimConstraint_1);
    for v237, v238 in pairs(l_Tracks_2) do
        local v239 = v79(l_CurveAnimation_0, v237, v236);
        if v238.Type == v4.TRACK_TYPES.CFrame then
            v239 = v239:FindFirstChild(v237) or Instance.new("Folder", v239);
            v239.Name = v237;
            local v240 = makeVector3Curve(v238.Components[v4.PROPERTY_KEYS.Position]);
            if v240 then
                v240.Name = v4.PROPERTY_KEYS.Position;
                v240.Parent = v239;
            end;
            local v241 = makeRotationCurve(v238.Components[v4.PROPERTY_KEYS.Rotation]);
            if v241 then
                v241.Name = v4.PROPERTY_KEYS.Rotation;
                v241.Parent = v239;
            end;
        elseif v238.Type == v4.TRACK_TYPES.Facs then
            local v242 = makeFacsCurve(v238);
            if v242 then
                v242.Name = v237;
                v242.Parent = v239;
            end;
        end;
        v231 = v231 + v8.countKeyframes(v238);
        v232 = v232 + 1;
    end;
    local v243 = {};
    local l_Events_1 = v223.Events;
    for v245, v246 in pairs(l_Events_1.Data) do
        for v247, v248 in pairs(v246) do
            if not v243[v247] then
                v243[v247] = {};
            end;
            v243[v247][v245] = v248;
        end;
    end;
    if l_Events_1.NamedKeyframes then
        local v249 = {};
        for v250, v251 in pairs(l_Events_1.NamedKeyframes) do
            v249[v250] = v251;
        end;
        v243[v4.NAMED_KEYFRAMES_CHANNEL] = v249;
    end;
    for v252, v253 in pairs(v243) do
        local l_MarkerCurve_0 = Instance.new("MarkerCurve");
        l_MarkerCurve_0.Name = v252;
        l_MarkerCurve_0.Parent = l_CurveAnimation_0;
        for v255, v256 in pairs(v253) do
            l_MarkerCurve_0:InsertMarkerAtTime(v255 / v4.TICK_FREQUENCY, v256);
            v233 = v233 + 1;
        end;
    end;
    v113(v223, v224, l_CurveAnimation_0);
    return l_CurveAnimation_0, v231, v232, v233;
end;
return v11;