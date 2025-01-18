local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.DraggerFramework;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_DraggerFramework_0.Utility.DragHelper);
local v5 = require(l_DraggerFramework_0.Utility.PartMover);
local v6 = require(l_DraggerFramework_0.Utility.AttachmentMover);
local v7 = require(l_DraggerFramework_0.Components.TargetGridView);
local v8 = require(l_DraggerFramework_0.Components.TargetSoftSnapView);
local v9 = require(l_DraggerFramework_0.Utility.AnimationTask);
local _ = require(l_DraggerFramework_0.Utility.Analytics);
local v11 = require(l_DraggerFramework_0.Flags.getFFlagDraggerTelemetry);
local v12 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v13 = require(l_DraggerFramework_0.Flags.getFFlagDraggerFinalShortcuts);
local v14 = require(l_DraggerFramework_0.Utility.CursorGroupName);
local v15 = {
    eventName = "SBT_DraggerFreeformDragCompleted", 
    lastUpdated = {
        2024, 
        10, 
        14
    }, 
    description = "The user successfully dragged the selection via freeform drag.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local v16 = {};
v16.__index = v16;
local function _(v17) --[[ Line: 35 ]] --[[ Name: sCurve ]]
    if v17 < 0.5 then
        return 0.5 * (v17 / 0.5) ^ 4;
    else
        return 1 - 0.5 * ((1 - v17) / 0.5) ^ 4;
    end;
end;
v16.new = function(v19, v20, v21) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy), v16 (copy), v12 (copy), v9 (copy)
    local v22 = tick();
    local v23 = setmetatable({
        _draggerContext = v19, 
        _draggerToolModel = v20, 
        _dragInfo = v21, 
        _partMover = v5.new(), 
        _attachmentMover = v6.new(), 
        _tiltRotate = CFrame.new(), 
        _lastAppliedTransform = CFrame.new()
    }, v16);
    if v12() then
        v23._animationTask = v9.new(function(v24, v25) --[[ Line: 56 ]]
            -- upvalues: v23 (copy)
            v23:_animationCallback(v24, v25);
        end);
    end;
    v23:_init();
    v23:_analyticsRecordFreeformDragBegin(tick() - v22);
    return v23;
end;
v16._init = function(v26) --[[ Line: 66 ]] --[[ Name: _init ]]
    v26:_initIgnoreList(v26._draggerToolModel._selectionInfo:getObjectsToTransform());
    v26:_initMovers();
end;
v16._initMovers = function(v27) --[[ Line: 71 ]] --[[ Name: _initMovers ]]
    local v28 = not v27._draggerToolModel._draggerContext:areConstraintsEnabled();
    local v29, v30, v31 = v27._draggerToolModel._selectionInfo:getObjectsToTransform();
    v27._partMover:setDragged(v29, v27._draggerToolModel._selectionInfo:getOriginalCFrameMap(), v28, v27._draggerToolModel._selectionInfo:getBoundingBox().Position, v27._draggerToolModel:getSelectionWrapper():get(), v31, v27._draggerToolModel._selectionInfo:getRootMapping());
    v27._attachmentMover:setDragged(v30);
end;
v16._initIgnoreList = function(v32, v33) --[[ Line: 87 ]] --[[ Name: _initIgnoreList ]]
    local v34 = table.create(#v33 + 1);
    for v35, v36 in ipairs(v33) do
        v34[v35] = v36;
    end;
    table.insert(v34, v32._partMover:getIgnorePart());
    v32._raycastFilter = v34;
end;
v16._animationCallback = function(v37, v38, v39) --[[ Line: 97 ]] --[[ Name: _animationCallback ]]
    if v39 then
        v37._partMover:transformTo(v37._lastAppliedTransform);
        v37._attachmentMover:transformTo(v37._lastAppliedTransform);
        if v37._draggerToolModel._draggerContext:shouldJoinSurfaces() then
            v37._jointPairs = v37._partMover:computeJointPairs(v37._lastAppliedTransform);
            return;
        end;
    else
        local v40 = if v38 < 0.5 then 0.5 * (v38 / 0.5) ^ 4 else 1 - 0.5 * ((1 - v38) / 0.5) ^ 4;
        local l__animateFrom_0 = v37._animateFrom;
        local v42 = l__animateFrom_0.baseCFrame:Lerp(v37._lastDragTarget.baseCFrame, v40);
        local v43 = l__animateFrom_0.offsetCFrame:Lerp(v37._lastDragTarget.offsetCFrame, v40);
        local v44 = v42 * l__animateFrom_0.tiltRotate:Lerp(v37._tiltRotate, v40) * v43 * v37._draggerToolModel._selectionInfo:getLocalBoundingBox():Inverse();
        v37._partMover:transformTo(v44);
        v37._attachmentMover:transformTo(v44);
    end;
end;
v16._beginAnimation = function(v45, v46) --[[ Line: 118 ]] --[[ Name: _beginAnimation ]]
    v45._animateFrom = table.freeze({
        tiltRotate = v45._tiltRotate, 
        baseCFrame = v45._lastDragTarget.baseCFrame, 
        offsetCFrame = v45._lastDragTarget.offsetCFrame
    });
    v45._tiltRotate = v46;
    v45._animationTask:animate(v45._draggerToolModel._draggerContext:getTiltRotateDuration());
end;
v16.canHoldOrientation = function(_) --[[ Line: 128 ]] --[[ Name: canHoldOrientation ]]
    return true;
end;
v16._renderSurfaceJoints = function(v48) --[[ Line: 132 ]] --[[ Name: _renderSurfaceJoints ]]
    if v48._animationTask:inProgress() then
        return nil;
    else
        local l__draggerToolModel_0 = v48._draggerToolModel;
        if l__draggerToolModel_0._draggerContext:shouldJoinSurfaces() and v48._jointPairs then
            local v50, v51 = l__draggerToolModel_0._selectionInfo:getBoundingBox();
            local v52 = v50 * v51;
            return v48._jointPairs:renderJoints(l__draggerToolModel_0._draggerContext:getHandleScale(v52));
        else
            return;
        end;
    end;
end;
v16._renderSnapTarget = function(v53) --[[ Line: 154 ]] --[[ Name: _renderSnapTarget ]]
    -- upvalues: v3 (copy), v8 (copy), v7 (copy)
    local l__draggerContext_0 = v53._draggerContext;
    local l__lastDragTarget_0 = v53._lastDragTarget;
    if l__draggerContext_0:shouldShowTargetGrids() then
        if #l__lastDragTarget_0.softSnaps > 0 then
            return v3.createElement(v8, {
                DragTarget = l__lastDragTarget_0, 
                DraggerContext = l__draggerContext_0
            });
        else
            local v56 = if l__draggerContext_0:shouldGridSnap() then l__draggerContext_0:getGridSize() else nil;
            local _, _, v59 = v53._draggerToolModel._selectionInfo:getLocalBoundingBox();
            return v3.createElement(v7, {
                DragTarget = l__lastDragTarget_0, 
                SourceSize = v59, 
                Scale = l__draggerContext_0:getHandleScale(l__lastDragTarget_0.targetMatrix.Position), 
                GridSize = v56, 
                MajorStep = l__draggerContext_0:getMajorGridIncrement(), 
                Color = l__draggerContext_0:getGridColor(), 
                PrimaryColor = l__draggerContext_0:getChosenColor()
            });
        end;
    else
        return;
    end;
end;
v16._renderSnapRelation = function(v60) --[[ Line: 182 ]] --[[ Name: _renderSnapRelation ]]
    -- upvalues: v3 (copy)
    local l__draggerContext_1 = v60._draggerContext;
    local l__lastDragTarget_1 = v60._lastDragTarget;
    if l__draggerContext_1:shouldGridSnap() and #l__lastDragTarget_1.softSnaps == 0 then
        local l_mainCFrame_0 = l__lastDragTarget_1.mainCFrame;
        local v64 = l_mainCFrame_0:PointToWorldSpace(v60._dragInfo.draggedPoint);
        local l_targetMatrix_0 = l__lastDragTarget_1.targetMatrix;
        local l_Position_0 = l_targetMatrix_0.Position;
        local l_YVector_0 = l_targetMatrix_0.YVector;
        local v68 = (v64 - l_Position_0):Dot(l_YVector_0);
        local v69 = v64 - l_YVector_0 * v68;
        local v70 = l__draggerContext_1:getHandleScale(v64);
        return v3.createFragment({
            SnapFrom = v3.createElement("SphereHandleAdornment", {
                Radius = v70 * 0.15, 
                CFrame = l_mainCFrame_0.Rotation + v64, 
                Color3 = l__draggerContext_1:getChosenColor(), 
                AlwaysOnTop = true, 
                AdornCullingMode = Enum.AdornCullingMode.Never, 
                Adornee = workspace.Terrain, 
                ZIndex = 0
            }), 
            SnapTo = v3.createElement("BoxHandleAdornment", {
                Size = Vector3.new(0.05 * v70, v68, 0.05 * v70), 
                CFrame = CFrame.fromMatrix(v69 + 0.5 * l_YVector_0 * v68, l_YVector_0:Cross(l_targetMatrix_0.ZVector).Unit, l_YVector_0), 
                Color3 = l__draggerContext_1:getChosenColor(), 
                AlwaysOnTop = true, 
                AdornCullingMode = Enum.AdornCullingMode.Never, 
                Adornee = workspace.Terrain, 
                ZIndex = 0
            })
        });
    else
        return;
    end;
end;
v16._renderSnap = function(v71) --[[ Line: 226 ]] --[[ Name: _renderSnap ]]
    -- upvalues: v3 (copy)
    if not v71._draggerToolModel._draggerContext:areConstraintsEnabled() and v71._lastDragTarget then
        return v3.createFragment({
            SnapConnection = v71:_renderSnapRelation(), 
            SnapTarget = v71:_renderSnapTarget()
        });
    else
        return;
    end;
end;
v16.render = function(v72) --[[ Line: 236 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v3 (copy)
    if v12() then
        return v3.createFragment({
            SurfaceJoints = v72:_renderSurfaceJoints(), 
            Snap = v72:_renderSnap()
        });
    elseif v72._draggerToolModel._draggerContext:shouldJoinSurfaces() and v72._jointPairs then
        local v73, v74 = v72._draggerToolModel._selectionInfo:getBoundingBox();
        local v75 = v73 * v74;
        return v72._jointPairs:renderJoints(v72._draggerToolModel._draggerContext:getHandleScale(v75));
    else
        return;
    end;
end;
v16._shouldAlignDraggedObjects = function(v76) --[[ Line: 251 ]] --[[ Name: _shouldAlignDraggedObjects ]]
    -- upvalues: v13 (copy)
    if v13() then
        return v76._draggerToolModel:shouldAlignDraggedObjects() and not v76._draggerContext:isAltKeyDown();
    else
        return v76._draggerToolModel:shouldAlignDraggedObjects() and not v76._draggerContext:isShiftKeyDown();
    end;
end;
v16.rotate = function(v77, v78) --[[ Line: 259 ]] --[[ Name: rotate ]]
    -- upvalues: v4 (copy), v12 (copy)
    if v77._draggerToolModel._draggerContext:areConstraintsEnabled() then
        return;
    else
        if v78 == Vector3.new(0, 1, 0, 0) then
            v77._dragAnalytics.dragRotates = v77._dragAnalytics.dragRotates + 1;
        else
            v77._dragAnalytics.dragTilts = v77._dragAnalytics.dragTilts + 1;
        end;
        local v79 = v77._draggerToolModel._selectionInfo:getLocalBoundingBox();
        local v80 = nil;
        if v77._lastDragTarget then
            v80 = v77._lastDragTarget.targetMatrix;
        end;
        local v81 = v4.updateTiltRotate(v77._draggerToolModel._draggerContext:getCameraCFrame(), v77._draggerToolModel._draggerContext:getMouseRay(), v77._raycastFilter, v79, v80, v77._tiltRotate, v78, if v12() then v77:_shouldAlignDraggedObjects() else v77._draggerToolModel:shouldAlignDraggedObjects(), if v12() and v77._draggerContext:shouldGridSnap() then v77._draggerContext:getGridSize() else nil);
        if v12() then
            if v77._lastDragTarget then
                v77:_beginAnimation(v81);
                return;
            else
                v77._tiltRotate = v81;
                return;
            end;
        else
            v77._tiltRotate = v81;
            return;
        end;
    end;
end;
v16._updateGeometric = function(v82) --[[ Line: 307 ]] --[[ Name: _updateGeometric ]]
    -- upvalues: v12 (copy), v4 (copy)
    local v83 = nil;
    if v82._lastDragTarget then
        v83 = v82._lastDragTarget.targetMatrix;
    end;
    if v12() then
        local v84 = v82._draggerToolModel._draggerContext:getMouseRay();
        local v85 = v82:_shouldAlignDraggedObjects();
        local v86, v87, v88 = v82._draggerToolModel._selectionInfo:getLocalBoundingBox();
        local v89 = v4.getDragTarget(v82._raycastFilter, v86, v87, v88, v82._dragInfo.draggedPoint, v84, if v82._draggerContext:shouldGridSnap() then v82._draggerContext:getGridSize() else nil, v82._tiltRotate, v83, v85, v82._dragInfo.clickedMetadata.IsPivot, v82._draggerContext:getSoftSnapMarginFactor(), v82._draggerContext:shouldPartSnap());
        v82:_analyticsRecordFreeformDragUpdate(v89);
        if v89 then
            v82._lastDragTarget = v89;
            local v90 = v89.mainCFrame * v82._draggerToolModel._selectionInfo:getLocalBoundingBox():Inverse();
            if not v82._animationTask:inProgress() then
                v82._partMover:transformTo(v90);
                v82._attachmentMover:transformTo(v90);
                if v82._draggerToolModel._draggerContext:shouldJoinSurfaces() then
                    v82._jointPairs = v82._partMover:computeJointPairs(v90);
                end;
            end;
            v82._lastAppliedTransform = v90;
            return;
        end;
    else
        local function v92(v91) --[[ Line: 354 ]] --[[ Name: snapFunction ]]
            -- upvalues: v82 (copy)
            return v82._draggerContext:snapToGridSize(v91);
        end;
        local v93, v94, v95 = v82._draggerToolModel._selectionInfo:getLocalBoundingBox();
        local v96 = v4.getDragTarget(v82._draggerToolModel._draggerContext:getMouseRay(), v92, v82._dragInfo.clickPoint, v82._raycastFilter, v93, v82._dragInfo.basisPoint, v95, v94, v82._tiltRotate, v83, v82._draggerToolModel:shouldAlignDraggedObjects());
        v82:_analyticsRecordFreeformDragUpdate(v96);
        if v96 then
            v82._lastDragTarget = v96;
            local v97 = v96.mainCFrame * v93:Inverse();
            v82._partMover:transformTo(v97);
            v82._attachmentMover:transformTo(v97);
            v82._lastAppliedTransform = v97;
            if v82._draggerToolModel._draggerContext:shouldJoinSurfaces() then
                v82._jointPairs = v82._partMover:computeJointPairs(v97);
            end;
        end;
    end;
end;
v16._updatePhysical = function(v98) --[[ Line: 391 ]] --[[ Name: _updatePhysical ]]
    -- upvalues: v12 (copy), v4 (copy)
    local v99, _, _ = v98._draggerToolModel._selectionInfo:getLocalBoundingBox();
    local v102 = nil;
    if v12() then
        if not v98._dragInfo.draggedPoint then
            return;
        else
            v102 = v4.getCameraPlaneDragTarget(v98._draggerToolModel._draggerContext:getMouseRay(), v98._draggerToolModel._draggerContext:getCameraCFrame().LookVector, v99:pointToWorldSpace(v98._dragInfo.draggedPoint));
        end;
    elseif not v98._dragInfo.clickPoint then
        return;
    else
        v102 = v4.getCameraPlaneDragTarget(v98._draggerToolModel._draggerContext:getMouseRay(), v98._draggerToolModel._draggerContext:getCameraCFrame().LookVector, v99:pointToWorldSpace(v98._dragInfo.clickPoint));
    end;
    v98:_analyticsRecordFreeformDragUpdate(v102);
    if v102 then
        local v103 = v98._draggerToolModel._draggerContext:areCollisionsEnabled() and Enum.IKCollisionsMode.IncludeContactedMechanisms or Enum.IKCollisionsMode.NoCollisions;
        local v104 = v98._partMover:moveToWithIk(v102.mainCFrame, v103);
        v98._attachmentMover:transformTo(v104);
        v98._lastAppliedTransform = v104;
    end;
end;
v16.update = function(v105) --[[ Line: 430 ]] --[[ Name: update ]]
    if v105._draggerToolModel._draggerContext:areConstraintsEnabled() then
        v105:_updatePhysical();
        return;
    else
        v105:_updateGeometric();
        return;
    end;
end;
v16.destroy = function(v106) --[[ Line: 438 ]] --[[ Name: destroy ]]
    -- upvalues: v12 (copy), v14 (copy), l_Workspace_0 (copy)
    if v12() then
        v106._animationTask:commit();
    end;
    local l_attachmentBeingDragged_0 = v106._dragInfo.attachmentBeingDragged;
    if l_attachmentBeingDragged_0 then
        local v108 = v106._draggerToolModel._draggerContext:getMouseRay();
        local v109 = RaycastParams.new();
        v109.BruteForceAllSlow = true;
        v109.CollisionGroup = v14;
        local v110 = l_Workspace_0:Raycast(v108.Origin, v108.Direction, v109);
        if v110 then
            local l_WorldCFrame_0 = l_attachmentBeingDragged_0.WorldCFrame;
            if l_attachmentBeingDragged_0.Parent ~= v110.Instance then
                local l_v110_0 = v110 --[[ copy: 4 -> 6 ]];
                pcall(function() --[[ Line: 458 ]]
                    -- upvalues: l_attachmentBeingDragged_0 (copy), l_v110_0 (copy)
                    l_attachmentBeingDragged_0.Parent = l_v110_0.Position;
                end);
                l_attachmentBeingDragged_0.WorldCFrame = l_WorldCFrame_0;
            end;
        else
            v106._attachmentMover:transformTo(CFrame.new());
        end;
    end;
    if v106._draggerToolModel._draggerContext:shouldJoinSurfaces() and v106._jointPairs then
        v106._jointPairs:createJoints();
    end;
    v106._jointPairs = nil;
    v106._partMover:commit();
    v106._attachmentMover:commit();
    v106:_analyticsSendFreeformDragged();
    if v106._draggerContext:shouldUseLocalSpace() then
        return v106._draggerToolModel._selectionInfo:getTransformedCopy(v106._lastAppliedTransform);
    else
        local v113, v114, v115 = v106._lastAppliedTransform:ToOrientation();
        if math.abs(v113) > 1.0E-5 or math.abs(v114) > 1.0E-5 or math.abs(v115) > 1.0E-5 then
            return nil;
        else
            return v106._draggerToolModel._selectionInfo:getTransformedCopy(v106._lastAppliedTransform);
        end;
    end;
end;
v16._analyticsRecordFreeformDragBegin = function(v116, v117) --[[ Line: 499 ]] --[[ Name: _analyticsRecordFreeformDragBegin ]]
    local v118, v119 = v116._draggerToolModel._selectionInfo:getObjectsToTransform();
    v116._dragAnalytics = {
        dragTilts = 0, 
        dragRotates = 0, 
        partCount = #v118, 
        attachmentCount = #v119, 
        timeToStartDrag = v117
    };
    v116._dragStartLocation = nil;
end;
v16._analyticsRecordFreeformDragUpdate = function(v120, v121) --[[ Line: 511 ]] --[[ Name: _analyticsRecordFreeformDragUpdate ]]
    if v121 then
        v120._dragAnalytics.dragTargetType = v121.dragTargetType;
        if v120._dragStartLocation then
            v120._dragAnalytics.dragDistance = (v121.mainCFrame.Position - v120._dragStartLocation).Magnitude;
        else
            v120._dragAnalytics.dragDistance = 0;
            v120._dragStartLocation = v121.mainCFrame.Position;
        end;
        v120._dragAnalytics.distanceToCamera = (v120._draggerToolModel._draggerContext:getCameraCFrame().Position - v121.mainCFrame.Position).Magnitude;
        return;
    else
        v120._dragAnalytics.dragTargetType = "Failed";
        return;
    end;
end;
v16._analyticsSendFreeformDragged = function(v122) --[[ Line: 528 ]] --[[ Name: _analyticsSendFreeformDragged ]]
    -- upvalues: v11 (copy), v15 (copy)
    v122._dragAnalytics.gridSize = v122._draggerContext:getGridSize();
    v122._dragAnalytics.toolName = v122._draggerToolModel:getAnalyticsName();
    v122._dragAnalytics.wasAutoSelected = v122._draggerToolModel:wasAutoSelected();
    v122._dragAnalytics.joinSurfaces = v122._draggerContext:shouldJoinSurfaces();
    v122._dragAnalytics.useConstraints = v122._draggerContext:areConstraintsEnabled();
    v122._dragAnalytics.haveCollisions = v122._draggerContext:areCollisionsEnabled();
    v122._dragAnalytics.pivotType = v122._draggerToolModel:classifySelectionPivot();
    v122._draggerToolModel._draggerContext:getAnalytics():sendEvent("freeformDragged", v122._dragAnalytics);
    if v11() then
        v122._draggerContext:getAnalytics():logTelemetryCounter(v122._draggerToolModel:getAnalyticsName(), v15);
    end;
end;
return v16;