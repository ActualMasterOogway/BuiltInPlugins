local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v8 = v2.PureComponent:extend("PopUpFrame");
v8.init = function(v9) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v9.ref = v2.createRef();
    v9.state = {
        position = UDim2.new(), 
        closeHovered = false
    };
    v9.onMouseEnter = function() --[[ Line: 24 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            closeHovered = true
        });
    end;
    v9.onMouseLeave = function() --[[ Line: 30 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            closeHovered = false
        });
    end;
    v9.reposition = function() --[[ Line: 36 ]]
        -- upvalues: v9 (copy)
        if v9.ref.current == nil then
            return;
        else
            v9:setState({
                position = v9.getPosition()
            });
            return;
        end;
    end;
    v9.getPosition = function() --[[ Line: 47 ]]
        -- upvalues: v9 (copy)
        local l_props_0 = v9.props;
        local l_ExpandedHeight_0 = l_props_0.ExpandedHeight;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_current_0 = v9.ref.current;
        local v14 = Vector2.new();
        local v15 = Vector2.new();
        if l_current_0 then
            v14 = l_current_0.parent.AbsolutePosition;
            v15 = l_current_0.parent.AbsoluteSize;
        end;
        local l_X_0 = v14.X;
        local v17 = v14.Y - (l_ExpandedHeight_0 + l_Stylizer_0.TopBarHeight) + v15.Y;
        return UDim2.fromOffset(l_X_0, v17);
    end;
    v9.changeTokens = {};
end;
v8.didUpdate = function(v18, v19) --[[ Line: 69 ]] --[[ Name: didUpdate ]]
    if v18.props.Hide ~= v19.Hide then
        if not v18.props.Hide then
            v18.reposition();
        end;
        v18:setState({
            closeHovered = false
        });
    end;
end;
v8.didMount = function(v20) --[[ Line: 80 ]] --[[ Name: didMount ]]
    local l_Parent_0 = v20.ref.current.Parent;
    table.insert(v20.changeTokens, l_Parent_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v20.reposition));
    table.insert(v20.changeTokens, l_Parent_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v20.reposition));
end;
v8.willUnmount = function(v22) --[[ Line: 86 ]] --[[ Name: willUnmount ]]
    for _, v24 in ipairs(v22.changeTokens) do
        v24:Disconnect();
    end;
end;
v8.renderTopBar = function(v25, v26) --[[ Line: 92 ]] --[[ Name: renderTopBar ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy)
    local l_state_0 = v25.state;
    local l_props_1 = v25.props;
    local l_closeHovered_0 = l_state_0.closeHovered;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Size_0 = l_Stylizer_1.Arrow.Size;
    return v2.createElement(l_Pane_0, {
        BackgroundColor3 = l_Stylizer_1.TopBarColor, 
        BorderSizePixel = 0, 
        LayoutOrder = v26, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.TopBarHeight), 
        Padding = l_Stylizer_1.TopBarPadding, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        CloseButton = v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
            ImageColor3 = if l_closeHovered_0 then l_Stylizer_1.Arrow.HoverColor else l_Stylizer_1.Arrow.Color, 
            Image = l_Stylizer_1.Arrow.Image, 
            ImageRectOffset = l_Stylizer_1.Arrow.Offset, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            [v2.Event.MouseButton1Click] = l_props_1.OnFocusLost, 
            [v2.Event.MouseEnter] = v25.onMouseEnter, 
            [v2.Event.MouseLeave] = v25.onMouseLeave
        })
    });
end;
v8.renderFrame = function(v32) --[[ Line: 125 ]] --[[ Name: renderFrame ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy)
    local l_state_1 = v32.state;
    local l_props_2 = v32.props;
    local l_Stylizer_2 = l_props_2.Stylizer;
    local l_position_0 = l_state_1.position;
    local v37 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Position = l_position_0, 
        Size = UDim2.new(1, 0, 0, l_props_2.ExpandedHeight + l_Stylizer_2.TopBarHeight), 
        BackgroundColor3 = l_Stylizer_2.BackgroundColor, 
        BorderSizePixel = 0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TopBar = v32:renderTopBar(v37:getNextOrder()), 
        Content = l_props_2.RenderContent(v37:getNextOrder())
    });
end;
v8.render = function(v38) --[[ Line: 148 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_CaptureFocus_0 (copy)
    local l_props_3 = v38.props;
    local v40 = not l_props_3.Hide;
    return v2.createElement(l_Pane_0, {
        ForwardRef = v38.ref, 
        Size = UDim2.fromScale(1, 0)
    }, {
        PortalToRoot = v40 and v2.createElement(l_CaptureFocus_0, {
            OnFocusLost = l_props_3.OnFocusLost
        }, {
            Frame = v40 and v38:renderFrame()
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));