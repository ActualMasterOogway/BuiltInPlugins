local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Particle);
local v2 = require(script.Parent.SpringDamper);
local v3 = require(script.Parent.constants);
local v4 = require(script.Parent.class);
local v5 = require(script.Parent.constructCFrameForBone);
local v7 = v4(function(v6) --[[ Line: 10 ]]
    v6.initSucceded = false;
    v6.physicallyAnimate = true;
    v6.windSpeed = 0;
    v6.windDir = Vector3.new(1, 1, 1, 0);
    v6.skel = {};
    v6.numPoints = 0;
    v6.structurePoints = {};
    v6.bindWorldPose = {};
    v6.numSprings = 0;
    v6.structureSprings = {};
    v6.originalMountpoints = {};
    v6.worldModel = nil;
    v6.cone = nil;
    v6.lastTick = nil;
    v6.dt = nil;
    v6.rapTimeSoFar = 0;
    v6.spinY = 0;
    v6.spinX = 0;
    v6.windChanged = false;
    v6.isChangingYaw = false;
    v6.isChangingPitch = false;
    v6.tailBone = nil;
    v6.origCenter = Vector3.new(0, 0, 0, 0);
    v6.lastDtIndex = 0;
    v6.lastDts = {};
end);
v7.init = function(v8, v9) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v5 (copy), l_RunService_0 (copy)
    if v9 == nil then
        return;
    else
        v8.worldModel = v9;
        v8.cone = v8.worldModel:WaitForChild("Cone");
        local l_worldModel_0 = v8.worldModel;
        local l_cone_0 = v8.cone;
        local l_numPoints_0 = v8.numPoints;
        local l_structurePoints_0 = v8.structurePoints;
        local l_skel_0 = v8.skel;
        local l_numBones_0 = v3.numBones;
        local l_structureSprings_0 = v8.structureSprings;
        local l_numSprings_0 = v8.numSprings;
        local l_bindWorldPose_0 = v8.bindWorldPose;
        local l_originalMountpoints_0 = v8.originalMountpoints;
        if l_cone_0 == nil then
            return;
        else
            l_worldModel_0.PrimaryPart = l_cone_0;
            local v20 = l_cone_0:GetChildren()[1];
            l_skel_0[1] = v20;
            if v20 == nil then
                return;
            else
                local v21 = v20:GetChildren()[1];
                l_skel_0[2] = v21;
                if v21 == nil then
                    return;
                else
                    local v22 = v21:GetChildren()[1];
                    l_skel_0[3] = v22;
                    if v22 == nil then
                        return;
                    else
                        local v23 = v22:GetChildren()[1];
                        l_skel_0[4] = v23;
                        if v23 == nil then
                            return;
                        else
                            local v24 = v23:GetChildren()[1];
                            l_skel_0[5] = v24;
                            if v24 == nil then
                                return;
                            else
                                local v25 = v24:GetChildren()[1];
                                l_skel_0[6] = v25;
                                if v25 == nil then
                                    return;
                                else
                                    for v26 = 1, l_numBones_0 do
                                        local v27 = 1 - 0.3 * v26 / 6;
                                        l_structurePoints_0[l_numPoints_0 + 1] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(0, -1, 0, 0), v27);
                                        l_structurePoints_0[l_numPoints_0 + 2] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(v3.sqrt3on2, 0.5, 0), v27);
                                        l_structurePoints_0[l_numPoints_0 + 3] = v1(l_skel_0[v26].WorldPosition + v3.radiusOfStructure * Vector3.new(-v3.sqrt3on2, 0.5, 0), v27);
                                        if l_numPoints_0 == 0 then
                                            local v28 = (l_structurePoints_0[1].position + l_structurePoints_0[2].position + l_structurePoints_0[3].position) / 3;
                                            l_originalMountpoints_0[1] = l_structurePoints_0[1].position - v28;
                                            l_originalMountpoints_0[2] = l_structurePoints_0[2].position - v28;
                                            l_originalMountpoints_0[3] = l_structurePoints_0[3].position - v28;
                                        end;
                                        l_structureSprings_0[l_numSprings_0 + 1] = v2(l_structurePoints_0[l_numPoints_0 + 1], l_structurePoints_0[l_numPoints_0 + 2]);
                                        l_structureSprings_0[l_numSprings_0 + 2] = v2(l_structurePoints_0[l_numPoints_0 + 2], l_structurePoints_0[l_numPoints_0 + 3]);
                                        l_structureSprings_0[l_numSprings_0 + 3] = v2(l_structurePoints_0[l_numPoints_0 + 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                        l_structureSprings_0[l_numSprings_0 + 1].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 1].dampingFactor = 5;
                                        l_structureSprings_0[l_numSprings_0 + 2].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 2].dampingFactor = 5;
                                        l_structureSprings_0[l_numSprings_0 + 3].springConstant = 58;
                                        l_structureSprings_0[l_numSprings_0 + 3].dampingFactor = 5;
                                        if l_numPoints_0 >= 3 then
                                            l_structureSprings_0[l_numSprings_0 + 4] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            l_structureSprings_0[l_numSprings_0 + 5] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 6] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            for v29 = 1, 6 do
                                                l_structureSprings_0[l_numSprings_0 + v29].springConstant = 28;
                                                l_structureSprings_0[l_numSprings_0 + v29].dampingFactor = 7;
                                            end;
                                            l_structureSprings_0[l_numSprings_0 + 7] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 8] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            l_structureSprings_0[l_numSprings_0 + 9] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 3], l_structurePoints_0[l_numPoints_0 + 2]);
                                            l_structureSprings_0[l_numSprings_0 + 10] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            l_structureSprings_0[l_numSprings_0 + 11] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 3], l_structurePoints_0[l_numPoints_0 + 3]);
                                            l_structureSprings_0[l_numSprings_0 + 12] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 3], l_structurePoints_0[l_numPoints_0 + 1]);
                                            if l_numSprings_0 == 3 then
                                                for v30 = 1, 12 do
                                                    l_structureSprings_0[l_numSprings_0 + v30].springConstant = 28;
                                                    l_structureSprings_0[l_numSprings_0 + v30].dampingFactor = 5;
                                                end;
                                            end;
                                            if l_numPoints_0 >= 6 then
                                                l_structureSprings_0[l_numSprings_0 + 13] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                l_structureSprings_0[l_numSprings_0 + 14] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 15] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 16] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 17] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                l_structureSprings_0[l_numSprings_0 + 18] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 6], l_structurePoints_0[l_numPoints_0 + 2]);
                                                l_structureSprings_0[l_numSprings_0 + 19] = v2(l_structurePoints_0[l_numPoints_0 + 2 - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 20] = v2(l_structurePoints_0[l_numPoints_0 + 1 - 6], l_structurePoints_0[l_numPoints_0 + 3]);
                                                l_structureSprings_0[l_numSprings_0 + 21] = v2(l_structurePoints_0[l_numPoints_0 + 3 - 6], l_structurePoints_0[l_numPoints_0 + 1]);
                                                for v31 = 13, 21 do
                                                    l_structureSprings_0[l_numSprings_0 + v31].springConstant = 24;
                                                    l_structureSprings_0[l_numSprings_0 + v31].dampingFactor = 7;
                                                end;
                                                l_numSprings_0 = l_numSprings_0 + 9;
                                            end;
                                            l_numSprings_0 = l_numSprings_0 + 9;
                                        end;
                                        l_numSprings_0 = l_numSprings_0 + 3;
                                        l_numPoints_0 = l_numPoints_0 + 3;
                                    end;
                                    v8.numSprings = l_numSprings_0;
                                    v8.numPoints = l_numPoints_0;
                                    for v32 = 1, l_numBones_0 do
                                        l_bindWorldPose_0[v32] = v5(v32, l_structurePoints_0):Inverse() * l_skel_0[v32].WorldCFrame;
                                    end;
                                    l_cone_0.CFrame = CFrame.new();
                                    l_cone_0.Size = l_cone_0.Size * 0.4;
                                    v8.lastTick = tick();
                                    v8.initSucceded = true;
                                    v8:afterCamera(0);
                                    l_RunService_0:BindToRenderStep("WindhoseAfterCamera", Enum.RenderPriority.Camera.Value + 1, function(v33) --[[ Line: 237 ]] --[[ Name: afterCameraRenderStep ]]
                                        -- upvalues: v8 (copy)
                                        v8:afterCamera(v33);
                                    end);
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v7.onRenderStepSock = function(v34, v35) --[[ Line: 245 ]] --[[ Name: onRenderStepSock ]]
    -- upvalues: v3 (copy), v5 (copy)
    local v36 = {};
    local l_numBones_1 = v3.numBones;
    local l_structurePoints_1 = v34.structurePoints;
    local l_structureSprings_1 = v34.structureSprings;
    local l_skel_1 = v34.skel;
    local l_windDir_0 = v34.windDir;
    local l_windSpeed_0 = v34.windSpeed;
    local l_numPoints_1 = v34.numPoints;
    local l_bindWorldPose_1 = v34.bindWorldPose;
    local l_spinY_0 = v34.spinY;
    local l_spinX_0 = v34.spinX;
    local l_originalMountpoints_1 = v34.originalMountpoints;
    local l_numSprings_1 = v34.numSprings;
    local l_rapTimeSoFar_0 = v34.rapTimeSoFar;
    for v50 = 1, l_numBones_1 do
        v36[v50] = v5(v50, l_structurePoints_1);
        local v51 = v36[v50] * l_bindWorldPose_1[v50];
        local v52 = nil;
        v52 = if v50 > 1 then l_skel_1[v50].Parent.WorldCFrame:Inverse() * v51 else l_skel_1[v50].Parent.CFrame:Inverse() * v51;
        l_skel_1[v50].CFrame = v52;
    end;
    local v53 = CFrame.fromEulerAnglesYXZ(0, l_spinY_0, 0) * CFrame.fromEulerAnglesYXZ(l_spinX_0, 0, 0);
    for v54 = 1, 3 do
        l_structurePoints_1[v54].position = v53:PointToWorldSpace(l_originalMountpoints_1[v54]) - 0.45 * v34.windDir;
    end;
    if v34.physicallyAnimate then
        local v55 = Vector3.new(0, 0, 0, 0);
        if workspace.Gravity > 0 then
            v55 = Vector3.new(0, -math.min(v3.inverseStandardGravity * workspace.Gravity, 4), 0);
        end;
        for v56 = 4, l_numPoints_1 do
            l_structurePoints_1[v56]:update(v35, false);
        end;
        local v57 = math.min(math.min(30, v3.spsToFudgedMps * l_windSpeed_0 * 2), v3.spsToFudgedMps * 1000);
        for v58 = 4, l_numPoints_1 do
            local v59 = math.floor(v58 / 3);
            local v60 = v59 * (1 - v57 / 30);
            l_structurePoints_1[v58]:addForce(v60 * v55);
            local v61 = v57 * v36[v59].RightVector * math.sin(v57 * l_rapTimeSoFar_0) + v36[v59].UpVector * math.sin(v57 * l_rapTimeSoFar_0);
            if v59 == 5 then
                l_structurePoints_1[v58]:addForce(v61);
            end;
            local v62 = 2 - math.max(0, l_windDir_0:Dot(v36[v59].LookVector));
            l_structurePoints_1[v58]:addForce(v62 * l_windDir_0 * 0.25 * v57);
        end;
        for v63 = 1, l_numSprings_1 do
            l_structureSprings_1[v63]:computeForce();
        end;
    end;
end;
v7.updateAndGetAvgDt = function(v64, v65) --[[ Line: 319 ]] --[[ Name: updateAndGetAvgDt ]]
    -- upvalues: v3 (copy)
    v65 = math.clamp(v65, 0.008333333333333333, 0.02);
    if v64.lastDtIndex >= 2 * v3.maxDtsToAvg then
        v64.lastDtIndex = v3.maxDtsToAvg;
    end;
    v64.lastDtIndex = v64.lastDtIndex + 1;
    v64.lastDts[(v64.lastDtIndex - 1) % v3.maxDtsToAvg + 1] = v65;
    local v66 = math.min(v3.maxDtsToAvg, v64.lastDtIndex);
    local v67 = 0;
    for v68 = 1, v66 do
        v67 = v67 + v64.lastDts[v68];
    end;
    return v67 / v66;
end;
v7.afterCamera = function(v69, v70) --[[ Line: 339 ]] --[[ Name: afterCamera ]]
    if not v69.initSucceded then
        return;
    else
        if v69.physicallyAnimate then
            local v71 = tick();
            local v72 = v71 - v69.lastTick;
            v69.lastTick = v71;
            v69:onRenderStepSock((v69:updateAndGetAvgDt(v70)));
            if v69.rapTimeSoFar > 3.141592653589793 then
                v69.rapTimeSoFar = v69.rapTimeSoFar - 3.141592653589793;
            end;
            v69.rapTimeSoFar = v69.rapTimeSoFar + v72;
        end;
        return;
    end;
end;
v7.destroy = function(_) --[[ Line: 359 ]] --[[ Name: destroy ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0:UnbindFromRenderStep("WindhoseAfterCamera");
end;
return v7;