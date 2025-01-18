local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v2.UI.DragListener;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ArrowButton);
local v8 = v1.PureComponent:extend("ZoomBar");
v8.HORIZONTAL = "Horizontal";
v8.VERTICAL = "Vertical";
v8.calculateScrollAndZoom = function(v9) --[[ Line: 28 ]] --[[ Name: calculateScrollAndZoom ]]
    local v10 = math.clamp(1 - (v9.MaxValue - v9.MinValue), 0, 1);
    local v11 = 0;
    if v10 > 0 then
        v11 = v9.MinValue / v10;
    end;
    if v9.props.AdjustScrollZoom then
        v9.props.AdjustScrollZoom(v11, v10);
    end;
end;
v8.getDraggableSize = function(v12) --[[ Line: 40 ]] --[[ Name: getDraggableSize ]]
    -- upvalues: v8 (ref), v3 (copy)
    if v12.props.Direction == v8.HORIZONTAL then
        return v12.props.ContainerSize.X - v3.SCROLL_BAR_PADDING - v3.SCROLL_BAR_SIZE * 4;
    else
        return v12.props.ContainerSize.Y - v3.SCROLL_BAR_PADDING - v3.SCROLL_BAR_SIZE * 4;
    end;
end;
v8.isDragging = function(v13) --[[ Line: 48 ]] --[[ Name: isDragging ]]
    return v13.state.Zooming or v13.state.Scrolling;
end;
v8.calculateMinAndMax = function(v14) --[[ Line: 52 ]] --[[ Name: calculateMinAndMax ]]
    local l_props_0 = v14.props;
    local v16 = l_props_0.Scroll or 0;
    local v17 = l_props_0.Zoom or 0;
    v14.MinValue = v16 * v17;
    v14.MaxValue = 1 - v17 + v16 * v17;
end;
v8.init = function(v18) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v8 (ref)
    v18.state = {
        Scrolling = false, 
        Zooming = false, 
        Hovering = false
    };
    v18.MinValue = 0;
    v18.MaxValue = 1;
    v18.updateMin = function(v19) --[[ Line: 70 ]]
        -- upvalues: v18 (copy), v3 (ref)
        v18.MinValue = math.clamp((v19 - v18.props.Min - v18.ClickOffset + v3.SCROLL_BAR_SIZE) / v18:getDraggableSize(), 0, v18.MaxValue);
    end;
    v18.updateMax = function(v20) --[[ Line: 76 ]]
        -- upvalues: v18 (copy)
        v18.MaxValue = math.clamp((v20 - v18.props.Min - v18.ClickOffset) / v18:getDraggableSize(), v18.MinValue, 1);
    end;
    v18.updateMiddle = function(v21) --[[ Line: 81 ]]
        -- upvalues: v18 (copy)
        local l_MinValue_0 = v18.MinValue;
        v18.MinValue = math.clamp(v21, 0, l_MinValue_0 + (1 - v18.MaxValue));
        v18.MaxValue = v18.MaxValue + (v18.MinValue - l_MinValue_0);
        v18:calculateScrollAndZoom();
    end;
    v18.dragMiddle = function(v23) --[[ Line: 89 ]]
        -- upvalues: v18 (copy)
        local v24 = (v23 - v18.props.Min - v18.ClickOffset) / v18:getDraggableSize();
        v18.updateMiddle(v24);
    end;
    v18.onZoomBegan = function(v25, v26, v27) --[[ Line: 94 ]]
        -- upvalues: v18 (copy), v8 (ref), v3 (ref)
        if Enum.UserInputType.MouseButton1 == v26.UserInputType then
            v18:setState({
                Zooming = true
            });
            if v18.props.Direction == v8.HORIZONTAL then
                v18.ClickOffset = v26.Position.X - v25.AbsolutePosition.X + v3.SCROLL_BAR_SIZE * 2;
            else
                v18.ClickOffset = v26.Position.Y - v25.AbsolutePosition.Y + v3.SCROLL_BAR_SIZE * 2;
            end;
            v18.ZoomFunc = v27;
        end;
    end;
    v18.onScrollBegan = function(v28, v29) --[[ Line: 108 ]]
        -- upvalues: v18 (copy), v8 (ref), v3 (ref)
        if Enum.UserInputType.MouseButton1 == v29.UserInputType then
            v18:setState({
                Scrolling = true
            });
            if v18.props.Direction == v8.HORIZONTAL then
                v18.ClickOffset = v29.Position.X - v28.AbsolutePosition.X + v3.SCROLL_BAR_SIZE * 2;
                return;
            else
                v18.ClickOffset = v29.Position.Y - v28.AbsolutePosition.Y + v3.SCROLL_BAR_SIZE * 2;
            end;
        end;
    end;
    v18.onInputChanged = function(v30) --[[ Line: 121 ]]
        -- upvalues: v18 (copy), v8 (ref)
        if v18:isDragging() then
            local v31 = v18.props.Direction == v8.HORIZONTAL and v30.Position.X or v30.Position.Y;
            if v18.state.Zooming then
                v18.ZoomFunc(v31);
                v18:calculateScrollAndZoom();
                return;
            elseif v18.state.Scrolling then
                v18.dragMiddle(v31);
            end;
        end;
    end;
    v18.onInputEnded = function() --[[ Line: 133 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            Zooming = false, 
            Scrolling = false
        });
    end;
    v18.mouseEnter = function() --[[ Line: 140 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            Hovering = true
        });
    end;
    v18.mouseLeave = function() --[[ Line: 146 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            Hovering = false
        });
    end;
end;
v8.render = function(v32) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v8 (ref), v1 (copy), l_DragListener_0 (copy), v7 (copy)
    local l_props_1 = v32.props;
    local l_state_0 = v32.state;
    local l_zoomBarTheme_0 = l_props_1.Stylizer.zoomBarTheme;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local l_Hovering_0 = l_state_0.Hovering;
    local v41 = v32:isDragging();
    if not v41 then
        v32:calculateMinAndMax();
    end;
    local v42 = v32.MinValue * v32:getDraggableSize() + v3.SCROLL_BAR_SIZE + 1;
    local v43 = v3.SCROLL_BAR_SIZE * 2 + v32.MaxValue * v32:getDraggableSize();
    local v44 = v42 + v3.SCROLL_BAR_SIZE;
    local v45 = v43 - v42 - v3.SCROLL_BAR_SIZE;
    local v46 = v32.props.Direction == v8.HORIZONTAL;
    local v47 = nil;
    v47 = if v41 then l_zoomBarTheme_0.pressedColor else if l_Hovering_0 then l_zoomBarTheme_0.hoverColor else l_zoomBarTheme_0.controlColor;
    return v1.createElement("ImageButton", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundColor3 = l_zoomBarTheme_0.backgroundColor, 
        BorderColor3 = l_zoomBarTheme_0.borderColor, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0, 
        AutoButtonColor = false, 
        ImageTransparency = 1, 
        [v1.Event.InputBegan] = function(_, v49) --[[ Line: 196 ]]
            -- upvalues: v32 (copy), v45 (copy), v3 (ref), v46 (copy)
            if not v32:isDragging() and v49.UserInputType == Enum.UserInputType.MouseButton1 then
                v32.ClickOffset = v45 / 2 + v3.SCROLL_BAR_SIZE * 2;
                v32.dragMiddle(v46 and v49.Position.X or v49.Position.Y);
            end;
        end
    }, {
        DragTarget = v32:isDragging() and v1.createElement(l_DragListener_0, {
            OnDragMoved = v32.onInputChanged, 
            OnDragEnded = v32.onInputEnded
        }), 
        MinZoomControl = v1.createElement("ImageLabel", {
            Position = v46 and UDim2.new(0, v42, 0, 0) or UDim2.new(0, 0, 0, v42), 
            Size = UDim2.new(0, v3.SCROLL_BAR_SIZE, 0, v3.SCROLL_BAR_SIZE), 
            BackgroundColor3 = l_zoomBarTheme_0.controlColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            Image = l_zoomBarTheme_0.controlImage, 
            Rotation = v46 and 0 or 90, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = l_zoomBarTheme_0.imageColor, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = function(v50, v51) --[[ Line: 219 ]]
                -- upvalues: v32 (copy)
                v32.onZoomBegan(v50, v51, v32.updateMin);
            end
        }), 
        ScrollControl = v1.createElement("Frame", {
            Position = v46 and UDim2.new(0, v44, 0, 0) or UDim2.new(0, 0, 0, v44), 
            Size = v46 and UDim2.new(0, v45, 1, 0) or UDim2.new(1, 0, 0, v45), 
            BackgroundColor3 = v47, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = v32.onScrollBegan, 
            [v1.Event.MouseEnter] = v32.mouseEnter, 
            [v1.Event.MouseLeave] = v32.mouseLeave
        }), 
        MaxZoomControl = v1.createElement("ImageLabel", {
            Position = v46 and UDim2.new(0, v43, 0, 0) or UDim2.new(0, 0, 0, v43), 
            Size = UDim2.new(0, v3.SCROLL_BAR_SIZE, 0, v3.SCROLL_BAR_SIZE), 
            BackgroundColor3 = l_zoomBarTheme_0.controlColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            Image = l_zoomBarTheme_0.controlImage, 
            Rotation = v46 and 0 or 90, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = l_zoomBarTheme_0.imageColor, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = function(v52, v53) --[[ Line: 248 ]]
                -- upvalues: v32 (copy)
                v32.onZoomBegan(v52, v53, v32.updateMax);
            end
        }), 
        MinButton = v1.createElement(v7, {
            Rotation = v46 and 270 or 0, 
            OnActivated = function() --[[ Line: 255 ]] --[[ Name: OnActivated ]]
                -- upvalues: v32 (copy), v3 (ref)
                v32.updateMiddle(v32.MinValue - v3.ZOOM_INCREMENT);
            end
        }), 
        MaxButton = v1.createElement(v7, {
            Rotation = v46 and 90 or 180, 
            Position = v46 and UDim2.new(1, 0, 0, 0) or UDim2.new(0, 0, 1, 0), 
            AnchorPoint = v46 and Vector2.new(1, 0) or Vector2.new(0, 1), 
            OnActivated = function() --[[ Line: 264 ]] --[[ Name: OnActivated ]]
                -- upvalues: v32 (copy), v3 (ref)
                v32.updateMiddle(v32.MinValue + v3.ZOOM_INCREMENT);
            end
        })
    });
end;
v8 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8);
return v8;