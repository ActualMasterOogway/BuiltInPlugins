local v0 = Rect.new(3, 0, 4, 6);
local v1 = require(script.Parent.Internal.RequireRoact);
local v2 = require(script.Parent.Internal.ThemeChangeListener);
local v3 = require(script.Parent.Internal.Theme);
local v4 = require(script.Parent.Internal.Mouse);
local v5 = require(script.Parent.TitledFrame);
local v6 = require(script.Parent.RoundTextBox);
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = v1.PureComponent:extend("RangeSlider");
v16.init = function(v17) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v17.sliderFrameRef = v1.createRef();
    v17.state = {
        currentLowerTextInputBoxText = tostring(v17.props.LowerRangeValue), 
        currentUpperTextInputBoxText = tostring(v17.props.UpperRangeValue), 
        Pressed = false
    };
    v17.currentLowerRangeValue = v17.props.LowerRangeValue;
    v17.currentUpperRangeValue = v17.props.UpperRangeValue;
    v17.havePropsChanged = false;
end;
v16.willUpdate = function(v18) --[[ Line: 83 ]] --[[ Name: willUpdate ]]
    v18.currentLowerRangeValue = v18.props.LowerRangeValue;
    v18.currentUpperRangeValue = v18.props.UpperRangeValue;
    v18.havePropsChanged = false;
end;
v16.render = function(v19) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v15 (ref), v1 (copy), v14 (ref), v11 (ref), v4 (copy), v7 (ref), v3 (copy), v8 (ref), v0 (copy), v10 (ref), v9 (ref), v6 (copy), v12 (ref), v13 (ref), v5 (copy), v2 (copy)
    local function v41() --[[ Line: 90 ]] --[[ Name: renderInternal ]]
        -- upvalues: v15 (ref), v19 (copy), v1 (ref), v14 (ref), v11 (ref), v4 (ref), v7 (ref), v3 (ref), v8 (ref), v0 (ref), v10 (ref), v9 (ref), v6 (ref), v12 (ref), v13 (ref), v5 (ref)
        local v20 = v15(v19);
        local l_currentLowerTextInputBoxText_0 = v19.state.currentLowerTextInputBoxText;
        local l_currentUpperTextInputBoxText_0 = v19.state.currentUpperTextInputBoxText;
        local l_v19_0 = v19;
        local v24 = true;
        if v19.currentLowerRangeValue == v19.props.LowerRangeValue then
            v24 = v19.currentUpperRangeValue ~= v19.props.UpperRangeValue;
        end;
        l_v19_0.havePropsChanged = v24;
        if v19.havePropsChanged then
            l_currentLowerTextInputBoxText_0 = tostring(v19.props.LowerRangeValue);
            l_currentUpperTextInputBoxText_0 = tostring(v19.props.UpperRangeValue);
        end;
        l_v19_0 = {
            RangedSliderContent = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 38)
            }, {
                SliderFrame = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 262, 0, 18), 
                    [v1.Ref] = v19.sliderFrameRef
                }, {
                    ClickHandler = v1.createElement("ImageButton", {
                        Size = UDim2.new(1, 18, 1, v19.state.Pressed and 300 or 0), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        ZIndex = 4, 
                        [v1.Event.InputBegan] = function(_, v26) --[[ Line: 121 ]]
                            -- upvalues: v19 (ref), v14 (ref), v11 (ref)
                            if v19.props.Enabled and v26.UserInputType == Enum.UserInputType.MouseButton1 then
                                v19:setState({
                                    Pressed = true
                                });
                                v19.staticRangeDuringInput = v14(v19, v26);
                                v11(v19, v26);
                            end;
                        end, 
                        [v1.Event.InputChanged] = function(_, v28) --[[ Line: 131 ]]
                            -- upvalues: v19 (ref), v11 (ref)
                            if v19.props.Enabled and v19.state.Pressed and v28.UserInputType == Enum.UserInputType.MouseMovement then
                                v11(v19, v28);
                            end;
                        end, 
                        [v1.Event.InputEnded] = function(_, v30) --[[ Line: 137 ]]
                            -- upvalues: v19 (ref)
                            if v19.props.Enabled and v30.UserInputType == Enum.UserInputType.MouseButton1 then
                                v19:setState({
                                    Pressed = false
                                });
                            end;
                        end
                    }), 
                    HoverHandler = v1.createElement("Frame", {
                        Size = UDim2.new(1, 18, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        [v1.Event.MouseEnter] = function() --[[ Line: 151 ]]
                            -- upvalues: v19 (ref), v4 (ref)
                            if v19.props.Enabled then
                                v4.onEnter(v19.props.Mouse);
                            end;
                        end, 
                        [v1.Event.MouseLeave] = function() --[[ Line: 152 ]]
                            -- upvalues: v19 (ref), v4 (ref)
                            if v19.props.Enabled then
                                v4.onLeave(v19.props.Mouse);
                            end;
                        end
                    }), 
                    SliderHandleOne = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 18, 0, 18), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(v7(v19), 0, 0, 0), 
                        Image = v3.isDarkerTheme() and "rbxasset://textures/RoactStudioWidgets/slider_handle_dark.png" or "rbxasset://textures/RoactStudioWidgets/slider_handle_light.png", 
                        Visible = v19.props.Enabled, 
                        ZIndex = 3
                    }), 
                    SliderHandleTwo = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 18, 0, 18), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(v8(v19), 0, 0, 0), 
                        Image = v3.isDarkerTheme() and "rbxasset://textures/RoactStudioWidgets/slider_handle_dark.png" or "rbxasset://textures/RoactStudioWidgets/slider_handle_light.png", 
                        Visible = v19.props.Enabled, 
                        ZIndex = 3
                    }), 
                    BackgroundBar = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 262, 0, 6), 
                        Image = v3.isDarkerTheme() and "rbxasset://textures/RoactStudioWidgets/slider_bar_background_dark.png" or "rbxasset://textures/RoactStudioWidgets/slider_bar_background_light.png", 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v0, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0)
                    }), 
                    ForegroundBar = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(v10(v19), 0, 0, 6), 
                        Image = v3.isDarkerTheme() and "rbxasset://textures/RoactStudioWidgets/slider_bar_dark.png" or "rbxasset://textures/RoactStudioWidgets/slider_bar_light.png", 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v0, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(v9(v19), 0, 0.5, 0), 
                        Visible = v19.props.Enabled, 
                        ZIndex = 2
                    })
                }), 
                LowerLabel = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 0, 0, 20), 
                    TextColor3 = v20.TextColor, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 22, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Bottom, 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Visible = v19.props.Enabled, 
                    Text = v19.props.MinLabelText or tostring(v19.props.Min) .. "%"
                }), 
                UpperLabel = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 0, 0, 20), 
                    TextColor3 = v20.TextColor, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 22, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextYAlignment = Enum.TextYAlignment.Bottom, 
                    AnchorPoint = Vector2.new(1, 1), 
                    Position = UDim2.new(0, 262, 1, 0), 
                    Visible = v19.props.Enabled, 
                    Text = v19.props.MaxLabelText or tostring(v19.props.Max) .. "%"
                }), 
                LowerInputBox = v1.createElement(v6, {
                    Enabled = v19.props.Enabled, 
                    MaxLength = 100, 
                    Text = l_currentLowerTextInputBoxText_0, 
                    Position = UDim2.new(0, 291, 0, 0), 
                    Width = 48, 
                    Height = 38, 
                    ShowToolTip = false, 
                    HorizontalAlignment = Enum.TextXAlignment.Center, 
                    Mouse = v19.props.Mouse, 
                    SetText = function(v31) --[[ Line: 234 ]] --[[ Name: SetText ]]
                        -- upvalues: v19 (ref)
                        v19:setState({
                            currentLowerTextInputBoxText = v31
                        });
                    end, 
                    FocusChanged = function(v32, v33) --[[ Line: 240 ]] --[[ Name: FocusChanged ]]
                        -- upvalues: v19 (ref), v12 (ref)
                        if not v32 then
                            local v34 = false;
                            if v33 then
                                local v35 = tonumber(v19.state.currentLowerTextInputBoxText);
                                if v35 then
                                    v34 = v12(v19, v35);
                                end;
                            end;
                            if not v34 then
                                v19:setState({
                                    currentLowerTextInputBoxText = tostring(v19.props.LowerRangeValue)
                                });
                            end;
                        end;
                    end
                }), 
                Dash = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 10, 0, 2), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(0, 356, 0.5, 0), 
                    BackgroundColor3 = v20.TextDescriptionColor
                }), 
                UpperInputBox = v1.createElement(v6, {
                    Enabled = v19.props.Enabled, 
                    MaxLength = 100, 
                    Text = l_currentUpperTextInputBoxText_0, 
                    Position = UDim2.new(0, 363, 0, 0), 
                    Width = 48, 
                    Height = 38, 
                    ShowToolTip = false, 
                    HorizontalAlignment = Enum.TextXAlignment.Center, 
                    Mouse = v19.props.Mouse, 
                    SetText = function(v36) --[[ Line: 275 ]] --[[ Name: SetText ]]
                        -- upvalues: v19 (ref)
                        v19:setState({
                            currentUpperTextInputBoxText = v36
                        });
                    end, 
                    FocusChanged = function(v37, v38) --[[ Line: 281 ]] --[[ Name: FocusChanged ]]
                        -- upvalues: v19 (ref), v13 (ref)
                        if not v37 then
                            local v39 = false;
                            if v38 then
                                local v40 = tonumber(v19.state.currentUpperTextInputBoxText);
                                if v40 then
                                    v39 = v13(v19, v40);
                                end;
                            end;
                            if not v39 then
                                v19:setState({
                                    currentUpperTextInputBoxText = tostring(v19.props.UpperRangeValue)
                                });
                            end;
                        end;
                    end
                }), 
                PercentageLabel = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 426, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    TextColor3 = v20.TextDescriptionColor, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 22, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Text = v19.props.UnitsLabelText or "%"
                })
            })
        };
        return v1.createElement(v5, {
            Title = v19.props.Title, 
            MaxHeight = 38, 
            LayoutOrder = v19.props.LayoutOrder or 1
        }, l_v19_0);
    end;
    return v1.createElement(v2, {
        render = v41
    });
end;
v16.didUpdate = function(v42) --[[ Line: 325 ]] --[[ Name: didUpdate ]]
    if v42.havePropsChanged then
        v42.havePropsChanged = false;
        v42:setState({
            currentLowerTextInputBoxText = tostring(v42.props.LowerRangeValue), 
            currentUpperTextInputBoxText = tostring(v42.props.UpperRangeValue)
        });
    end;
end;
local function _(v43) --[[ Line: 335 ]] --[[ Name: calculateSliderTotalRange ]]
    return v43.props.Max - v43.props.Min;
end;
v7 = function(v45) --[[ Line: 339 ]]
    return (v45.props.LowerRangeValue - v45.props.Min) / (v45.props.Max - v45.props.Min);
end;
v8 = function(v46) --[[ Line: 343 ]]
    return (v46.props.UpperRangeValue - v46.props.Min) / (v46.props.Max - v46.props.Min);
end;
v9 = function(v47) --[[ Line: 347 ]]
    -- upvalues: v7 (ref)
    return v7(v47);
end;
v10 = function(v48) --[[ Line: 351 ]]
    -- upvalues: v8 (ref), v7 (ref)
    return v8(v48) - v7(v48);
end;
local function v53(v49, v50) --[[ Line: 355 ]] --[[ Name: calculateIncrementSnappedValue ]]
    if v49.props.SnapIncrement > 0.001 then
        local v51 = math.max(v49.props.SnapIncrement * math.floor(v50 / v49.props.SnapIncrement), v49.props.Min);
        local v52 = math.min(v51 + v49.props.SnapIncrement, v49.props.Max);
        return math.abs(v51 - v50) < math.abs(v52 - v50) and v51 or v52;
    else
        return (math.min(v49.props.Max, (math.max(v49.props.Min, v50))));
    end;
end;
local function v58(v54, v55) --[[ Line: 364 ]] --[[ Name: calculateMouseClickValue ]]
    -- upvalues: v53 (copy)
    local v56 = math.max(0, (math.min(1, (v55.Position.X - v54.sliderFrameRef.current.AbsolutePosition.X) / v54.sliderFrameRef.current.AbsoluteSize.X)));
    local v57 = v54.props.Min + v56 * (v54.props.Max - v54.props.Min);
    return (v53(v54, v57));
end;
v14 = function(v59, v60) --[[ Line: 371 ]]
    -- upvalues: v58 (copy)
    local v61 = v58(v59, v60);
    if v61 < v59.props.LowerRangeValue then
        return v59.props.UpperRangeValue;
    elseif v59.props.UpperRangeValue < v61 then
        return v59.props.LowerRangeValue;
    elseif math.abs(v61 - v59.props.LowerRangeValue) < math.abs(v61 - v59.props.UpperRangeValue) then
        return v59.props.UpperRangeValue;
    else
        return v59.props.LowerRangeValue;
    end;
end;
local function _(v62, v63) --[[ Line: 389 ]] --[[ Name: clampLowerRangeValue ]]
    -- upvalues: v53 (copy)
    v63 = v53(v62, v63);
    return (math.min(v62.props.UpperRangeValue, (math.max(v62.props.Min, v63))));
end;
local function _(v65, v66) --[[ Line: 394 ]] --[[ Name: clampUpperRangeValue ]]
    -- upvalues: v53 (copy)
    v66 = v53(v65, v66);
    return (math.min(v65.props.Max, (math.max(v65.props.LowerRangeValue, v66))));
end;
v11 = function(v68, v69) --[[ Line: 399 ]]
    -- upvalues: v58 (copy), v53 (copy)
    local v70 = v58(v68, v69);
    local v71 = math.min(v70, v68.staticRangeDuringInput);
    v71 = v53(v68, v71);
    local v72 = math.min(v68.props.UpperRangeValue, (math.max(v68.props.Min, v71)));
    local v73 = math.max(v70, v68.staticRangeDuringInput);
    v73 = v53(v68, v73);
    v71 = math.min(v68.props.Max, (math.max(v68.props.LowerRangeValue, v73)));
    v68.props.SetValues(v72, v71);
end;
v12 = function(v74, v75) --[[ Line: 406 ]]
    -- upvalues: v53 (copy)
    local v76 = v53(v74, v75);
    v75 = math.min(v74.props.UpperRangeValue, (math.max(v74.props.Min, v76)));
    if v74.props.LowerRangeValue ~= v75 then
        v74.props.SetValues(v75, v74.props.UpperRangeValue);
        return true;
    else
        return false;
    end;
end;
v13 = function(v77, v78) --[[ Line: 415 ]]
    -- upvalues: v53 (copy)
    local v79 = v53(v77, v78);
    v78 = math.min(v77.props.Max, (math.max(v77.props.LowerRangeValue, v79)));
    if v77.props.UpperRangeValue ~= v78 then
        v77.props.SetValues(v77.props.LowerRangeValue, v78);
        return true;
    else
        return false;
    end;
end;
v15 = function(v80) --[[ Line: 424 ]]
    -- upvalues: v3 (copy)
    local v81 = {
        TextColor = v3.getTitleTextColor(), 
        TextDescriptionColor = v3.getTextDescriptionColor()
    };
    local v82 = {};
    for v83, v84 in pairs(v81) do
        v82[v83] = v80.props.Style and v80.props.Style[v83] or v84;
    end;
    return v82;
end;
return v16;