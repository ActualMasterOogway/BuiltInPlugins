local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Utility.getGeometry);
local v4 = require(l_Parent_0.Utility.JointPairs);
local v5 = require(l_Parent_0.Utility.JointUtil);
local v6 = require(l_Parent_0.Utility.fixSlightlyOffgridOrientation);
local _ = function(v7) --[[ Line: 18 ]] --[[ Name: getSelectedInstanceSet ]]
    local v8 = {};
    for _, v10 in pairs(v7) do
        v8[v10] = true;
    end;
    return v8;
end;
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v13 = setmetatable({
        _partSet = {}, 
        _toUnanchor = {}, 
        _facesToHighlightSet = {}, 
        _nearbyGeometry = {}
    }, v12);
    v13:_createMainPart();
    return v13;
end;
v12.getIgnorePart = function(v14) --[[ Line: 50 ]] --[[ Name: getIgnorePart ]]
    return v14._mainPart;
end;
v12.setDragged = function(v15, v16, v17, v18, v19, v20, v21, v22) --[[ Line: 56 ]] --[[ Name: setDragged ]]
    -- upvalues: l_Workspace_0 (copy)
    local v23 = table.create(16);
    for _, v25 in ipairs(v16) do
        if v25:IsDescendantOf(l_Workspace_0) and v25:GetRootPart() then
            table.insert(v23, v25);
        end;
    end;
    v15._workspaceParts = v23;
    assert(not v15._moving);
    v15._moving = true;
    v15._originalCFrameMap = v17;
    if #v16 == 0 then
        v15._parts = {};
        return;
    else
        v15:_initPartSet(v16);
        v15._customCenter = v19 or Vector3.new();
        v15:_prepareJoints(v16, v18, v22);
        v15._hasSetupGeometryTracking = false;
        if v22 then
            local l_v16_0 = v16;
            local l_v22_0 = v22;
            local v28 = {};
            for _, v30 in pairs(v20) do
                v28[v30] = true;
            end;
            v15:_setupRootMappingMove(l_v16_0, l_v22_0, v28);
        else
            local l_v16_1 = v16;
            local v32 = {};
            for _, v34 in pairs(v20) do
                v32[v34] = true;
            end;
            v15:_setupBulkMove(l_v16_1, v32);
        end;
        local v35 = {};
        for _, v37 in ipairs(v21) do
            v35[v37] = v37:GetPivot();
        end;
        v15._originalModelPivotMap = v35;
        v15._parts = v16;
        v15._hasMovementWelds = false;
        return;
    end;
end;
v12._setupRootMappingMove = function(v38, _, v40, _) --[[ Line: 100 ]] --[[ Name: _setupRootMappingMove ]]
    local v42 = {};
    local l__originalCFrameMap_0 = v38._originalCFrameMap;
    local v44 = 1;
    local v45 = {};
    local v46 = {};
    for v47, v48 in v40.RootToDescendantCountMap do
        if v48 == 0 and v38._partSet[v47] then
            local l_AssemblyRootPart_0 = v47.AssemblyRootPart;
            if l_AssemblyRootPart_0 ~= v47 and l_AssemblyRootPart_0 then
                v47 = l_AssemblyRootPart_0;
                l__originalCFrameMap_0[l_AssemblyRootPart_0] = l_AssemblyRootPart_0.CFrame;
            end;
            v45[v44] = v47;
            v46[v44] = l__originalCFrameMap_0[v47];
            v44 = v44 + 1;
        else
            v42[v47] = v47:GetPivot();
        end;
    end;
    v38._pivotToMapping = v42;
    v38._moveWithCFrameChangeParts = v45;
    v38._moveWithCFrameChangeOriginalCFrames = v46;
    v38._moveWithCFrameChangeTargetCFrames = table.create(#v45);
    v38._bulkMoveParts = {};
    v38._bulkMoveOriginalCFrames = {};
    v38._bulkMoveTargetCFrames = {};
end;
v12._setupBulkMove = function(v50, v51, v52) --[[ Line: 160 ]] --[[ Name: _setupBulkMove ]]
    -- upvalues: l_RunService_0 (copy)
    local v53 = {};
    local l__originalCFrameMap_1 = v50._originalCFrameMap;
    local v55 = {};
    local v56 = {};
    local v57 = 1;
    for _, v59 in ipairs(v51) do
        if v52[v59] and (v59:GetRootPart() or v59) == v59 then
            v53[v59] = true;
            v56[v57] = v59;
            v55[v57] = l__originalCFrameMap_1[v59];
            v57 = v57 + 1;
        end;
    end;
    local v60 = {};
    local v61 = {};
    local v62 = 1;
    for _, v64 in ipairs(v51) do
        local v65 = v64:GetRootPart() or v64;
        if not v53[v65] then
            v53[v65] = true;
            v60[v62] = v65;
            v61[v62] = l__originalCFrameMap_1[v65];
            v62 = v62 + 1;
        end;
    end;
    if l_RunService_0:IsRunning() then
        for v66, _ in pairs(v53) do
            if not v66.Anchored then
                v66.Anchored = true;
                v50._toUnanchor[v66] = true;
            end;
        end;
    end;
    v50._moveWithCFrameChangeParts = v56;
    v50._moveWithCFrameChangeOriginalCFrames = v55;
    v50._moveWithCFrameChangeTargetCFrames = table.create(#v56);
    v50._bulkMoveParts = v60;
    v50._bulkMoveOriginalCFrames = v61;
    v50._bulkMoveTargetCFrames = table.create(#v60);
end;
v12._initPartSet = function(v68, v69) --[[ Line: 234 ]] --[[ Name: _initPartSet ]]
    v68._partSet = {};
    for _, v71 in ipairs(v69) do
        v68._partSet[v71] = true;
    end;
end;
v12._setupGeometryTracking = function(v72) --[[ Line: 245 ]] --[[ Name: _setupGeometryTracking ]]
    assert(not v72._hasSetupGeometryTracking);
    v72._nearbyGeometry = {};
    v72._rootPartSet = {};
    for _, v74 in ipairs(v72._workspaceParts) do
        local l_v74_RootPart_0 = v74:GetRootPart();
        if l_v74_RootPart_0 then
            v72._rootPartSet[l_v74_RootPart_0] = true;
        end;
    end;
end;
v12._ensureGeometryTrackingHasBeenSetup = function(v76) --[[ Line: 267 ]] --[[ Name: _ensureGeometryTrackingHasBeenSetup ]]
    if not v76._hasSetupGeometryTracking then
        v76:_setupGeometryTracking();
        v76._hasSetupGeometryTracking = true;
    end;
end;
v12._createMainPart = function(v77) --[[ Line: 278 ]] --[[ Name: _createMainPart ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "PartDragMover";
    l_Part_0.Transparency = 1;
    l_Part_0.Archivable = false;
    l_Part_0.CanCollide = false;
    l_Part_0.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.3, 0.5);
    v77._mainPart = l_Part_0;
    v77._originalMainPartCFrame = l_Part_0.CFrame;
end;
v12._setupMainPart = function(v79, v80) --[[ Line: 296 ]] --[[ Name: _setupMainPart ]]
    -- upvalues: l_RunService_0 (copy), l_Workspace_0 (copy)
    v79._mainPart.Anchored = l_RunService_0:IsRunning();
    v79._originalMainPartCFrame = CFrame.new(v80);
    v79._mainPart.CFrame = v79._originalMainPartCFrame;
    v79._mainPart.Parent = l_Workspace_0.Terrain;
    v79._partSet[v79._mainPart] = true;
end;
v12._prepareJoints = function(v81, v82, v83, v84) --[[ Line: 310 ]] --[[ Name: _prepareJoints ]]
    -- upvalues: v5 (copy)
    v81._reenableJoints = {};
    v81._adjustAndReenableMotor6Ds = {};
    v81._alreadyConnectedToSets = {};
    local v85 = if v84 then v84.PartToRootMap else nil;
    for _, v87 in ipairs(v82) do
        v81._alreadyConnectedToSets[v87] = {};
        for _, v89 in ipairs(v87:GetJoints()) do
            if v89:IsA("JointInstance") then
                local v90 = v5.getJointInstanceCounterpart(v89, v87);
                if v83 then
                    if v81._partSet[v90] then
                        if v85 and v85[v87] ~= v85[v90] then
                            v89.Enabled = false;
                            v81._reenableJoints[v89] = true;
                        end;
                    elseif v89:IsA("Motor6D") then
                        v89.Enabled = false;
                        v81._adjustAndReenableMotor6Ds[v89] = true;
                        v81._alreadyConnectedToSets[v87][v90] = true;
                    else
                        v89.Parent = nil;
                    end;
                else
                    v81._alreadyConnectedToSets[v87][v90] = true;
                end;
            elseif v89:IsA("Constraint") then
                local v91 = v5.getConstraintCounterpart(v89, v87);
                if v91 then
                    v81._alreadyConnectedToSets[v87][v91] = true;
                    if v89:IsA("RigidConstraint") and v85 then
                        local v92 = v85[v91];
                        if v85[v87] ~= v92 and v92 then
                            v89.Enabled = false;
                            v81._reenableJoints[v89] = true;
                        end;
                    end;
                end;
            elseif v89:IsA("WeldConstraint") then
                local v93 = v5.getWeldConstraintCounterpart(v89, v87);
                v81._alreadyConnectedToSets[v87][v93] = true;
                if v83 then
                    if v81._partSet[v93] then
                        if v85 and v85[v87] ~= v85[v93] then
                            v89.Enabled = false;
                            v81._reenableJoints[v89] = true;
                        end;
                    else
                        v89.Enabled = false;
                        v81._reenableJoints[v89] = true;
                    end;
                end;
            elseif v89:IsA("NoCollisionConstraint") then
                local v94 = v5.getNoCollisionConstraintCounterpart(v89, v87);
                v81._alreadyConnectedToSets[v87][v94] = true;
            else
                error("Unexpected Joint Type: " .. v89.ClassName);
            end;
        end;
    end;
end;
v12._installMovementWelds = function(v95) --[[ Line: 402 ]] --[[ Name: _installMovementWelds ]]
    if v95._hasMovementWelds then
        return;
    else
        v95:_setupMainPart(v95._customCenter);
        v95._hasMovementWelds = true;
        v95._temporaryJoints = {};
        local v96 = v95._originalMainPartCFrame:Inverse();
        for _, v98 in ipairs(v95._parts) do
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Archivable = false;
            l_Weld_0.Name = "Temp Movement Weld";
            l_Weld_0.Part0 = v95._mainPart;
            l_Weld_0.Part1 = v98;
            l_Weld_0.C0 = v96 * v98.CFrame;
            l_Weld_0.Parent = v95._mainPart;
            table.insert(v95._temporaryJoints, l_Weld_0);
        end;
        return;
    end;
end;
v12.computeJointPairs = function(v100, v101) --[[ Line: 424 ]] --[[ Name: computeJointPairs ]]
    -- upvalues: v4 (copy), l_RunService_0 (copy)
    assert(v100._moving);
    v100:_ensureGeometryTrackingHasBeenSetup();
    local v104 = v4.new(v100._parts, v100._partSet, v100._rootPartSet, v101, v100._alreadyConnectedToSets, function(v102) --[[ Line: 435 ]]
        -- upvalues: v100 (copy)
        local v103 = v100._originalCFrameMap[v102];
        return v100:_getGeometry(v102, v103);
    end);
    if l_RunService_0:IsRunning() then
        v100:_flushNonDraggedGeometryCache();
    end;
    return v104;
end;
v12._transformModelPivots = function(v105, v106) --[[ Line: 450 ]] --[[ Name: _transformModelPivots ]]
    if v105._originalModelPivotMap then
        for v107, v108 in pairs(v105._originalModelPivotMap) do
            v107.WorldPivot = v106 * v108;
        end;
    end;
end;
v12._transformToImpl = function(v109, v110, v111) --[[ Line: 458 ]] --[[ Name: _transformToImpl ]]
    -- upvalues: l_Workspace_0 (copy), v6 (copy)
    if v109._bulkMoveParts then
        local l__bulkMoveTargetCFrames_0 = v109._bulkMoveTargetCFrames;
        local l__bulkMoveOriginalCFrames_0 = v109._bulkMoveOriginalCFrames;
        for v114 = 1, #v109._bulkMoveParts do
            l__bulkMoveTargetCFrames_0[v114] = v110 * l__bulkMoveOriginalCFrames_0[v114];
        end;
        l_Workspace_0:BulkMoveTo(v109._bulkMoveParts, l__bulkMoveTargetCFrames_0, v111);
        l__bulkMoveTargetCFrames_0 = v109._moveWithCFrameChangeTargetCFrames;
        l__bulkMoveOriginalCFrames_0 = v109._moveWithCFrameChangeOriginalCFrames;
        for v115 = 1, #v109._moveWithCFrameChangeParts do
            l__bulkMoveTargetCFrames_0[v115] = v6(v110 * l__bulkMoveOriginalCFrames_0[v115]);
        end;
        l_Workspace_0:BulkMoveTo(v109._moveWithCFrameChangeParts, l__bulkMoveTargetCFrames_0, Enum.BulkMoveMode.FireAllEvents);
    end;
    if v109._pivotToMapping then
        for v116, v117 in v109._pivotToMapping do
            v116:PivotTo(v6(v110 * v117));
        end;
        return;
    else
        v109:_transformModelPivots(v110);
        return;
    end;
end;
v12.transformTo = function(v118, v119) --[[ Line: 485 ]] --[[ Name: transformTo ]]
    assert(v118._moving);
    v118._lastTransform = v119;
    v118:_transformToImpl(v119, Enum.BulkMoveMode.FireCFrameChanged);
end;
v12.transformToWithIk = function(v120, v121, v122, v123, v124) --[[ Line: 494 ]] --[[ Name: transformToWithIk ]]
    -- upvalues: l_Workspace_0 (copy)
    assert(v120._moving);
    if #v120._parts == 0 then
        v120:transformTo(v121);
        return v121;
    else
        v120:_installMovementWelds();
        local v125 = v121 * v120._originalMainPartCFrame;
        pcall(function() --[[ Line: 508 ]]
            -- upvalues: l_Workspace_0 (ref), v120 (copy), v125 (copy), v122 (copy), v123 (copy), v124 (copy)
            l_Workspace_0:IKMoveTo(v120._mainPart, v125, v122, v123, v124);
        end);
        local v126 = v120._mainPart.CFrame * v120._originalMainPartCFrame:Inverse();
        v120:_transformModelPivots(v126);
        v120:_flushNonDraggedGeometryCache();
        return v126;
    end;
end;
v12.moveToWithIk = function(v127, v128, v129) --[[ Line: 523 ]] --[[ Name: moveToWithIk ]]
    return v127:transformToWithIk(v128, 0.85, 0.4, v129);
end;
v12.rotateToWithIk = function(v130, v131, v132) --[[ Line: 529 ]] --[[ Name: rotateToWithIk ]]
    return v130:transformToWithIk(v131, 0.4, 0.85, v132);
end;
v12.isIntersectingOthers = function(v133, v134) --[[ Line: 539 ]] --[[ Name: isIntersectingOthers ]]
    -- upvalues: l_Workspace_0 (copy)
    assert(v133._moving);
    local l_status_0, l_result_0 = pcall(l_Workspace_0.ArePartsTouchingOthers, l_Workspace_0, v133._workspaceParts, v134 or 0.001);
    if l_status_0 then
        return l_result_0;
    else
        return true;
    end;
end;
v12.commit = function(v137) --[[ Line: 561 ]] --[[ Name: commit ]]
    assert(v137._moving);
    v137._moving = false;
    if v137._mainPart then
        v137._mainPart.Parent = nil;
    end;
    if v137._reenableJoints then
        for v138, _ in pairs(v137._reenableJoints) do
            v138.Enabled = true;
        end;
        v137._reenableJoints = nil;
    end;
    if v137._adjustAndReenableMotor6Ds then
        for v140, _ in pairs(v137._adjustAndReenableMotor6Ds) do
            if v137._partSet[v140.Part0] then
                local l_Part0_0 = v140.Part0;
                v140.C0 = l_Part0_0.CFrame:Inverse() * v137._originalCFrameMap[l_Part0_0] * v140.C0;
            else
                local l_Part1_0 = v140.Part1;
                v140.C1 = l_Part1_0.CFrame:Inverse() * v137._originalCFrameMap[l_Part1_0] * v140.C1;
            end;
            v140.Enabled = true;
        end;
        v137._adjustAndReenableMotor6Ds = nil;
    end;
    v137._facesToHighlightSet = {};
    if v137._temporaryJoints then
        for _, v145 in ipairs(v137._temporaryJoints) do
            v145:Destroy();
        end;
        v137._temporaryJoints = {};
    end;
    for v146, _ in pairs(v137._toUnanchor) do
        v146.Anchored = false;
    end;
    v137._toUnanchor = {};
    if v137._bulkMoveParts then
        v137._moveWithCFrameChangeParts = nil;
        v137._moveWithCFrameChangeOriginalCFrames = nil;
        v137._moveWithCFrameChangeTargetCFrames = nil;
        v137._bulkMoveParts = nil;
        v137._bulkMoveOriginalCFrames = nil;
        v137._bulkMoveTargetCFrames = nil;
    end;
    if v137._pivotToMapping then
        v137._pivotToMapping = nil;
    end;
end;
local _ = function(_) --[[ Line: 618 ]] --[[ Name: augmentGeometry ]]

end;
v12._getGeometry = function(v150, v151, v152) --[[ Line: 624 ]] --[[ Name: _getGeometry ]]
    -- upvalues: v3 (copy)
    local v153 = v150._nearbyGeometry[v151];
    if not v153 then
        v153 = v3(v151, Vector3.new(), v152);
        v150._nearbyGeometry[v151] = v153;
        local _ = v153;
    end;
    return v153;
end;
v12._flushNonDraggedGeometryCache = function(v155) --[[ Line: 643 ]] --[[ Name: _flushNonDraggedGeometryCache ]]
    for v156, _ in pairs(v155._nearbyGeometry) do
        if not v155._partSet[v156] then
            v155._nearbyGeometry[v156] = nil;
        end;
    end;
end;
return v12;