local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_0.Utility.Colors);
local v5 = require(l_Parent_0.Utility.Math);
local v6 = require(l_Parent_0.Components.StandaloneSelectionBox);
local v7 = require(l_Parent_0.Utility.roundRotation);
local v8 = require(l_Parent_0.Utility.snapRotationToPrimaryDirection);
local v9 = require(l_Parent_0.Utility.HotkeyHelpBuilder);
local v10 = require(l_Parent_0.Components.RotateHandleView);
local v11 = require(l_Parent_0.Components.SummonHandlesNote);
local v12 = require(l_Parent_0.Components.SummonHandlesHider);
local v13 = require(l_Parent_0.Components.DraggedPivot);
local v14 = require(l_Parent_0.Components.SummonedPivot);
local v15 = require(l_Parent_0.Components.HotkeyUsageInfo);
local v16 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v17 = require(l_Parent_0.Flags.getFFlagDraggerRotateReference);
local v18 = {};
v18.__index = v18;
local v19 = table.freeze({
    XAxis = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, 1, 0))), 
        Color = v4.X_AXIS, 
        RadiusOffset = 0
    }, 
    YAxis = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0, 0), Vector3.new(0, 0, 1, 0), (Vector3.new(1, 0, 0, 0))), 
        Color = v4.Y_AXIS, 
        RadiusOffset = 0.01
    }, 
    ZAxis = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        Color = v4.Z_AXIS, 
        RadiusOffset = 0.02
    }
});
local function _(v20) --[[ Line: 60 ]] --[[ Name: isRightAngle ]]
    return math.abs(math.floor(v20 / 1.5707963267948966 + 0.5) * 1.5707963267948966 - v20) < 0.001;
end;
local function v28(v22, v23, v24, v25) --[[ Line: 65 ]] --[[ Name: getRotationTransform ]]
    -- upvalues: v7 (copy)
    local v26 = v22:VectorToObjectSpace(v23);
    local v27 = CFrame.fromAxisAngle(v26, v24);
    if v25 > 0 and math.abs(math.floor(v24 / 1.5707963267948966 + 0.5) * 1.5707963267948966 - v24) < 0.001 then
        v27 = v7(v27);
    end;
    return v22 * v27 * v22:Inverse();
end;
local function v35(v29, v30) --[[ Line: 88 ]] --[[ Name: rotationAngleFromRay ]]
    -- upvalues: v5 (copy)
    local v31 = v5.intersectRayPlane(v30.Origin, v30.Direction, v29.Position, v29.RightVector);
    if v31 >= 0 then
        local l_Unit_0 = (v30.Origin + v30.Direction * v31 - v29.Position).Unit;
        local v33 = v29.LookVector:Dot(l_Unit_0);
        local v34 = math.atan2(v29.UpVector:Dot(l_Unit_0), v33);
        if v34 < 0 then
            return 6.283185307179586 + v34;
        else
            return v34;
        end;
    else
        return nil;
    end;
end;
local function _(v36, v37) --[[ Line: 108 ]] --[[ Name: snapToRotateIncrementIfNeeded ]]
    if v37 > 0 then
        local v38 = math.rad(v37);
        local v39 = math.floor(v36 / v38 + 0.5) * v38;
        if math.abs(v36 - 6.283185307179586) < math.abs(v36 - v39) then
            return 0;
        else
            return v39;
        end;
    else
        return v36;
    end;
end;
v18.new = function(v41, v42, v43) --[[ Line: 128 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy)
    return (setmetatable({
        _draggerContext = v41, 
        _handles = {}, 
        _props = v42 or {
            Summonable = true
        }, 
        _implementation = v43, 
        _tabKeyDown = false
    }, v18));
end;
v18._summonHandles = function(v44) --[[ Line: 141 ]] --[[ Name: _summonHandles ]]
    -- upvalues: v16 (copy), v8 (copy)
    assert(not v16(), "Wrong flag branching");
    if not v44._props.Summonable then
        return false;
    else
        local v45 = v44._draggerContext:getMouseRay();
        local _, v47, v48 = v44._schema.getMouseTarget(v44._draggerContext, v45, {});
        if v47 then
            local v49 = v45.Origin + v45.Direction.Unit * v48;
            v44._summonBasisOffset = CFrame.new(v44._boundingBox.CFrame:PointToObjectSpace(v49));
            if v44._implementation.findSummonSnap then
                local v50, v51 = v44._implementation:findSummonSnap(v49, v47);
                if v50 then
                    local v52 = v44._boundingBox.CFrame:ToObjectSpace(v50);
                    local v53 = v52:Inverse() * v44._summonBasisOffset;
                    v44._summonBasisOffset = v52 * v8(v53);
                    v44._summonWasSnapped = true;
                    v44._summonWasSnappedToSurface = v51;
                end;
            end;
        end;
        return;
    end;
end;
v18._endSummon = function(v54) --[[ Line: 168 ]] --[[ Name: _endSummon ]]
    -- upvalues: v16 (copy)
    assert(not v16(), "Wrong flag branching");
    if v54._summonBasisOffset then
        v54._summonBasisOffset = nil;
        v54._summonWasSnapped = false;
        v54._summonWasSnappedToSurface = false;
    end;
end;
v18.beginSummon = function(v55, v56) --[[ Line: 178 ]] --[[ Name: beginSummon ]]
    -- upvalues: v16 (copy)
    assert(v16(), "Wrong flag branching");
    v55._summonBasisOffset = v56;
end;
v18.endSummon = function(v57) --[[ Line: 183 ]] --[[ Name: endSummon ]]
    -- upvalues: v16 (copy)
    assert(v16(), "Wrong flag branching");
    v57._summonBasisOffset = nil;
end;
v18._getBasisOffset = function(v58) --[[ Line: 188 ]] --[[ Name: _getBasisOffset ]]
    -- upvalues: v16 (copy)
    if v16() then
        local l__summonBasisOffset_0 = v58._summonBasisOffset;
        if l__summonBasisOffset_0 then
            return v58._basisOffset * l__summonBasisOffset_0;
        else
            return v58._basisOffset;
        end;
    else
        return v58._summonBasisOffset or v58._basisOffset;
    end;
end;
v18.update = function(v60, v61, v62) --[[ Line: 201 ]] --[[ Name: update ]]
    -- upvalues: v16 (copy)
    if not v60._draggingHandleId then
        if not v16() and not v60._tabKeyDown then
            v60:_endSummon();
        end;
        local v63, v64, v65 = v62:getBoundingBox();
        v60._boundingBox = {
            Size = v65, 
            CFrame = v63 * CFrame.new(v64)
        };
        v60._basisOffset = CFrame.new(-v64);
        v60._selectionInfo = v62;
        v60._selectionWrapper = v61:getSelectionWrapper();
        v60._schema = v61:getSchema();
        v60._scale = v60._draggerContext:getHandleScale((v60._boundingBox.CFrame * v60:_getBasisOffset()).Position);
    end;
    v60:_updateHandles();
end;
v18.shouldBiasTowardsObjects = function(_) --[[ Line: 221 ]] --[[ Name: shouldBiasTowardsObjects ]]
    return false;
end;
v18.hitTest = function(v67, v68, _) --[[ Line: 225 ]] --[[ Name: hitTest ]]
    -- upvalues: v10 (copy)
    local v70 = nil;
    local v71 = 1e999;
    for v72, v73 in pairs(v67._handles) do
        local v74 = v10.hitTest(v73, v68);
        if v74 and v74 < v71 then
            v71 = v74;
            v70 = v72;
        end;
    end;
    return v70, v71, true;
end;
v18._renderHotkeyHelp = function(v75) --[[ Line: 241 ]] --[[ Name: _renderHotkeyHelp ]]
    -- upvalues: v9 (copy), v3 (copy), v15 (copy)
    if not v75._draggerContext:getSetting("HotkeyUsageHidden") then
        local v76 = {};
        v9.addGridSnap(v76, v75._draggerContext);
        v9.addSummonHandles(v76);
        v9.addHelp(v76);
        return v3.createElement(v15, {
            DraggerContext = v75._draggerContext, 
            HotkeyList = v76
        });
    else
        return;
    end;
end;
v18._getTickAngle = function(v77) --[[ Line: 255 ]] --[[ Name: _getTickAngle ]]
    local v78 = v77._draggerContext:getRotateIncrement();
    if v78 >= 5 then
        return (math.rad(v78));
    else
        return nil;
    end;
end;
v18._renderDraggingHandles = function(v79, v80) --[[ Line: 264 ]] --[[ Name: _renderDraggingHandles ]]
    -- upvalues: v3 (copy), v10 (copy), v19 (copy), v4 (copy)
    local v81 = v79:_getTickAngle();
    local v82 = {};
    local l__startAngle_0 = v79._startAngle;
    local v84 = v79._draggerContext:getRotateIncrement();
    local v85;
    if v84 > 0 then
        local v86 = math.rad(v84);
        local v87 = math.floor(l__startAngle_0 / v86 + 0.5) * v86;
        v85 = math.abs(l__startAngle_0 - 6.283185307179586) < math.abs(l__startAngle_0 - v87) and 0 or v87;
    else
        v85 = l__startAngle_0;
    end;
    l__startAngle_0 = v79._handles[v80];
    v82[v80] = v3.createElement(v10, {
        HandleCFrame = l__startAngle_0.HandleCFrame, 
        Color = l__startAngle_0.Color, 
        StartAngle = v85 - v79._draggingLastGoodDelta, 
        EndAngle = v85, 
        Scale = v79._scale, 
        Hovered = false, 
        RadiusOffset = l__startAngle_0.RadiusOffset, 
        TickAngle = v81, 
        DraggerContext = v79._draggerContext
    });
    for v88, v89 in pairs(v79._handles) do
        if v88 ~= v80 then
            local l_Offset_0 = v19[v88].Offset;
            v82[v88] = v3.createElement(v10, {
                HandleCFrame = v79._boundingBox.CFrame * l_Offset_0, 
                Color = v4.makeDimmed(v89.Color), 
                Scale = v79._scale, 
                Thin = true, 
                RadiusOffset = l__startAngle_0.RadiusOffset
            });
        end;
    end;
    return v3.createFragment(v82);
end;
v18._renderDragging = function(v91, v92) --[[ Line: 304 ]] --[[ Name: _renderDragging ]]
    -- upvalues: v3 (copy)
    return v3.createFragment({
        Handles = v91:_renderDraggingHandles(v92), 
        HotkeyHelp = v91:_renderHotkeyHelp(), 
        ImplementationRendered = v91._implementation:render(v91._lastGlobalTransformForRender)
    });
end;
v18._renderHovering = function(v93, v94) --[[ Line: 312 ]] --[[ Name: _renderHovering ]]
    -- upvalues: v4 (copy), v3 (copy), v10 (copy)
    local v95 = {};
    for v96, v97 in pairs(v93._handles) do
        local l_Color_0 = v97.Color;
        local v99 = v96 == v94;
        local v100 = nil;
        if v99 then
            v100 = v93:_getTickAngle();
        else
            l_Color_0 = v4.makeDimmed(l_Color_0);
        end;
        v95[v96] = v3.createElement(v10, {
            HandleCFrame = v97.HandleCFrame, 
            Color = l_Color_0, 
            Scale = v93._scale, 
            Hovered = v99, 
            RadiusOffset = v97.RadiusOffset, 
            TickAngle = v100
        });
    end;
    return v3.createFragment(v95);
end;
v18._renderDragOrHover = function(v101, v102) --[[ Line: 335 ]] --[[ Name: _renderDragOrHover ]]
    if v101._draggingHandleId and v101._handles[v101._draggingHandleId] then
        return v101:_renderDragging(v101._draggingHandleId);
    else
        return v101:_renderHovering(v102);
    end;
end;
v18._renderBoundingBox = function(v103) --[[ Line: 344 ]] --[[ Name: _renderBoundingBox ]]
    -- upvalues: v3 (copy), v6 (copy)
    if v103._props.ShowBoundingBox and #v103._selectionWrapper:get() > 1 then
        return v3.createElement(v6, {
            CFrame = v103._boundingBox.CFrame, 
            Size = v103._boundingBox.Size, 
            Color = v103._draggerContext:getSelectionBoxColor(), 
            LineThickness = v103._draggerContext:getHoverThickness(), 
            Container = v103._draggerContext:getGuiParent()
        });
    else
        return;
    end;
end;
v18._renderSummon = function(v104) --[[ Line: 356 ]] --[[ Name: _renderSummon ]]
    -- upvalues: v3 (copy), v14 (copy), v12 (copy), v11 (copy)
    if v104._props.Summonable then
        local v105 = {};
        if v104._summonBasisOffset then
            v105.SummonSnap = v3.createElement(v14, {
                DraggerContext = v104._draggerContext, 
                CFrame = v104._boundingBox.CFrame * v104:_getBasisOffset(), 
                Dragging = v104._draggingHandleId ~= nil
            });
        end;
        if not v104._draggingHandleId then
            if v104._summonBasisOffset then
                v105.SummonHandlesHider = v3.createElement(v12, {
                    DraggerContext = v104._draggerContext
                });
            elseif not v12.hasSeenEnough(v104._draggerContext) then
                local l_Position_0 = (v104._boundingBox.CFrame * v104._basisOffset).Position;
                local v107, v108 = v104._draggerContext:worldToViewportPoint(l_Position_0);
                if v107.Z > 0 then
                    v105.SummonHandlesNote = v3.createElement(v11, {
                        Position = Vector2.new(v107.X, v107.Y), 
                        InView = v108, 
                        DraggerContext = v104._draggerContext
                    });
                end;
            end;
        end;
        return v3.createFragment(v105);
    else
        return;
    end;
end;
v18.renderNEW = function(v109, v110) --[[ Line: 389 ]] --[[ Name: renderNEW ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Folder", {}, {
        Handles = v109:_renderDragOrHover(v110), 
        BoundingBox = v109:_renderBoundingBox(), 
        Summon = v109:_renderSummon()
    });
end;
v18.render = function(v111, v112) --[[ Line: 397 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v3 (copy), v10 (copy), v19 (copy), v4 (copy), v6 (copy), l_Workspace_0 (copy), v13 (copy), v12 (copy), v11 (copy)
    if v16() then
        return v111:renderNEW(v112);
    else
        local v113 = {};
        local v114 = v111._draggerContext:getRotateIncrement();
        local v115 = nil;
        if v114 >= 5 then
            v115 = math.rad(v114);
        end;
        if v111._draggingHandleId and v111._handles[v111._draggingHandleId] then
            local v116 = v111._handles[v111._draggingHandleId];
            v113[v111._draggingHandleId] = v3.createElement(v10, {
                HandleCFrame = v116.HandleCFrame, 
                Color = v116.Color, 
                StartAngle = v111._startAngle - v111._draggingLastGoodDelta, 
                EndAngle = v111._startAngle, 
                Scale = v111._scale, 
                Hovered = false, 
                RadiusOffset = v116.RadiusOffset, 
                TickAngle = v115, 
                DraggerContext = v111._draggerContext
            });
            for v117, v118 in pairs(v111._handles) do
                if v117 ~= v111._draggingHandleId then
                    local l_Offset_1 = v19[v117].Offset;
                    v113[v117] = v3.createElement(v10, {
                        HandleCFrame = v111._boundingBox.CFrame * l_Offset_1, 
                        Color = v4.makeDimmed(v118.Color), 
                        Scale = v111._scale, 
                        Thin = true, 
                        RadiusOffset = v116.RadiusOffset
                    });
                end;
            end;
            v113.ImplementationRendered = v111._implementation:render(v111._lastGlobalTransformForRender);
        else
            for v120, v121 in pairs(v111._handles) do
                local l_Color_1 = v121.Color;
                local v123 = v120 == v112;
                local v124 = nil;
                if v123 then
                    v124 = v115;
                else
                    l_Color_1 = v4.makeDimmed(l_Color_1);
                end;
                v113[v120] = v3.createElement(v10, {
                    HandleCFrame = v121.HandleCFrame, 
                    Color = l_Color_1, 
                    Scale = v111._scale, 
                    Hovered = v123, 
                    RadiusOffset = v121.RadiusOffset, 
                    TickAngle = v124
                });
            end;
        end;
        if v111._props.ShowBoundingBox and #v111._selectionWrapper:get() > 1 then
            v113.SelectionBoundingBox = v3.createElement(v6, {
                CFrame = v111._boundingBox.CFrame, 
                Size = v111._boundingBox.Size, 
                Color = v111._draggerContext:getSelectionBoxColor(), 
                LineThickness = v111._draggerContext:getHoverThickness(), 
                Container = v111._draggerContext:getGuiParent()
            });
        end;
        if v111._props.Summonable then
            if v111._summonBasisOffset then
                if v111._summonWasSnapped then
                    v113.SummonSnap = v3.createElement("BoxHandleAdornment", {
                        Adornee = l_Workspace_0.Terrain, 
                        Color3 = v111._draggerContext:getGeometrySnapColor(), 
                        CFrame = v111._boundingBox.CFrame * v111._summonBasisOffset, 
                        Size = Vector3.new(0.5, 0.5, 0.5, 0) * v111._scale, 
                        AlwaysOnTop = not v111._summonWasSnappedToSurface, 
                        Transparency = v111._summonWasSnappedToSurface and 0 or 0.5, 
                        ZIndex = 0
                    });
                else
                    v113.SummonedPivot = v3.createElement(v13, {
                        DraggerContext = v111._draggerContext, 
                        CFrame = v111._boundingBox.CFrame * v111:_getBasisOffset(), 
                        IsActive = v111._draggerContext:shouldShowActiveInstanceHighlight() and #v111._selectionWrapper:get() == 1
                    });
                end;
            end;
            if not v111._draggingHandleId then
                if v111._summonBasisOffset then
                    v113.SummonHandlesHider = v3.createElement(v12, {
                        DraggerContext = v111._draggerContext
                    });
                elseif not v12.hasSeenEnough(v111._draggerContext) then
                    local l_Position_1 = (v111._boundingBox.CFrame * v111._basisOffset).Position;
                    local v126, v127 = v111._draggerContext:worldToViewportPoint(l_Position_1);
                    if v126.Z > 0 then
                        v113.SummonHandlesNote = v3.createElement(v11, {
                            Position = Vector2.new(v126.X, v126.Y), 
                            InView = v127, 
                            DraggerContext = v111._draggerContext
                        });
                    end;
                end;
            end;
        end;
        return v3.createElement("Folder", {}, v113);
    end;
end;
v18.mouseDown = function(v128, v129, v130) --[[ Line: 515 ]] --[[ Name: mouseDown ]]
    -- upvalues: v35 (copy), v16 (copy)
    if not v128._handles[v130] then
        return;
    else
        local l_HandleCFrame_0 = v128._handles[v130].HandleCFrame;
        local v132 = v35(l_HandleCFrame_0, v129.Unit);
        if not v132 then
            return;
        else
            v128._draggingHandleId = v130;
            v128._handleCFrame = l_HandleCFrame_0;
            v128._lastGlobalTransformForRender = CFrame.new();
            v128._draggingLastGoodDelta = 0;
            v128._originalBoundingBoxCFrame = v128._boundingBox.CFrame;
            if v16() then
                v128._startAngle = v132;
            else
                local v133 = v128._draggerContext:getRotateIncrement();
                local v134;
                if v133 > 0 then
                    local v135 = math.rad(v133);
                    local v136 = math.floor(v132 / v135 + 0.5) * v135;
                    v134 = math.abs(v132 - 6.283185307179586) < math.abs(v132 - v136) and 0 or v136;
                else
                    v134 = v132;
                end;
                v128._startAngle = v134;
            end;
            v128._implementation:beginDrag(v128._selectionWrapper:get(), v128._selectionInfo);
            return;
        end;
    end;
end;
v18.mouseDrag = function(v137, v138) --[[ Line: 545 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v35 (copy), v16 (copy), v28 (copy)
    if not v137._handles[v137._draggingHandleId] then
        return;
    else
        local v139 = v35(v137._handleCFrame, v138.Unit);
        if not v139 then
            return;
        else
            local v140 = nil;
            if v16() then
                local v141 = v137._draggerContext:getRotateIncrement();
                local v142 = v139 - v137._startAngle;
                if v141 > 0 then
                    local v143 = math.rad(v141);
                    local v144 = math.floor(v142 / v143 + 0.5) * v143;
                    v140 = math.abs(v142 - 6.283185307179586) < math.abs(v142 - v144) and 0 or v144;
                else
                    v140 = v142;
                end;
            else
                local v145 = v137._draggerContext:getRotateIncrement();
                local v146;
                if v145 > 0 then
                    local v147 = math.rad(v145);
                    local v148 = math.floor(v139 / v147 + 0.5) * v147;
                    v146 = math.abs(v139 - 6.283185307179586) < math.abs(v139 - v148) and 0 or v148;
                else
                    v146 = v139;
                end;
                v140 = v146 - v137._startAngle;
            end;
            local v149 = v28(v137._handleCFrame, v137._handleCFrame.RightVector, v140, v137._draggerContext:getRotateIncrement());
            local v150 = v137._implementation:updateDrag(v149);
            v137._boundingBox.CFrame = v150 * v137._originalBoundingBoxCFrame;
            v137._lastGlobalTransformForRender = v150;
            local v151 = v150:VectorToObjectSpace(v137._handleCFrame.LookVector);
            v137._draggingLastGoodDelta = -math.atan2(v137._handleCFrame.UpVector:Dot(v151), (v137._handleCFrame.LookVector:Dot(v151)));
            return;
        end;
    end;
end;
v18.mouseUp = function(v152, _) --[[ Line: 585 ]] --[[ Name: mouseUp ]]
    -- upvalues: v16 (copy), v17 (copy)
    if not v152._draggingHandleId then
        return;
    else
        if not v16() and not v152._tabKeyDown then
            v152:_endSummon();
        end;
        v152._draggingHandleId = nil;
        local v154 = v152._implementation:endDrag();
        v152._schema.addUndoWaypoint(v152._draggerContext, "Axis Rotate Selection");
        if v17() then
            if v152._draggerContext:shouldUseLocalSpace() then
                return v154;
            else
                return nil;
            end;
        else
            return v154;
        end;
    end;
end;
v18._updateHandles = function(v155) --[[ Line: 610 ]] --[[ Name: _updateHandles ]]
    -- upvalues: v19 (copy)
    if v155._selectionInfo:isEmpty() then
        v155._handles = {};
        return;
    else
        for v156, v157 in pairs(v19) do
            v155._handles[v156] = {
                HandleCFrame = v155._boundingBox.CFrame * v155:_getBasisOffset() * v157.Offset, 
                Color = v157.Color, 
                RadiusOffset = v157.RadiusOffset, 
                Scale = v155._scale
            };
        end;
        return;
    end;
end;
local v158 = table.freeze({
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true
});
v18.keyDown = function(v159, v160) --[[ Line: 630 ]] --[[ Name: keyDown ]]
    -- upvalues: v16 (copy), v158 (copy)
    if not v16() and v160 == Enum.KeyCode.Tab then
        v159._tabKeyDown = true;
        if not v159._draggingHandleId then
            v159:_summonHandles();
            return true;
        end;
    elseif v16() and v158[v160] then
        if v159._draggingHandleId then
            v159:mouseDrag(v159._draggerContext:getMouseRay());
            return true;
        end;
    elseif v16() and v160 == Enum.KeyCode.H then
        v159._draggerContext:setSetting("HotkeyUsageHidden", not v159._draggerContext:getSetting("HotkeyUsageHidden"));
        return true;
    end;
    return false;
end;
v18.keyUp = function(v161, v162) --[[ Line: 652 ]] --[[ Name: keyUp ]]
    -- upvalues: v16 (copy), v158 (copy)
    if not v16() and v162 == Enum.KeyCode.Tab then
        v161._tabKeyDown = false;
        if not v161._draggingHandleId then
            v161:_endSummon();
            return true;
        end;
    elseif v16() and v158[v162] then
        if v161._draggingHandleId then
            v161:mouseDrag(v161._draggerContext:getMouseRay());
        end;
        return true;
    end;
    return false;
end;
v18.getPriority = function(v163) --[[ Line: 668 ]] --[[ Name: getPriority ]]
    if v163._implementation.getPriority then
        return v163._implementation.getPriority();
    else
        return 0;
    end;
end;
return v18;