local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v2.Style.Stylizer;
local v7 = v1.PureComponent:extend("HueSaturationPicker");
v7.init = function(v8) --[[ Line: 35 ]] --[[ Name: init ]]
    v8:setState({
        MouseDown = false
    });
    v8.onMouseDown = function(_) --[[ Line: 40 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            MouseDown = true
        });
    end;
    v8.onInputChanged = function(v10, v11) --[[ Line: 46 ]]
        -- upvalues: v8 (copy)
        if v8.state.MouseDown and v11.UserInputType == Enum.UserInputType.MouseMovement then
            local v12 = (Vector2.new(v11.Position.X, v11.Position.Y) - v10.AbsolutePosition) / v10.AbsoluteSize;
            v8.props.OnHueSaturationChanged(v12.x, 1 - v12.y);
        end;
    end;
    v8.onInputEnded = function(v13, v14) --[[ Line: 54 ]]
        -- upvalues: v8 (copy)
        if v14.UserInputType == Enum.UserInputType.MouseButton1 and v8.state.MouseDown then
            local l_X_0 = v14.Position.X;
            local l_Y_0 = v14.Position.Y;
            local v17 = (Vector2.new(l_X_0, l_Y_0) - v13.AbsolutePosition) / v13.AbsoluteSize;
            v17 = Vector2.new(math.clamp(v17.x, 0, 1), (math.clamp(v17.y, 0, 1)));
            v8:setState({
                MouseDown = false
            });
            v8.props.OnHueSaturationChanged(v17.x, 1 - v17.y);
        end;
    end;
end;
v7.render = function(v18) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v18.props;
    local l_HueSaturationPicker_0 = l_props_0.Stylizer.HueSaturationPicker;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_HueSaturationPicker_0.Size, 
        Image = l_HueSaturationPicker_0.GradientImage, 
        BackgroundColor3 = l_HueSaturationPicker_0.Black, 
        AutoButtonColor = false, 
        ImageTransparency = 1 - l_props_0.Value, 
        [v1.Event.MouseButton1Down] = v18.onMouseDown, 
        [v1.Event.InputEnded] = v18.onInputEnded, 
        [v1.Event.InputChanged] = v18.onInputChanged
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
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0
})(v7));