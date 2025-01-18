local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v5.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local v11 = require(l_Parent_0.Src.Util.Constants);
local v12 = require(l_Parent_0.Src.Actions.OnPlayerEmulationEnabledChanged);
local function _() --[[ Line: 32 ]] --[[ Name: GetMainSwitchEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
end;
local function v15(v14) --[[ Line: 36 ]] --[[ Name: SetMainSwitchEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.PlayerEmulationEnabled = v14;
end;
local v16 = v3.PureComponent:extend("MainSwitchSection");
v16.initEnabledStatus = function(v17) --[[ Line: 42 ]] --[[ Name: initEnabledStatus ]]
    -- upvalues: v11 (copy), l_PlayerEmulatorService_0 (copy)
    if v17.props.Plugin:get():GetSetting(v11.MAIN_SWITCH_KEY) == true then
        l_PlayerEmulatorService_0.PlayerEmulationEnabled = true;
    end;
end;
v16.updatePlayerEmulationEnabled = function(v18, v19) --[[ Line: 50 ]] --[[ Name: updatePlayerEmulationEnabled ]]
    -- upvalues: v11 (copy)
    v18.props.Plugin:get():SetSetting(v11.MAIN_SWITCH_KEY, v19);
    v18.props.onPlayerEmulationEnabledChanged(v19);
end;
v16.init = function(v20) --[[ Line: 58 ]] --[[ Name: init ]]
    v20.signalTokens = {};
end;
v16.didMount = function(v21) --[[ Line: 62 ]] --[[ Name: didMount ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    local v22 = l_PlayerEmulatorService_0:GetPropertyChangedSignal("PlayerEmulationEnabled"):Connect(function() --[[ Line: 64 ]]
        -- upvalues: v21 (copy), l_PlayerEmulatorService_0 (ref)
        v21:updatePlayerEmulationEnabled(l_PlayerEmulatorService_0.PlayerEmulationEnabled);
    end);
    table.insert(v21.signalTokens, v22);
    v21:initEnabledStatus();
end;
v16.willUnmount = function(v23) --[[ Line: 72 ]] --[[ Name: willUnmount ]]
    for _, v25 in pairs(v23.signalTokens) do
        v25:Disconnect();
    end;
    v23.signalTokens = nil;
end;
v16.render = function(v26) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_TextLabel_0 (copy), l_ToggleButton_0 (copy), v15 (copy)
    local l_props_0 = v26.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    return v3.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v3.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }) else nil, 
        Label = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_Localization_0:getText("MainSwitchSection", "LabelText"), 
            TextXAlignment = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.TextXAlignment.Left else nil, 
            TextWrapped = l_EnablePseudolocalizationInPlayerEmulator2_0 and true or nil, 
            TextTruncate = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.TextTruncate.SplitWord else nil, 
            LayoutOrder = 1
        }, {
            FlexItem = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v3.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            }) else nil
        }), 
        Toggle = v3.createElement(l_ToggleButton_0, {
            AnchorPoint = if l_EnablePseudolocalizationInPlayerEmulator2_0 then nil else Vector2.new(0, 0.5), 
            LayoutOrder = 2, 
            OnClick = v15, 
            Position = if l_EnablePseudolocalizationInPlayerEmulator2_0 then nil else UDim2.new(0, l_Stylizer_0.TOGGLE_BUTTON_OFFSET, 0.5, -l_Stylizer_0.TOGGLE_BUTTON_HEIGHT / 2), 
            Selected = l_mainSwitchEnabled_0
        })
    });
end;
v16 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16);
return v4.connect(function(v32, _) --[[ Line: 136 ]] --[[ Name: mapStateToProps ]]
    return {
        mainSwitchEnabled = v32.MainSwitch.mainSwitchEnabled
    };
end, function(v34) --[[ Line: 142 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        onPlayerEmulationEnabledChanged = function(v35) --[[ Line: 144 ]] --[[ Name: onPlayerEmulationEnabledChanged ]]
            -- upvalues: v34 (copy), v12 (ref)
            v34(v12(v35));
        end
    };
end)(v16);