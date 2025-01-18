local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v3.UI.DragListener;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ArrowButton);
local v8 = v1.PureComponent:extend("WideScrollingFrame");
v8.init = function(v9) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v9.scrollArea = v1.createRef();
    v9.state = {
        CanvasPosition = Vector2.new(), 
        dragging = false, 
        mouseXOffset = 0, 
        hovering = false
    };
    v9.onSizeChanged = function(v10) --[[ Line: 41 ]]
        -- upvalues: v9 (copy)
        if v9.props.OnSizeChanged then
            v9.props.OnSizeChanged(v10);
        end;
    end;
    v9.onCanvasPositionChanged = function(v11) --[[ Line: 47 ]]
        -- upvalues: v9 (copy)
        if v11.CanvasPosition ~= v9.state.CanvasPosition then
            v9:setState({
                CanvasPosition = v11.CanvasPosition
            });
        end;
    end;
    v9.onDragStarted = function(v12, v13) --[[ Line: 55 ]]
        -- upvalues: v9 (copy)
        if v13.UserInputType == Enum.UserInputType.MouseButton1 then
            v9:setState({
                mouseXOffset = v13.Position.X - v12.AbsolutePosition.X, 
                dragging = true
            });
        end;
    end;
    v9.setCanvasPosition = function(v14) --[[ Line: 64 ]]
        -- upvalues: v9 (copy)
        local v15 = math.floor(v14 * v9.props.CanvasSize.X.Offset + 0.5);
        v9:setState({
            CanvasPosition = Vector2.new(v15, 0)
        });
    end;
    v9.onDragMoved = function(v16) --[[ Line: 73 ]]
        -- upvalues: v9 (copy)
        local l_mouseXOffset_0 = v9.state.mouseXOffset;
        local l_current_0 = v9.scrollArea.current;
        local v19 = math.clamp((v16.Position.X - l_current_0.AbsolutePosition.X - l_mouseXOffset_0) / l_current_0.AbsoluteSize.X, 0, 1);
        v9.setCanvasPosition(v19);
    end;
    v9.onDragEnded = function() --[[ Line: 82 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            dragging = false
        });
    end;
    v9.scroll = function(v20, v21) --[[ Line: 88 ]]
        -- upvalues: v9 (copy)
        local l_props_0 = v9.props;
        local l_Offset_0 = l_props_0.CanvasSize.X.Offset;
        local v24 = l_props_0.Width / l_Offset_0 * v20.AbsoluteSize.X;
        v9:setState({
            mouseXOffset = v24 / 2
        });
        v9.onDragMoved(v21);
    end;
    v9.mouseEnter = function() --[[ Line: 98 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            hovering = true
        });
    end;
    v9.mouseLeave = function() --[[ Line: 104 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            hovering = false
        });
    end;
end;
v8.render = function(v25) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy), l_DragListener_0 (copy)
    local l_props_1 = v25.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_0 = v25.state;
    local l_Size_0 = l_props_1.Size;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local l_Position_0 = l_props_1.Position;
    local l_CanvasSize_0 = l_props_1.CanvasSize;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local l_Width_0 = l_props_1.Width;
    local v36 = l_props_1.BackgroundTransparency or 0;
    local l_dragging_0 = l_state_0.dragging;
    local l_hovering_0 = l_state_0.hovering;
    local l_CanvasPosition_0 = l_state_0.CanvasPosition;
    local l_scrollBarTheme_0 = l_Stylizer_0.scrollBarTheme;
    local v41 = l_CanvasSize_0.X.Offset > 0 and l_CanvasSize_0.X.Offset or 1;
    local v42 = l_Width_0 < v41;
    local v43 = math.min(l_CanvasPosition_0.X, v41 - l_Width_0);
    local v44 = nil;
    v44 = if l_dragging_0 then l_scrollBarTheme_0.pressedColor else if l_hovering_0 then l_scrollBarTheme_0.hoverColor else l_scrollBarTheme_0.controlColor;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor, 
        BackgroundTransparency = v36, 
        ZIndex = l_ZIndex_0
    }, {
        Canvas = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -v2.SCROLL_BAR_SIZE), 
            CanvasSize = l_CanvasSize_0, 
            CanvasPosition = l_CanvasPosition_0, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            [v1.Change.AbsoluteSize] = v25.onSizeChanged, 
            [v1.Change.CanvasPosition] = v25.onCanvasPositionChanged, 
            [v1.Event.InputBegan] = l_props_1.OnInputChanged, 
            [v1.Event.InputChanged] = l_props_1.OnInputChanged
        }, l_props_1[v1.Children]), 
        Footer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.SCROLL_BAR_SIZE), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_scrollBarTheme_0.backgroundColor, 
            BorderColor3 = l_scrollBarTheme_0.borderColor
        }, {
            ScrollArea = v42 and v1.createElement("Frame", {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(1, -v2.SCROLL_BAR_SIZE * 2 - v2.SCROLL_BAR_PADDING, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Change.AbsoluteSize] = v25.recalculateExtents, 
                [v1.Ref] = v25.scrollArea, 
                [v1.Event.InputBegan] = function(v45, v46) --[[ Line: 181 ]]
                    -- upvalues: l_dragging_0 (copy), v25 (copy)
                    if not l_dragging_0 and v46.UserInputType == Enum.UserInputType.MouseButton1 then
                        v25.scroll(v45, v46);
                    end;
                end
            }, {
                ScrollBar = v1.createElement("Frame", {
                    Size = UDim2.new(l_Width_0 / v41, 0, 1, 0), 
                    Position = UDim2.new(v43 / v41, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v44, 
                    [v1.Event.MouseEnter] = v25.mouseEnter, 
                    [v1.Event.mouseLeave] = v25.mouseLeave, 
                    [v1.Event.InputBegan] = v25.onDragStarted
                })
            }), 
            LeftButton = v42 and v1.createElement(v7, {
                Rotation = 270, 
                OnActivated = function() --[[ Line: 201 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v25 (copy)
                    v25.setCanvasPosition(0);
                end
            }), 
            RightButton = v42 and v1.createElement(v7, {
                Rotation = 90, 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                OnActivated = function() --[[ Line: 210 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v25 (copy)
                    v25.setCanvasPosition(1);
                end
            }), 
            DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v25.onDragMoved, 
                OnDragEnded = v25.onDragEnded
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));