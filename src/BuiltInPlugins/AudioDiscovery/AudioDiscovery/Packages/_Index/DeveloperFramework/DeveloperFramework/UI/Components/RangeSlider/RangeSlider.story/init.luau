local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.RangeSlider);
local v4 = require(l_Parent_0.Util.LayoutOrderIterator);
local v5 = v1.PureComponent:extend("ExampleRangeSlider");
formatNumber = function(v6) --[[ Line: 14 ]] --[[ Name: formatNumber ]]
    return (tostring(math.floor(0.5 + v6 * 100) / 100));
end;
getTootipText = function(v7) --[[ Line: 19 ]] --[[ Name: getTootipText ]]
    return "test slider: " .. formatNumber(v7);
end;
v5.init = function(v8) --[[ Line: 23 ]] --[[ Name: init ]]
    v8.state = {
        currentMax = 5, 
        currentMin = 0
    };
    v8.setValues = function(v9, v10) --[[ Line: 28 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            Tooltip = getTootipText(v10), 
            currentMax = v10, 
            currentMin = v9
        });
    end;
end;
v5.render = function(v11) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), v2 (copy)
    local v12 = v4.new();
    local v13 = {
        RangeSlider = v1.createElement(v3, {
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            SnapIncrement = 1, 
            VerticalDragTolerance = 300
        }), 
        DisabledRangeSlider = v1.createElement(v3, {
            LayoutOrder = v12:getNextOrder(), 
            Disabled = true, 
            LowerRangeValue = 1, 
            UpperRangeValue = 3, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = function() --[[ Line: 62 ]] --[[ Name: OnValuesChanged ]]

            end, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 200, 0, 20)
        }), 
        RangeSliderNoLower = v1.createElement(v3, {
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            HideLowerKnob = true, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            SnapIncrement = 1, 
            VerticalDragTolerance = 300
        }), 
        RangeSliderFillFromCenter = v1.createElement(v3, {
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            FillFromCenter = true, 
            Disabled = false, 
            HideLowerKnob = true, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            Tooltip = getTootipText(v11.state.currentMax), 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        }), 
        RotatedSliderContainer = v1.createElement("Frame", {
            LayoutOrder = v12:getNextOrder(), 
            Rotation = 25, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 150, 0, 20)
        }, {
            Slider = v1.createElement(v3, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Disabled = false, 
                HideLowerKnob = true, 
                LowerRangeValue = v11.state.currentMin, 
                UpperRangeValue = v11.state.currentMax, 
                Min = 0, 
                Max = 5, 
                OnValuesChanged = v11.setValues, 
                Size = UDim2.new(0, 100, 0, 20), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                SnapIncrement = 1, 
                VerticalDragTolerance = 300
            })
        }), 
        RangeSliderVertical = v1.createElement(v3, {
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            Layout = Enum.FillDirection.Vertical, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 20, 0, 200), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        }), 
        RangeSliderColor = v1.createElement(v3, {
            ImageColor3 = Color3.new(1, 0, 0), 
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        }), 
        RangeSliderHideBackground = v1.createElement(v3, {
            HideBackground = true, 
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        }), 
        RangeSliderNoInput = v1.createElement(v3, {
            HideBackground = true, 
            HideLowerKnob = true, 
            HideUpperKnob = true, 
            LayoutOrder = v12:getNextOrder(), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Disabled = false, 
            LowerRangeValue = v11.state.currentMin, 
            UpperRangeValue = v11.state.currentMax, 
            Min = 0, 
            Max = 5, 
            OnValuesChanged = v11.setValues, 
            Size = UDim2.new(0, 200, 0, 20), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            VerticalDragTolerance = 300
        })
    };
    return v1.createElement(v2, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Padding = 10, 
        Spacing = 15
    }, v13);
end;
return v5;