local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Utility.Colors);
local v4 = require(l_Parent_0.Utility.Math);
local v5 = require(l_Parent_0.Components.StandaloneSelectionBox);
local v6 = require(l_Parent_0.Components.ScaleHandleView);
local v7 = require(l_Parent_0.Components.DraggedPivot);
local v8 = require(l_Parent_0.Components.SummonedPivot);
local v9 = require(l_Parent_0.Components.HotkeyUsageInfo);
local v10 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v11 = require(l_Parent_0.Utility.HotkeyHelpBuilder);
local v12 = require(l_Parent_0.Components.FloatingValueInput);
local v13 = require(l_Parent_0.Utility.conciseNumberFormat);
local v14 = require(l_Parent_0.Utility.SoftSnapper);
local v15 = require(l_Parent_0.Utility.computeHandlePositionDistance);
local v16 = require(l_Parent_0.Utility.computeDraggedDistance);
local v17 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v18 = require(l_Parent_0.Flags.getFFlagDraggerLockedSummon);
local v19 = require(l_Parent_0.Flags.getFFlagDraggerHandleTracking);
local v20 = require(l_Parent_0.Flags.getFFlagDraggerFinalShortcuts);
local _ = game:DefineFastFlag("DraggerScaleShowOtherHandles", false);
local v22 = {};
v22.__index = v22;
local v23 = table.freeze({
    X_AXIS = 1, 
    Y_AXIS = 2, 
    Z_AXIS = 3
});
local v24 = table.freeze({
    MinusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, 1, 0))), 
        Color = v3.X_AXIS, 
        NormalId = v23.X_AXIS
    }, 
    PlusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, -1, 0))), 
        Color = v3.X_AXIS, 
        NormalId = v23.X_AXIS
    }, 
    MinusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), (Vector3.new(1, 0, 0, 0))), 
        Color = v3.Y_AXIS, 
        NormalId = v23.Y_AXIS
    }, 
    PlusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), (Vector3.new(-1, 0, 0, 0))), 
        Color = v3.Y_AXIS, 
        NormalId = v23.Y_AXIS
    }, 
    MinusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        Color = v3.Z_AXIS, 
        NormalId = v23.Z_AXIS
    }, 
    PlusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), (Vector3.new(0, -1, 0, 0))), 
        Color = v3.Z_AXIS, 
        NormalId = v23.Z_AXIS
    }
});
local v25 = table.freeze({
    Vector3.new(0.5, 0.5, 0.5, 0), 
    Vector3.new(0.5, 0.5, -0.5, 0), 
    Vector3.new(0.5, -0.5, 0.5, 0), 
    Vector3.new(0.5, -0.5, -0.5, 0), 
    Vector3.new(-0.5, 0.5, 0.5, 0), 
    Vector3.new(-0.5, 0.5, -0.5, 0), 
    Vector3.new(-0.5, -0.5, 0.5, 0), 
    (Vector3.new(-0.5, -0.5, -0.5, 0))
});
v22.new = function(v26, v27, v28) --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), v14 (copy), v22 (copy)
    local v29 = {
        _handles = {}, 
        _props = v27 or {}, 
        _draggerContext = v26, 
        _implementation = v28
    };
    if v17() then
        v29._softSnapper = v14.new(v26);
    end;
    return (setmetatable(v29, v22));
end;
v22._hasSoftSnap = function(v30) --[[ Line: 105 ]] --[[ Name: _hasSoftSnap ]]
    return v30._draggerContext:shouldPartSnap();
end;
v22._summonHandles = function(v31) --[[ Line: 110 ]] --[[ Name: _summonHandles ]]
    -- upvalues: v17 (copy), v25 (copy)
    assert(not v17(), "Wrong flag branching");
    if not v31._props.Summonable then
        return false;
    else
        local v32 = v31._draggerContext:getMouseRay();
        local _, v34, v35 = v31._schema.getMouseTarget(v31._draggerContext, v32, {});
        if v34 and v31._selectionInfo:doesContainItem(v34) then
            local v36 = v32.Origin + v32.Direction.Unit * v35;
            local v37 = v31._boundingBox.CFrame:PointToObjectSpace(v36);
            local v38 = v31._boundingBox.Size / 2;
            v31._summonBasisOffset = CFrame.new(v37:Max(-v38):Min(v38));
            return;
        else
            local v39 = v31._draggerContext:getMouseLocation();
            local v40 = nil;
            local v41 = 1e999;
            for _, v43 in ipairs(v25) do
                local v44 = v31._boundingBox.CFrame * CFrame.new(v31._boundingBox.Size * v43);
                local v45, v46 = v31._draggerContext:worldToViewportPoint(v44.Position);
                local l_Magnitude_0 = (v39 - Vector2.new(v45.X, v45.Y)).Magnitude;
                if v46 and l_Magnitude_0 < v41 then
                    v41 = l_Magnitude_0;
                    v40 = v44;
                end;
            end;
            if v40 then
                v31._summonBasisOffset = v31._boundingBox.CFrame:ToObjectSpace(v40);
            end;
            return;
        end;
    end;
end;
v22._endSummon = function(v48) --[[ Line: 144 ]] --[[ Name: _endSummon ]]
    -- upvalues: v17 (copy)
    assert(not v17(), "Wrong flag branching");
    if v48._summonBasisOffset then
        v48._summonBasisOffset = nil;
    end;
end;
v22.beginSummon = function(v49, v50) --[[ Line: 153 ]] --[[ Name: beginSummon ]]
    -- upvalues: v18 (copy)
    local v51 = v49._selectionInfo:getBoundingBox() * v50;
    if v18() then
        local v52 = v49._boundingBox.CFrame:ToObjectSpace(v51);
        local v53 = v49._boundingBox.Size / 2;
        local v54 = v52.Position:Max(-v53):Min(v53);
        v49._summonBasisOffset = v52.Rotation + v54;
        return;
    else
        v49._summonBasisOffset = v49._boundingBox.CFrame:ToObjectSpace(v51);
        return;
    end;
end;
v22.endSummon = function(v55) --[[ Line: 166 ]] --[[ Name: endSummon ]]
    v55._summonBasisOffset = nil;
end;
v22._getBasisOffset = function(v56) --[[ Line: 170 ]] --[[ Name: _getBasisOffset ]]
    return v56._summonBasisOffset or v56._basisOffset;
end;
v22.update = function(v57, v58, v59) --[[ Line: 174 ]] --[[ Name: update ]]
    if not v57._draggingHandleId then
        v57._selectionInfo = v59;
        v57._draggerToolModel = v58;
        v57._schema = v58:getSchema();
        v57._selectionWrapper = v58:getSelectionWrapper();
        local v60, v61, v62 = v57._implementation:getBoundingBox(v57._selectionWrapper:get(), v57._selectionInfo);
        v57._basisOffset = CFrame.new(-v61);
        v57._boundingBox = {
            Size = v62, 
            CFrame = v60 * CFrame.new(v61)
        };
    end;
    v57:_updateHandles();
end;
v22.shouldBiasTowardsObjects = function(_) --[[ Line: 197 ]] --[[ Name: shouldBiasTowardsObjects ]]
    return true;
end;
v22._rememberCurrentBoundsAsOriginal = function(v64) --[[ Line: 201 ]] --[[ Name: _rememberCurrentBoundsAsOriginal ]]
    v64._originalBoundingBoxSize = v64._boundingBox.Size;
    v64._originalBoundingBoxCFrame = v64._boundingBox.CFrame;
    v64._originalBasisOffset = v64:_getBasisOffset().Position;
    local l_Axis_0 = v64._handles[v64._draggingHandleId].Axis;
    local l__originalBasisOffset_0 = v64._originalBasisOffset;
    v64._perpendicularMovement = l__originalBasisOffset_0 - l_Axis_0 * l__originalBasisOffset_0:Dot(l_Axis_0);
end;
v22._refreshDrag = function(v67) --[[ Line: 213 ]] --[[ Name: _refreshDrag ]]
    v67._committedDeltaSize = v67._lastDeltaSize;
    v67._committedOffset = v67._lastOffset;
    v67:_rememberCurrentBoundsAsOriginal();
    local v68, v69 = v67:_getDistanceAlongAxis(v67._draggerContext:getMouseRay(), true);
    v67._startDistance = v68 and v69 or 0;
end;
local function _(v70, v71) --[[ Line: 227 ]] --[[ Name: areAxesSame ]]
    if v70 == v71 then
        return true;
    elseif not v70 or not v71 or v70.X ~= v71.X or v70.Y ~= v71.Y or v70.Z ~= v71.Z then
        return false;
    else
        return true;
    end;
end;
v22._updateExtrudeMode = function(v73) --[[ Line: 246 ]] --[[ Name: _updateExtrudeMode ]]
    local v74 = v73._selectionWrapper:get();
    local l__selectionInfo_0 = v73._selectionInfo;
    local l__normalId_0 = v73._normalId;
    local v77 = v73._implementation:shouldScaleFromCenter(v74, l__selectionInfo_0, l__normalId_0);
    local v78 = v73._implementation:axesToScale(l__selectionInfo_0, l__normalId_0);
    local v79, v80 = v73._implementation:getMinMaxSizes(l__selectionInfo_0, v78, v73._boundingBox.Size);
    v73._minimumSize = v79;
    v73._maximumSize = v80;
    local l__lastAxesToScale_0 = v73._lastAxesToScale;
    v79 = not (v78 == l__lastAxesToScale_0 or if v78 and l__lastAxesToScale_0 then v78.X == l__lastAxesToScale_0.X and v78.Y == l__lastAxesToScale_0.Y and v78.Z == l__lastAxesToScale_0.Z else false);
    v80 = v77 ~= v73._lastResizeFromCenter;
    v73._lastAxesToScale = v78;
    v73._lastResizeFromCenter = v77;
    return v79 or v80;
end;
v22._refreshDragIfNeeded = function(v82) --[[ Line: 262 ]] --[[ Name: _refreshDragIfNeeded ]]
    local v83 = v82:_updateExtrudeMode();
    if v83 and v82._handles[v82._draggingHandleId] then
        v82:_refreshDrag();
    end;
    return v83;
end;
v22.hitTest = function(v84, v85, v86) --[[ Line: 270 ]] --[[ Name: hitTest ]]
    -- upvalues: v6 (copy)
    local v87 = nil;
    local v88 = 1e999;
    for v89, v90 in pairs(v84._handles) do
        local v91 = v6.hitTest(v90, v85);
        if v91 and v91 < v88 then
            v88 = v91;
            v87 = v89;
        end;
    end;
    if v87 then
        return v87, 0;
    elseif v86 then
        return nil, 0;
    else
        for v92, v93 in pairs(v84._handles) do
            local v94 = v6.distanceFromHandle(v93, v85);
            if v94 < v88 then
                v88 = v94;
                v87 = v92;
            end;
        end;
        if v88 < 0 then
            return v87, 0;
        else
            return nil, 0;
        end;
    end;
end;
v22._getBoundingBoxColor = function(v95) --[[ Line: 306 ]] --[[ Name: _getBoundingBoxColor ]]
    -- upvalues: v3 (copy)
    if v95._scalingLimitReachedUpper or v95._scalingLimitReachedLower or v95._resizeWasConstrained then
        return v3.SizeLimitReached;
    else
        return v95._draggerContext:getSelectionBoxColor();
    end;
end;
v22._getBoundingBoxThickness = function(v96) --[[ Line: 313 ]] --[[ Name: _getBoundingBoxThickness ]]
    return v96._draggerContext:getHoverThickness();
end;
v22._shouldDrawBoundingBox = function(v97) --[[ Line: 317 ]] --[[ Name: _shouldDrawBoundingBox ]]
    return v97._scalingLimitReachedLower or v97._scalingLimitReachedUpper or v97._resizeWasConstrained or v97._props.ShowBoundingBox and #v97._selectionWrapper:get() > 1;
end;
local v98 = {
    Hotkey = v20() and "\226\172\135Alt" or "\226\172\135Shift", 
    LabelLocEntry = "ScaleUniformly"
};
local v99 = {
    Hotkey = v20() and "\226\172\134Alt" or "\226\172\134Shift", 
    LabelLocEntry = "ScaleResize"
};
local v100 = {
    Hotkey = "\226\172\135Ctrl", 
    LabelLocEntry = "ScaleAroundPivot"
};
local v101 = {
    Hotkey = "\226\172\134Ctrl", 
    LabelLocEntry = "ScaleFromEdge"
};
v22._renderHotkeyHelp = function(v102) --[[ Line: 343 ]] --[[ Name: _renderHotkeyHelp ]]
    -- upvalues: v11 (copy), v101 (copy), v100 (copy), v20 (copy), v99 (copy), v98 (copy), v2 (copy), v9 (copy)
    if not v102._draggerContext:getSetting("HotkeyUsageHidden") then
        local v103 = {};
        v11.addGridSnap(v103, v102._draggerContext);
        if v102._draggerContext:isCtrlKeyDown() then
            table.insert(v103, v101);
        else
            table.insert(v103, v100);
        end;
        if if v20() then v102._draggerContext:isAltKeyDown() else v102._draggerContext:isShiftKeyDown() then
            table.insert(v103, v99);
        else
            table.insert(v103, v98);
        end;
        v11.addSummonHandles(v103);
        v11.addHelp(v103);
        return v2.createElement(v9, {
            DraggerContext = v102._draggerContext, 
            HotkeyList = v103
        });
    else
        return;
    end;
end;
v22._renderSoftSnaps = function(v104) --[[ Line: 371 ]] --[[ Name: _renderSoftSnaps ]]
    if v104:_hasSoftSnap() then
        local v105 = v104._scalingLimitReachedLower or v104._scalingLimitReachedUpper;
        return v104._softSnapper:render(v104._draggerContext, not v105);
    else
        return;
    end;
end;
v22._renderChosenAxis = function(v106) --[[ Line: 380 ]] --[[ Name: _renderChosenAxis ]]
    -- upvalues: v2 (copy), v10 (copy)
    local l_Position_0 = (v106._boundingBox.CFrame * v106:_getBasisOffset()).Position;
    local l__dragDirection_0 = v106._dragDirection;
    return v2.createElement(v10, {
        AlwaysOnTop = false, 
        Color3 = v106._draggerContext:getGridColor(), 
        Render = function(v109) --[[ Line: 387 ]] --[[ Name: Render ]]
            -- upvalues: l_Position_0 (copy), l__dragDirection_0 (copy)
            v109:AddLine(l_Position_0 - l__dragDirection_0 * 10000, l_Position_0 + l__dragDirection_0 * 10000);
        end
    });
end;
v22._renderDraggingHandles = function(v110) --[[ Line: 393 ]] --[[ Name: _renderDraggingHandles ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v111 = {};
    local v112 = v110._handles[v110._draggingHandleId];
    v111[v110._draggingHandleId] = v2.createElement(v6, {
        HandleCFrame = v112.HandleCFrame, 
        Color = v112.Color, 
        Scale = v112.Scale
    });
    return v2.createFragment(v111);
end;
v22._renderSizeMeasurement = function(v113) --[[ Line: 421 ]] --[[ Name: _renderSizeMeasurement ]]
    -- upvalues: v2 (copy), v12 (copy), v13 (copy)
    local l_Size_0 = v113._boundingBox.Size;
    local v115 = ({
        l_Size_0.X, 
        l_Size_0.Y, 
        l_Size_0.Z
    })[v113._normalId];
    local l_Position_1 = v113._boundingBox.CFrame.Position;
    local v117, v118 = v113._draggerContext:worldToViewportPoint(l_Position_1);
    if v118 then
        return v2.createElement(v12, {
            DraggerContext = v113._draggerContext, 
            Position = UDim2.fromOffset(v117.X, v117.Y), 
            Value = v13(v115)
        });
    else
        return;
    end;
end;
v22._renderSummon = function(v119) --[[ Line: 437 ]] --[[ Name: _renderSummon ]]
    -- upvalues: v2 (copy), v8 (copy)
    if v119._summonBasisOffset then
        return v2.createElement(v8, {
            DraggerContext = v119._draggerContext, 
            CFrame = v119._boundingBox.CFrame * v119:_getBasisOffset(), 
            IsActive = v119._draggerContext:shouldShowActiveInstanceHighlight() and #v119._selectionWrapper:get() == 1
        });
    else
        return;
    end;
end;
v22._renderBoundingBox = function(v120) --[[ Line: 448 ]] --[[ Name: _renderBoundingBox ]]
    -- upvalues: v2 (copy), v5 (copy)
    if v120:_shouldDrawBoundingBox() then
        return v2.createElement(v5, {
            CFrame = v120._boundingBox.CFrame, 
            Size = v120._boundingBox.Size, 
            Color = v120:_getBoundingBoxColor(), 
            LineThickness = v120:_getBoundingBoxThickness(), 
            Container = v120._draggerContext:getGuiParent()
        });
    else
        return;
    end;
end;
v22._renderHovering = function(v121, v122) --[[ Line: 461 ]] --[[ Name: _renderHovering ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy)
    local v123 = {};
    for v124, v125 in pairs(v121._handles) do
        local l_Color_0 = v125.Color;
        local v127 = v124 == v122;
        if not v127 then
            l_Color_0 = v3.makeDimmed(v125.Color);
        end;
        v123[v124] = v2.createElement(v6, {
            HandleCFrame = v125.HandleCFrame, 
            Color = l_Color_0, 
            Scale = v125.Scale, 
            Hovered = v127
        });
    end;
    return v2.createFragment(v123);
end;
v22._renderDragging = function(v128) --[[ Line: 479 ]] --[[ Name: _renderDragging ]]
    -- upvalues: v2 (copy)
    return v2.createFragment({
        Handles = v128:_renderDraggingHandles(), 
        ChosenAxisDisplay = v128:_renderChosenAxis(), 
        SoftSnaps = v128:_renderSoftSnaps(), 
        SizeMeasurement = if v128._draggerContext:shouldShowPreciseInput() then v128:_renderSizeMeasurement() else nil, 
        HotkeyHelp = v128:_renderHotkeyHelp(), 
        Implementation = v128._implementation:render(v128._lastDeltaSize, v128._lastOffset)
    });
end;
v22.renderNEW = function(v129, v130) --[[ Line: 491 ]] --[[ Name: renderNEW ]]
    -- upvalues: v2 (copy)
    local v131 = v129._draggingHandleId and v129._handles[v129._draggingHandleId];
    return v2.createElement("Folder", {}, {
        MainView = if v131 then v129:_renderDragging() else v129:_renderHovering(v130), 
        BoundingBox = v129:_renderBoundingBox(), 
        Summon = v129:_renderSummon()
    });
end;
v22.render = function(v132, v133) --[[ Line: 501 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v2 (copy), v6 (copy), v3 (copy), v5 (copy), v7 (copy)
    if v17() then
        return v132:renderNEW(v133);
    else
        local v134 = {};
        if v132._draggingHandleId and v132._handles[v132._draggingHandleId] then
            local v135 = v132._handles[v132._draggingHandleId];
            v134[v132._draggingHandleId] = v2.createElement(v6, {
                HandleCFrame = v135.HandleCFrame, 
                Color = v135.Color, 
                Scale = v135.Scale
            });
            for v136, v137 in pairs(v132._handles) do
                if v136 ~= v132._draggingHandleId then
                    v134[v136] = v2.createElement(v6, {
                        HandleCFrame = v137.HandleCFrame, 
                        Color = v3.makeDimmed(v137.Color), 
                        Scale = v137.Scale, 
                        Thin = true
                    });
                end;
            end;
            v134.ImplementationRendered = v132._implementation:render(v132._lastDeltaSize, v132._lastOffset);
        else
            for v138, v139 in pairs(v132._handles) do
                local l_Color_1 = v139.Color;
                local v141 = v138 == v133;
                if not v141 then
                    l_Color_1 = v3.makeDimmed(v139.Color);
                end;
                v134[v138] = v2.createElement(v6, {
                    HandleCFrame = v139.HandleCFrame, 
                    Color = l_Color_1, 
                    Scale = v139.Scale, 
                    Hovered = v141
                });
            end;
        end;
        if v132:_shouldDrawBoundingBox() then
            v134.SelectionBoundingBox = v2.createElement(v5, {
                CFrame = v132._boundingBox.CFrame, 
                Size = v132._boundingBox.Size, 
                Color = v132:_getBoundingBoxColor(), 
                LineThickness = v132:_getBoundingBoxThickness(), 
                Container = v132._draggerContext:getGuiParent()
            });
        end;
        if v132._summonBasisOffset then
            v134.SummonedPivot = v2.createElement(v7, {
                DraggerContext = v132._draggerContext, 
                CFrame = v132._boundingBox.CFrame * v132:_getBasisOffset(), 
                IsActive = v132._draggerContext:shouldShowActiveInstanceHighlight() and #v132._selectionWrapper:get() == 1
            });
        end;
        return v2.createElement("Folder", {}, v134);
    end;
end;
v22._needsSoftSnaps = function(v142) --[[ Line: 566 ]] --[[ Name: _needsSoftSnaps ]]
    local v143 = false;
    if v142._draggerContext:getMaxSoftSnaps() > 0 then
        v143 = v142._draggerContext:getSoftSnapMarginFactor() > 0;
    end;
    return v143;
end;
v22.mouseDown = function(v144, v145, v146) --[[ Line: 572 ]] --[[ Name: mouseDown ]]
    -- upvalues: v19 (copy), v17 (copy)
    v144._draggingHandleId = v146;
    if not v144._handles[v146] then
        return;
    else
        v144._normalId = v144._handles[v146].NormalId;
        v144._handleCFrame = v144._handles[v146].HandleCFrame;
        v144:_rememberCurrentBoundsAsOriginal();
        v144:_updateExtrudeMode();
        local v147, v148 = v144:_getDistanceAlongAxis(v145, true);
        v144._startDistance = v147 and v148 or 0;
        if v19() then
            v144._startDragHandlePosition = v144._handles[v146].HandleCFrame.Position;
            v144._startDragHandleScale = v144._handles[v146].Scale;
        end;
        v144._committedDeltaSize = Vector3.new();
        v144._committedOffset = Vector3.new();
        v144._lastDeltaSize = Vector3.new();
        v144._lastOffset = Vector3.new();
        v144._implementation:beginScale(v144._selectionWrapper:get(), v144._selectionInfo, v144._normalId);
        if v17() then
            if v144._implementation.getSoftSnaps and v144:_needsSoftSnaps() then
                v144._softSnapper:setSnaps(v144._implementation:getSoftSnaps(v144._handleCFrame.LookVector, v144._summonBasisOffset));
                return;
            else
                v144._softSnapper:clearSnaps();
            end;
        end;
        return;
    end;
end;
local function _(v149, v150, v151, v152) --[[ Line: 618 ]] --[[ Name: clampWithStep ]]
    if v149 < v150 then
        if v152 > 0 then
            return v150 + (v152 - (v150 - v149) % v152);
        else
            return v150;
        end;
    elseif v151 < v149 then
        if v152 > 0 then
            return v151 - (v152 - (v149 - v151) % v152);
        else
            return v151;
        end;
    else
        return v149;
    end;
end;
local function v168(v154, v155, v156, v157, v158, v159, v160) --[[ Line: 635 ]] --[[ Name: computeDeltaSizeMultiaxis ]]
    -- upvalues: v4 (copy)
    if v158 < 0.01 then
        v158 = 0;
    end;
    local v161 = v4.vectorToArray(v154);
    local v162 = v4.vectorToArray(v159 - v154);
    local v163 = v4.vectorToArray(v160 - v154);
    local v164 = v162[v156];
    local v165 = v163[v156];
    local l_v158_0 = v158;
    local v167 = if v155 < v164 then if l_v158_0 > 0 then v164 + (l_v158_0 - (v164 - v155) % l_v158_0) else v164 else if v165 < v155 then if l_v158_0 > 0 then v165 - (l_v158_0 - (v155 - v165) % l_v158_0) else v165 else v155;
    v164 = v161[v156] == 0 and 0 or v167 / v161[v156];
    return v154 * v4.setToVector3(v157) * v164, v167;
end;
v22.mouseDrag = function(v169, v170) --[[ Line: 648 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v17 (copy), v19 (copy), v15 (copy), v168 (copy)
    assert(v169._draggingHandleId, "Missing dragging handle ID.");
    if not v169._handles[v169._draggingHandleId] then
        return;
    else
        v169:_refreshDragIfNeeded();
        local v171, v172 = v169:_getDistanceAlongAxis(v170);
        if not v171 then
            return;
        else
            local v173 = if v17() then v169._draggerContext:shouldGridSnap() else nil;
            local v174 = nil;
            v174 = if v19() then v15(v169._draggerContext:getCamera(), v169._dragStartPosition, v169._dragDirection, v169._startDragHandlePosition, v169._startDragHandleScale, v169._startDistance, v172) - (v169._startDragHandlePosition - v169._dragStartPosition).Magnitude else v172 - v169._startDistance;
            local v175 = v169._draggerContext:snapToGridSize(v174);
            if v17() and v169:_hasSoftSnap() then
                local v176 = if v173 then math.abs(v175 - v174) else nil;
                local v177 = v169._softSnapper:updateCurrentSnap(v174, v176);
                if v177 then
                    v175 = v177;
                end;
            end;
            local l_NormalId_0 = v169._handles[v169._draggingHandleId].NormalId;
            local v179 = nil;
            local v180 = ({
                v169._originalBoundingBoxSize.X, 
                v169._originalBoundingBoxSize.Y, 
                v169._originalBoundingBoxSize.Z
            })[l_NormalId_0];
            if not v169:_getBasisOffset().Position:FuzzyEq((Vector3.new())) then
                local v181 = v172 / v169._startDistance * v180;
                v175 = v169._draggerContext:snapToGridSize(v181 - v180);
                if v17() and v169:_hasSoftSnap() then
                    local v182 = v169._softSnapper:updateCurrentSnap(v175, nil);
                    if v182 then
                        v175 = v182;
                    end;
                end;
            elseif v169._lastResizeFromCenter then
                v175 = v175 * 2;
            end;
            local v183 = v180 == 0 and 1 or (v180 + v175) / v180;
            local v184 = -v169._worldBBoxCenterToScaleCenter;
            local v185 = v183 * v184 - v184;
            v179 = v169._originalBoundingBoxCFrame:Inverse():VectorToWorldSpace(v185);
            if not v169._lastAxesToScale.X then
                v179 = Vector3.new(0, v179.Y, v179.Z);
            end;
            if not v169._lastAxesToScale.Y then
                v179 = Vector3.new(v179.X, 0, v179.Z);
            end;
            if not v169._lastAxesToScale.Z then
                v179 = Vector3.new(v179.X, v179.Y, 0);
            end;
            local l__originalBoundingBoxSize_0 = v169._originalBoundingBoxSize;
            local l__lastAxesToScale_1 = v169._lastAxesToScale;
            local v188 = nil;
            v188 = if v17() then if v173 then v169._draggerContext:getGridSize() else 0 else v169._draggerContext:getGridSize();
            local l__minimumSize_0 = v169._minimumSize;
            local l__maximumSize_0 = v169._maximumSize;
            local v191, v192 = v168(l__originalBoundingBoxSize_0, v175, l_NormalId_0, l__lastAxesToScale_1, v188, l__minimumSize_0, l__maximumSize_0);
            if v175 ~= 0 then
                v179 = v179 * (v192 / v175);
            end;
            v169._scalingLimitReachedUpper = v175 - v192 > 0;
            v169._scalingLimitReachedLower = v192 - v175 > 0;
            local v193 = v191 + v169._committedDeltaSize;
            local v194 = v179 + v169._committedOffset;
            if v193:FuzzyEq((Vector3.new())) then
                v193 = Vector3.new();
            end;
            if v194:FuzzyEq((Vector3.new())) then
                v194 = Vector3.new();
            end;
            local v195, v196 = v169._implementation:updateScale(v193, v194);
            v169._lastDeltaSize = v195;
            v169._lastOffset = v196;
            v169._resizeWasConstrained = v193 ~= v169._lastDeltaSize;
            v169._boundingBox.CFrame = v169._originalBoundingBoxCFrame * CFrame.new(v169._lastOffset - v169._committedOffset);
            v169._boundingBox.Size = l__originalBoundingBoxSize_0 + (v169._lastDeltaSize - v169._committedDeltaSize);
            if v169._summonBasisOffset then
                v169._summonBasisOffset = CFrame.new(v169._originalBasisOffset / v169._originalBoundingBoxSize * v169._boundingBox.Size);
                return;
            else
                v169._basisOffset = CFrame.new(v169._originalBasisOffset / v169._originalBoundingBoxSize * v169._boundingBox.Size);
                return;
            end;
        end;
    end;
end;
v22.mouseUp = function(v197, _) --[[ Line: 789 ]] --[[ Name: mouseUp ]]
    -- upvalues: v17 (copy)
    if v197._handles[v197._draggingHandleId] then
        v197._implementation:endScale();
    end;
    v197._draggingHandleId = nil;
    v197._scalingLimitReachedUpper = false;
    v197._scalingLimitReachedLower = false;
    v197._resizeWasConstrained = false;
    if not v17() and not v197._tabKeyDown then
        v197:_endSummon();
    end;
    v197._schema.addUndoWaypoint(v197._draggerContext, "Scale Selection");
end;
v22._getLocalOppositeBoundingBoxSideCenterOffset = function(v199, v200) --[[ Line: 805 ]] --[[ Name: _getLocalOppositeBoundingBoxSideCenterOffset ]]
    -- upvalues: v24 (copy)
    local l_Offset_0 = v24[v200].Offset;
    local v202 = 0.5 * math.abs(l_Offset_0:Inverse():VectorToWorldSpace(v199._originalBoundingBoxSize).Z);
    return l_Offset_0 * CFrame.new(0, 0, v202);
end;
v22._getScaleCenterToOppositeBoundingBoxSide = function(v203, v204) --[[ Line: 813 ]] --[[ Name: _getScaleCenterToOppositeBoundingBoxSide ]]
    local v205 = v203:_getLocalOppositeBoundingBoxSideCenterOffset(v204);
    return (v203._originalBoundingBoxCFrame.Rotation * v205).Position;
end;
v22._computeProjectionLineAndScaleCenter = function(v206) --[[ Line: 820 ]] --[[ Name: _computeProjectionLineAndScaleCenter ]]
    -- upvalues: v6 (copy), v4 (copy)
    v206._dragDirection = v206._handleCFrame.LookVector;
    local v207 = v206._handles[v206._draggingHandleId];
    v206._dragHandleCenter = (v207.HandleCFrame * v6.getLocalHandleOffset(v207)).Position;
    if v206._lastResizeFromCenter then
        v206._worldBBoxCenterToScaleCenter = (v206._originalBoundingBoxCFrame.Rotation * CFrame.new(v206._originalBasisOffset)).Position;
    else
        local v208 = v206:_getScaleCenterToOppositeBoundingBoxSide(v206._draggingHandleId);
        local v209 = v206._dragHandleCenter - v206._originalBoundingBoxCFrame.Position;
        v206._worldBBoxCenterToScaleCenter = v4.intersectRayPlanePoint(v209, v206._dragDirection, v208, v206._dragDirection);
    end;
    v206._dragStartPosition = v206._originalBoundingBoxCFrame.Position + v206._worldBBoxCenterToScaleCenter;
end;
v22._getDistanceAlongAxis = function(v210, v211, v212) --[[ Line: 849 ]] --[[ Name: _getDistanceAlongAxis ]]
    -- upvalues: v16 (copy)
    if v212 then
        v210:_computeProjectionLineAndScaleCenter();
    end;
    return v16(v210._dragStartPosition, v210._dragDirection, v211);
end;
v22._updateHandles = function(v213) --[[ Line: 856 ]] --[[ Name: _updateHandles ]]
    -- upvalues: v24 (copy)
    if v213._selectionInfo:isEmpty() or v213._boundingBox.Size:FuzzyEq((Vector3.new())) then
        v213._handles = {};
        return;
    else
        for v214, v215 in pairs(v24) do
            local l_Offset_1 = v215.Offset;
            local v217 = l_Offset_1:Inverse();
            local v218 = 0.5 * math.abs(v217:VectorToWorldSpace(v213._boundingBox.Size).Z);
            local v219 = v217:VectorToWorldSpace(v213:_getBasisOffset().Position);
            if v218 < math.abs(v219.Z) and v219.Z < 0 then
                v218 = math.abs(v219.Z);
            end;
            local v220 = v213._boundingBox.CFrame * l_Offset_1 * CFrame.new(v219.X, v219.Y, -v218);
            v213._handles[v214] = {
                Color = v215.Color, 
                Axis = l_Offset_1.LookVector, 
                HandleCFrame = v220, 
                NormalId = v215.NormalId, 
                Scale = v213._draggerContext:getHandleScale(v220.Position)
            };
        end;
        return;
    end;
end;
local v221 = {
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true, 
    [Enum.KeyCode.RightControl] = true, 
    [Enum.KeyCode.LeftControl] = true, 
    [Enum.KeyCode.RightAlt] = true, 
    [Enum.KeyCode.LeftAlt] = true
};
v22.keyDown = function(v222, v223) --[[ Line: 900 ]] --[[ Name: keyDown ]]
    -- upvalues: v17 (copy), v221 (copy)
    if not v17() and v223 == Enum.KeyCode.Tab then
        v222._tabKeyDown = true;
        if not v222._draggingHandleId then
            v222:_summonHandles();
            return true;
        end;
    elseif v17() and v221[v223] then
        return true;
    elseif v17() and v223 == Enum.KeyCode.H then
        v222._draggerContext:setSetting("HotkeyUsageHidden", not v222._draggerContext:getSetting("HotkeyUsageHidden"));
        return true;
    end;
    return false;
end;
v22.keyUp = function(v224, v225) --[[ Line: 921 ]] --[[ Name: keyUp ]]
    -- upvalues: v17 (copy), v221 (copy)
    if not v17() and v225 == Enum.KeyCode.Tab then
        v224._tabKeyDown = false;
        if not v224._draggingHandleId then
            v224:_endSummon();
        end;
        return true;
    elseif v17() and v221[v225] then
        return true;
    else
        return false;
    end;
end;
v22.getPriority = function(v226) --[[ Line: 934 ]] --[[ Name: getPriority ]]
    if v226._implementation.getPriority then
        return v226._implementation.getPriority();
    else
        return 0;
    end;
end;
return v22;