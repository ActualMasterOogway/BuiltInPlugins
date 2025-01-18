local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.ToggleItemModule);
local v8 = require(l_Parent_0.Src.Util.Constants);
local v9 = require(l_Parent_0.Src.Actions.OnCustomPolicyEnabledChanged);
local v10 = require(l_Parent_0.Src.Actions.OnCustomPolicySwitchEnabledChanged);
local function _() --[[ Line: 32 ]] --[[ Name: GetPlayerEmulatorServiceCustomPoliciesEnabledProperty ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.CustomPoliciesEnabled;
end;
local function _(v12) --[[ Line: 36 ]] --[[ Name: SetPlayerEmulatorServiceCustomPoliciesEnabledProperty ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.CustomPoliciesEnabled = v12;
end;
local v14 = v3.PureComponent:extend("CustomPolicySwitchSection");
v14.updateCustomPoliciesEnabled = function(v15) --[[ Line: 42 ]] --[[ Name: updateCustomPoliciesEnabled ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    v15.props.onCustomPolicyEnabledChanged(l_PlayerEmulatorService_0.CustomPoliciesEnabled);
end;
v14.updateCustomPoliciesSwitchEnabled = function(v16, v17) --[[ Line: 47 ]] --[[ Name: updateCustomPoliciesSwitchEnabled ]]
    -- upvalues: v8 (copy)
    v16.props.Plugin:get():SetSetting(v8.CUSTOM_POLICIES_SWITCH_KEY, v17);
    v16.props.onCustomPolicySwitchEnabledChanged(v17);
end;
v14.init = function(v18) --[[ Line: 54 ]] --[[ Name: init ]]
    v18.signalTokens = {};
end;
v14.didMount = function(v19) --[[ Line: 58 ]] --[[ Name: didMount ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v8 (copy)
    local v20 = l_PlayerEmulatorService_0:GetPropertyChangedSignal("CustomPoliciesEnabled"):Connect(function() --[[ Line: 60 ]]
        -- upvalues: v19 (copy)
        v19:updateCustomPoliciesEnabled();
    end);
    table.insert(v19.signalTokens, v20);
    local l_Setting_0 = v19.props.Plugin:get():GetSetting(v8.CUSTOM_POLICIES_SWITCH_KEY);
    if l_Setting_0 == true then
        v19:updateCustomPoliciesSwitchEnabled(l_Setting_0);
    end;
    v19:updateCustomPoliciesEnabled();
end;
v14.willUnmount = function(v22) --[[ Line: 74 ]] --[[ Name: willUnmount ]]
    for _, v24 in pairs(v22.signalTokens) do
        v24:Disconnect();
    end;
    v22.signalTokens = nil;
end;
v14.render = function(v25) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v3 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), v7 (copy)
    local l_props_0 = v25.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_customPolicySwitchEnabled_0 = l_props_0.customPolicySwitchEnabled;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    if not l_props_0.customPolicySwitchActive then
        l_PlayerEmulatorService_0.CustomPoliciesEnabled = true;
        return nil;
    else
        l_PlayerEmulatorService_0.CustomPoliciesEnabled = l_customPolicySwitchEnabled_0;
        return v3.createElement("Frame", {
            AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
            Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            Toggle = v3.createElement(v7, {
                Key = l_Localization_0:getText("CustomPolicySwitchSection", "LabelText"), 
                IsOn = l_customPolicySwitchEnabled_0, 
                Enabled = l_mainSwitchEnabled_0, 
                ToggleCallback = function(_, v33, _) --[[ Line: 109 ]] --[[ Name: ToggleCallback ]]
                    -- upvalues: v25 (copy)
                    v25:updateCustomPoliciesSwitchEnabled(v33);
                end
            })
        });
    end;
end;
v14 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14);
return v4.connect(function(v35, _) --[[ Line: 122 ]] --[[ Name: mapStateToProps ]]
    return {
        mainSwitchEnabled = v35.MainSwitch.mainSwitchEnabled, 
        customPolicySwitchEnabled = v35.CustomPolicySwitch.customPolicySwitchEnabled, 
        customPolicySwitchActive = v35.CustomPolicySwitch.customPolicySwitchActive
    };
end, function(v37) --[[ Line: 130 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        onCustomPolicyEnabledChanged = function(v38) --[[ Line: 132 ]] --[[ Name: onCustomPolicyEnabledChanged ]]
            -- upvalues: v37 (copy), v9 (ref)
            v37(v9(v38));
        end, 
        onCustomPolicySwitchEnabledChanged = function(v39) --[[ Line: 135 ]] --[[ Name: onCustomPolicySwitchEnabledChanged ]]
            -- upvalues: v37 (copy), v10 (ref)
            v37(v10(v39));
        end
    };
end)(v14);