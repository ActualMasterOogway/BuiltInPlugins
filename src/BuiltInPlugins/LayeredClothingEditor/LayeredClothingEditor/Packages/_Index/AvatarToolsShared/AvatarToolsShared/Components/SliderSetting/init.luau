local _ = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Slider_0 = l_UI_0.Slider;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Util_0 = v3.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v14 = v2.PureComponent:extend("SliderSetting");
l_Util_0.Typecheck.wrap(v14, script);
v14.defaultProps = {
    ShowInputField = true, 
    ShowBackground = false
};
v14.init = function(v15, v16) --[[ Line: 50 ]] --[[ Name: init ]]
    v15.state = {
        valueText = tostring(v16.Value)
    };
    v15.previoustPropsValue = v16.Value;
    v15.onValueChanged = function(v17) --[[ Line: 55 ]]
        -- upvalues: v15 (copy)
        if v15.props.SetValue then
            v15.props.SetValue(v17);
        end;
    end;
    v15.onTextChanged = function(v18) --[[ Line: 61 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            valueText = v18
        });
    end;
    v15.onTextSubmitted = function() --[[ Line: 67 ]]
        -- upvalues: v15 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
            -- upvalues: v15 (ref)
            return (tonumber(v15.state.valueText));
        end);
        if l_status_0 and l_result_0 then
            local v21 = math.clamp(l_result_0, 0, v15.props.MaxValue);
            v15.onValueChanged(v21);
            if v15.props.OnTextBoxValueChanged then
                v15.props.OnTextBoxValueChanged(v21);
                return;
            end;
        else
            v15.onValueChanged(0);
        end;
    end;
end;
v14.render = function(v22) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_Slider_0 (copy), l_DEPRECATED_TextInput_0 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Title_0 = l_props_0.Title;
    local l_Value_0 = l_props_0.Value;
    v22.previoustPropsValue = l_Value_0;
    local l_MaxValue_0 = l_props_0.MaxValue;
    local l_Height_0 = l_props_0.Height;
    local l_UsePercentage_0 = l_props_0.UsePercentage;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_IsDisabled_0 = l_props_0.IsDisabled;
    local l_ShowInputField_0 = l_props_0.ShowInputField;
    local l_ShowBackground_0 = l_props_0.ShowBackground;
    local v34 = l_LayoutOrderIterator_0.new();
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_OnChangeBegan_0 = l_props_0.OnChangeBegan;
    local v37 = l_props_0.SnapIncrement or l_Stylizer_0.DefaultSnap;
    local v38 = v22.previoustPropsValue == l_Value_0 and l_state_0.value or l_Value_0;
    v38 = if v37 == l_Stylizer_0.DefaultSnap then string.format("%d", v38) else string.format("%" .. v37 .. "f", v38);
    local v39 = false;
    if l_Title_0 ~= nil then
        v39 = l_Title_0 ~= "";
    end;
    local l_InputWidth_0 = l_Stylizer_0.InputWidth;
    local l_InputHeight_0 = l_Stylizer_0.InputHeight;
    local v42 = l_Stylizer_0.PercentageLabelWidth + l_Stylizer_0.ValueTextBoxPadding + l_Stylizer_0.InputWidth;
    local v43 = l_ShowBackground_0 and "RoundBox" or nil;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(0, 0, 0, l_Height_0), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Stylizer_0.SliderContainerPadding, 
        Style = v43, 
        Padding = {
            Left = l_Stylizer_0.SliderContainerPadding, 
            Right = l_Stylizer_0.SliderContainerPadding
        }
    }, {
        Label = v39 and v2.createElement(l_TextLabel_0, {
            Text = l_Title_0, 
            StyleModifier = l_IsDisabled_0 and l_StyleModifier_0.Disabled or nil, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v34:getNextOrder()
        }), 
        SliderContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(0, 0, 0, l_Height_0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v34:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Spacing = l_Stylizer_0.SliderContainerPadding
        }, {
            ValueSlider = v2.createElement(l_Slider_0, {
                Disabled = l_IsDisabled_0, 
                Min = 0, 
                Max = l_MaxValue_0, 
                Value = l_Value_0, 
                SnapIncrement = v37, 
                Size = UDim2.new(0, l_Stylizer_0.SliderWidth, 0, l_Height_0), 
                LayoutOrder = v34:getNextOrder(), 
                OnValueChanged = v22.onValueChanged, 
                OnChangeBegan = l_OnChangeBegan_0
            }), 
            ValueTextBoxFrame = l_ShowInputField_0 and v2.createElement(l_Pane_0, {
                LayoutOrder = v34:getNextOrder(), 
                Size = UDim2.new(0, v42, 1, 0), 
                BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Spacing = l_Stylizer_0.ValueTextBoxPadding
            }, {
                ValueTextBox = v2.createElement(l_DEPRECATED_TextInput_0, {
                    Enabled = not l_IsDisabled_0, 
                    LayoutOrder = v34:getNextOrder(), 
                    Text = v38, 
                    Size = UDim2.new(0, l_InputWidth_0, 0, l_InputHeight_0), 
                    OnTextChanged = v22.onTextChanged, 
                    OnFocusLost = v22.onTextSubmitted, 
                    Style = "FilledRoundedBorder", 
                    StyleModifier = l_IsDisabled_0 and l_StyleModifier_0.Disabled or nil
                }), 
                PercentageLabel = l_UsePercentage_0 and v2.createElement(l_TextLabel_0, {
                    Text = "%", 
                    StyleModifier = l_IsDisabled_0 and l_StyleModifier_0.Disabled or nil, 
                    Size = UDim2.new(0, l_Stylizer_0.PercentageLabelWidth, 1, 0), 
                    LayoutOrder = v34:getNextOrder()
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));