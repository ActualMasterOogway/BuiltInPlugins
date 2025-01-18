local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v10 = require(l_Parent_0.Src.Util.Constants);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local l_UI_0 = v6.UI;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_map_0 = v6.Dash.map;
local l_StyleModifier_0 = v6.Util.StyleModifier;
local v19 = require(l_Parent_0.Src.Networking.Requests.GetLanguages);
local function _() --[[ Line: 57 ]] --[[ Name: GetLocaleId ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    return l_PlayerEmulatorService_0.EmulatedGameLocale;
end;
local function _(v21) --[[ Line: 61 ]] --[[ Name: SetLocaleId ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    l_PlayerEmulatorService_0.EmulatedGameLocale = v21;
end;
local function _() --[[ Line: 65 ]] --[[ Name: GetMainSwitchEnabled ]]
    -- upvalues: l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_PlayerEmulatorService_0 (copy)
    if l_EnablePseudolocalizationInPlayerEmulator2_0 then
        return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
    else
        return l_PlayerEmulatorService_0.PlayerEmulationEnabled_deprecated;
    end;
end;
l_LocalizationService_0.RobloxForcePlayModeRobloxLocaleId = l_getStudioLocaleId_0();
local v24 = v4.PureComponent:extend("LanguageSection");
v24.getCurrentLanguageName = function(v25) --[[ Line: 78 ]] --[[ Name: getCurrentLanguageName ]]
    local v26 = string.gsub(v25.state.localeId, "-", "_");
    local l_languagesTable_0 = v25.props.languagesTable;
    if v26 ~= "" and l_languagesTable_0[v26] then
        return l_languagesTable_0[v26].displayText;
    else
        return;
    end;
end;
v24.getTestLangInstructionText = function(v28) --[[ Line: 87 ]] --[[ Name: getTestLangInstructionText ]]
    local l_Localization_0 = v28.props.Localization;
    local v30 = string.gsub(v28.state.localeId, "-", "_");
    local l_languagesTable_1 = v28.props.languagesTable;
    if v30 ~= "" and l_languagesTable_1[v30] then
        return string.format(l_Localization_0:getText("LanguageSection", "InstructionText"), l_languagesTable_1[v30].displayText, l_languagesTable_1[v30].languageCode);
    else
        return "";
    end;
end;
v24.initLocaleId = function(v32) --[[ Line: 102 ]] --[[ Name: initLocaleId ]]
    -- upvalues: v10 (copy), l_PlayerEmulatorService_0 (copy)
    local l_Setting_0 = v32.props.Plugin:get():GetSetting(v10.LOCALEID_SETTING_KEY);
    if l_Setting_0 then
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_Setting_0;
    end;
end;
v24.onPlayerEmulationEnabledChanged = function(v34) --[[ Line: 111 ]] --[[ Name: onPlayerEmulationEnabledChanged ]]
    -- upvalues: l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_PlayerEmulatorService_0 (copy), l_getStudioLocaleId_0 (copy)
    local l_localeId_0 = v34.state.localeId;
    if if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_PlayerEmulatorService_0.PlayerEmulationEnabled else l_PlayerEmulatorService_0.PlayerEmulationEnabled_deprecated then
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_localeId_0;
        return;
    else
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_getStudioLocaleId_0();
        return;
    end;
end;
v24.onRobloxForcePlayModeRobloxLocaleIdChanged = function(v36) --[[ Line: 120 ]] --[[ Name: onRobloxForcePlayModeRobloxLocaleIdChanged ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v10 (copy)
    local l_EmulatedGameLocale_0 = l_PlayerEmulatorService_0.EmulatedGameLocale;
    v36:setState({
        localeId = l_EmulatedGameLocale_0
    });
    v36.props.Plugin:get():SetSetting(v10.LOCALEID_SETTING_KEY, l_EmulatedGameLocale_0);
end;
v24.init = function(v38) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy), v4 (copy)
    v38.state = {
        localeId = l_PlayerEmulatorService_0.EmulatedGameLocale
    };
    v38.textBoxRef = v4.createRef();
    v38.signalTokens = {};
    v38.onItemClicked = function(v39) --[[ Line: 137 ]]
        -- upvalues: l_PlayerEmulatorService_0 (ref), v38 (copy)
        if not v39.localeId then
            l_PlayerEmulatorService_0.EmulatedGameLocale = "";
            v38.textBoxRef.current:CaptureFocus();
            return;
        else
            l_PlayerEmulatorService_0.EmulatedGameLocale = v39.localeId;
            return;
        end;
    end;
    v38.createLanguageListForSelectInput = function(v40) --[[ Line: 146 ]]
        -- upvalues: v38 (copy)
        local v41 = {};
        if v40.displayText ~= nil then
            v41.Id = v40.displayText;
            v41.Label = v40.displayText;
            v41.localeId = v40.localeId;
            return v41;
        else
            if v40.displayTextStringKey ~= nil then
                v41.Id = v38.props.Localization:getText(v40.displayTextSectionKey, v40.displayTextStringKey);
                v41.Label = v38.props.Localization:getText(v40.displayTextSectionKey, v40.displayTextStringKey);
            end;
            return v41;
        end;
    end;
end;
v24.didMount = function(v42) --[[ Line: 160 ]] --[[ Name: didMount ]]
    -- upvalues: l_PlayerEmulatorService_0 (copy)
    local v43 = v42.props.Networking:get();
    v42.props.loadLanguages(v43);
    local v44 = l_PlayerEmulatorService_0:GetPropertyChangedSignal("EmulatedGameLocale"):Connect(function() --[[ Line: 165 ]]
        -- upvalues: v42 (copy)
        v42:onRobloxForcePlayModeRobloxLocaleIdChanged();
    end);
    table.insert(v42.signalTokens, v44);
    v42:initLocaleId();
end;
v24.willUnmount = function(v45) --[[ Line: 174 ]] --[[ Name: willUnmount ]]
    for _, v47 in pairs(v45.signalTokens) do
        v47:Disconnect();
    end;
    v45.signalTokens = nil;
end;
v24.render = function(v48) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_SelectInput_0 (copy), l_map_0 (copy), l_TextInput_0 (copy), l_PlayerEmulatorService_0 (copy), l_DEPRECATED_TextInput_0 (copy)
    local l_state_0 = v48.state;
    local l_props_0 = v48.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_localeId_1 = l_state_0.localeId;
    local l_languagesList_0 = l_props_0.languagesList;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v57 = v4.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.SELECTOR_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            HorizontalFlex = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.UIFlexAlignment.SpaceBetween else nil, 
            VerticalAlignment = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.VerticalAlignment.Center else nil, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING, 
            Wraps = l_EnablePseudolocalizationInPlayerEmulator2_0 and true or nil
        }), 
        Label = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            StyleModifier = if l_mainSwitchEnabled_0 then nil else l_StyleModifier_0.Disabled, 
            Text = l_Localization_1:getText("LanguageSection", "LabelText"), 
            TextXAlignment = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.TextXAlignment.Left else nil
        }, {
            FlexItem = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v4.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Grow
            }) else nil
        }), 
        LanguageDropdown = v4.createElement(l_SelectInput_0, {
            Items = l_map_0(l_languagesList_0, v48.createLanguageListForSelectInput), 
            LayoutOrder = 2, 
            OnItemActivated = v48.onItemClicked, 
            SelectedId = v48:getCurrentLanguageName() or l_Localization_1:getText("LanguageSection", "CustomLanguageDisplayText"), 
            Enabled = l_mainSwitchEnabled_0
        }), 
        LocaleIdTextBox = v4.createElement("Frame", {
            Size = l_Stylizer_0.LOCALEID_TEXTBOX_SIZE, 
            BorderColor3 = l_Stylizer_0.BorderColor, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            LayoutOrder = 3
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = l_Stylizer_0.TEXT_INDENT_PADDING
            }), 
            TextBox = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v4.createElement(l_TextInput_0, {
                OnFocusLost = function() --[[ Line: 247 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v48 (copy), l_PlayerEmulatorService_0 (ref)
                    if v48.textBoxRef.current then
                        l_PlayerEmulatorService_0.EmulatedGameLocale = v48.textBoxRef.current.Text;
                    end;
                end, 
                Disabled = not l_mainSwitchEnabled_0, 
                Text = l_localeId_1, 
                [v4.Ref] = v48.textBoxRef
            }) else v4.createElement(l_DEPRECATED_TextInput_0, {
                OnFocusLost = function() --[[ Line: 257 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v48 (copy), l_PlayerEmulatorService_0 (ref)
                    if v48.textBoxRef.current then
                        l_PlayerEmulatorService_0.EmulatedGameLocale = v48.textBoxRef.current.Text;
                    end;
                end, 
                Disabled = not l_mainSwitchEnabled_0, 
                Text = l_localeId_1, 
                [v4.Ref] = v48.textBoxRef
            })
        })
    });
    local v58 = v4.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else nil, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    }, {
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = l_Stylizer_0.TEXT_INDENT_PADDING, 
            PaddingBottom = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING else nil
        }), 
        TextLabel = v4.createElement(l_TextLabel_0, {
            AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
            Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.LANGUAGE_INSTRUCTION_SIZE, 
            StyleModifier = if l_mainSwitchEnabled_0 then nil else l_StyleModifier_0.Disabled, 
            TextSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_Stylizer_0.LANGUAGE_INSTRUCTION_TEXT_SIZE else nil, 
            Text = v48:getTestLangInstructionText(), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = l_EnablePseudolocalizationInPlayerEmulator2_0 and true or nil
        })
    });
    return v4.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.fromScale(1, 0) else l_Stylizer_0.LANGUAGE_SECTION_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING else nil
        }), 
        SelectorModule = v57, 
        TextModule = v58
    });
end;
v24 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Networking = v9, 
    Plugin = l_ContextServices_0.Plugin
})(v24);
return v5.connect(function(v59, _) --[[ Line: 324 ]] --[[ Name: mapStateToProps ]]
    return {
        mainSwitchEnabled = v59.MainSwitch.mainSwitchEnabled, 
        languagesTable = v59.Languages.languagesTable, 
        languagesList = v59.Languages.languagesList
    };
end, function(v61) --[[ Line: 332 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy)
    return {
        loadLanguages = function(v62) --[[ Line: 334 ]] --[[ Name: loadLanguages ]]
            -- upvalues: v61 (copy), v19 (ref)
            v61(v19(v62));
        end
    };
end)(v24);