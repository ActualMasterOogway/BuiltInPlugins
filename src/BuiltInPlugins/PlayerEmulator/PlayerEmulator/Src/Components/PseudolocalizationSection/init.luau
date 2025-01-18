local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v4.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local function _() --[[ Line: 31 ]] --[[ Name: GetPseudolocalizationEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.PseudolocalizationEnabled;
end;
local function _() --[[ Line: 35 ]] --[[ Name: GetTextElongationFactor ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.TextElongationFactor;
end;
local function v16(v15) --[[ Line: 39 ]] --[[ Name: SetPseudolocalizationEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.PseudolocalizationEnabled = v15;
end;
local function _(v17) --[[ Line: 43 ]] --[[ Name: SetTextElongationFactor ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.TextElongationFactor = v17;
end;
local function _() --[[ Line: 47 ]] --[[ Name: GetMainSwitchEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
end;
local v20 = v2.PureComponent:extend("PseudolocalizationSection");
v20.initPseudolocalizationEnabled = function(v21) --[[ Line: 53 ]] --[[ Name: initPseudolocalizationEnabled ]]
    -- upvalues: v7 (copy), l_PlayerEmulatorService_0 (copy)
    local l_Setting_0 = v21.props.Plugin:get():GetSetting(v7.PSEUDOLOCALIZATION_ENABLED_SETTING_KEY);
    if l_Setting_0 then
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = l_Setting_0;
    end;
end;
v20.initTextElongationFactor = function(v23) --[[ Line: 62 ]] --[[ Name: initTextElongationFactor ]]
    -- upvalues: v7 (copy), l_PlayerEmulatorService_0 (copy)
    local l_Setting_1 = v23.props.Plugin:get():GetSetting(v7.TEXT_ELONGATION_FACTOR_SETTING_KEY);
    if l_Setting_1 then
        l_PlayerEmulatorService_0.TextElongationFactor = l_Setting_1;
    end;
end;
v20.onPlayerEmulationEnabledChanged = function(v25) --[[ Line: 71 ]] --[[ Name: onPlayerEmulationEnabledChanged ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    if l_PlayerEmulatorService_0.PlayerEmulationEnabled then
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = v25.state.pseudolocalizationEnabled;
        l_PlayerEmulatorService_0.TextElongationFactor = v25.state.textElongationFactor;
        return;
    else
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = false;
        l_PlayerEmulatorService_0.TextElongationFactor = 0;
        return;
    end;
end;
v20.onPseudolocalizationChanged = function(v26) --[[ Line: 83 ]] --[[ Name: onPseudolocalizationChanged ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v7 (copy)
    local l_PseudolocalizationEnabled_0 = l_PlayerEmulatorService_0.PseudolocalizationEnabled;
    v26:setState({
        pseudolocalizationEnabled = l_PseudolocalizationEnabled_0
    });
    v26.props.Plugin:get():SetSetting(v7.PSEUDOLOCALIZATION_ENABLED_SETTING_KEY, l_PseudolocalizationEnabled_0);
end;
v20.onTextElongationFactorChanged = function(v28) --[[ Line: 92 ]] --[[ Name: onTextElongationFactorChanged ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v7 (copy)
    local l_TextElongationFactor_0 = l_PlayerEmulatorService_0.TextElongationFactor;
    v28:setState({
        textElongationFactor = l_TextElongationFactor_0
    });
    v28.props.Plugin:get():SetSetting(v7.TEXT_ELONGATION_FACTOR_SETTING_KEY, l_TextElongationFactor_0);
end;
v20.init = function(v30) --[[ Line: 101 ]] --[[ Name: init ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    v30.state = {
        pseudolocalizationEnabled = l_PlayerEmulatorService_0.PseudolocalizationEnabled, 
        textElongationFactor = l_PlayerEmulatorService_0.TextElongationFactor
    };
end;
v20.didMount = function(v31) --[[ Line: 108 ]] --[[ Name: didMount ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    local _ = l_PlayerEmulatorService_0:GetPropertyChangedSignal("PseudolocalizationEnabled"):Connect(function() --[[ Line: 111 ]]
        -- upvalues: v31 (copy)
        v31:onPseudolocalizationChanged();
    end);
    v31:initPseudolocalizationEnabled();
    local _ = l_PlayerEmulatorService_0:GetPropertyChangedSignal("TextElongationFactor"):Connect(function() --[[ Line: 118 ]]
        -- upvalues: v31 (copy)
        v31:onTextElongationFactorChanged();
    end);
    v31:initTextElongationFactor();
end;
v20.render = function(v34) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_ToggleButton_0 (copy), v16 (copy), l_Slider_0 (copy), l_PlayerEmulatorService_0 (copy)
    local l_state_0 = v34.state;
    local l_props_0 = v34.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_pseudolocalizationEnabled_0 = l_state_0.pseudolocalizationEnabled;
    local l_textElongationFactor_0 = l_state_0.textElongationFactor;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v43 = v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.TOGGLE_BUTTON_HEIGHT), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 3
    }, {
        Layout = v2.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_Localization_0:getText("LanguageSection", "PseudolocalizationLabelText"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            StyleModifier = if l_mainSwitchEnabled_0 then nil else l_StyleModifier_0.Disabled, 
            LayoutOrder = 1
        }, {
            FlexItem = v2.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            })
        }), 
        Toggle = v2.createElement(l_ToggleButton_0, {
            Disabled = not l_mainSwitchEnabled_0, 
            OnClick = v16, 
            Selected = l_pseudolocalizationEnabled_0, 
            LayoutOrder = 2
        })
    });
    local v45 = v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.TOGGLE_BUTTON_HEIGHT), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 4
    }, {
        Layout = v2.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = "Elongate", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            StyleModifier = if l_mainSwitchEnabled_0 then nil else l_StyleModifier_0.Disabled, 
            LayoutOrder = 1
        }, {
            FlexItem = v2.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            })
        }), 
        Slider = v2.createElement(l_Slider_0, {
            Disabled = not l_mainSwitchEnabled_0, 
            Min = 0, 
            Max = 200, 
            Value = l_textElongationFactor_0, 
            SnapIncrement = 10, 
            Size = UDim2.new(0, 100, 0, l_Stylizer_0.TOGGLE_BUTTON_HEIGHT), 
            LayoutOrder = 2, 
            OnValueChanged = function(v44) --[[ Line: 208 ]] --[[ Name: OnValueChanged ]]
                -- upvalues: l_PlayerEmulatorService_0 (ref)
                l_PlayerEmulatorService_0.TextElongationFactor = v44;
            end
        })
    });
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING
        }), 
        PseudolocalizationModule = v43, 
        ElongateModule = v45
    });
end;
v20 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v20);
return v3.connect(function(v46, _) --[[ Line: 236 ]] --[[ Name: mapStateToProps ]]
    return {
        mainSwitchEnabled = v46.MainSwitch.mainSwitchEnabled
    };
end)(v20);