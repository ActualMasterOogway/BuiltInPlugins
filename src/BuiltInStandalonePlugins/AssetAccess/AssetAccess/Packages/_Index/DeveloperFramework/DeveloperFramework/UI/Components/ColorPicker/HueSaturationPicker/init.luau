local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = v1.PureComponent:extend("HueSaturationPicker");
v2.init = function(v3) --[[ Line: 24 ]] --[[ Name: init ]]
    v3:setState({
        MouseDown = false
    });
    v3.onMouseDown = function(_) --[[ Line: 29 ]]
        -- upvalues: v3 (copy)
        v3:setState({
            MouseDown = true
        });
    end;
    v3.onInputChanged = function(v5, v6) --[[ Line: 35 ]]
        -- upvalues: v3 (copy)
        if v3.state.MouseDown and v6.UserInputType == Enum.UserInputType.MouseMovement then
            local v7 = (Vector2.new(v6.Position.X, v6.Position.Y) - v5.AbsolutePosition) / v5.AbsoluteSize;
            v3.props.OnHueSaturationChanged(v7.x, 1 - v7.y);
        end;
    end;
    v3.onInputEnded = function(v8, v9) --[[ Line: 43 ]]
        -- upvalues: v3 (copy)
        if v9.UserInputType == Enum.UserInputType.MouseButton1 and v3.state.MouseDown then
            local l_X_0 = v9.Position.X;
            local l_Y_0 = v9.Position.Y;
            local v12 = (Vector2.new(l_X_0, l_Y_0) - v8.AbsolutePosition) / v8.AbsoluteSize;
            v12 = Vector2.new(math.clamp(v12.x, 0, 1), (math.clamp(v12.y, 0, 1)));
            v3:setState({
                MouseDown = false
            });
            v3.props.OnHueSaturationChanged(v12.x, 1 - v12.y);
        end;
    end;
end;
v2.render = function(v13) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v13.props;
    local l_HueSaturationPicker_0 = l_props_0.Style.HueSaturationPicker;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_HueSaturationPicker_0.Size, 
        Image = l_HueSaturationPicker_0.GradientImage, 
        BackgroundColor3 = l_HueSaturationPicker_0.Black, 
        AutoButtonColor = false, 
        ImageTransparency = 1 - l_props_0.Value, 
        [v1.Event.MouseButton1Down] = v13.onMouseDown, 
        [v1.Event.InputEnded] = v13.onInputEnded, 
        [v1.Event.InputChanged] = v13.onInputChanged
    }, {
        PositionIndicator = v1.createElement("ImageLabel", {
            Size = l_HueSaturationPicker_0.PositionIndicatorSize, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(l_props_0.Hue, 1 - l_props_0.Saturation), 
            AnchorPoint = l_HueSaturationPicker_0.PositionIndicatorAnchor, 
            Image = l_HueSaturationPicker_0.PositionIndicatorImage, 
            ImageColor3 = l_HueSaturationPicker_0.Black
        })
    });
end;
return v2;