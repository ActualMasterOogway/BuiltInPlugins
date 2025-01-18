local l_StudioService_0 = game:GetService("StudioService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Utility.Colors);
local v4 = require(l_Parent_0.Utility.MockAnalytics);
local v5 = require(l_Parent_0.Flags.getFFlagDraggerFinalShortcuts);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    assert(v8 ~= nil);
    return (setmetatable({
        _workspace = if v9 == true then game:GetService("Workspace") else nil, 
        _guiTarget = v7, 
        _useLocalSpace = false, 
        _areCollisionsEnabled = true, 
        _areConstraintsEnabled = false, 
        _areConstraintDetailsShown = false, 
        _drawConstraintsOnTop = false, 
        _shouldJoinSurfaces = true, 
        _mouseLocation = Vector2.new(), 
        _mouseUnitRay = Ray.new(Vector3.new(), (Vector3.new())), 
        _cameraCFrame = CFrame.new(), 
        _cameraSize = 10, 
        _mouseIcon = "", 
        _isSimulating = false, 
        _gridSize = 1, 
        _gridSnapEnabled = true, 
        _partSnapEnabled = true, 
        _rotateIncrement = 0.5235987755982988, 
        _rotateSnapEnabled = true, 
        _selection = v8, 
        _undoWaypoints = {}, 
        _isTabDown = false, 
        _isAltDown = false, 
        _isCtrlDown = false, 
        _isShiftDown = false, 
        _settingValues = {}
    }, v6));
end;
v6.getGuiParent = function(v10) --[[ Line: 61 ]] --[[ Name: getGuiParent ]]
    return v10._guiTarget;
end;
v6.setHoverInstance = function(v11, v12) --[[ Line: 65 ]] --[[ Name: setHoverInstance ]]
    v11._hoverInstance = v12;
end;
v6.onInstanceHovered = function(v13, v14) --[[ Line: 69 ]] --[[ Name: onInstanceHovered ]]
    v13._onInstanceHovered = v14;
    return function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        v13._onInstanceHovered = nil;
    end;
end;
v6.invokeInstanceHovered = function(v15, v16, v17) --[[ Line: 76 ]] --[[ Name: invokeInstanceHovered ]]
    if v15._onInstanceHovered then
        v15._onInstanceHovered(v16, v17);
    end;
end;
v6.expectHoverInstance = function(v18, v19) --[[ Line: 82 ]] --[[ Name: expectHoverInstance ]]
    if v18._hoverInstance ~= v19 then
        local v20 = v19 and v19:GetFullName() or "nil";
        local v21 = v18._hoverInstance and v18._hoverInstance:GetFullName() or "nil";
        error("Wrong hover instance,\n    Expected: " .. v20 .. "\n    Got: " .. v21);
    end;
end;
v6.shouldUseLocalSpace = function(v22) --[[ Line: 90 ]] --[[ Name: shouldUseLocalSpace ]]
    return v22._useLocalSpace;
end;
v6.setUseLocalSpace = function(v23, v24) --[[ Line: 94 ]] --[[ Name: setUseLocalSpace ]]
    v23._useLocalSpace = v24;
end;
v6.areCollisionsEnabled = function(v25) --[[ Line: 98 ]] --[[ Name: areCollisionsEnabled ]]
    return v25._areCollisionsEnabled;
end;
v6.setCollisionsEnabled = function(v26, v27) --[[ Line: 102 ]] --[[ Name: setCollisionsEnabled ]]
    v26._areCollisionsEnabled = v27;
end;
v6.areConstraintsEnabled = function(v28) --[[ Line: 106 ]] --[[ Name: areConstraintsEnabled ]]
    return v28._areConstraintsEnabled;
end;
v6.setConstraintsEnabled = function(v29, v30) --[[ Line: 110 ]] --[[ Name: setConstraintsEnabled ]]
    v29._areConstraintsEnabled = v30;
end;
v6.areConstraintDetailsShown = function(v31) --[[ Line: 114 ]] --[[ Name: areConstraintDetailsShown ]]
    return v31._areConstraintDetailsShown;
end;
v6.setConstraintDetailsShown = function(v32, v33) --[[ Line: 118 ]] --[[ Name: setConstraintDetailsShown ]]
    v32._areConstraintDetailsShown = v33;
end;
v6.shouldDrawConstraintsOnTop = function(v34) --[[ Line: 122 ]] --[[ Name: shouldDrawConstraintsOnTop ]]
    return v34._drawConstraintsOnTop;
end;
v6.setDrawConstraintsOnTop = function(v35, v36) --[[ Line: 126 ]] --[[ Name: setDrawConstraintsOnTop ]]
    v35._drawConstraintsOnTop = v36;
end;
v6.shouldJoinSurfaces = function(v37) --[[ Line: 130 ]] --[[ Name: shouldJoinSurfaces ]]
    return v37._shouldJoinSurfaces;
end;
v6.setJoinSurfaces = function(v38, v39) --[[ Line: 134 ]] --[[ Name: setJoinSurfaces ]]
    assert(typeof(v39) == "boolean");
    v38._shouldJoinSurfaces = v39;
end;
v6.getShowBoundingBox = function(_) --[[ Line: 139 ]] --[[ Name: getShowBoundingBox ]]
    return true;
end;
v6.getShowOutline = function(_) --[[ Line: 143 ]] --[[ Name: getShowOutline ]]
    return true;
end;
v6.shouldShowHover = function(_) --[[ Line: 147 ]] --[[ Name: shouldShowHover ]]
    return true;
end;
v6.shouldAnimateHover = function(_) --[[ Line: 151 ]] --[[ Name: shouldAnimateHover ]]
    return true;
end;
v6.shouldSelectScopeByDefault = function(_) --[[ Line: 155 ]] --[[ Name: shouldSelectScopeByDefault ]]
    return true;
end;
v6.getHoverAnimationSpeedInSeconds = function(_) --[[ Line: 159 ]] --[[ Name: getHoverAnimationSpeedInSeconds ]]
    return 0.5;
end;
v6.getHoverBoxColor = function(_, _) --[[ Line: 163 ]] --[[ Name: getHoverBoxColor ]]
    return Color3.new();
end;
v6.getHoverThickness = function(_) --[[ Line: 167 ]] --[[ Name: getHoverThickness ]]
    return 0.04;
end;
v6.getHoverLineThickness = function(_) --[[ Line: 171 ]] --[[ Name: getHoverLineThickness ]]
    return 1;
end;
v6.getSelectionBoxColor = function(_, _) --[[ Line: 175 ]] --[[ Name: getSelectionBoxColor ]]
    return Color3.new();
end;
v6.useBoundingBoxMoveHandles = function(_) --[[ Line: 179 ]] --[[ Name: useBoundingBoxMoveHandles ]]
    return false;
end;
v6.getGeometrySnapColor = function(_) --[[ Line: 183 ]] --[[ Name: getGeometrySnapColor ]]
    return Color3.new();
end;
v6.getGridColor = function(_) --[[ Line: 187 ]] --[[ Name: getGridColor ]]
    return Color3.new();
end;
v6.getChosenColor = function(_) --[[ Line: 191 ]] --[[ Name: getChosenColor ]]
    return Color3.new();
end;
v6.shouldShowHoverGrids = function(_) --[[ Line: 195 ]] --[[ Name: shouldShowHoverGrids ]]
    return true;
end;
v6.shouldShowTargetGrids = function(_) --[[ Line: 199 ]] --[[ Name: shouldShowTargetGrids ]]
    return true;
end;
v6.shouldShowPreciseInput = function(_) --[[ Line: 203 ]] --[[ Name: shouldShowPreciseInput ]]
    return true;
end;
v6.getMajorGridIncrement = function(_) --[[ Line: 207 ]] --[[ Name: getMajorGridIncrement ]]
    return 5;
end;
v6.getTiltRotateDuration = function(_) --[[ Line: 211 ]] --[[ Name: getTiltRotateDuration ]]
    return 0.13;
end;
v6.getMaxSoftSnaps = function(_) --[[ Line: 215 ]] --[[ Name: getMaxSoftSnaps ]]
    return 100;
end;
v6.getSoftSnapMarginFactor = function(_) --[[ Line: 219 ]] --[[ Name: getSoftSnapMarginFactor ]]
    return 1;
end;
v6.getSummonMarginFactor = function(_) --[[ Line: 223 ]] --[[ Name: getSummonMarginFactor ]]
    return 1;
end;
v6.getCameraCFrame = function(v64) --[[ Line: 227 ]] --[[ Name: getCameraCFrame ]]
    return v64._cameraCFrame;
end;
v6.getCamera = function(v65) --[[ Line: 231 ]] --[[ Name: getCamera ]]
    if v65._workspace then
        return v65._workspace.CurrentCamera;
    else
        return nil;
    end;
end;
v6.setCamera = function(v66, v67, v68) --[[ Line: 235 ]] --[[ Name: setCamera ]]
    if v66._workspace then
        v66._workspace.CurrentCamera.CFrame = v67;
    end;
    v66._cameraCFrame = v67;
    v66._cameraSize = v68 or 10;
end;
v6.getHandleScale = function(_, _) --[[ Line: 244 ]] --[[ Name: getHandleScale ]]
    return 1;
end;
v6.getMouseUnitRay = function(v71) --[[ Line: 248 ]] --[[ Name: getMouseUnitRay ]]
    return v71:viewportPointToRay(v71._mouseLocation);
end;
v6.getMouseRay = function(v72) --[[ Line: 252 ]] --[[ Name: getMouseRay ]]
    local v73 = v72:getMouseUnitRay();
    return Ray.new(v73.Origin, v73.Direction * 10000);
end;
v6.getMouseLocation = function(v74) --[[ Line: 257 ]] --[[ Name: getMouseLocation ]]
    return v74._mouseLocation;
end;
v6.setMouseLocation = function(v75, v76) --[[ Line: 261 ]] --[[ Name: setMouseLocation ]]
    v75._mouseLocation = v76;
end;
v6.viewportPointToRay = function(v77, v78) --[[ Line: 265 ]] --[[ Name: viewportPointToRay ]]
    if v77._workspace then
        return v77._workspace.CurrentCamera:ViewportPointToRay(v78.X, v78.Y);
    else
        local v79 = (v78.X / 1000 - 0.5) * v77._cameraSize;
        local v80 = (v78.Y / 1000 - 0.5) * v77._cameraSize;
        local v81 = v77._cameraCFrame:PointToWorldSpace((Vector3.new(v79, v80, 0)));
        return Ray.new(v81, v77._cameraCFrame.LookVector);
    end;
end;
v6.worldToViewportPoint = function(v82, v83) --[[ Line: 275 ]] --[[ Name: worldToViewportPoint ]]
    if v82._workspace then
        return v82._workspace.CurrentCamera:WorldToViewportPoint(v83);
    else
        local v84 = v82._cameraCFrame:Inverse() * v83;
        local v85 = (v84.X / v82._cameraSize + 0.5) * 1000;
        local v86 = (v84.Y / v82._cameraSize + 0.5) * 1000;
        local v87 = false;
        if v85 >= 0 then
            v87 = false;
            if v85 <= 1000 then
                v87 = false;
                if v86 >= 0 then
                    v87 = false;
                    if v86 <= 1000 then
                        v87 = v84.Z < 0;
                    end;
                end;
            end;
        end;
        return Vector2.new(v85, v86), v87;
    end;
end;
v6.getViewportSize = function(v88) --[[ Line: 286 ]] --[[ Name: getViewportSize ]]
    if v88._workspace then
        return v88._workspace.CurrentCamera.ViewportSize;
    else
        return Vector2.new(1000, 1000);
    end;
end;
v6.setMouseIcon = function(v89, v90) --[[ Line: 293 ]] --[[ Name: setMouseIcon ]]
    v89._mouseIcon = v90;
end;
v6.expectMouseIcon = function(v91, v92) --[[ Line: 297 ]] --[[ Name: expectMouseIcon ]]
    if v91._mouseIcon ~= v92 then
        local v93 = v92 or "nil";
        local v94 = v91._mouseIcon or "nil";
        error("Wrong mouse icon,\n    Expected: " .. v93 .. "\n    Got: " .. v94);
    end;
end;
v6.getSelection = function(v95) --[[ Line: 305 ]] --[[ Name: getSelection ]]
    return v95._selection;
end;
v6.isSimulating = function(v96) --[[ Line: 311 ]] --[[ Name: isSimulating ]]
    return v96._isSimulating;
end;
v6.setSimulating = function(v97, v98) --[[ Line: 315 ]] --[[ Name: setSimulating ]]
    v97._isSimulating = v98;
end;
v6.isTabKeyDown = function(v99) --[[ Line: 319 ]] --[[ Name: isTabKeyDown ]]
    return v99._isTabDown;
end;
v6.isAltKeyDown = function(v100) --[[ Line: 323 ]] --[[ Name: isAltKeyDown ]]
    return v100._isAltDown;
end;
v6.isCtrlKeyDown = function(v101) --[[ Line: 327 ]] --[[ Name: isCtrlKeyDown ]]
    return v101._isCtrlDown;
end;
v6.isShiftKeyDown = function(v102) --[[ Line: 331 ]] --[[ Name: isShiftKeyDown ]]
    return v102._isShiftDown;
end;
v6.shouldExtendSelection = function(v103) --[[ Line: 335 ]] --[[ Name: shouldExtendSelection ]]
    return v103:isCtrlKeyDown() or v103:isShiftKeyDown();
end;
v6.setCtrlAltShift = function(v104, v105, v106, v107) --[[ Line: 339 ]] --[[ Name: setCtrlAltShift ]]
    v104._isCtrlDown = v105;
    v104._isAltDown = v106;
    v104._isShiftDown = v107;
end;
v6.setTab = function(v108, v109) --[[ Line: 345 ]] --[[ Name: setTab ]]
    v108._isTabDown = v109;
end;
v6.getGridSize = function(v110) --[[ Line: 349 ]] --[[ Name: getGridSize ]]
    return v110._gridSize;
end;
v6.getGridSnapEnabled = function(v111) --[[ Line: 353 ]] --[[ Name: getGridSnapEnabled ]]
    return v111._gridSnapEnabled;
end;
v6.setPartSnapEnabled = function(v112, v113) --[[ Line: 357 ]] --[[ Name: setPartSnapEnabled ]]
    v112._partSnapEnabled = v113;
end;
v6.getPartSnapEnabled = function(v114) --[[ Line: 361 ]] --[[ Name: getPartSnapEnabled ]]
    return v114._partSnapEnabled;
end;
v6.shouldPartSnap = function(v115) --[[ Line: 364 ]] --[[ Name: shouldPartSnap ]]
    -- upvalues: v5 (copy)
    if v5() then
        return v115:getPartSnapEnabled() and not v115:isShiftKeyDown();
    else
        return v115:getPartSnapEnabled() and not v115:isAltKeyDown();
    end;
end;
v6.shouldGridSnap = function(v116) --[[ Line: 372 ]] --[[ Name: shouldGridSnap ]]
    -- upvalues: v5 (copy)
    if v5() then
        return v116:getGridSnapEnabled() and not v116:isShiftKeyDown();
    else
        return v116:getGridSnapEnabled() and not v116:isAltKeyDown();
    end;
end;
v6.shouldAngleSnap = function(v117) --[[ Line: 380 ]] --[[ Name: shouldAngleSnap ]]
    -- upvalues: v5 (copy)
    if v5() then
        return v117._rotateSnapEnabled and not v117:isShiftKeyDown();
    else
        return v117._rotateSnapEnabled and not v117:isAltKeyDown();
    end;
end;
v6.snapToGridSize = function(v118, v119) --[[ Line: 388 ]] --[[ Name: snapToGridSize ]]
    if v118._gridSnapEnabled then
        return math.floor(v119 / v118._gridSize + 0.5) * v118._gridSize;
    else
        return v119;
    end;
end;
v6.getRotateIncrement = function(v120) --[[ Line: 398 ]] --[[ Name: getRotateIncrement ]]
    return v120._rotateIncrement;
end;
v6.setGridSnap = function(v121, v122, v123) --[[ Line: 402 ]] --[[ Name: setGridSnap ]]
    assert(v122 ~= nil, "Missing enabled");
    assert(v123 ~= nil, "Missing snap");
    v121._gridSnapEnabled = v122;
    v121._gridSize = v123;
end;
v6.setRotateSnap = function(v124, v125, v126) --[[ Line: 409 ]] --[[ Name: setRotateSnap ]]
    assert(v125 ~= nil, "Missing enabled");
    assert(v126 ~= nil, "Missing snap");
    v124._rotateSnapEnabled = v125;
    v124._rotateIncrement = v126;
end;
v6.getAnalytics = function(_) --[[ Line: 416 ]] --[[ Name: getAnalytics ]]
    -- upvalues: v4 (copy)
    return v4;
end;
v6.gizmoRaycast = function(_, v129, v130, v131) --[[ Line: 420 ]] --[[ Name: gizmoRaycast ]]
    -- upvalues: l_StudioService_0 (copy)
    return l_StudioService_0:GizmoRaycast(v129, v130, v131);
end;
v6.setInsertPoint = function(v132, v133) --[[ Line: 424 ]] --[[ Name: setInsertPoint ]]
    v132._insertPoint = v133;
end;
v6.expectInsertPoint = function(v134, v135) --[[ Line: 428 ]] --[[ Name: expectInsertPoint ]]
    if v134._insertPoint ~= v135 then
        local v136 = tostring(v135);
        local v137 = tostring(v134._insertPoint);
        error("Wrong insert point,\n    Expected: " .. v136 .. "\n    Got: " .. v137);
    end;
end;
v6.shouldShowActiveInstanceHighlight = function(_) --[[ Line: 436 ]] --[[ Name: shouldShowActiveInstanceHighlight ]]
    return true;
end;
v6.shouldAlignDraggedObjects = function(_) --[[ Line: 440 ]] --[[ Name: shouldAlignDraggedObjects ]]
    return true;
end;
v6.addUndoWaypoint = function(v140, v141, _) --[[ Line: 444 ]] --[[ Name: addUndoWaypoint ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    if l_ChangeHistoryService_0 then
        l_ChangeHistoryService_0:SetWaypoint(v141);
    end;
    table.insert(v140._undoWaypoints, v141);
    while #v140._undoWaypoints > 20 do
        table.remove(v140._undoWaypoints, 1);
    end;
end;
v6.expectMostRecentUndoWaypoint = function(v143, v144) --[[ Line: 454 ]] --[[ Name: expectMostRecentUndoWaypoint ]]
    local v145 = v143._undoWaypoints[#v143._undoWaypoints];
    if v145 ~= v144 then
        error("Wrong last undo waypoint,\n    Expected: " .. v144 .. "\n    Got: " .. (v145 or "<none>"));
    end;
end;
v6.expectAndUndo = function(v146, v147) --[[ Line: 466 ]] --[[ Name: expectAndUndo ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    v146:expectMostRecentUndoWaypoint(v147);
    v146._undoWaypoints[#v146._undoWaypoints] = nil;
    if l_ChangeHistoryService_0 then
        l_ChangeHistoryService_0:Undo();
    end;
end;
v6.getText = function(_, v149, v150, v151) --[[ Line: 474 ]] --[[ Name: getText ]]
    if v151 then
        return ("%s.%s (%s)").format(v149, v150, table.concat(v151, ","));
    else
        return ("%s.%s").format(v149, v150);
    end;
end;
v6.getThemeColor = function(_, v153, _) --[[ Line: 482 ]] --[[ Name: getThemeColor ]]
    -- upvalues: v3 (copy)
    if v153 == Enum.StudioStyleGuideColor.MainBackground then
        return v3.WHITE;
    else
        return v3.BLACK;
    end;
end;
v6.getTheme = function(_) --[[ Line: 490 ]] --[[ Name: getTheme ]]
    return "Dark";
end;
v6.getSetting = function(v156, v157) --[[ Line: 494 ]] --[[ Name: getSetting ]]
    return v156._settingValues[v157];
end;
v6.setSetting = function(v158, v159, v160) --[[ Line: 498 ]] --[[ Name: setSetting ]]
    v158._settingValues[v159] = v160;
end;
v6.setPivotIndicator = function(_, _) --[[ Line: 502 ]] --[[ Name: setPivotIndicator ]]
    return false;
end;
return v6;