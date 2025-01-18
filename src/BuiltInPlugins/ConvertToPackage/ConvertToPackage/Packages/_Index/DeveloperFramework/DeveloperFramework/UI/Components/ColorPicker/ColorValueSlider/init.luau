local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = v1.PureComponent:extend("ColorValueSlider");
v2.init = function(v3) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v3.state = {
        mouseDown = false
    };
    v3._rootRef = v1.createRef();
    v3.onMouseDown = function() --[[ Line: 36 ]]
        -- upvalues: v3 (copy)
        v3:setState({
            MouseDown = true
        });
    end;
    v3.onInputChanged = function(_, v5) --[[ Line: 42 ]]
        -- upvalues: v3 (copy)
        if v3.state.MouseDown and v5.UserInputType == Enum.UserInputType.MouseMovement then
            v3.props.updatePosition(v3:xToAlpha(v5.Position.X));
        end;
    end;
    v3.onInputEnded = function(_, v7) --[[ Line: 48 ]]
        -- upvalues: v3 (copy)
        if v7.UserInputType == Enum.UserInputType.MouseButton1 and v3.state.MouseDown then
            v3:setState({
                MouseDown = false
            });
            v3.props.updatePosition(v3:xToAlpha(v7.Position.X));
        end;
    end;
end;
v2.xToAlpha = function(v8, v9) --[[ Line: 58 ]] --[[ Name: xToAlpha ]]
    local l_current_0 = v8._rootRef.current;
    return (math.clamp((v9 - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1));
end;
v2.render = function(v11) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v11.props;
    local l_ColorValueSlider_0 = l_props_0.Style.ColorValueSlider;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_ColorValueSlider_0.Size, 
        Image = l_ColorValueSlider_0.GradientImage, 
        ImageColor3 = Color3.fromHSV(l_props_0.Hue, l_props_0.Saturation, 1), 
        AutoButtonColor = false, 
        [v1.Ref] = v11._rootRef, 
        [v1.Event.MouseButton1Down] = v11.onMouseDown, 
        [v1.Event.InputEnded] = v11.onInputEnded, 
        [v1.Event.InputChanged] = v11.onInputChanged
    }, {
        PositionIndicator = v1.createElement("ImageLabel", {
            Size = l_ColorValueSlider_0.PositionIndicatorSize, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(l_props_0.Value, 0), 
            AnchorPoint = l_ColorValueSlider_0.PositionIndicatorAnchor, 
            Image = l_ColorValueSlider_0.PositionIndicatorImage, 
            ImageColor3 = l_ColorValueSlider_0.White
        })
    });
end;
return v2;