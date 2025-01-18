local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v4 = {};
local function v21(v5) --[[ Line: 14 ]] --[[ Name: findDuplicateParts ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v6 = v1.getMotors(v5);
    local v7 = v1.getBones(v5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    for _, v12 in v6 do
        if v12.Part0 then
            v8[v12.Part0] = true;
        end;
        if v12.Part1 then
            v8[v12.Part1] = true;
        end;
    end;
    if v3() then
        for _, v14 in (v1.getAnimationConstraints(v5)) do
            local v15 = v1.getPart0(v14);
            local v16 = v1.getPart1(v14);
            if v15 then
                v8[v15] = true;
            end;
            if v16 then
                v8[v16] = true;
            end;
        end;
    end;
    for v17, _ in v8 do
        if v9[v17.Name] then
            return {
                {
                    ID = v2.RIG_ERRORS.NameCollision
                }
            };
        else
            v9[v17.Name] = true;
        end;
    end;
    for _, v20 in v7 do
        if v10[v20.Name] then
            return {
                {
                    ID = v2.RIG_ERRORS.BoneNameCollision
                }
            };
        else
            v10[v20.Name] = true;
        end;
    end;
    return {};
end;
local function v33(v22) --[[ Line: 56 ]] --[[ Name: findMotorErrors ]]
    local l_motors_0 = v22.motors;
    local l_motorsWithMissingPart0_0 = v22.motorsWithMissingPart0;
    local l_motorsWithMissingPart1_0 = v22.motorsWithMissingPart1;
    local l_partsWithMultipleParents_0 = v22.partsWithMultipleParents;
    local l_rig_0 = v22.rig;
    local l_motorsMap_0 = v22.motorsMap;
    for _, v30 in pairs(l_motors_0) do
        local l_Part0_0 = v30.Part0;
        local l_Part1_0 = v30.Part1;
        if not l_Part0_0 or l_Part0_0 and l_Part0_0.Parent == nil then
            table.insert(l_motorsWithMissingPart0_0, v30);
        end;
        if not l_Part1_0 or l_Part1_0 and l_Part1_0.Parent == nil then
            table.insert(l_motorsWithMissingPart1_0, v30);
        end;
        if l_Part0_0 and l_Part1_0 and (not l_Part0_0.Anchored or not l_Part1_0.Anchored) then
            v22.unanchoredPartExists = true;
        end;
        if l_Part0_0 and l_Part1_0 and l_rig_0:FindFirstChild(l_Part0_0.Name, true) and l_rig_0:FindFirstChild(l_Part1_0.Name, true) then
            if l_motorsMap_0[l_Part1_0] then
                table.insert(l_partsWithMultipleParents_0, l_Part1_0);
            else
                l_motorsMap_0[l_Part1_0] = v30;
            end;
        end;
    end;
end;
local function v45(v34) --[[ Line: 86 ]] --[[ Name: findAnimConstraintErrors ]]
    -- upvalues: v1 (copy)
    local l_animConstraints_0 = v34.animConstraints;
    local l_animConstraintsWithMissingAttachment0_0 = v34.animConstraintsWithMissingAttachment0;
    local l_animConstraintsWithMissingAttachment1_0 = v34.animConstraintsWithMissingAttachment1;
    local l_partsWithMultipleParents_1 = v34.partsWithMultipleParents;
    local l_rig_1 = v34.rig;
    local l_animConstraintsMap_0 = v34.animConstraintsMap;
    for _, v42 in l_animConstraints_0 do
        local v43 = v1.getPart0(v42);
        local v44 = v1.getPart1(v42);
        if not v43 or not v43.Parent then
            table.insert(l_animConstraintsWithMissingAttachment0_0, v42);
        end;
        if not v44 or not v44.Parent then
            table.insert(l_animConstraintsWithMissingAttachment1_0, v42);
        end;
        if v43 and v44 and (not v43.Anchored or not v44.Anchored) then
            v34.unanchoredPartExists = true;
        end;
        if v43 and v44 and l_rig_1:FindFirstChild(v43.Name, true) and l_rig_1:FindFirstChild(v44.Name, true) then
            if l_animConstraintsMap_0[v44] then
                table.insert(l_partsWithMultipleParents_1, v44);
            else
                l_animConstraintsMap_0[v44] = v42;
            end;
        end;
    end;
end;
local function v53(v46) --[[ Line: 117 ]] --[[ Name: findNameCollisions ]]
    -- upvalues: v2 (copy)
    local l_parts_0 = v46.parts;
    local l_root_0 = v46.root;
    if not l_root_0 then
        return;
    else
        for _, v50 in ipairs(l_parts_0) do
            if v50.Name == l_root_0.Name and v50 ~= l_root_0 then
                table.insert(v46.errorList, {
                    ID = v2.RIG_ERRORS.NameCollision
                });
                return;
            else
                for _, v52 in ipairs(l_parts_0) do
                    if v50 ~= v52 and v50.Name == v52.Name then
                        table.insert(v46.errorList, {
                            ID = v2.RIG_ERRORS.NameCollision
                        });
                        break;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v66(v54, v55) --[[ Line: 144 ]] --[[ Name: checkForCircularRig ]]
    -- upvalues: v3 (copy), v1 (copy)
    for v56, v57 in pairs(v54) do
        local l_Part0_1 = v57.Part0;
        if l_Part0_1 and v56 and l_Part0_1 == v56 then
            return true;
        else
            local v59 = {};
            while l_Part0_1 ~= nil and l_Part0_1 ~= game.Workspace do
                local v60 = v54[l_Part0_1];
                if v60 then
                    l_Part0_1 = v60.Part0;
                    if v3() then
                        if v59[v60] then
                            return true;
                        else
                            v59[v60] = true;
                        end;
                    elseif not v59[v60] then
                        v59[v60] = {};
                    else
                        return true;
                    end;
                else
                    break;
                end;
            end;
        end;
    end;
    if v3() then
        for v61, v62 in pairs(v55) do
            local v63 = v1.getPart0(v62);
            if v63 and v61 and v63 == v61 then
                return true;
            else
                local v64 = {};
                while v63 ~= nil and v63 ~= game.Workspace do
                    local v65 = v55[v63];
                    if v65 then
                        v63 = v1.getPart0(v65);
                        if v64[v65] then
                            return true;
                        else
                            v64[v65] = true;
                        end;
                    else
                        break;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
local function v89(v67) --[[ Line: 197 ]] --[[ Name: addRigErrors ]]
    -- upvalues: v3 (copy), v2 (copy), v66 (copy), v1 (copy), l_script_FirstAncestor_0 (copy)
    local l_bones_0 = v67.bones;
    local l_motors_1 = v67.motors;
    local l_animConstraints_1 = v67.animConstraints;
    local l_unanchoredPartExists_0 = v67.unanchoredPartExists;
    local l_motorsWithMissingPart0_1 = v67.motorsWithMissingPart0;
    local l_motorsWithMissingPart1_1 = v67.motorsWithMissingPart1;
    local l_partsWithMultipleParents_2 = v67.partsWithMultipleParents;
    local l_rig_2 = v67.rig;
    local l_motorsMap_1 = v67.motorsMap;
    local l_animConstraintsMap_1 = v67.animConstraintsMap;
    local l_animConstraintsWithMissingAttachment0_1 = v67.animConstraintsWithMissingAttachment0;
    local l_animConstraintsWithMissingAttachment1_1 = v67.animConstraintsWithMissingAttachment1;
    local l_errorList_0 = v67.errorList;
    local l_root_1 = v67.root;
    local v82 = false;
    if l_bones_0 ~= nil then
        v82 = #l_bones_0 > 0;
    end;
    if #l_motors_1 == 0 and (not v3() or #l_animConstraints_1 == 0) and not v82 or not l_root_1 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.NoMotors
        });
    end;
    if not l_unanchoredPartExists_0 and not v82 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.PartsAnchored
        });
    end;
    if #l_partsWithMultipleParents_2 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MultipleParents, 
            Data = l_partsWithMultipleParents_2
        });
    end;
    if #l_motorsWithMissingPart0_1 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MissingPart0, 
            Data = l_motorsWithMissingPart0_1
        });
    end;
    if #l_motorsWithMissingPart1_1 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MissingPart1, 
            Data = l_motorsWithMissingPart1_1
        });
    end;
    if v3() then
        if #l_animConstraintsWithMissingAttachment0_1 > 0 then
            table.insert(l_errorList_0, {
                ID = v2.RIG_ERRORS.MissingPart0, 
                Data = l_animConstraintsWithMissingAttachment0_1
            });
        end;
        if #l_animConstraintsWithMissingAttachment1_1 > 0 then
            table.insert(l_errorList_0, {
                ID = v2.RIG_ERRORS.MissingPart1, 
                Data = l_animConstraintsWithMissingAttachment1_1
            });
        end;
    end;
    if v66(l_motorsMap_1, l_animConstraintsMap_1) then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.CircularRig
        });
    end;
    if v1.getAnimator(l_rig_2) == nil then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.NoAnimationController
        });
    end;
    local _, v84 = v1.getFaceControls(l_rig_2);
    local _ = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable);
    if #v84 > 1 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MultipleFaceControls, 
            Data = v84
        });
    end;
    local v86 = {};
    for _, v88 in v84 do
        if v88.Parent and not v88.Parent:IsA("BasePart") then
            table.insert(v86, v88);
        end;
    end;
    if #v86 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.FaceControlsParent, 
            Data = v86
        });
    end;
end;
v4.rigHasErrors = function(v90) --[[ Line: 285 ]] --[[ Name: rigHasErrors ]]
    -- upvalues: v1 (copy), v21 (copy), v3 (copy), v33 (copy), v45 (copy), v53 (copy), v89 (copy)
    v1.clearCache();
    local v91 = v21(v90);
    if #v91 > 0 then
        return true, v91;
    else
        local l_Parts_0 = v1.getRigInfo(v90).Parts;
        local v93 = {
            errorList = {}, 
            motorsMap = {}, 
            partsWithMultipleParents = {}, 
            motorsWithMissingPart0 = {}, 
            motorsWithMissingPart1 = {}, 
            unanchoredPartExists = false, 
            motors = v1.getMotors(v90), 
            parts = l_Parts_0, 
            root = v1.findRootPart(v90), 
            bones = v1.getBones(v90), 
            animConstraints = if v3() then v1.getAnimationConstraints(v90) else {}, 
            animConstraintsMap = {}, 
            animConstraintsWithMissingAttachment0 = {}, 
            animConstraintsWithMissingAttachment1 = {}, 
            rig = v90
        };
        v33(v93);
        if v3() then
            v45(v93);
        end;
        v53(v93);
        v89(v93);
        return #v93.errorList > 0, v93.errorList;
    end;
end;
return v4;