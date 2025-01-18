local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local v5 = require(l_Parent_0.Src.Util.MouseCursorManager);
local v6 = require(l_Parent_0.Src.Components.ImageDragger);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Pane_0 = v2.UI.Pane;
local v12 = v1.PureComponent:extend("ImageEditor");
local v13 = v4.Left.rawValue();
local v14 = v4.Right.rawValue();
local v15 = v4.Top.rawValue();
local v16 = v4.Bottom.rawValue();
local v17 = v4.Undefined.rawValue();
v12.init = function(v18, v19) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v1 (copy), v5 (copy), v3 (copy)
    v18.draggerHandlingMovement = false;
    v18.dragOrientation = v17;
    v18:setState({
        hoveringDraggerOrientation = -1
    });
    if math.max(v19.pixelDimensions.X, v19.pixelDimensions.Y) <= 0 then
        v18.leftPos = 0;
        v18.rightPos = 1;
        v18.topPos = 0;
        v18.bottomPos = 1;
    else
        local l_pixelDimensions_0 = v19.pixelDimensions;
        assert(l_pixelDimensions_0.X > 0);
        assert(l_pixelDimensions_0.Y > 0);
        local l_sliceRect_0 = v19.sliceRect;
        v18.leftPos = math.clamp(l_sliceRect_0[v13] / l_pixelDimensions_0.X, 0, 1);
        v18.rightPos = math.clamp(l_sliceRect_0[v14] / l_pixelDimensions_0.X, 0, 1);
        v18.topPos = math.clamp(l_sliceRect_0[v15] / l_pixelDimensions_0.Y, 0, 1);
        v18.bottomPos = math.clamp(l_sliceRect_0[v16] / l_pixelDimensions_0.Y, 0, 1);
    end;
    v18.backgroundImageRef = v1.createRef();
    v18.onDragging = function(v22, v23) --[[ Line: 64 ]]
        -- upvalues: v18 (copy), v17 (ref)
        if v18.dragOrientation == v17 then
            return;
        else
            v18.draggerHandlingMovement = true;
            v18.dragOrientation = v23;
            v18.updateDraggedPosition(v22);
            return;
        end;
    end;
    v18.disconnectMouseMoveInputObject = function() --[[ Line: 77 ]]
        -- upvalues: v18 (copy)
        if v18.mouseMoveInputObjectConnection then
            v18.mouseMoveInputObjectConnection:Disconnect();
            v18.mouseMoveInputObjectConnection = nil;
        end;
    end;
    v18.setDraggingState = function(v24) --[[ Line: 84 ]]
        -- upvalues: v18 (copy)
        v18.dragging = v24;
        v18:setState({
            dragging = v24
        });
    end;
    v18.setDraggingState(false);
    v18.onDragBegin = function(v25, v26, v27, v28) --[[ Line: 93 ]]
        -- upvalues: v18 (copy), v5 (ref)
        v18.obj = v25;
        v18.draggerHandlingMovement = true;
        v18.dragOrientation = v26;
        v18.mousePosition = v27;
        v18.draggerPosition = v28;
        v18.setDraggingState(true);
        v5.setLocked(v18.props.Mouse, true);
        local l_lastMouseMoveInputObject_0 = v18.lastMouseMoveInputObject;
        if l_lastMouseMoveInputObject_0 ~= nil then
            v18.disconnectMouseMoveInputObject();
            v18.mouseMoveInputObjectConnection = l_lastMouseMoveInputObject_0:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 109 ]]
                -- upvalues: v18 (ref), l_lastMouseMoveInputObject_0 (copy), v26 (copy)
                if v18.dragging then
                    v18.onDragging(l_lastMouseMoveInputObject_0.Position, v26);
                end;
            end);
        end;
    end;
    v18.onDragEnd = function(v30, _) --[[ Line: 117 ]]
        -- upvalues: v18 (copy), v13 (ref), v14 (ref), v15 (ref), v16 (ref), v5 (ref)
        local l_sliceRect_1 = v18.props.sliceRect;
        local l_pixelDimensions_1 = v18.props.pixelDimensions;
        if v30.UserInputType == Enum.UserInputType.MouseButton1 then
            local v34 = nil;
            if v18.dragOrientation == v13 then
                v34 = {
                    math.round(v18.leftPos * l_pixelDimensions_1.X), 
                    l_sliceRect_1[v14], 
                    l_sliceRect_1[v15], 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v14 then
                local v35 = math.round(v18.rightPos * l_pixelDimensions_1.X);
                v34 = {
                    l_sliceRect_1[v13], 
                    v35, 
                    l_sliceRect_1[v15], 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v15 then
                local v36 = math.round(v18.topPos * l_pixelDimensions_1.Y);
                v34 = {
                    l_sliceRect_1[v13], 
                    l_sliceRect_1[v14], 
                    v36, 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v16 then
                local v37 = math.round(v18.bottomPos * l_pixelDimensions_1.Y);
                v34 = {
                    l_sliceRect_1[v13], 
                    l_sliceRect_1[v14], 
                    l_sliceRect_1[v15], 
                    v37
                };
            end;
            if v34 then
                v18.props.setSliceRect(v34, true);
            end;
            v18.disconnectMouseMoveInputObject();
            v18.setDraggingState(false);
            v18.uncertainDragStarted = false;
            v18.updateHoverDragger();
            v5.setLocked(v18.props.Mouse, false);
        end;
        v18.draggerHandlingMovement = false;
    end;
    v18.priorityDragCandidates = {};
    v18.getBestPriorityDragCandidate = function() --[[ Line: 153 ]]
        -- upvalues: v18 (copy)
        local v38 = nil;
        local v39 = nil;
        for _, v41 in pairs(v18.priorityDragCandidates) do
            if v38 == nil or v38 < v41.priority then
                v38 = v41.priority;
                v39 = v41;
            end;
        end;
        return v39;
    end;
    v18.uncertainDragCandidates = {};
    v18.getBestUncertainDragCandidate = function() --[[ Line: 168 ]]
        -- upvalues: v18 (copy)
        local v42 = nil;
        for _, v44 in pairs(v18.uncertainDragCandidates) do
            if v42 == nil or v42 < v44.priority then
                v42 = v44.priority;
            end;
        end;
        local v45 = nil;
        local v46 = nil;
        for _, v48 in pairs(v18.uncertainDragCandidates) do
            if v48.priority == v42 and (v45 == nil or v48.distance < v45) then
                v45 = v48.distance;
                v46 = v48;
            end;
        end;
        return v46;
    end;
    v18.uncertainDragStarted = false;
    v18.startUncertainDrag = function(v49) --[[ Line: 189 ]]
        -- upvalues: v18 (copy)
        if v18.uncertainDragStarted then
            return;
        else
            v18.uncertainDragStarted = true;
            local v50 = v18.getBestUncertainDragCandidate();
            if v50 then
                local l_instance_0 = v50.instance;
                local v52 = Vector2.new(l_instance_0.Position.X.Scale, l_instance_0.Position.Y.Scale);
                v18.onDragBegin(l_instance_0, v50.orientation, v49, v52);
                v18.draggerHandlingMovement = false;
            end;
            return;
        end;
    end;
    v18.priorityHoverOrientation = nil;
    v18.updateHoverDragger = function(_, _) --[[ Line: 205 ]]
        -- upvalues: v18 (copy), v13 (ref), v14 (ref), v5 (ref), v3 (ref), v15 (ref), v16 (ref)
        if v18.dragging then
            return;
        else
            local v55 = -1;
            local v56 = v18.getBestPriorityDragCandidate();
            if v56 then
                v55 = v56.orientation;
            else
                local v57 = v18.getBestUncertainDragCandidate();
                if v57 then
                    v55 = v57.orientation;
                end;
            end;
            v18:setState({
                hoveringDraggerOrientation = v55
            });
            if v55 == v13 or v55 == v14 then
                v5.setCursor(v18.props.Mouse, v3.MOUSE_CURSORS.EW);
            elseif v55 == v15 or v55 == v16 then
                v5.setCursor(v18.props.Mouse, v3.MOUSE_CURSORS.NS);
            end;
            if v55 == -1 then
                v5.resetCursor(v18.props.Mouse);
            end;
            return;
        end;
    end;
    v18.addDragCandidateWithId = function(v58, v59, v60, v61, v62) --[[ Line: 237 ]]
        -- upvalues: v18 (copy)
        v18.uncertainDragCandidates[v58] = {
            distance = v60, 
            instance = v61, 
            orientation = v59, 
            priority = v62 or 0
        };
        v18.updateHoverDragger();
    end;
    v18.removeDragCandidateWithId = function(v63) --[[ Line: 247 ]]
        -- upvalues: v18 (copy)
        v18.uncertainDragCandidates[v63] = nil;
        v18.updateHoverDragger();
    end;
    v18.onBackgroundInputChanged = function(_, v65) --[[ Line: 252 ]]
        -- upvalues: v18 (copy)
        if v18.dragging and v65.UserInputType == Enum.UserInputType.MouseMovement then
            if v18.draggerHandlingMovement then
                return;
            else
                v18.updateDraggedPosition(v65.Position);
            end;
        end;
    end;
    v18.onBackgroundInputEnded = function(_, v67) --[[ Line: 265 ]]
        -- upvalues: v18 (copy)
        if v67.UserInputType == Enum.UserInputType.MouseButton1 and v18.uncertainDragStarted then
            v18.onDragEnd(v67, v18.dragOrientation);
        end;
    end;
    v18.updateDraggedPosition = function(v68) --[[ Line: 273 ]]
        -- upvalues: v18 (copy), v13 (ref), v14 (ref), v15 (ref), v16 (ref)
        local l_sliceRect_2 = v18.props.sliceRect;
        local v70 = Vector2.new(v68.X, v68.Y) - v18.mousePosition;
        local l_fitImageSize_0 = v18.state.fitImageSize;
        if not l_fitImageSize_0 then
            return;
        else
            v18.newPosition = v18.draggerPosition + v70 / l_fitImageSize_0;
            local l_pixelDimensions_2 = v18.props.pixelDimensions;
            if v18.dragOrientation == v13 then
                local v73 = l_sliceRect_2[v14] / l_pixelDimensions_2.X;
                v18.leftPos = math.clamp(v18.newPosition.X, 0, v73);
                v18.obj.Position = UDim2.fromScale(v18.leftPos, v18.obj.Position.Y.Scale);
                return;
            elseif v18.dragOrientation == v14 then
                local v74 = l_sliceRect_2[v13] / l_pixelDimensions_2.X;
                v18.rightPos = math.clamp(v18.newPosition.X, v74, 1);
                v18.obj.Position = UDim2.fromScale(v18.rightPos, v18.obj.Position.Y.Scale);
                return;
            elseif v18.dragOrientation == v15 then
                local v75 = l_sliceRect_2[v16] / l_pixelDimensions_2.Y;
                v18.topPos = math.clamp(v18.newPosition.Y, 0, v75);
                v18.obj.Position = UDim2.fromScale(v18.obj.Position.X.Scale, v18.topPos);
                return;
            else
                if v18.dragOrientation == v16 then
                    local v76 = l_sliceRect_2[v15] / l_pixelDimensions_2.Y;
                    v18.bottomPos = math.clamp(v18.newPosition.Y, v76, 1);
                    v18.obj.Position = UDim2.fromScale(v18.obj.Position.X.Scale, v18.bottomPos);
                end;
                return;
            end;
        end;
    end;
    v18.addPriorityDragCandidate = function(v77, v78, v79) --[[ Line: 305 ]]
        -- upvalues: v18 (copy)
        v18.priorityDragCandidates[v77] = {
            priority = v78, 
            instance = v79, 
            orientation = v77
        };
        v18.updateHoverDragger();
    end;
    v18.removePriorityDragCandidate = function(v80) --[[ Line: 314 ]]
        -- upvalues: v18 (copy)
        v18.priorityDragCandidates[v80] = nil;
        v18.updateHoverDragger();
    end;
    v18.setMostRecentMouseMoveInputObject = function(v81) --[[ Line: 319 ]]
        -- upvalues: v18 (copy)
        v18.lastMouseMoveInputObject = v81;
    end;
    v18.onFitImageSizeChanged = function(v82) --[[ Line: 323 ]]
        -- upvalues: v18 (copy)
        local l_pixelDimensions_3 = v18.props.pixelDimensions;
        local v84 = false;
        if l_pixelDimensions_3 then
            v84 = v82.AbsoluteSize.X > l_pixelDimensions_3.X;
        end;
        v18:setState({
            fitImageSize = v82.AbsoluteSize, 
            isEnlarged = v84
        });
    end;
end;
v12.createDragger = function(v85, v86) --[[ Line: 338 ]] --[[ Name: createDragger ]]
    -- upvalues: v1 (copy), v6 (copy)
    return v1.createElement(v6, {
        orientation = v86, 
        pixelDimensions = v85.props.pixelDimensions, 
        sliceRect = v85.props.sliceRect, 
        onDragBegin = v85.onDragBegin, 
        onDragging = v85.onDragging, 
        onDragEnd = v85.onDragEnd, 
        addDragCandidateWithId = v85.addDragCandidateWithId, 
        removeDragCandidateWithId = v85.removeDragCandidateWithId, 
        isHovering = v85.state.hoveringDraggerOrientation == v86, 
        isDragging = v85.state.dragging, 
        addPriorityDragCandidate = v85.addPriorityDragCandidate, 
        removePriorityDragCandidate = v85.removePriorityDragCandidate, 
        startUncertainDrag = v85.startUncertainDrag, 
        setMostRecentMouseMoveInputObject = v85.setMostRecentMouseMoveInputObject
    });
end;
v12.didMount = function(v87) --[[ Line: 358 ]] --[[ Name: didMount ]]
    v87.onFitImageSizeChanged(v87.backgroundImageRef:getValue());
end;
v12.render = function(v88) --[[ Line: 362 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v3 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy)
    local l_props_0 = v88.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_selectedObject_0 = l_props_0.selectedObject;
    local l_pixelDimensions_4 = l_props_0.pixelDimensions;
    assert(l_selectedObject_0);
    assert(l_pixelDimensions_4);
    local v93 = false;
    if l_pixelDimensions_4.X > 0 then
        v93 = l_pixelDimensions_4.Y > 0;
    end;
    assert(v93);
    local v94 = v88.state.isEnlarged and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default;
    v93 = l_pixelDimensions_4.X / l_pixelDimensions_4.Y;
    return v1.createElement(l_Pane_0, {
        Position = l_props_0.position, 
        Size = l_props_0.size, 
        Style = "RoundBox", 
        BackgroundColor = l_Stylizer_0.PaneBackgroundColor, 
        Padding = v3.IMAGE_PREVIEW_WINDOW_PADDING
    }, {
        BackgroundCheckboardImage = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = v3.IMAGES.BACKGROUND_GRID, 
            ScaleType = Enum.ScaleType.Tile, 
            Size = UDim2.fromScale(1, 1), 
            TileSize = UDim2.fromOffset(v3.BACKGROUND_TILE_SIZE, v3.BACKGROUND_TILE_SIZE), 
            [v1.Event.InputChanged] = v88.onBackgroundInputChanged, 
            [v1.Event.InputEnded] = v88.onBackgroundInputEnded, 
            LayoutOrder = l_props_0.layoutOrder, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            [v1.Change.AbsoluteSize] = v88.onFitImageSizeChanged, 
            [v1.Ref] = v88.backgroundImageRef
        }, {
            AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = v93, 
                AspectType = Enum.AspectType.FitWithinMaxSize, 
                DominantAxis = Enum.DominantAxis.Width
            }), 
            ImagePreview = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_selectedObject_0.Image, 
                ImageColor3 = l_props_0.imageColor3, 
                Position = UDim2.fromScale(0, 0), 
                ScaleType = Enum.ScaleType.Fit, 
                ResampleMode = v94, 
                ImageRectOffset = l_props_0.imageRectOffset, 
                ImageRectSize = l_props_0.imageRectSize, 
                Size = UDim2.fromScale(1, 1)
            }, {
                LeftDragSlider = v88:createDragger(v13), 
                RightDragSlider = v88:createDragger(v14), 
                TopDragSlider = v88:createDragger(v15), 
                BottomDragSlider = v88:createDragger(v16)
            }), 
            border = v1.createElement("UIStroke", {
                Thickness = 1, 
                Color = l_Stylizer_0.PaneBorderColor, 
                Transparency = 0
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v12));