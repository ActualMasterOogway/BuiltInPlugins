local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v9 = require(l_Parent_0.Src.Networking.Requests.GetCountryRegion);
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Actions.OnEmulatedCountryRegionChanged);
local l_UI_0 = v5.UI;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_map_0 = v5.Dash.map;
local l_StyleModifier_0 = v5.Util.StyleModifier;
local v17 = v3.PureComponent:extend("CountryRegionSection");
local function _() --[[ Line: 56 ]] --[[ Name: GetEmulatedCountryRegionCode ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.EmulatedCountryCode;
end;
local function _(v19) --[[ Line: 60 ]] --[[ Name: SetEmulatedCountryRegionCode ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.EmulatedCountryCode = v19;
end;
v17.getCurrentCountryRegionText = function(v21, v22) --[[ Line: 64 ]] --[[ Name: getCurrentCountryRegionText ]]
    local l_countryRegionTable_0 = v21.props.countryRegionTable;
    if l_countryRegionTable_0 and l_countryRegionTable_0[v22] then
        return l_countryRegionTable_0[v22].displayText;
    else
        return "";
    end;
end;
v17.updateCountryRegionSetting = function(v24, v25) --[[ Line: 74 ]] --[[ Name: updateCountryRegionSetting ]]
    -- upvalues: v10 (copy)
    local v26 = v24.props.Plugin:get();
    if v26:GetSetting(v10.COUNTRY_REGION_SETTING_KEY) ~= v25 then
        v26:SetSetting(v10.COUNTRY_REGION_SETTING_KEY, v25);
    end;
    v24.props.onEmulatedCountryRegionChanged(v25);
end;
v17.init = function(v27) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    v27.signalTokens = {};
    v27.createCountryRegionListForSelectInput = function(v28) --[[ Line: 87 ]]
        return {
            Id = v28.displayText, 
            Label = v28.displayText, 
            code = v28.code
        };
    end;
    v27.onItemClicked = function(v29) --[[ Line: 95 ]]
        -- upvalues: l_PlayerEmulatorService_0 (ref)
        l_PlayerEmulatorService_0.EmulatedCountryCode = v29.code;
    end;
end;
v17.didMount = function(v30) --[[ Line: 100 ]] --[[ Name: didMount ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    local v31 = v30.props.Plugin:get();
    local v32 = v30.props.Networking:get();
    local v33 = l_PlayerEmulatorService_0:GetPropertyChangedSignal("EmulatedCountryCode"):Connect(function() --[[ Line: 105 ]]
        -- upvalues: v30 (copy), l_PlayerEmulatorService_0 (ref)
        v30:updateCountryRegionSetting(l_PlayerEmulatorService_0.EmulatedCountryCode);
    end);
    table.insert(v30.signalTokens, v33);
    v30.props.loadCountryRegion(v32, v31);
end;
v17.willUnmount = function(v34) --[[ Line: 113 ]] --[[ Name: willUnmount ]]
    for _, v36 in pairs(v34.signalTokens) do
        v36:Disconnect();
    end;
    v34.signalTokens = nil;
end;
v17.render = function(v37) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_SelectInput_0 (copy), l_map_0 (copy)
    local l_props_0 = v37.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_countryRegionList_0 = l_props_0.countryRegionList;
    local l_userCountryRegionCode_0 = l_props_0.userCountryRegionCode;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    return v3.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.SELECTOR_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v3.createElement("UIListLayout", {
            HorizontalFlex = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.UIFlexAlignment.SpaceBetween else nil, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.VerticalAlignment.Center else nil, 
            Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING, 
            Wraps = l_EnablePseudolocalizationInPlayerEmulator2_0 and true or nil
        }), 
        Label = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            StyleModifier = if l_mainSwitchEnabled_0 then nil else l_StyleModifier_0.Disabled, 
            Text = l_Localization_0:getText("CountryRegionSection", "LabelText"), 
            LayoutOrder = 1
        }), 
        CountryRegionDropdown = v3.createElement(l_SelectInput_0, {
            Items = l_map_0(l_countryRegionList_0, v37.createCountryRegionListForSelectInput), 
            LayoutOrder = 2, 
            OnItemActivated = v37.onItemClicked, 
            SelectedId = v37:getCurrentCountryRegionText(l_userCountryRegionCode_0), 
            Enabled = l_mainSwitchEnabled_0
        })
    });
end;
v17 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Networking = v8, 
    Plugin = l_ContextServices_0.Plugin
})(v17);
return v4.connect(function(v45, _) --[[ Line: 173 ]] --[[ Name: mapStateToProps ]]
    return {
        mainSwitchEnabled = v45.MainSwitch.mainSwitchEnabled, 
        countryRegionTable = v45.CountryRegion.countryRegionTable, 
        countryRegionList = v45.CountryRegion.countryRegionList, 
        userCountryRegionCode = v45.CountryRegion.userCountryRegionCode
    };
end, function(v47) --[[ Line: 182 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v11 (copy)
    return {
        loadCountryRegion = function(v48, v49) --[[ Line: 184 ]] --[[ Name: loadCountryRegion ]]
            -- upvalues: v47 (copy), v9 (ref)
            v47(v9(v48, v49));
        end, 
        onEmulatedCountryRegionChanged = function(v50) --[[ Line: 188 ]] --[[ Name: onEmulatedCountryRegionChanged ]]
            -- upvalues: v47 (copy), v11 (ref)
            v47(v11(v50));
        end
    };
end)(v17);