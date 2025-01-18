local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v4 = {
    Cache = {
        CacheRig = nil, 
        CacheData = nil
    }, 
    FaceControlsCache = {
        CacheRig = nil, 
        CacheData = nil
    }
};
local function v5(v6, v7) --[[ Line: 21 ]] --[[ Name: getDescendants ]]
    -- upvalues: v5 (copy)
    local v8 = false;
    if v7.Name == "AnimSaves" then
        v8 = v7:IsA("Model") or v7:IsA("ObjectValue");
    end;
    if not v8 then
        for _, v10 in ipairs(v7:GetChildren()) do
            table.insert(v6, v10);
            v5(v6, v10);
        end;
    end;
    return v6;
end;
v4.getTemporaryConstraints = function() --[[ Line: 33 ]] --[[ Name: getTemporaryConstraints ]]
    -- upvalues: v2 (copy)
    return Workspace:FindFirstChild(v2.TEMPORARY_CONSTRAINTS);
end;
v4.usingTemporaryConstraints = function() --[[ Line: 37 ]] --[[ Name: usingTemporaryConstraints ]]
    -- upvalues: v4 (copy)
    return v4.getTemporaryConstraints() ~= nil;
end;
v4.getConstraints = function(v11) --[[ Line: 41 ]] --[[ Name: getConstraints ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v12 = {};
    local v13 = v4.getTemporaryConstraints() or v11;
    local v14 = v5({}, v13);
    for _, v16 in ipairs(v14) do
        if v16:IsA("BallSocketConstraint") or v16:IsA("HingeConstraint") then
            table.insert(v12, v16);
        end;
    end;
    return v12;
end;
v4.buildRigHierarchy = function(v17) --[[ Line: 56 ]] --[[ Name: buildRigHierarchy ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy)
    local v18 = v4.findRootPart(v17);
    local v19 = v4.getMotors(v17);
    local v20 = v4.getBones(v17);
    local v21 = if v3() then v4.getAnimationConstraints(v17) else {};
    assert(v18, "Rig is missing a root part.");
    local l_Name_0 = v18.Name;
    return {
        [l_Name_0] = v1(l_Name_0, function(v23) --[[ Line: 66 ]]
            -- upvalues: v19 (copy), v3 (ref), v21 (copy), v4 (ref), v20 (copy)
            local v24 = {};
            for _, v26 in ipairs(v19) do
                if v26.Part0.Name == v23 then
                    table.insert(v24, v26.Part1.Name);
                end;
            end;
            if v3() then
                for _, v28 in ipairs(v21) do
                    local v29 = v4.getPart0(v28);
                    local v30 = v4.getPart1(v28);
                    if v29 and v30 and v29.Name == v23 then
                        table.insert(v24, v30.Name);
                    end;
                end;
            end;
            for _, v32 in ipairs(v20) do
                if v32.Parent.Name == v23 then
                    table.insert(v24, v32.Name);
                end;
            end;
            return v24;
        end)
    };
end;
v4.isR15Humanoid = function(v33) --[[ Line: 92 ]] --[[ Name: isR15Humanoid ]]
    local l_Humanoid_0 = v33:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 or not l_Humanoid_0:IsA("Humanoid") or l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
        return false;
    else
        local l_Parent_0 = l_Humanoid_0.Parent;
        if not l_Parent_0 or not l_Parent_0:IsA("Model") then
            return false;
        else
            return true;
        end;
    end;
end;
v4.isR6Humanoid = function(v36) --[[ Line: 104 ]] --[[ Name: isR6Humanoid ]]
    local l_Humanoid_1 = v36:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 or not l_Humanoid_1:IsA("Humanoid") or l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R6 then
        return false;
    else
        local l_Parent_1 = l_Humanoid_1.Parent;
        if not l_Parent_1 or not l_Parent_1:IsA("Model") then
            return false;
        else
            return true;
        end;
    end;
end;
v4.findRootPart = function(v39) --[[ Line: 117 ]] --[[ Name: findRootPart ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    local v40 = nil;
    v40 = if v4.isR6Humanoid(v39) then v39:FindFirstChild("HumanoidRootPart") or v39.PrimaryPart else v39.PrimaryPart or v39:FindFirstChild("HumanoidRootPart");
    if v40 then
        return v40;
    else
        local v41 = v4.getRigInfo(v39);
        local l_PartNameToMotor_0 = v41.PartNameToMotor;
        local l_PartNameToAnimConstraint_0 = v41.PartNameToAnimConstraint;
        local l_BoneNameToBone_0 = v41.BoneNameToBone;
        local v45 = nil;
        local v46 = next(l_PartNameToMotor_0 or {});
        if v46 then
            while not v45 do
                local v47 = l_PartNameToMotor_0[v46];
                if v47 and v47.Part0 then
                    v46 = v47.Part0.Name;
                else
                    v45 = v46;
                end;
            end;
        end;
        if v3() or not v45 then
            local v48 = next(l_BoneNameToBone_0 or {});
            if v48 then
                while not v45 do
                    local v49 = l_BoneNameToBone_0[v48];
                    if v49 then
                        v48 = v49.Parent.Name;
                    else
                        v45 = v48;
                    end;
                end;
            end;
        end;
        if v3() and l_PartNameToAnimConstraint_0 then
            local v50 = next(l_PartNameToAnimConstraint_0);
            if v50 then
                while not v45 do
                    local v51 = l_PartNameToAnimConstraint_0[v50];
                    local v52 = v4.getPart0(v51);
                    if v52 then
                        v50 = v52.Name;
                    else
                        v45 = v50;
                    end;
                end;
            end;
        end;
        local v53 = v5({}, v39);
        for _, v55 in ipairs(v53) do
            if v55.Name == v45 and v55:IsA("BasePart") then
                return v55;
            end;
        end;
        return;
    end;
end;
v4.getAnimationController = function(v56) --[[ Line: 186 ]] --[[ Name: getAnimationController ]]
    return v56:FindFirstChildOfClass("Humanoid") or v56:FindFirstChildOfClass("AnimationController");
end;
v4.getAnimator = function(v57) --[[ Line: 190 ]] --[[ Name: getAnimator ]]
    -- upvalues: v4 (copy)
    local v58 = v4.getAnimationController(v57);
    if v58 then
        local l_Animator_0 = v58:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            return l_Animator_0;
        else
            return Instance.new("Animator", v58);
        end;
    else
        return;
    end;
end;
v4.getPart0 = function(v60) --[[ Line: 202 ]] --[[ Name: getPart0 ]]
    local v61 = v60 and v60.Attachment0 and v60.Attachment0.Parent;
    if v61 and v61:IsA("BasePart") then
        return v61;
    else
        return nil;
    end;
end;
v4.getPart1 = function(v62) --[[ Line: 207 ]] --[[ Name: getPart1 ]]
    local v63 = v62 and v62.Attachment1 and v62.Attachment1.Parent;
    if v63 and v63:IsA("BasePart") then
        return v63;
    else
        return nil;
    end;
end;
v4.getMotors = function(v64) --[[ Line: 212 ]] --[[ Name: getMotors ]]
    -- upvalues: v5 (copy)
    local v65 = {};
    local v66 = v5({}, v64);
    for _, v68 in ipairs(v66) do
        if v68:IsA("Motor6D") then
            table.insert(v65, v68);
        end;
    end;
    return v65;
end;
v4.getBones = function(v69) --[[ Line: 225 ]] --[[ Name: getBones ]]
    -- upvalues: v5 (copy)
    local v70 = {};
    local v71 = v5({}, v69);
    for _, v73 in ipairs(v71) do
        if v73:IsA("Bone") then
            table.insert(v70, v73);
        end;
    end;
    return v70;
end;
v4.getAnimationConstraints = function(v74) --[[ Line: 237 ]] --[[ Name: getAnimationConstraints ]]
    -- upvalues: v5 (copy)
    local v75 = {};
    local v76 = v5({}, v74);
    for _, v78 in ipairs(v76) do
        if v78:IsA("AnimationConstraint") then
            table.insert(v75, v78);
        end;
    end;
    return v75;
end;
v4.getUnusedRigTracks = function(v79, v80) --[[ Line: 249 ]] --[[ Name: getUnusedRigTracks ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v81 = {};
    local v82 = v4.findRootPart(v79);
    local v83 = v4.getRigInfo(v79);
    local l_Parts_0 = v83.Parts;
    local l_PartNameToMotor_1 = v83.PartNameToMotor;
    local _ = v83.PartNameToConstraint;
    local l_PartNameToAnimConstraint_1 = v83.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v83.BoneNameToBone;
    for _, v90 in ipairs(l_Parts_0) do
        if l_BoneNameToBone_1[v90.Name] or v90 ~= v82 and (l_PartNameToMotor_1[v90.Name] or v3() and l_PartNameToAnimConstraint_1 and l_PartNameToAnimConstraint_1[v90.Name]) then
            local v91 = false;
            for _, v93 in ipairs(v80) do
                if v90.Name == v93.Name then
                    v91 = true;
                    break;
                end;
            end;
            if not v91 then
                table.insert(v81, {
                    Name = v90.Name, 
                    Instance = "Root", 
                    Type = v2.TRACK_TYPES.CFrame
                });
            end;
        end;
    end;
    table.sort(v81, function(v94, v95) --[[ Line: 287 ]]
        return v94.Name < v95.Name;
    end);
    return v81;
end;
v4.clearCache = function() --[[ Line: 294 ]] --[[ Name: clearCache ]]
    -- upvalues: v4 (copy)
    v4.Cache = {};
    v4.FaceControlsCache = {};
end;
v4.getRigInfo = function(v96) --[[ Line: 301 ]] --[[ Name: getRigInfo ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    local v97 = {};
    local v98 = {};
    local v99 = {};
    local v100 = {};
    local v101 = {};
    if v96 ~= v4.Cache.CacheRig then
        local v102 = v4.getMotors(v96);
        local v103 = v4.getConstraints(v96);
        local v104 = if v3() then v4.getAnimationConstraints(v96) else {};
        local v105 = v5({}, v96);
        for _, v107 in ipairs(v105) do
            if v107:IsA("BasePart") then
                for _, v109 in ipairs(v102) do
                    if v109.Part1 == v107 then
                        v98[v107.Name] = v109;
                        table.insert(v97, v107);
                        break;
                    end;
                end;
                for _, v111 in ipairs(v103) do
                    if v4.getPart1(v111) == v107 then
                        v99[v107.Name] = v111;
                        break;
                    end;
                end;
                if v3() then
                    for _, v113 in ipairs(v104) do
                        if v4.getPart1(v113) == v107 then
                            v100[v107.Name] = v113;
                            table.insert(v97, v107);
                            break;
                        end;
                    end;
                end;
            elseif v107:IsA("Bone") then
                v101[v107.Name] = v107;
                table.insert(v97, v107);
            end;
        end;
        v4.Cache.CacheRig = v96;
        v4.Cache.CacheData = {
            Parts = v97, 
            PartNameToMotor = v98, 
            PartNameToConstraint = v99, 
            PartNameToAnimConstraint = v100, 
            BoneNameToBone = v101
        };
    end;
    return v4.Cache.CacheData;
end;
v4.getFaceControls = function(v114) --[[ Line: 358 ]] --[[ Name: getFaceControls ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v115 = {};
    if v114 ~= v4.FaceControlsCache.CacheRig then
        local v116 = v5({}, v114);
        for _, v118 in ipairs(v116) do
            if v118:IsA("FaceControls") then
                table.insert(v115, v118);
            end;
        end;
        v4.FaceControlsCache.CacheRig = v114;
        v4.FaceControlsCache.FaceControls = v115;
    end;
    return v4.FaceControlsCache.FaceControls[1], v4.FaceControlsCache.FaceControls;
end;
v4.getPartByName = function(v119, v120) --[[ Line: 373 ]] --[[ Name: getPartByName ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v121 = v4.getRigInfo(v119);
    local l_PartNameToMotor_2 = v121.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v121.PartNameToAnimConstraint;
    if v3() then
        if l_PartNameToMotor_2 then
            local v124 = l_PartNameToMotor_2[v120];
            if v124 then
                return v124.Part1;
            end;
        end;
        if l_PartNameToAnimConstraint_2 then
            local v125 = l_PartNameToAnimConstraint_2[v120];
            if v125 then
                return v4.getPart1(v125);
            end;
        end;
    else
        local v126 = l_PartNameToMotor_2[v120];
        if v126 then
            return v126.Part1;
        end;
    end;
    return nil;
end;
v4.getBoneByName = function(v127, v128) --[[ Line: 399 ]] --[[ Name: getBoneByName ]]
    -- upvalues: v4 (copy)
    return v4.getRigInfo(v127).BoneNameToBone[v128];
end;
return v4;