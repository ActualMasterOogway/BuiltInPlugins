local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Utility.Colors);
local v4 = require(l_Parent_0.Components.StandaloneSelectionBox);
local v5 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v6 = require(l_Parent_0.Components.HotkeyUsageInfo);
local v7 = require(l_Parent_0.Components.FloatingValueInput);
local v8 = require(l_Parent_0.Utility.HotkeyHelpBuilder);
local v9 = require(l_Parent_0.Utility.conciseNumberFormat);
local v10 = require(l_Parent_0.Utility.SoftSnapper);
local v11 = require(l_Parent_0.Components.MoveHandleView);
local v12 = require(l_Parent_0.Components.SummonHandlesNote);
local v13 = require(l_Parent_0.Components.SummonHandlesHider);
local v14 = require(l_Parent_0.Components.DraggedPivot);
local v15 = require(l_Parent_0.Components.SummonedPivot);
local v16 = require(l_Parent_0.Utility.computeDraggedDistance);
local v17 = require(l_Parent_0.Utility.computeHandlePositionDistance);
local v18 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v19 = require(l_Parent_0.Flags.getFFlagDraggerHandleTracking);
local v20 = game:DefineFastFlag("DraggerUseFolderNotFrame", false);
local v21 = {};
v21.__index = v21;
local v22 = table.freeze({
    MinusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        Color = v3.Z_AXIS, 
        Opposite = "PlusZ"
    }, 
    PlusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), (Vector3.new(0, -1, 0, 0))), 
        Color = v3.Z_AXIS, 
        Opposite = "MinusZ"
    }, 
    MinusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), (Vector3.new(1, 0, 0, 0))), 
        Color = v3.Y_AXIS, 
        Opposite = "PlusY"
    }, 
    PlusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), (Vector3.new(-1, 0, 0, 0))), 
        Color = v3.Y_AXIS, 
        Opposite = "MinusY"
    }, 
    MinusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, 1, 0))), 
        Color = v3.X_AXIS, 
        Opposite = "PlusX"
    }, 
    PlusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, -1, 0))), 
        Color = v3.X_AXIS, 
        Opposite = "MinusX"
    }
});
v21.new = function(v23, v24, v25) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v10 (copy), v21 (copy)
    local v26 = {
        _handles = {}, 
        _props = v24 or {
            MustPositionAtPivot = false, 
            Summonable = true
        }, 
        _draggerContext = v23, 
        _implementation = v25, 
        _tabKeyDown = false
    };
    if v18() then
        v26._softSnapper = v10.new(v23);
    end;
    return (setmetatable(v26, v21));
end;
v21.update = function(v27, v28, v29) --[[ Line: 88 ]] --[[ Name: update ]]
    -- upvalues: v18 (copy)
    if not v27._draggingHandleId then
        if not v18() and not v27._tabKeyDown then
            v27:_endSummon();
        end;
        local v30, v31, v32 = v29:getBoundingBox();
        v27._basisOffset = CFrame.new(-v31);
        v27._boundingBox = {
            Size = v32, 
            CFrame = v30 * CFrame.new(v31)
        };
        v27._draggerToolModel = v28;
        v27._schema = v28:getSchema();
        v27._selectionWrapper = v28:getSelectionWrapper();
        v27._selectionInfo = v29;
    end;
    v27:_updateHandles();
end;
v21._summonHandles = function(v33) --[[ Line: 112 ]] --[[ Name: _summonHandles ]]
    -- upvalues: v18 (copy)
    assert(not v18(), "Wrong flag branching");
    if not v33._props.Summonable then
        return false;
    else
        local v34 = v33._draggerContext:getMouseRay();
        local _, _, v37 = v33._schema.getMouseTarget(v33._draggerContext, v34, {});
        if v37 then
            local v38 = v34.Origin + v34.Direction.Unit * v37;
            v33._summonBasisOffset = CFrame.new(v33._boundingBox.CFrame:PointToObjectSpace(v38));
        end;
        return;
    end;
end;
v21._endSummon = function(v39) --[[ Line: 127 ]] --[[ Name: _endSummon ]]
    -- upvalues: v18 (copy)
    assert(not v18(), "Wrong flag branching");
    if v39._summonBasisOffset then
        v39._summonBasisOffset = nil;
        v39._summonWasSnapped = false;
        v39._summonWasSnappedToSurface = false;
    end;
end;
v21.beginSummon = function(v40, v41) --[[ Line: 137 ]] --[[ Name: beginSummon ]]
    -- upvalues: v18 (copy)
    assert(v18(), "Wrong flag branching");
    v40._summonOffsetInBasis = v41;
    v40._laggingHandleId = nil;
end;
v21.endSummon = function(v42) --[[ Line: 145 ]] --[[ Name: endSummon ]]
    -- upvalues: v18 (copy)
    assert(v18(), "Wrong flag branching");
    v42._summonOffsetInBasis = nil;
    v42._laggingHandleId = nil;
end;
v21._getBasisOffset = function(v43) --[[ Line: 153 ]] --[[ Name: _getBasisOffset ]]
    -- upvalues: v18 (copy)
    if v18() then
        local l__summonOffsetInBasis_0 = v43._summonOffsetInBasis;
        if l__summonOffsetInBasis_0 then
            return v43._basisOffset * l__summonOffsetInBasis_0;
        else
            return v43._basisOffset;
        end;
    else
        return v43._summonBasisOffset or v43._basisOffset;
    end;
end;
v21.shouldBiasTowardsObjects = function(_) --[[ Line: 166 ]] --[[ Name: shouldBiasTowardsObjects ]]
    return false;
end;
v21.hitTest = function(v46, v47, _) --[[ Line: 170 ]] --[[ Name: hitTest ]]
    -- upvalues: v11 (copy)
    local v49 = nil;
    local v50 = 1e999;
    for v51, v52 in pairs(v46._handles) do
        local v53 = v11.hitTest(v52, v47);
        if v53 and v53 < v50 then
            v50 = v53;
            v49 = v51;
        end;
    end;
    return v49, v50, true;
end;
v21._doMeasuredMove = function(v54, v55) --[[ Line: 182 ]] --[[ Name: _doMeasuredMove ]]
    local v56 = v55 - v54._lastDelta;
    v54._lastDelta = v55;
    v54._draggerToolModel._boundsChangedTracker:uninstall();
    v54._implementation:beginDrag(v54._selectionWrapper:get(), v54._selectionInfo);
    v54._implementation:updateDrag(CFrame.new(v54._axis * v56));
    v54._implementation:endDrag();
    v54._schema.addUndoWaypoint(v54._draggerContext, "Precise Axis Move Selection");
    v54._draggerToolModel._boundsChangedTracker:install();
    v54._draggerToolModel:_updateSelectionInfo();
    v54._draggerToolModel:_scheduleRender();
end;
v21._doBump = function(v57, v58) --[[ Line: 196 ]] --[[ Name: _doBump ]]
    -- upvalues: v22 (copy)
    if not next(v57._handles) then
        return;
    else
        local v59 = v57._draggerContext:getGridSize();
        if v57._laggingHandleId and v22[v57._laggingRelativeToId].Opposite == v58 then
            v58 = v57._laggingRelativeToId;
            v59 = -v59;
        end;
        if not v57._laggingHandleId or v57._laggingRelativeToId ~= v58 then
            v57._laggingHandleId = v57:_getHandleIdClosestToCenterOfScreen(v58);
            v57._laggingRelativeToId = v58;
            v57._lastDelta = 0;
            v57._axis = v57._handles[v58].Axis.LookVector;
        end;
        v57:_doMeasuredMove(v57._lastDelta + v59);
        return;
    end;
end;
v21._useBoundingBoxMoveHandles = function(v60) --[[ Line: 219 ]] --[[ Name: _useBoundingBoxMoveHandles ]]
    -- upvalues: v18 (copy)
    if v18() then
        return v60._draggerContext:useBoundingBoxMoveHandles() and not v60._summonOffsetInBasis and not v60._props.MustPositionAtPivot;
    else
        return v60._draggerContext:useBoundingBoxMoveHandles() and not v60._summonBasisOffset and not v60._props.MustPositionAtPivot;
    end;
end;
v21._hasSoftSnap = function(v61) --[[ Line: 231 ]] --[[ Name: _hasSoftSnap ]]
    return v61._draggerContext:shouldPartSnap();
end;
local function _(v62) --[[ Line: 237 ]] --[[ Name: xy ]]
    return Vector2.new(v62.X, v62.Y);
end;
v21._getHandleIdClosestToCenterOfScreen = function(v64, v65) --[[ Line: 243 ]] --[[ Name: _getHandleIdClosestToCenterOfScreen ]]
    local v66 = v64._handles[v65];
    local v67 = -1e999;
    local v68 = 1e999;
    local v69 = nil;
    local v70 = v64._draggerContext:getCameraCFrame();
    local v71 = v70:VectorToObjectSpace(v66.Axis.LookVector);
    local v72 = Vector2.new(v71.X, v71.Y);
    for v73, v74 in v64._handles do
        if v73 ~= v64._draggingHandleId and v73 ~= v66.Opposite then
            local v75 = v70:VectorToObjectSpace(v74.Axis.LookVector);
            local v76 = Vector2.new(v75.X, v75.Y);
            local v77 = v70:PointToObjectSpace(v74.Axis.Position + v74.Axis.LookVector * 0.01);
            v75 = Vector2.new(v77.X, v77.Y).Magnitude;
            local v78 = math.abs(v76.Y * v72.X - v76.X * v72.Y);
            if math.abs(v78 - v67) < 0.001 then
                if v75 < v68 then
                    v67 = v78;
                    v68 = v75;
                    v69 = v73;
                end;
            elseif v67 < v78 then
                v67 = v78;
                v68 = v75;
                v69 = v73;
            end;
        end;
    end;
    return v69;
end;
v21._getMoveMeasurementArrowMetrics = function(v79) --[[ Line: 285 ]] --[[ Name: _getMoveMeasurementArrowMetrics ]]
    -- upvalues: v11 (copy)
    local v80 = v79._handles[v79._laggingRelativeToId];
    local v81 = v79._handles[v79._laggingHandleId];
    local v82 = v81.Axis - v79._axis * v79._lastDelta;
    local v83 = v79._draggerContext:getHandleScale(v82.Position);
    local l_LookVector_0 = v80.Axis.LookVector;
    local l_LookVector_1 = v82.LookVector;
    local l_Position_0 = v80.Axis.Position;
    local v87 = nil;
    if v79:_useBoundingBoxMoveHandles() then
        v87 = 2.5 * v83 + v81.AxisOffset;
        l_Position_0 = l_Position_0 - l_LookVector_0 * v80.AxisOffset;
    else
        v87 = (3.5 + (v81.Outset or 0)) * v83;
    end;
    local v88 = l_LookVector_1 * v87;
    local v89 = l_Position_0 + v88;
    local v90 = l_Position_0 - l_LookVector_0 * v79._lastDelta + v88;
    if v79._lastDelta < 0 then
        local l_v90_0 = v90;
        v90 = v89;
        v89 = l_v90_0;
    end;
    local v92 = v79._draggerContext:getHandleScale(v80.Axis.Position);
    local v93, v94 = v11.getHandleDimensionForScale(v92, v80.Outset);
    local v95 = l_Position_0 + l_LookVector_0 * (v93 + math.clamp(v79._draggingHandleFrac, 0.4, 1) * v94) + 0.5 * v88;
    local v96, v97 = v79._draggerContext:worldToViewportPoint(v95);
    local v98 = nil;
    if v97 then
        v98 = UDim2.fromOffset(v96.X, v96.Y);
    end;
    return table.freeze({
        from = v89, 
        to = v90, 
        direction = l_LookVector_0, 
        perpendicularDirection = l_LookVector_1, 
        scale = v83, 
        viewportPosition = v98, 
        inBounds = v97
    });
end;
v21._renderMoveMeasurementArrow = function(v99, v100) --[[ Line: 333 ]] --[[ Name: _renderMoveMeasurementArrow ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.createElement(v5, {
        AlwaysOnTop = true, 
        Color3 = v99._draggerContext:getChosenColor(), 
        Render = function(v101) --[[ Line: 337 ]] --[[ Name: Render ]]
            -- upvalues: v100 (copy), v99 (copy)
            local l_from_0 = v100.from;
            local l_to_0 = v100.to;
            v101:AddLine(l_from_0, l_to_0);
            local v104 = 0.3 * v100.scale;
            if math.abs(v99._lastDelta) > 3 * v104 then
                local v105 = v100.perpendicularDirection * v104;
                local v106 = v100.direction * v104;
                if v99._lastDelta > 0 then
                    v101:AddLine(l_from_0, l_from_0 - v106 + v105);
                    v101:AddLine(l_from_0, l_from_0 - v106 - v105);
                    return;
                else
                    v101:AddLine(l_to_0, l_to_0 + v106 + v105);
                    v101:AddLine(l_to_0, l_to_0 + v106 - v105);
                end;
            end;
        end
    });
end;
v21._renderHotkeyHelp = function(v107) --[[ Line: 356 ]] --[[ Name: _renderHotkeyHelp ]]
    -- upvalues: v8 (copy), v2 (copy), v6 (copy)
    if not v107._draggerContext:getSetting("HotkeyUsageHidden") then
        local v108 = {};
        v8.addGridSnap(v108, v107._draggerContext);
        v8.addSummonHandles(v108);
        v8.addHelp(v108);
        return v2.createElement(v6, {
            DraggerContext = v107._draggerContext, 
            HotkeyList = v108
        });
    else
        return;
    end;
end;
v21._lastTransformWasLinear = function(v109) --[[ Line: 373 ]] --[[ Name: _lastTransformWasLinear ]]
    return Vector3.new(v109._lastGlobalTransformForRender:ToOrientation()).Magnitude < 0.001;
end;
v21._renderChosenAxisGuide = function(v110, v111) --[[ Line: 379 ]] --[[ Name: _renderChosenAxisGuide ]]
    -- upvalues: v11 (copy), v2 (copy), v5 (copy)
    local v112 = v110._handles[v111];
    local v113, v114 = v11.getHandleDimensionForScale(v112.Scale, v112.Outset);
    local l_Position_1 = v112.Axis.Position;
    local l_LookVector_2 = v112.Axis.LookVector;
    return v2.createElement(v5, {
        AlwaysOnTop = false, 
        Color3 = v110._draggerContext:getGridColor(), 
        Render = function(v117) --[[ Line: 388 ]] --[[ Name: Render ]]
            -- upvalues: v113 (copy), v114 (copy), l_Position_1 (copy), l_LookVector_2 (copy)
            local v118 = v113 + v114;
            v117:AddLine(l_Position_1 + l_LookVector_2 * v118, l_Position_1 + l_LookVector_2 * 10000);
            v117:AddLine(l_Position_1 - l_LookVector_2 * 10000, l_Position_1);
        end
    });
end;
v21._renderPassiveLaggingHandle = function(v119) --[[ Line: 397 ]] --[[ Name: _renderPassiveLaggingHandle ]]
    -- upvalues: v2 (copy), v11 (copy), v3 (copy)
    local v120 = not v119:_useBoundingBoxMoveHandles();
    local v121, v122, v123 = v119:_getLaggingHandleChoice();
    return v2.createElement(v11, {
        Axis = v121, 
        AxisOffset = not v120 and v123.AxisOffset or nil, 
        Outset = v123.Outset, 
        Color = v3.makeDimmed(v123.Color), 
        Scale = v122, 
        AlwaysOnTop = true, 
        Thin = true
    });
end;
v21._renderActiveMoveMeasurement = function(v124) --[[ Line: 412 ]] --[[ Name: _renderActiveMoveMeasurement ]]
    -- upvalues: v2 (copy), v7 (copy), v9 (copy)
    if v124._laggingHandleId then
        local v125 = v124:_getMoveMeasurementArrowMetrics();
        return v2.createFragment({
            MoveMeasurementValue = v2.createElement(v7, {
                DraggerContext = v124._draggerContext, 
                Position = v125.viewportPosition, 
                Value = v9(v124._lastDelta)
            })
        });
    else
        return;
    end;
end;
v21._updateLaggingHandleChoice = function(v126, v127) --[[ Line: 427 ]] --[[ Name: _updateLaggingHandleChoice ]]
    local v128 = nil;
    local _ = nil;
    local v130 = nil;
    if v126._draggerContext:shouldShowPreciseInput() and v126:_lastTransformWasLinear() then
        if not v126._laggingHandleId then
            v126._laggingHandleId = v126:_getHandleIdClosestToCenterOfScreen(v127);
            v126._laggingRelativeToId = v127;
        end;
        v130 = v126._handles[v126._laggingHandleId];
        v128 = v126._lastGlobalTransformForRender:Inverse() * v130.Axis;
        return v128, v126._draggerContext:getHandleScale(v128.Position), v130;
    else
        v126._laggingHandleId = nil;
        return nil, nil, nil;
    end;
end;
v21._getLaggingHandleChoice = function(v131) --[[ Line: 446 ]] --[[ Name: _getLaggingHandleChoice ]]
    local v132 = v131._handles[v131._laggingHandleId];
    local v133 = CFrame.new(-v131._axis * v131._lastDelta) * v132.Axis;
    return v133, v131._draggerContext:getHandleScale(v133.Position), v132;
end;
v21._renderDraggingAxisHandles = function(v134, v135) --[[ Line: 454 ]] --[[ Name: _renderDraggingAxisHandles ]]
    -- upvalues: v2 (copy), v11 (copy)
    local v136 = {};
    local v137 = v134._handles[v135];
    v136[v135] = v2.createElement(v11, {
        Axis = v137.Axis, 
        AxisOffset = v137.AxisOffset, 
        Outset = v137.Outset, 
        Color = v137.Color, 
        Scale = v137.Scale, 
        Tail = v134._lastDelta, 
        TailScale = v134._draggerContext:getHandleScale(v137.Axis.Position - v134._axis * v134._lastDelta), 
        AlwaysOnTop = true, 
        Hovered = false
    });
    return v2.createFragment(v136);
end;
v21._renderDraggingAxis = function(v138, v139) --[[ Line: 477 ]] --[[ Name: _renderDraggingAxis ]]
    -- upvalues: v18 (copy), v2 (copy)
    assert(v18());
    v138:_updateLaggingHandleChoice(v139);
    local v140 = v138:_lastTransformWasLinear();
    return v2.createFragment({
        ChosenAxisDisplay = if v140 then v138:_renderChosenAxisGuide(v139) else nil, 
        SoftSnaps = if v138:_hasSoftSnap() then v138._softSnapper:render(true) else nil, 
        ImplementationRendered = v138._implementation:render(v138._lastGlobalTransformForRender), 
        HotkeyHelp = v138:_renderHotkeyHelp(), 
        MoveMeasurement = if v140 then v138:_renderActiveMoveMeasurement() else nil, 
        Handles = v138:_renderDraggingAxisHandles(v139)
    });
end;
v21._renderHoveringHandles = function(v141, v142) --[[ Line: 495 ]] --[[ Name: _renderHoveringHandles ]]
    -- upvalues: v3 (copy), v2 (copy), v11 (copy)
    local v143 = {};
    local v144 = not v141:_useBoundingBoxMoveHandles();
    for v145, v146 in v141._handles do
        local l_Color_0 = v146.Color;
        local v148 = v145 == v142;
        if not v148 then
            l_Color_0 = v3.makeDimmed(l_Color_0);
        end;
        v143[v145] = v2.createElement(v11, {
            Axis = v146.Axis, 
            AxisOffset = if v144 then v146.AxisOffset else nil, 
            Outset = v146.Outset, 
            Color = l_Color_0, 
            Scale = v146.Scale, 
            AlwaysOnTop = true, 
            Hovered = v148
        });
    end;
    return v2.createFragment(v143);
end;
v21._renderMeasurementInputBox = function(v149, v150) --[[ Line: 518 ]] --[[ Name: _renderMeasurementInputBox ]]
    -- upvalues: v2 (copy), v7 (copy), v9 (copy)
    return v2.createElement(v7, {
        DraggerContext = v149._draggerContext, 
        Position = v150.viewportPosition, 
        Value = v9(v149._lastDelta), 
        OnChanged = function(v151) --[[ Line: 523 ]] --[[ Name: OnChanged ]]
            -- upvalues: v149 (copy)
            local v152 = tonumber(v151);
            if v152 then
                v149:_doMeasuredMove(v152);
                return true;
            else
                return false;
            end;
        end, 
        OnHidden = function() --[[ Line: 532 ]] --[[ Name: OnHidden ]]
            -- upvalues: v149 (copy)
            v149._laggingHandleId = nil;
        end
    });
end;
v21._renderPassiveMoveMeasurement = function(v153) --[[ Line: 541 ]] --[[ Name: _renderPassiveMoveMeasurement ]]
    -- upvalues: v2 (copy)
    if v153._laggingHandleId then
        local v154 = v153:_getMoveMeasurementArrowMetrics();
        return v2.createFragment({
            ValueInput = v153:_renderMeasurementInputBox(v154)
        });
    else
        return;
    end;
end;
v21._renderHovering = function(v155, v156) --[[ Line: 551 ]] --[[ Name: _renderHovering ]]
    -- upvalues: v2 (copy)
    return v2.createFragment({
        MoveMeasurement = v155:_renderPassiveMoveMeasurement(), 
        Handles = v155:_renderHoveringHandles(v156)
    });
end;
v21._renderBoundingBox = function(v157) --[[ Line: 559 ]] --[[ Name: _renderBoundingBox ]]
    -- upvalues: v2 (copy), v4 (copy)
    if v157._props.ShowBoundingBox and #v157._selectionWrapper:get() > 1 then
        return v2.createElement(v4, {
            CFrame = v157._boundingBox.CFrame, 
            Size = v157._boundingBox.Size, 
            Color = v157._draggerContext:getSelectionBoxColor(), 
            LineThickness = v157._draggerContext:getHoverThickness(), 
            Container = v157._draggerContext:getGuiParent()
        });
    else
        return;
    end;
end;
v21._renderSummon = function(v158) --[[ Line: 572 ]] --[[ Name: _renderSummon ]]
    -- upvalues: v2 (copy), v15 (copy), v13 (copy), v12 (copy)
    if not v158:_useBoundingBoxMoveHandles() and v158._props.Summonable then
        local v159 = {};
        if v158._summonOffsetInBasis then
            v159.SummonSnap = v2.createElement(v15, {
                DraggerContext = v158._draggerContext, 
                CFrame = v158._boundingBox.CFrame * v158:_getBasisOffset(), 
                Dragging = v158._draggingHandleId ~= nil, 
                Hovered = false
            });
        end;
        if not v158._draggingHandleId then
            if v158._summonOffsetInBasis then
                v159.SummonHandlesHider = v2.createElement(v13, {
                    DraggerContext = v158._draggerContext
                });
            elseif not v13.hasSeenEnough(v158._draggerContext) then
                local l_Position_2 = (v158._boundingBox.CFrame * v158._basisOffset).Position;
                local v161, v162 = v158._draggerContext:worldToViewportPoint(l_Position_2);
                if v161.Z > 0 then
                    v159.SummonHandlesNote = v2.createElement(v12, {
                        Position = Vector2.new(v161.X, v161.Y), 
                        InView = v162, 
                        DraggerContext = v158._draggerContext
                    });
                end;
            end;
        end;
        return v2.createFragment(v159);
    else
        return;
    end;
end;
v21._renderHoverOrDrag = function(v163, v164) --[[ Line: 607 ]] --[[ Name: _renderHoverOrDrag ]]
    if v163._draggingHandleId and v163._handles[v163._draggingHandleId] then
        return v163:_renderDraggingAxis(v163._draggingHandleId);
    else
        return v163:_renderHovering(v164);
    end;
end;
v21.renderNEW = function(v165, v166) --[[ Line: 617 ]] --[[ Name: renderNEW ]]
    -- upvalues: v2 (copy), v20 (copy)
    return v2.createElement(v20 and "Folder" or "Frame", {}, {
        Handles = v165:_renderHoverOrDrag(v166), 
        BoundingBox = v165:_renderBoundingBox(), 
        Summon = v165:_renderSummon()
    });
end;
v21.render = function(v167, v168) --[[ Line: 625 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v2 (copy), v11 (copy), v3 (copy), v4 (copy), v14 (copy), v13 (copy), v12 (copy)
    if v18() then
        return v167:renderNEW(v168);
    else
        local v169 = {};
        local v170 = not v167:_useBoundingBoxMoveHandles();
        if v167._draggingHandleId and v167._handles[v167._draggingHandleId] then
            local v171 = v167._handles[v167._draggingHandleId];
            v169[v167._draggingHandleId] = v2.createElement(v11, {
                Axis = v171.Axis, 
                AxisOffset = not v170 and v171.AxisOffset or nil, 
                Outset = v171.Outset, 
                Color = v171.Color, 
                Scale = v171.Scale, 
                AlwaysOnTop = true, 
                Hovered = false
            });
            for v172, v173 in pairs(v167._handles) do
                if v172 ~= v167._draggingHandleId then
                    v169[v172] = v2.createElement(v11, {
                        Axis = v173.Axis, 
                        AxisOffset = not v170 and v173.AxisOffset or nil, 
                        Outset = v173.Outset, 
                        Color = v3.makeDimmed(v173.Color), 
                        Scale = v173.Scale, 
                        AlwaysOnTop = true, 
                        Thin = true
                    });
                end;
            end;
            v169.ImplementationRendered = v167._implementation:render(v167._lastGlobalTransformForRender);
        else
            for v174, v175 in pairs(v167._handles) do
                local l_Color_1 = v175.Color;
                local v177 = v174 == v168;
                if not v177 then
                    l_Color_1 = v3.makeDimmed(l_Color_1);
                end;
                v169[v174] = v2.createElement(v11, {
                    Axis = v175.Axis, 
                    AxisOffset = not v170 and v175.AxisOffset or nil, 
                    Outset = v175.Outset, 
                    Color = l_Color_1, 
                    Scale = v175.Scale, 
                    AlwaysOnTop = true, 
                    Hovered = v177
                });
            end;
        end;
        if v167._props.ShowBoundingBox and #v167._selectionWrapper:get() > 1 then
            v169.SelectionBoundingBox = v2.createElement(v4, {
                CFrame = v167._boundingBox.CFrame, 
                Size = v167._boundingBox.Size, 
                Color = v167._draggerContext:getSelectionBoxColor(), 
                LineThickness = v167._draggerContext:getHoverThickness(), 
                Container = v167._draggerContext:getGuiParent()
            });
        end;
        if v170 and v167._props.Summonable then
            if v167._summonBasisOffset then
                v169.SummonedPivot = v2.createElement(v14, {
                    DraggerContext = v167._draggerContext, 
                    CFrame = v167._boundingBox.CFrame * v167:_getBasisOffset(), 
                    IsActive = v167._draggerContext:shouldShowActiveInstanceHighlight() and #v167._selectionWrapper:get() == 1
                });
            end;
            if not v167._draggingHandleId then
                if v167._summonBasisOffset then
                    v169.SummonHandlesHider = v2.createElement(v13, {
                        DraggerContext = v167._draggerContext
                    });
                elseif not v13.hasSeenEnough(v167._draggerContext) then
                    local l_Position_3 = (v167._boundingBox.CFrame * v167._basisOffset).Position;
                    local v179, v180 = v167._draggerContext:worldToViewportPoint(l_Position_3);
                    if v179.Z > 0 then
                        v169.SummonHandlesNote = v2.createElement(v12, {
                            Position = Vector2.new(v179.X, v179.Y), 
                            InView = v180, 
                            DraggerContext = v167._draggerContext
                        });
                    end;
                end;
            end;
        end;
        return v2.createElement("Folder", {}, v169);
    end;
end;
v21.selectionChanged = function(v181) --[[ Line: 722 ]] --[[ Name: selectionChanged ]]
    v181._laggingHandleId = nil;
end;
v21._needsSoftSnaps = function(v182) --[[ Line: 729 ]] --[[ Name: _needsSoftSnaps ]]
    local v183 = false;
    if v182._draggerContext:getMaxSoftSnaps() > 0 then
        v183 = v182._draggerContext:getSoftSnapMarginFactor() > 0;
    end;
    return v183;
end;
v21.mouseDown = function(v184, v185, v186) --[[ Line: 735 ]] --[[ Name: mouseDown ]]
    -- upvalues: v11 (copy), v19 (copy), v18 (copy)
    v184._laggingHandleId = nil;
    v184._draggingHandleId = v186;
    v184._draggingOriginalBoundingBoxCFrame = v184._boundingBox.CFrame;
    if v184._handles[v186] then
        v184:_setupMoveAtCurrentBoundingBox(v185);
        local v187 = v184._handles[v186];
        if not v184:_useBoundingBoxMoveHandles() then
            local v188, v189 = v11.getHandleDimensionForScale(v187.Scale, v184._props.Outset);
            v184._draggingHandleFrac = (v184._startDistance - v188) / v189;
        else
            local v190, v191 = v11.getHandleDimensionForScale(v187.Scale);
            local l_AxisOffset_0 = v187.AxisOffset;
            v184._draggingHandleFrac = (v184._startDistance - v190 - l_AxisOffset_0) / v191;
        end;
        if v19() then
            local l__draggingOriginalBoundingBoxCFrame_0 = v184._draggingOriginalBoundingBoxCFrame;
            v184._dragStartPosition = l__draggingOriginalBoundingBoxCFrame_0.Position + l__draggingOriginalBoundingBoxCFrame_0.Rotation:VectorToWorldSpace(v184:_getBasisOffset().Position);
            v184._startDragHandlePosition = v187.Axis.Position;
            v184._startDragHandleScale = v187.Scale;
            v184._dragDirection = v184._axis;
        end;
    end;
    if v18() then
        v184._lastGlobalTransformForRender = CFrame.new();
    end;
    v184._implementation:beginDrag(v184._selectionWrapper:get(), v184._selectionInfo);
    if v18() then
        if v184._implementation.getSoftSnaps and v184:_needsSoftSnaps() then
            v184._softSnapper:setSnaps(v184._implementation:getSoftSnaps(v184._axis, v184._summonOffsetInBasis));
            return;
        else
            v184._softSnapper:clearSnaps();
        end;
    end;
end;
v21._setupMoveAtCurrentBoundingBox = function(v194, v195) --[[ Line: 782 ]] --[[ Name: _setupMoveAtCurrentBoundingBox ]]
    -- upvalues: v22 (copy), v18 (copy)
    local l_Offset_0 = v22[v194._draggingHandleId].Offset;
    local _ = nil;
    v194._axis = if v18() then (v194._boundingBox.CFrame * v194:_getBasisOffset() * l_Offset_0).LookVector else (v194._boundingBox.CFrame * l_Offset_0).LookVector;
    local v198, v199 = v194:_getDistanceAlongAxis(v195);
    v194._startDistance = v198 and v199 or 0;
    if v18() then
        v194._lastDelta = 0;
        return;
    else
        v194._lastGlobalTransformForRender = CFrame.new();
        return;
    end;
end;
v21._setMidMoveBoundingBox = function(v200, v201) --[[ Line: 802 ]] --[[ Name: _setMidMoveBoundingBox ]]
    v200._boundingBox.CFrame = v201;
end;
v21._getDistanceAlongAxis = function(v202, v203) --[[ Line: 809 ]] --[[ Name: _getDistanceAlongAxis ]]
    -- upvalues: v16 (copy)
    local l__draggingOriginalBoundingBoxCFrame_1 = v202._draggingOriginalBoundingBoxCFrame;
    if not v202:_useBoundingBoxMoveHandles() then
        l__draggingOriginalBoundingBoxCFrame_1 = l__draggingOriginalBoundingBoxCFrame_1 * v202:_getBasisOffset();
    end;
    local l_Position_4 = l__draggingOriginalBoundingBoxCFrame_1.Position;
    local l_Unit_0 = v202._axis.Unit;
    return v16(l_Position_4, l_Unit_0, v203);
end;
v21._solveForAdjustedDistance = function(v207, v208) --[[ Line: 833 ]] --[[ Name: _solveForAdjustedDistance ]]
    -- upvalues: v19 (copy), v18 (copy), v22 (copy), v11 (copy)
    assert(not (v19() and v18()));
    local v209 = not v207:_useBoundingBoxMoveHandles();
    local v210 = nil;
    local v211 = nil;
    if v209 then
        v211 = v207._handles[v207._draggingHandleId].OffsetInHandleSpace;
    else
        v210 = v207._handles[v207._draggingHandleId].AxisOffset;
    end;
    local l_Offset_1 = v22[v207._draggingHandleId].Offset;
    local function v216(v213) --[[ Line: 847 ]] --[[ Name: getScaleForDistance ]]
        -- upvalues: v207 (copy), v209 (copy), l_Offset_1 (copy), v211 (ref), v210 (ref)
        local v214 = v207._draggingOriginalBoundingBoxCFrame + v207._axis * (v213 - v207._startDistance);
        local v215 = nil;
        v215 = if v209 then v214 * v207:_getBasisOffset() * l_Offset_1 else v209 and v214 * l_Offset_1 * v211 or v214 * l_Offset_1 * CFrame.new(0, 0, -v210);
        return v207._draggerContext:getHandleScale(v215.Position);
    end;
    local function v224(v217) --[[ Line: 861 ]] --[[ Name: getHandleFracForDistance ]]
        -- upvalues: v216 (copy), v209 (copy), v11 (ref), v207 (copy), v208 (copy), v210 (ref)
        local v218 = v216(v217);
        if v209 then
            local v219, v220 = v11.getHandleDimensionForScale(v218, v207._props.Outset);
            local v221 = v217 - v207._startDistance + v219;
            return (v208 - v221) / v220;
        else
            local v222, v223 = v11.getHandleDimensionForScale(v218);
            return (v208 - v217 + v207._startDistance - v222 - v210) / v223;
        end;
    end;
    local _ = function(v225) --[[ Line: 877 ]] --[[ Name: getHandleLengthForDistance ]]
        -- upvalues: v209 (copy), v11 (ref), v216 (copy), v207 (copy)
        local v226 = nil;
        local _ = nil;
        if v209 then
            local v228, v229 = v11.getHandleDimensionForScale(v216(v225), v207._props.Outset);
            v226 = v228;
            return v229;
        else
            local v230, v231 = v11.getHandleDimensionForScale(v216(v225));
            v226 = v230;
            return v231;
        end;
    end;
    local v233 = nil;
    local v234 = nil;
    if v209 then
        local v235, v236 = v11.getHandleDimensionForScale(v216(0), v207._props.Outset);
        v233 = v235;
        v234 = v236;
    else
        local v237, v238 = v11.getHandleDimensionForScale(v216(0));
        v233 = v237;
        v234 = v238;
    end;
    local l_v234_0 = v234;
    v234 = nil;
    local v240 = nil;
    if v209 then
        local v241, v242 = v11.getHandleDimensionForScale(v216(v208), v207._props.Outset);
        v234 = v241;
        v240 = v242;
    else
        local v243, v244 = v11.getHandleDimensionForScale(v216(v208));
        v234 = v243;
        v240 = v244;
    end;
    v234 = math.max(l_v234_0, v240);
    v240 = v208 - v234;
    local v245 = v208 + v234;
    local v246 = v224(v240);
    local v247 = v224(v245);
    while math.abs(v240 - v245) > 1.0E-4 do
        local v248 = 0.5 * (v240 + v245);
        local v249 = v224(v248);
        if (v207._draggingHandleFrac - v249) * (v247 - v246) > 0 then
            v240 = v248;
            v246 = v249;
        else
            v245 = v248;
            v247 = v249;
        end;
    end;
    return v240;
end;
v21._getSnappedDelta = function(v250, v251) --[[ Line: 920 ]] --[[ Name: _getSnappedDelta ]]
    local v252 = nil;
    if v250._implementation.getSnapPoints then
        v252 = v250._implementation:getSnapPoints();
    end;
    if v252 then
        local l_Position_5 = (v250._draggingOriginalBoundingBoxCFrame * v250._basisOffset).Position;
        local l__axis_0 = v250._axis;
        local v255 = -1e999;
        local v256 = 1e999;
        local v257 = 1e999;
        local v258 = 1e999;
        for _, v260 in ipairs(v252) do
            local v261 = (v260.Position - l_Position_5):Dot(l__axis_0);
            v255 = math.max(v255, v261);
            v256 = math.min(v256, v261);
            local v262 = math.abs(v261 - v251);
            if v262 < v257 then
                v257 = v262;
                v258 = v261;
            end;
        end;
        if v255 < v251 or v251 < v256 then
            local v263 = v250._draggerContext:snapToGridSize(v251);
            if v257 < math.abs(v263 - v251) then
                return v258;
            else
                return v263;
            end;
        else
            return v258;
        end;
    else
        return v250._draggerContext:snapToGridSize(v251);
    end;
end;
v21._mouseDragAxis = function(v264, v265) --[[ Line: 966 ]] --[[ Name: _mouseDragAxis ]]
    -- upvalues: v19 (copy), v17 (copy), v18 (copy)
    local v266, v267 = v264:_getDistanceAlongAxis(v265);
    if not v266 then
        return;
    else
        local v268 = v264._draggerContext:shouldGridSnap();
        local v269 = nil;
        v269 = if v19() then v17(v264._draggerContext:getCamera(), v264._dragStartPosition, v264._dragDirection, v264._startDragHandlePosition, v264._startDragHandleScale, v264._startDistance, v267) - (v264._startDragHandlePosition - v264._dragStartPosition).Magnitude else v264:_solveForAdjustedDistance(v267) - v264._startDistance;
        local v270 = nil;
        v270 = if not v264:_useBoundingBoxMoveHandles() then v264:_getSnappedDelta(v269) else v264._draggerContext:snapToGridSize(v269);
        if v264:_hasSoftSnap() then
            local v271 = if v268 then math.abs(v269 - v270) else nil;
            local v272 = v264._softSnapper:updateCurrentSnap(v269, v271);
            if v272 then
                v270 = v272;
            end;
        end;
        local v273 = v264._implementation:updateDrag(CFrame.new(v264._axis * v270));
        assert(v273 ~= nil, "Did not return a transform from updateDrag.");
        if v18() then
            if v264:_lastTransformWasLinear() then
                v264._lastDelta = math.sign(v270) * v273.Position.Magnitude;
                return v273;
            else
                v264._lastDelta = 0;
                return v273;
            end;
        else
            v264._lastDelta = math.sign(v270) * v273.Position.Magnitude;
            return v273;
        end;
    end;
end;
if v18() then
    v21.mouseDrag = function(v274, v275) --[[ Line: 1025 ]] --[[ Name: mouseDrag ]]
        local v276 = nil;
        if v274._handles[v274._draggingHandleId] then
            v276 = v274:_mouseDragAxis(v275);
        end;
        if v276 then
            v274:_setMidMoveBoundingBox(v276 * v274._draggingOriginalBoundingBoxCFrame);
            v274._lastGlobalTransformForRender = v276;
        end;
    end;
else
    v21.mouseDrag = function(v277, v278) --[[ Line: 1039 ]] --[[ Name: mouseDrag ]]
        local v279, v280 = v277:_getDistanceAlongAxis(v278);
        if not v279 then
            return;
        elseif not v277._handles[v277._draggingHandleId] then
            return;
        else
            local v281 = v277:_solveForAdjustedDistance(v280) - v277._startDistance;
            local v282 = nil;
            v282 = if not v277:_useBoundingBoxMoveHandles() then v277:_getSnappedDelta(v281) else v277._draggerContext:snapToGridSize(v281);
            local v283 = v277._implementation:updateDrag(CFrame.new(v277._axis * v282));
            assert(v283 ~= nil, "Did not return a transform from updateDrag.");
            v277:_setMidMoveBoundingBox(v283 * v277._draggingOriginalBoundingBoxCFrame);
            v277._lastGlobalTransformForRender = v283;
            return;
        end;
    end;
end;
v21.mouseUp = function(v284, _) --[[ Line: 1068 ]] --[[ Name: mouseUp ]]
    -- upvalues: v18 (copy)
    v284._draggingHandleId = nil;
    local v286 = v284._implementation:endDrag();
    v284._schema.addUndoWaypoint(v284._draggerContext, "Axis Move Selection");
    if not v18() and not v284._tabKeyDown then
        v284:_endSummon();
    end;
    return v286;
end;
v21._updateHandles = function(v287) --[[ Line: 1079 ]] --[[ Name: _updateHandles ]]
    -- upvalues: v22 (copy)
    if v287._selectionInfo:isEmpty() then
        v287._handles = {};
        return;
    else
        for v288, v289 in pairs(v22) do
            if not v287:_useBoundingBoxMoveHandles() then
                local v290 = v287._boundingBox.CFrame * v287:_getBasisOffset() * v289.Offset;
                v287._handles[v288] = {
                    Outset = v287._props.Outset, 
                    Axis = v290, 
                    Color = v289.Color, 
                    Scale = v287._draggerContext:getHandleScale(v290.Position), 
                    AlwaysOnTop = true, 
                    Opposite = v289.Opposite
                };
            else
                local v291 = 0.5 * math.abs(v289.Offset:Inverse():VectorToWorldSpace(v287._boundingBox.Size).Z);
                local v292 = v287._boundingBox.CFrame * v289.Offset * CFrame.new(0, 0, -v291);
                v287._handles[v288] = {
                    AxisOffset = v291, 
                    Axis = v292, 
                    Color = v289.Color, 
                    Scale = v287._draggerContext:getHandleScale(v292.Position), 
                    AlwaysOnTop = true, 
                    Opposite = v289.Opposite
                };
            end;
        end;
        return;
    end;
end;
local v293 = table.freeze({
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true
});
local v294 = table.freeze({
    [Enum.KeyCode.KeypadSeven] = "PlusY", 
    [Enum.KeyCode.KeypadOne] = "MinusY", 
    [Enum.KeyCode.KeypadFour] = "PlusX", 
    [Enum.KeyCode.KeypadSix] = "MinusX", 
    [Enum.KeyCode.KeypadEight] = "PlusZ", 
    [Enum.KeyCode.KeypadTwo] = "MinusZ"
});
v21.keyDown = function(v295, v296) --[[ Line: 1132 ]] --[[ Name: keyDown ]]
    -- upvalues: v18 (copy), v293 (copy), v294 (copy)
    if not v18() and v296 == Enum.KeyCode.Tab then
        v295._tabKeyDown = true;
        if not v295._draggingHandleId then
            v295:_summonHandles();
            return true;
        end;
    elseif v18() then
        if v293[v296] then
            if v295._draggingHandleId then
                v295:mouseDrag(v295._draggerContext:getMouseRay());
                return true;
            end;
        elseif v296 == Enum.KeyCode.H then
            v295._draggerContext:setSetting("HotkeyUsageHidden", not v295._draggerContext:getSetting("HotkeyUsageHidden"));
            return true;
        elseif v294[v296] then
            v295:_doBump(v294[v296]);
            return true;
        end;
    end;
    return false;
end;
v21.keyUp = function(v297, v298) --[[ Line: 1159 ]] --[[ Name: keyUp ]]
    -- upvalues: v18 (copy), v293 (copy)
    if not v18() and v298 == Enum.KeyCode.Tab then
        v297._tabKeyDown = false;
        if not v297._draggingHandleId then
            v297:_endSummon();
        end;
        return true;
    elseif v18() and v293[v298] then
        if v297._draggingHandleId then
            v297:mouseDrag(v297._draggerContext:getMouseRay());
        end;
        return true;
    else
        return false;
    end;
end;
v21.getPriority = function(v299) --[[ Line: 1175 ]] --[[ Name: getPriority ]]
    if v299._implementation.getPriority then
        return v299._implementation.getPriority();
    else
        return 0;
    end;
end;
return v21;