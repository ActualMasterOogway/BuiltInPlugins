local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_0.Implementation.SelectionCycleCache);
local v5 = require(l_Parent_0.Utility.SelectionWrapper);
local v6 = require(l_Parent_0.Utility.SelectionHelper);
local v7 = require(l_Parent_0.Utility.classifyPivot);
local _ = require(l_Parent_0.Utility.Analytics);
local v9 = {
    eventName = "SBT_DraggerHandleDragCompleted", 
    lastUpdated = {
        2024, 
        10, 
        14
    }, 
    description = "The user successfully dragged the selection via a handle.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local v10 = require(l_Parent_0.Flags.getFFlagDraggerTelemetry);
local v11 = require(l_Parent_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
local v12 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v13 = require(l_Parent_0.Flags.getFFlagDraggerSelectionChangeFix);
local v14 = {};
v14.__index = v14;
local v15 = require(l_Parent_0.Implementation.DraggerStateType);
local l_DraggerStates_0 = l_Parent_0.Implementation.DraggerStates;
local v17 = table.freeze({
    [v15.Ready] = require(l_DraggerStates_0.Ready), 
    [v15.DraggingFaceInstance] = require(l_DraggerStates_0.DraggingFaceInstance), 
    [v15.PendingDraggingParts] = require(l_DraggerStates_0.PendingDraggingParts), 
    [v15.PendingSelectNext] = require(l_DraggerStates_0.PendingSelectNext), 
    [v15.DraggingHandle] = require(l_DraggerStates_0.DraggingHandle), 
    [v15.DraggingParts] = require(l_DraggerStates_0.DraggingParts), 
    [v15.DragSelecting] = require(l_DraggerStates_0.DragSelecting)
});
local v18 = {
    AllowDragSelect = true, 
    AllowFreeformDrag = true, 
    ShowLocalSpaceIndicator = false, 
    WasAutoSelected = false, 
    HandlesList = {}, 
    ShowPivotIndicator = false, 
    ShowDragSelect = true
};
local v19 = {
    AnalyticsName = true
};
v14.new = function(v20, v21, v22, v23, v24, v25) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v19 (copy), v11 (copy), v4 (copy), v14 (copy)
    for v26, _ in pairs(v22) do
        if v18[v26] == nil and v19[v26] == nil then
            error("Unexpected DraggerToolModel prop `" .. v26 .. "`");
        end;
    end;
    local v28 = {};
    for v29, _ in pairs(v19) do
        local v31 = v22[v29];
        if v31 == nil then
            error("Required prop `" .. v29 .. "` missing from DraggerToolModel props");
        else
            v28[v29] = v31;
        end;
    end;
    for v32, v33 in pairs(v18) do
        if v22[v32] ~= nil then
            v28[v32] = v22[v32];
        else
            v28[v32] = v33;
        end;
    end;
    return (setmetatable({
        _lastMouseClickTime = 0, 
        _lastMouseClickLocation = Vector2.new(-1, -1), 
        _handlesList = if not v11() then v28.HandlesList else nil, 
        _allHandlesList = if v11() then v28.HandlesList else nil, 
        _enabledHandlesList = if v11() then v28.HandlesList else nil, 
        _draggerContext = v20, 
        _draggerSchema = v21, 
        _modelProps = v28, 
        _requestRenderCallback = v23, 
        _markViewDirtyCallback = v24, 
        _markSelectionDirtyCallback = v25, 
        _selectionWrapper = nil, 
        _selectionCycleCache = v4.new(v20, v21), 
        _handlesSummoned = false
    }, v14));
end;
v14.setMouseCursor = function(v34, v35) --[[ Line: 129 ]] --[[ Name: setMouseCursor ]]
    if v34._mouseCursor ~= v35 then
        v34._mouseCursor = v35;
        v34._draggerContext:setMouseIcon(v35);
    end;
end;
v14.transitionToState = function(v36, v37, ...) --[[ Line: 143 ]] --[[ Name: transitionToState ]]
    -- upvalues: v17 (copy)
    assert(v17[v37], "Missing state type: " .. tostring(v37));
    v36._stateObject:leave();
    v36._mainState = v37;
    v36._stateObject = v17[v37].new(v36, ...);
    v36._stateObject:enter();
    v36:_updatePivotIndicatorVisibility();
    v36:_scheduleRender();
end;
v14.render = function(v38) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    v38:_updateHandles();
    return v3.createElement(v3.Portal, {
        target = v38._draggerContext:getGuiParent()
    }, {
        DraggerUI = v3.createElement("Folder", {}, v38._stateObject:render())
    });
end;
v14.update = function(v39) --[[ Line: 164 ]] --[[ Name: update ]]
    -- upvalues: v15 (copy)
    if v39._draggerContext:isSimulating() then
        v39._markViewDirtyCallback();
        local v40 = true;
        if v39._mainState ~= v15.DraggingHandle then
            v40 = v39._mainState == v15.DraggingParts;
        end;
        if not v40 and v39._selectionInfo:isDynamic() then
            v39._markSelectionDirtyCallback();
        end;
    end;
end;
v14.getSelectionWrapper = function(v41) --[[ Line: 182 ]] --[[ Name: getSelectionWrapper ]]
    return v41._selectionWrapper;
end;
v14.getAnalyticsName = function(v42) --[[ Line: 186 ]] --[[ Name: getAnalyticsName ]]
    return v42._modelProps.AnalyticsName;
end;
v14.wasAutoSelected = function(v43) --[[ Line: 191 ]] --[[ Name: wasAutoSelected ]]
    return v43._modelProps.WasAutoSelected;
end;
v14.getSchema = function(v44) --[[ Line: 195 ]] --[[ Name: getSchema ]]
    return v44._draggerSchema;
end;
v14.getHandlesList = function(v45) --[[ Line: 199 ]] --[[ Name: getHandlesList ]]
    -- upvalues: v11 (copy)
    if v11() then
        return v45._enabledHandlesList;
    else
        return v45._handlesList;
    end;
end;
v14.doesAllowDragSelect = function(v46) --[[ Line: 203 ]] --[[ Name: doesAllowDragSelect ]]
    return v46._modelProps.AllowDragSelect;
end;
v14.doesAllowFreeformDrag = function(v47) --[[ Line: 207 ]] --[[ Name: doesAllowFreeformDrag ]]
    return v47._modelProps.AllowFreeformDrag;
end;
v14.shouldShowDragSelect = function(v48) --[[ Line: 211 ]] --[[ Name: shouldShowDragSelect ]]
    return v48._modelProps.ShowDragSelect;
end;
v14.shouldShowLocalSpaceIndicator = function(v49) --[[ Line: 215 ]] --[[ Name: shouldShowLocalSpaceIndicator ]]
    return v49._modelProps.ShowLocalSpaceIndicator;
end;
v14.shouldShowSelectionDot = function(v50) --[[ Line: 219 ]] --[[ Name: shouldShowSelectionDot ]]
    return v50._modelProps.ShowSelectionDot;
end;
v14.shouldUseCollisionTransparency = function(v51) --[[ Line: 223 ]] --[[ Name: shouldUseCollisionTransparency ]]
    return v51._modelProps.UseCollisionsTransparency;
end;
v14.shouldAlignDraggedObjects = function(v52) --[[ Line: 227 ]] --[[ Name: shouldAlignDraggedObjects ]]
    return v52._draggerContext:shouldAlignDraggedObjects();
end;
v14.selectNextSelectables = function(v53, v54, v55) --[[ Line: 231 ]] --[[ Name: selectNextSelectables ]]
    -- upvalues: v6 (copy), v13 (copy)
    local v56 = v53._selectionWrapper:get();
    local v57 = v53._draggerSchema.getNextSelectables(v53._draggerContext, v56, v54, v55);
    if v57 then
        local v58 = v53._draggerContext:shouldExtendSelection();
        local v59 = v6.updateSelectionWithMultipleSelectables(v57, v56, false, v58);
        v53._selectionWrapper:set(v59);
        if v13() and not v53:isSelected() then
            return;
        else
            v53:_updateSelectionInfo();
        end;
    end;
end;
v14.classifySelectionPivot = function(v60) --[[ Line: 270 ]] --[[ Name: classifySelectionPivot ]]
    -- upvalues: v7 (copy)
    if not v60._selectionInfo then
        return "None";
    else
        local v61, v62, v63 = v60._selectionInfo:getBoundingBox();
        return v7(v61, v62, v63);
    end;
end;
v14._processSelected = function(v64) --[[ Line: 279 ]] --[[ Name: _processSelected ]]
    -- upvalues: v15 (copy), v17 (copy), v5 (copy), v11 (copy)
    v64._mainState = v15.Ready;
    v64._stateObject = v17[v15.Ready].new(v64);
    if v64._modelProps.ShowPivotIndicator then
        v64._oldShowPivot = v64._draggerContext:setPivotIndicator(true);
    end;
    v64._mouseCursor = "";
    v64._draggerContext:setMouseIcon("");
    v64._boundsChangedTracker = v64._draggerSchema.BoundsChangedTracker.new(v64._draggerContext, function(_) --[[ Line: 296 ]]
        -- upvalues: v64 (copy)
        v64._markSelectionDirtyCallback();
    end);
    v64._boundsChangedTracker:install();
    v64._selectionWrapper = v5.new(v64._draggerContext:getSelection());
    v64._selectionChangedConnection = v64._selectionWrapper.onSelectionExternallyChanged:Connect(function() --[[ Line: 302 ]]
        -- upvalues: v64 (copy)
        v64:_processSelectionChanged();
    end);
    v64:_updateSelectionInfo();
    if v11() then
        v64:_updateEnabledHandlesList();
    end;
    v64._stateObject:enter();
    v64:_analyticsSessionBegin();
end;
v14._processDeselected = function(v66) --[[ Line: 315 ]] --[[ Name: _processDeselected ]]
    -- upvalues: v12 (copy)
    if v12() then
        v66:_endSummon();
    end;
    if v66._isMouseDown then
        v66:_processMouseUp();
    end;
    if v66._modelProps.ShowPivotIndicator then
        v66._draggerContext:setPivotIndicator(v66._oldShowPivot);
    end;
    v66._stateObject:leave();
    v66._stateObject = nil;
    v66._selectionWrapper:destroy();
    v66._selectionWrapper = nil;
    v66._boundsChangedTracker:uninstall();
    v66._selectionChangedConnection:Disconnect();
    v66._selectionChangedConnection = nil;
    v66:_analyticsSendSession();
end;
v14.isSelected = function(v67) --[[ Line: 345 ]] --[[ Name: isSelected ]]
    return v67._stateObject ~= nil;
end;
if v11() then
    v14._updateEnabledHandlesList = function(v68) --[[ Line: 350 ]] --[[ Name: _updateEnabledHandlesList ]]
        v68._enabledHandlesList = {};
        if v68._allHandlesList then
            for _, v70 in pairs(v68._allHandlesList) do
                if not v70._props or not v70._props.IsEnabledFunction then
                    table.insert(v68._enabledHandlesList, v70);
                elseif v70._props.IsEnabledFunction(v68._selectionInfo) then
                    table.insert(v68._enabledHandlesList, v70);
                end;
            end;
        end;
    end;
end;
v14._processSelectionChanged = function(v71) --[[ Line: 365 ]] --[[ Name: _processSelectionChanged ]]
    -- upvalues: v11 (copy), v12 (copy)
    if not v71._selectionWrapper then
        return;
    else
        v71:_updateSelectionInfo();
        v71._stateObject:processSelectionChanged();
        if v11() then
            v71:_updateEnabledHandlesList();
        end;
        if v12() then
            if v11() then
                if v71._allHandlesList then
                    for _, v73 in v71._allHandlesList do
                        if v73.selectionChanged then
                            v73:selectionChanged();
                        end;
                    end;
                end;
            elseif v71._handlesList then
                for _, v75 in v71._handlesList do
                    if v75.selectionChanged then
                        v75:selectionChanged();
                    end;
                end;
            end;
        end;
        v71:_scheduleRender();
        return;
    end;
end;
v14._processKeyDown = function(v76, v77) --[[ Line: 400 ]] --[[ Name: _processKeyDown ]]
    v76._stateObject:processKeyDown(v77);
end;
v14._processKeyUp = function(v78, v79) --[[ Line: 404 ]] --[[ Name: _processKeyUp ]]
    v78._stateObject:processKeyUp(v79);
end;
v14._processMouseDown = function(v80) --[[ Line: 408 ]] --[[ Name: _processMouseDown ]]
    if v80._isMouseDown then
        v80:_processMouseUp();
    end;
    local v81 = nil;
    local v82 = v80._draggerContext:getMouseLocation();
    if os.clock() - v80._lastMouseClickTime < 0.5 and v82 == v80._lastMouseClickLocation then
        v81 = true;
        v80._lastMouseClickTime = 0;
    else
        v81 = false;
        v80._lastMouseClickTime = os.clock();
    end;
    v80._lastMouseClickLocation = v82;
    v80._isMouseDown = true;
    v80._stateObject:processMouseDown(v81);
end;
v14._processMouseUp = function(v83) --[[ Line: 433 ]] --[[ Name: _processMouseUp ]]
    if not v83._isMouseDown then
        return;
    else
        v83._isMouseDown = false;
        v83._stateObject:processMouseUp();
        return;
    end;
end;
v14._processViewChanged = function(v84) --[[ Line: 448 ]] --[[ Name: _processViewChanged ]]
    if not v84._stateObject then
        return;
    else
        v84._stateObject:processViewChanged();
        v84:_scheduleRender();
        return;
    end;
end;
v14._updateHandles = function(v85) --[[ Line: 459 ]] --[[ Name: _updateHandles ]]
    -- upvalues: v11 (copy)
    local l_pairs_0 = pairs;
    local v87 = if v11() then v85._enabledHandlesList else v85._handlesList;
    for _, v89 in l_pairs_0(v87) do
        if v89.update then
            v89:update(v85, v85._selectionInfo);
        end;
    end;
end;
v14._updateSelectionInfo = function(v90, v91) --[[ Line: 469 ]] --[[ Name: _updateSelectionInfo ]]
    if v91 then
        v90._selectionInfo = v91;
    else
        v90._selectionInfo = v90._draggerSchema.SelectionInfo.new(v90._draggerContext, v90._selectionWrapper:get());
    end;
    v90._boundsChangedTracker:setSelection(v90._selectionInfo);
    v90:_updateHandles();
    v90:_updatePivotIndicatorVisibility();
end;
v14._updatePivotIndicatorVisibility = function(v92) --[[ Line: 482 ]] --[[ Name: _updatePivotIndicatorVisibility ]]
    -- upvalues: v15 (copy)
    if v92._modelProps.ShowPivotIndicator then
        if v92._mainState == v15.DragSelecting or #v92._selectionWrapper:get() > 1 then
            v92._draggerContext:setPivotIndicator(v92._oldShowPivot);
            return;
        else
            v92._draggerContext:setPivotIndicator(true);
        end;
    end;
end;
v14._processToolboxInitiatedFreeformSelectionDrag = function(v93) --[[ Line: 492 ]] --[[ Name: _processToolboxInitiatedFreeformSelectionDrag ]]
    -- upvalues: v12 (copy), v15 (copy)
    if not v93:doesAllowFreeformDrag() then
        return;
    elseif v93._isMouseDown then
        return;
    else
        v93._isMouseDown = true;
        if v12() then
            v93:transitionToState(v15.DraggingParts, {
                draggedPoint = Vector3.zero, 
                clickedPoint = Vector3.zero, 
                clickedMetadata = table.freeze({
                    RaycastResult = nil, 
                    TargetMatrix = CFrame.new(), 
                    TargetSize = Vector3.zero, 
                    IsPivot = false
                }), 
                clickedFaceInstance = nil, 
                attachmentBeingDragged = nil
            });
            return;
        else
            v93:transitionToState(v15.DraggingParts, {
                mouseLocation = v93._draggerContext:getMouseLocation(), 
                basisPoint = Vector3.zero, 
                clickPoint = Vector3.zero
            });
            return;
        end;
    end;
end;
v14._processToolboxInitiatedFaceDrag = function(v94, v95) --[[ Line: 532 ]] --[[ Name: _processToolboxInitiatedFaceDrag ]]
    -- upvalues: l_Workspace_0 (copy), v13 (copy), v15 (copy)
    if v94._isMouseDown then
        return;
    else
        v94._isMouseDown = true;
        local v96 = nil;
        if v95[1]:IsA("VideoFrame") then
            local l_SurfaceGui_0 = Instance.new("SurfaceGui");
            l_SurfaceGui_0.Enabled = true;
            l_SurfaceGui_0.Parent = l_Workspace_0;
            v95[1].Parent = l_SurfaceGui_0;
            v96 = l_SurfaceGui_0.ChildRemoved:Connect(function(_) --[[ Line: 552 ]]
                -- upvalues: l_SurfaceGui_0 (copy)
                l_SurfaceGui_0:Destroy();
            end);
            v94._selectionWrapper:set({
                l_SurfaceGui_0
            });
            if v13() and not v94:isSelected() then
                return;
            else
                v94:_updateSelectionInfo();
            end;
        end;
        v94:transitionToState(v15.DraggingFaceInstance, v96);
        return;
    end;
end;
v14._processMouseEnter = function(v99) --[[ Line: 574 ]] --[[ Name: _processMouseEnter ]]
    v99._stateObject:processMouseEnter();
end;
v14._processMouseLeave = function(v100) --[[ Line: 578 ]] --[[ Name: _processMouseLeave ]]
    v100._stateObject:processMouseLeave();
end;
v14._scheduleRender = function(v101) --[[ Line: 582 ]] --[[ Name: _scheduleRender ]]
    v101._requestRenderCallback();
end;
v14._isSummoned = function(v102) --[[ Line: 586 ]] --[[ Name: _isSummoned ]]
    return v102._handlesSummoned;
end;
v14._beginSummon = function(v103) --[[ Line: 590 ]] --[[ Name: _beginSummon ]]
    if v103._handlesSummoned then
        return;
    else
        local l__draggerContext_0 = v103._draggerContext;
        if v103._draggerSchema.getSummonTarget then
            local v105 = v103._draggerSchema.getSummonTarget(l__draggerContext_0, l__draggerContext_0:getMouseRay());
            if v105 then
                local v106, _, _ = v103._selectionInfo:getBoundingBox();
                local v109 = v106:ToObjectSpace(v105);
                local v110 = false;
                for _, v112 in v103:getHandlesList() do
                    if v112.beginSummon then
                        v112:beginSummon(v109);
                        v110 = true;
                    end;
                end;
                if v110 then
                    v103._handlesSummoned = true;
                    v103._pivotVisibleBeforeSummon = v103._draggerContext:setPivotIndicator(false);
                    v103:_scheduleRender();
                end;
            end;
        end;
        return;
    end;
end;
v14._endSummon = function(v113) --[[ Line: 616 ]] --[[ Name: _endSummon ]]
    if not v113._handlesSummoned or v113._isMouseDown then
        return;
    else
        v113._handlesSummoned = false;
        for _, v115 in v113:getHandlesList() do
            if v115.endSummon then
                v115:endSummon();
            end;
        end;
        v113._draggerContext:setPivotIndicator(v113._pivotVisibleBeforeSummon);
        v113:_scheduleRender();
        return;
    end;
end;
v14.shouldShowPivotIndicator = function(v116) --[[ Line: 631 ]] --[[ Name: shouldShowPivotIndicator ]]
    return v116._modelProps.ShowPivotIndicator;
end;
v14._analyticsSessionBegin = function(v117) --[[ Line: 635 ]] --[[ Name: _analyticsSessionBegin ]]
    v117._selectedAtTime = tick();
    v117._sessionAnalytics = {
        freeformDrags = 0, 
        handleDrags = 0, 
        clickSelects = 0, 
        dragSelects = 0, 
        dragTilts = 0, 
        dragRotates = 0, 
        toolName = v117._modelProps.AnalyticsName, 
        wasAutoSelected = v117._modelProps.WasAutoSelected
    };
    v117._draggerContext:getAnalytics():sendEvent("toolSelected", {
        toolName = v117._modelProps.AnalyticsName, 
        wasAutoSelected = v117._modelProps.WasAutoSelected
    });
    if v117._modelProps.WasAutoSelected then
        v117._draggerContext:getAnalytics():reportCounter("studioLuaDefaultDraggerSelected");
        return;
    else
        v117._draggerContext:getAnalytics():reportCounter("studioLua" .. v117._modelProps.AnalyticsName .. "DraggerSelected");
        return;
    end;
end;
v14._analyticsSendSession = function(v118) --[[ Line: 660 ]] --[[ Name: _analyticsSendSession ]]
    local v119 = tick() - v118._selectedAtTime;
    v118._sessionAnalytics.duration = v119;
    v118._draggerContext:getAnalytics():sendEvent("toolSession", v118._sessionAnalytics);
end;
v14._analyticsSendClick = function(v120, v121, v122) --[[ Line: 666 ]] --[[ Name: _analyticsSendClick ]]
    v120._draggerContext:getAnalytics():sendEvent("clickedObject", {
        toolName = v120._modelProps.AnalyticsName, 
        wasAutoSelected = v120._modelProps.WasAutoSelected, 
        altPressed = v120._draggerContext:isAltKeyDown(), 
        ctrlPressed = v120._draggerContext:isCtrlKeyDown(), 
        shiftPressed = v120._draggerContext:isShiftKeyDown(), 
        clickedAttachment = v121 and v121:IsA("Attachment"), 
        clickedConstraint = v121 and v121:IsA("Constraint"), 
        clickedWeldConstraint = v121 and v121:IsA("WeldConstraint"), 
        clickedNoCollisionConstraint = v121 and v121:IsA("NoCollisionConstraint"), 
        didAlterSelection = v122
    });
    if v122 then
        v120._sessionAnalytics.clickSelects = v120._sessionAnalytics.clickSelects + 1;
    end;
end;
v14._analyticsSendSelectionCycle = function(v123, v124, v125) --[[ Line: 684 ]] --[[ Name: _analyticsSendSelectionCycle ]]
    v123._draggerContext:getAnalytics():sendEvent("selectionCycle", {
        toolName = v123._modelProps.AnalyticsName, 
        numberOfClicks = v124, 
        selectableCount = v125
    });
end;
v14._analyticsRecordFreeformDragBegin = function(v126, v127) --[[ Line: 692 ]] --[[ Name: _analyticsRecordFreeformDragBegin ]]
    v126._sessionAnalytics.freeformDrags = v126._sessionAnalytics.freeformDrags + 1;
    local v128 = "studioLuaDragger" .. v126._modelProps.AnalyticsName .. "DragTime";
    v126._draggerContext:getAnalytics():reportStats(v128, v127);
end;
v14._analyticsSendHandleDragged = function(v129, v130) --[[ Line: 698 ]] --[[ Name: _analyticsSendHandleDragged ]]
    -- upvalues: v10 (copy), v9 (copy)
    v129._draggerContext:getAnalytics():sendEvent("handleDragged", {
        toolName = v129._modelProps.AnalyticsName, 
        wasAutoSelected = false, 
        gridSize = v129._draggerContext:getGridSize(), 
        rotateIncrement = v129._draggerContext:getRotateIncrement(), 
        useLocalSpace = v129._draggerContext:shouldUseLocalSpace(), 
        joinSurfaces = v129._draggerContext:shouldJoinSurfaces(), 
        useConstraints = v129._draggerContext:areConstraintsEnabled(), 
        haveCollisions = v129._draggerContext:areCollisionsEnabled(), 
        pivotType = v129:classifySelectionPivot(), 
        handleId = v130
    });
    if v10() then
        v129._draggerContext:getAnalytics():logTelemetryCounter(v129._modelProps.AnalyticsName, v9);
    end;
end;
v14._analyticsSendBoxSelect = function(v131) --[[ Line: 718 ]] --[[ Name: _analyticsSendBoxSelect ]]
    v131._draggerContext:getAnalytics():sendEvent("boxSelected", {
        toolName = v131._modelProps.AnalyticsName, 
        wasAutoSelected = v131._modelProps.WasAutoSelected, 
        objectCount = #v131._selectionWrapper:get(), 
        altPressed = v131._draggerContext:isAltKeyDown(), 
        ctrlPressed = v131._draggerContext:isCtrlKeyDown(), 
        shiftPressed = v131._draggerContext:isShiftKeyDown()
    });
end;
v14._analyticsSendFaceInstanceSelected = function(v132, v133) --[[ Line: 729 ]] --[[ Name: _analyticsSendFaceInstanceSelected ]]
    v132._draggerContext:getAnalytics():sendEvent("faceInstanceSelected", {
        toolName = v132._modelProps.AnalyticsName, 
        wasAutoSelected = v132._modelProps.WasAutoSelected, 
        className = v133
    });
end;
return v14;