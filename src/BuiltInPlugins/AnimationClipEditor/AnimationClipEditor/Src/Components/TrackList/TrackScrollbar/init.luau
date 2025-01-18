local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v3.UI.DragListener;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ArrowButton);
local v8 = v1.PureComponent:extend("TrackScrollbar");
v8.init = function(v9) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v9.scrollArea = v1.createRef();
    v9.state = {
        dragging = false, 
        hovering = false
    };
    v9.onDragStarted = function() --[[ Line: 36 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            dragging = true
        });
    end;
    v9.onDragEnded = function() --[[ Line: 42 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            dragging = false
        });
    end;
    v9.mouseEnter = function() --[[ Line: 48 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            hovering = true
        });
    end;
    v9.mouseLeave = function() --[[ Line: 54 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            hovering = false
        });
    end;
    v9.scroll = function(v10) --[[ Line: 60 ]]
        -- upvalues: v9 (copy)
        local l_props_0 = v9.props;
        local l_current_0 = v9.scrollArea.current;
        local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
        local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
        local v15 = (v10.Position.Y - l_AbsolutePosition_0.Y) / l_AbsoluteSize_0.Y * l_props_0.NumTracks;
        l_props_0.SetTopTrackIndex((math.floor(v15 + 0.5)));
    end;
end;
v8.render = function(v16) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy), l_DragListener_0 (copy)
    local l_props_1 = v16.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_0 = v16.state;
    local l_Size_0 = l_props_1.Size;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local l_Position_0 = l_props_1.Position;
    local l_TopTrackIndex_0 = l_props_1.TopTrackIndex;
    local l_NumTracks_0 = l_props_1.NumTracks;
    local l_dragging_0 = l_state_0.dragging;
    local l_hovering_0 = l_state_0.hovering;
    local l_scrollBarTheme_0 = l_Stylizer_0.scrollBarTheme;
    local v28 = l_TopTrackIndex_0 and l_NumTracks_0 > 1;
    local v29 = nil;
    v29 = if l_dragging_0 then l_scrollBarTheme_0.pressedColor else if l_hovering_0 then l_scrollBarTheme_0.hoverColor else l_scrollBarTheme_0.controlColor;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundColor3 = l_scrollBarTheme_0.backgroundColor, 
        BorderColor3 = l_scrollBarTheme_0.borderColor
    }, {
        ScrollArea = v1.createElement("Frame", {
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(1, 0, 1, -v2.SCROLL_BAR_SIZE * 2 - v2.SCROLL_BAR_PADDING), 
            BackgroundTransparency = 1, 
            [v1.Change.AbsoluteSize] = v16.recalculateExtents, 
            [v1.Ref] = v16.scrollArea, 
            [v1.Event.InputBegan] = function(_, v31) --[[ Line: 113 ]]
                -- upvalues: v16 (copy), l_props_1 (copy)
                if v31.UserInputType == Enum.UserInputType.MouseButton1 then
                    v16.scroll(v31);
                    return;
                else
                    if v31.UserInputType == Enum.UserInputType.MouseWheel then
                        l_props_1.OnScroll(v31.Position.Z);
                    end;
                    return;
                end;
            end, 
            [v1.Event.InputChanged] = function(_, v33) --[[ Line: 120 ]]
                -- upvalues: l_props_1 (copy)
                if v33.UserInputType == Enum.UserInputType.MouseWheel then
                    l_props_1.OnScroll(v33.Position.Z);
                end;
            end
        }, {
            ScrollBar = v28 and v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1 / l_NumTracks_0, 0), 
                Position = UDim2.new(0, 0, (l_TopTrackIndex_0 - 1) / l_NumTracks_0, 0), 
                BorderSizePixel = 1, 
                BorderColor3 = l_scrollBarTheme_0.borderColor, 
                BackgroundColor3 = v29, 
                [v1.Event.MouseEnter] = v16.mouseEnter, 
                [v1.Event.mouseLeave] = v16.mouseLeave, 
                [v1.Event.InputBegan] = function(_, v35) --[[ Line: 135 ]]
                    -- upvalues: v16 (copy)
                    if v35.UserInputType == Enum.UserInputType.MouseButton1 then
                        v16.onDragStarted();
                    end;
                end
            })
        }), 
        UpButton = v28 and v1.createElement(v7, {
            Rotation = 0, 
            OnActivated = function() --[[ Line: 145 ]] --[[ Name: OnActivated ]]
                -- upvalues: l_props_1 (copy), l_TopTrackIndex_0 (copy)
                l_props_1.SetTopTrackIndex(l_TopTrackIndex_0 - 1);
            end
        }), 
        DownButton = v28 and v1.createElement(v7, {
            Rotation = 180, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            OnActivated = function() --[[ Line: 154 ]] --[[ Name: OnActivated ]]
                -- upvalues: l_props_1 (copy), l_TopTrackIndex_0 (copy)
                l_props_1.SetTopTrackIndex(l_TopTrackIndex_0 + 1);
            end
        }), 
        DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
            OnDragMoved = v16.scroll, 
            OnDragEnded = v16.onDragEnded
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));