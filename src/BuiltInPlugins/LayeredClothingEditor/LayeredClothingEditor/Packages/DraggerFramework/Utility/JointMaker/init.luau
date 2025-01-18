local _ = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Utility.getGeometry);
local v3 = require(l_Parent_0.Utility.JointPairs);
local v4 = require(l_Parent_0.Utility.JointUtil);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _isSimulating = v6
    }, v5));
end;
local function _(v7) --[[ Line: 17 ]] --[[ Name: getConstraintLength ]]
    local l_WorldPosition_0 = v7.Attachment0.WorldPosition;
    return (v7.Attachment1.WorldPosition - l_WorldPosition_0).Magnitude;
end;
local function _(v10, v11) --[[ Line: 23 ]] --[[ Name: includeInFixup ]]
    if v11 then
        while true do
            if v10 then
                if v11[v10] then
                    return false;
                else
                    v10 = v10.Parent;
                end;
            else
                return true;
            end;
        end;
    else
        return true;
    end;
end;
v5.pickUpParts = function(v13, v14, v15) --[[ Line: 40 ]] --[[ Name: pickUpParts ]]
    -- upvalues: v4 (copy)
    local v16 = {};
    for _, v18 in ipairs(v14) do
        v16[v18] = true;
    end;
    v13._partSet = v16;
    v13._parts = v14;
    v13._rootPartSet = {};
    local l_Terrain_0 = workspace.Terrain;
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    for _, v28 in ipairs(v14) do
        v23[v28] = {};
        for _, v30 in ipairs(v28:GetJoints()) do
            if v30:IsA("Constraint") then
                local v31 = v4.getConstraintCounterpart(v30, v28);
                if v31 then
                    v23[v28][v31] = true;
                    if v30:IsA("RopeConstraint") or v30:IsA("RodConstraint") then
                        local l_v30_0 = v30;
                        local v33;
                        if v15 then
                            while true do
                                if l_v30_0 then
                                    if v15[l_v30_0] then
                                        v33 = false;
                                        break;
                                    else
                                        l_v30_0 = l_v30_0.Parent;
                                    end;
                                else
                                    v33 = true;
                                    break;
                                end;
                            end;
                        else
                            v33 = true;
                        end;
                        if v33 then
                            v33 = {};
                            local l_WorldPosition_1 = v30.Attachment0.WorldPosition;
                            v33.Span = (v30.Attachment1.WorldPosition - l_WorldPosition_1).Magnitude;
                            v33.Length = v30.Length;
                            v26[v30] = v33;
                        end;
                    elseif v30:IsA("SpringConstraint") then
                        local l_v30_1 = v30;
                        local v36;
                        if v15 then
                            while true do
                                if l_v30_1 then
                                    if v15[l_v30_1] then
                                        v36 = false;
                                        break;
                                    else
                                        l_v30_1 = l_v30_1.Parent;
                                    end;
                                else
                                    v36 = true;
                                    break;
                                end;
                            end;
                        else
                            v36 = true;
                        end;
                        if v36 then
                            v36 = {};
                            local l_WorldPosition_2 = v30.Attachment0.WorldPosition;
                            v36.Span = (v30.Attachment1.WorldPosition - l_WorldPosition_2).Magnitude;
                            v36.FreeLength = v30.FreeLength;
                            v25[v30] = v36;
                        end;
                    end;
                end;
            elseif v30:IsA("JointInstance") then
                local v38 = v4.getJointInstanceCounterpart(v30, v28);
                if not v16[v38] then
                    if v30:IsA("Motor6D") then
                        v30.Enabled = false;
                        v21[v30] = v28.CFrame;
                        v23[v28][v38] = true;
                    else
                        table.insert(v22, v30);
                    end;
                end;
            elseif v30:IsA("WeldConstraint") then
                local v39 = v4.getWeldConstraintCounterpart(v30, v28);
                v23[v28][v39] = true;
            elseif v30:IsA("NoCollisionConstraint") then
                local v40 = v4.getNoCollisionConstraintCounterpart(v30, v28);
                v23[v28][v40] = true;
            end;
        end;
        v24[v28] = {};
        if v28 ~= l_Terrain_0 then
            for _, v42 in ipairs(v28:GetTouchingParts()) do
                v24[v28][v42] = true;
            end;
        end;
    end;
    v13._lengthConstraintsToFixupSet = v26;
    v13._springsToFixupSet = v25;
    v13._initiallyTouchingSets = v24;
    v13._jointsToDestroy = v22;
    v13._weldConstraintsToReenableSet = v20;
    v13._motor6dsToAdjustAndReenableSet = v21;
    v13._alreadyConnectedToSets = v23;
    v13._geometryCache = {};
end;
v5.anchorParts = function(v43) --[[ Line: 124 ]] --[[ Name: anchorParts ]]
    local v44 = {};
    for _, v46 in ipairs(v43._parts) do
        if not v46.Anchored then
            v46.Anchored = true;
            v44[v46] = true;
        end;
    end;
    v43._toUnanchorSet = v44;
end;
v5.restoreAnchored = function(v47) --[[ Line: 135 ]] --[[ Name: restoreAnchored ]]
    if v47._toUnanchorSet then
        for v48, _ in pairs(v47._toUnanchorSet) do
            v48.Anchored = false;
        end;
        v47._toUnanchorSet = nil;
    end;
end;
v5.breakJointsToOutsiders = function(v50) --[[ Line: 147 ]] --[[ Name: breakJointsToOutsiders ]]
    for _, v52 in ipairs(v50._jointsToDestroy) do
        v52.Parent = nil;
    end;
    v50._jointsToDestroy = {};
end;
v5.computeJointPairs = function(v53) --[[ Line: 157 ]] --[[ Name: computeJointPairs ]]
    -- upvalues: v3 (copy)
    local v55 = v3.new(v53._parts, v53._partSet, v53._rootPartSet, CFrame.new(), v53._alreadyConnectedToSets, function(v54) --[[ Line: 164 ]]
        -- upvalues: v53 (copy)
        return v53:_getGeometry(v54);
    end);
    if v53._isSimulating then
        v53._geometryCache = {};
    end;
    return v55;
end;
v5.isColliding = function(v56, v57) --[[ Line: 176 ]] --[[ Name: isColliding ]]
    for _, v59 in ipairs(v56._parts) do
        for _, v61 in ipairs(v59:GetTouchingParts()) do
            if not v56._partSet[v61] and (v57 or not v56._initiallyTouchingSets[v59][v61]) then
                return true;
            end;
        end;
    end;
    return false;
end;
v5.fixupConstraintLengths = function(v62) --[[ Line: 189 ]] --[[ Name: fixupConstraintLengths ]]
    for v63, v64 in pairs(v62._lengthConstraintsToFixupSet) do
        local l_WorldPosition_3 = v63.Attachment0.WorldPosition;
        local v66 = (v63.Attachment1.WorldPosition - l_WorldPosition_3).Magnitude / v64.Span;
        v63.Length = v64.Length * v66;
    end;
    for v67, v68 in pairs(v62._springsToFixupSet) do
        local l_WorldPosition_4 = v67.Attachment0.WorldPosition;
        local v70 = (v67.Attachment1.WorldPosition - l_WorldPosition_4).Magnitude / v68.Span;
        v67.FreeLength = v68.FreeLength * v70;
    end;
end;
v5.putDownParts = function(v71) --[[ Line: 200 ]] --[[ Name: putDownParts ]]
    for v72, _ in pairs(v71._weldConstraintsToReenableSet) do
        v72.Enabled = true;
    end;
    for v74, v75 in pairs(v71._motor6dsToAdjustAndReenableSet) do
        if v71._partSet[v74.Part0] then
            v74.C0 = v74.Part0.CFrame:Inverse() * v75 * v74.C0;
        else
            v74.C1 = v74.Part1.CFrame:Inverse() * v75 * v74.C1;
        end;
        v74.Enabled = true;
    end;
    v71._motor6dsToAdjustAndReenableSet = nil;
    v71._weldConstraintsToReenableSet = nil;
    v71._alreadyConnectedToSets = nil;
    v71._geometryCache = nil;
    v71._parts = {};
    v71._partSet = {};
end;
v5._getGeometry = function(v76, v77) --[[ Line: 224 ]] --[[ Name: _getGeometry ]]
    -- upvalues: v2 (copy)
    if v76._partSet[v77] then
        return v2(v77);
    else
        local v78 = v76._geometryCache[v77];
        if not v78 then
            v78 = v2(v77);
            v76._geometryCache[v77] = v78;
        end;
        return v78;
    end;
end;
return v5;