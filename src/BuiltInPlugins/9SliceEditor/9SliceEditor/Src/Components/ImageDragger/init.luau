local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = v1.PureComponent:extend("ImageDragger");
local v10 = v4.Left.rawValue();
local v11 = v4.Right.rawValue();
local v12 = v4.Top.rawValue();
local v13 = v4.Bottom.rawValue();
local v14 = {
    [v10] = 1, 
    [v11] = 2, 
    [v12] = 3, 
    [v13] = 4
};
v9.init = function(v15, v16) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy), v11 (copy), v13 (copy), v10 (copy), v12 (copy), v14 (copy)
    v15:setState({
        dragging = false
    });
    v15.draggerInstanceRef = v1.createRef();
    v15.selectionPriority = 0;
    v15.onInputBegan = function(v17, v18) --[[ Line: 48 ]]
        -- upvalues: v15 (copy), v16 (copy)
        local l_orientation_0 = v15.props.orientation;
        if v18.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = true
            });
            local v20 = Vector2.new(v18.Position.X, v18.Position.Y);
            local v21 = Vector2.new(v17.Position.X.Scale, v17.Position.Y.Scale);
            v16.onDragBegin(v17, l_orientation_0, v20, v21);
            return;
        else
            if v18.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.addPriorityDragCandidate(l_orientation_0, v17.ZIndex, v17);
                v15.props.setMostRecentMouseMoveInputObject(v18);
            end;
            return;
        end;
    end;
    v15.onHandleInputChanged = function(v22, v23) --[[ Line: 65 ]]
        -- upvalues: v15 (copy), v3 (ref), v11 (ref), v13 (ref), v10 (ref), v12 (ref)
        local v24 = nil;
        local l_orientation_1 = v15.props.orientation;
        local v26 = v15.draggerInstanceRef:getValue();
        local l_DRAGGER_WIDTH_0 = v3.DRAGGER_WIDTH;
        local v28 = 0;
        l_DRAGGER_WIDTH_0 = v3.DRAGGER_CLICK_WINDOW_WIDTH;
        v28 = (not (l_orientation_1 ~= v11) or l_orientation_1 == v13) and 0.01 or 0;
        if l_orientation_1 == v10 or l_orientation_1 == v11 then
            v24 = math.abs(v26.AbsolutePosition.X + v28 + l_DRAGGER_WIDTH_0 / 2 - v23.Position.X);
        elseif l_orientation_1 == v12 or l_orientation_1 == v13 then
            v24 = math.abs(v26.AbsolutePosition.Y + v28 + l_DRAGGER_WIDTH_0 / 2 - v23.Position.Y);
        end;
        v15.props.addDragCandidateWithId(v22, v15.props.orientation, v24, v26, v15.selectionPriority);
    end;
    v15.onInputBeganOnLowPriorityHandles = function(v29, v30) --[[ Line: 93 ]]
        -- upvalues: v15 (copy)
        if v30.UserInputType == Enum.UserInputType.MouseButton1 then
            local v31 = Vector2.new(v30.Position.X, v30.Position.Y);
            v15.props.startUncertainDrag(v31);
            return;
        else
            if v30.UserInputType == Enum.UserInputType.MouseMovement then
                v15.onHandleInputChanged(v29, v30);
                v15.props.setMostRecentMouseMoveInputObject(v30);
            end;
            return;
        end;
    end;
    v15.onInputChanged = function(_, v33) --[[ Line: 103 ]]
        -- upvalues: v15 (copy), v16 (copy)
        local l_orientation_2 = v15.props.orientation;
        if v15.state.dragging and v33.UserInputType == Enum.UserInputType.MouseMovement then
            local v35 = Vector2.new(v33.Position.X, v33.Position.Y);
            v16.onDragging(v35, l_orientation_2);
        end;
    end;
    v15.onInputEnded = function(_, v37) --[[ Line: 112 ]]
        -- upvalues: v15 (copy), v16 (copy)
        local l_orientation_3 = v15.props.orientation;
        v16.onDragEnd(v37, l_orientation_3);
        if v37.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = false
            });
            return;
        else
            if v37.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.removePriorityDragCandidate(l_orientation_3);
            end;
            return;
        end;
    end;
    v15.onHandleInputEnded = function(v39, v40) --[[ Line: 125 ]]
        -- upvalues: v15 (copy), v16 (copy)
        local l_orientation_4 = v15.props.orientation;
        v16.onDragEnd(v40, l_orientation_4);
        if v40.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = false
            });
            return;
        else
            if v40.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.removeDragCandidateWithId(v39);
            end;
            return;
        end;
    end;
    v15.onInputBeganOnPriorityHandles = function(_, _) --[[ Line: 137 ]]
        -- upvalues: v15 (copy), v14 (ref)
        v15.selectionPriority = v14[v15.props.orientation];
    end;
    v15.onInputEndedOnPriorityHandles = function(_, _) --[[ Line: 141 ]]
        -- upvalues: v15 (copy)
        v15.selectionPriority = 0;
    end;
end;
v9.render = function(v46) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v11 (copy), v3 (copy), v12 (copy), v13 (copy), v1 (copy), v14 (copy)
    local l_props_0 = v46.props;
    local l_sliceRect_0 = l_props_0.sliceRect;
    local l_pixelDimensions_0 = l_props_0.pixelDimensions;
    local l_orientation_5 = l_props_0.orientation;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_isHovering_0 = l_props_0.isHovering;
    local v53 = l_isHovering_0 and not l_props_0.isDragging;
    local v54 = math.round(l_sliceRect_0[l_orientation_5]);
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if l_orientation_5 == v10 or l_orientation_5 == v11 then
        local v64 = math.clamp(v54 / l_pixelDimensions_0.X, 0, 1);
        v56 = UDim2.fromScale(v64, 0.5);
        v60 = l_Stylizer_0.EdgeHandleSize;
        local v65 = nil;
        if l_orientation_5 == v10 then
            v65 = v3.IMAGES.DRAGGER_V2.LEFT;
            v63 = UDim2.fromOffset(v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_WIDTH_V2 + v3.DRAGGER_CENTER_INSETPX, 0);
        elseif l_orientation_5 == v11 then
            v65 = v3.IMAGES.DRAGGER_V2.RIGHT;
            v63 = UDim2.fromOffset(v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_CENTER_INSETPX, 0);
        end;
        v58 = UDim2.new(0.5, 0, 0, l_Stylizer_0.EdgeHandleInsetPx);
        v59 = UDim2.new(0.5, 0, 1, -l_Stylizer_0.EdgeHandleInsetPx);
        v55 = v53 and v65.OUTLINED or v65.NORMAL;
        v62 = Rect.new(0, 8, 8, 8);
        v57 = UDim2.new(0, v3.DRAGGER_WIDTH_V2, 1, 0);
        v61 = UDim2.new(0, v3.DRAGGER_CLICK_WINDOW_WIDTH, 1, v3.DRAGGER_HANDLE_SIZE * 2);
    elseif l_orientation_5 == v12 or l_orientation_5 == v13 then
        local v66 = math.clamp(v54 / l_pixelDimensions_0.Y, 0, 1);
        v55 = v3.IMAGES.HORIZONTAL_DRAGGER;
        v56 = UDim2.fromScale(0.5, v66);
        v60 = UDim2.new(l_Stylizer_0.EdgeHandleSize.Y, l_Stylizer_0.EdgeHandleSize.X);
        local v67 = nil;
        if l_orientation_5 == v12 then
            v67 = v3.IMAGES.DRAGGER_V2.TOP;
            v63 = UDim2.fromOffset(0, v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_WIDTH_V2 + v3.DRAGGER_CENTER_INSETPX);
        elseif l_orientation_5 == v13 then
            v67 = v3.IMAGES.DRAGGER_V2.BOTTOM;
            v63 = UDim2.fromOffset(0, v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_CENTER_INSETPX);
        end;
        v58 = UDim2.new(0, l_Stylizer_0.EdgeHandleInsetPx, 0.5, 0);
        v59 = UDim2.new(1, -l_Stylizer_0.EdgeHandleInsetPx, 0.5, 0);
        v55 = v53 and v67.OUTLINED or v67.NORMAL;
        v62 = Rect.new(8, 0, 8, 8);
        v57 = UDim2.new(1, 0, 0, v3.DRAGGER_WIDTH_V2);
        v61 = UDim2.new(1, v3.DRAGGER_HANDLE_SIZE * 2, 0, v3.DRAGGER_CLICK_WINDOW_WIDTH);
    end;
    local v68 = Color3.fromRGB(255, 131, 131);
    local v69 = Color3.fromRGB(255, 0, 0);
    local v70 = Color3.fromRGB(210, 0, 0);
    local v71 = l_isHovering_0 and l_props_0.isDragging;
    local v72 = v53 and v68 or v71 and v70 or v69;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v56, 
        Size = v61, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 1), 
        [v1.Event.InputBegan] = v46.onInputBeganOnLowPriorityHandles, 
        [v1.Event.InputChanged] = v46.onHandleInputChanged, 
        [v1.Event.InputEnded] = v46.onHandleInputEnded, 
        [v1.Ref] = v46.draggerInstanceRef
    }, {
        Image = v1.createElement("ImageLabel", {
            Position = v63, 
            BackgroundTransparency = 1, 
            Image = v55, 
            Size = v57, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v62, 
            BorderSizePixel = 0, 
            ImageColor3 = v72, 
            ZIndex = 5 + v14[l_orientation_5] + (l_isHovering_0 and 100 or 0), 
            [v1.Event.InputBegan] = v46.onInputBeganOnPriorityHandles, 
            [v1.Event.InputEnded] = v46.onInputEndedOnPriorityHandles
        }, {
            Handle1 = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = v58, 
                Size = v60, 
                BorderSizePixel = 0, 
                ZIndex = 1 + v14[l_orientation_5], 
                BackgroundColor3 = Color3.new(0, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Event.InputBegan] = v46.onInputBeganOnLowPriorityHandles, 
                [v1.Event.InputChanged] = v46.onHandleInputChanged, 
                [v1.Event.InputEnded] = v46.onHandleInputEnded
            }), 
            Handle2 = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = v59, 
                Size = v60, 
                BorderSizePixel = 0, 
                ZIndex = 1 + v14[l_orientation_5], 
                BackgroundColor3 = Color3.new(0, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Event.InputBegan] = v46.onInputBeganOnLowPriorityHandles, 
                [v1.Event.InputChanged] = v46.onHandleInputChanged, 
                [v1.Event.InputEnded] = v46.onHandleInputEnded
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v9));