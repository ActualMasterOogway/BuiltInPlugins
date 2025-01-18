local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetNameLength);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetCount);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAssetImportPlugin);
local v17 = v2.PureComponent:extend("PresetNamePrompt");
v17.init = function(v18) --[[ Line: 30 ]] --[[ Name: init ]]
    v18.state = {
        currentText = v18:_getInitialPresetName(), 
        title = ""
    };
    v18.onTextChanged = function(v19) --[[ Line: 36 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            currentText = v19
        });
    end;
    v18.onButtonPressed = function(v20) --[[ Line: 42 ]]
        -- upvalues: v18 (copy)
        v18.props.OnButtonPressed(v20, v18.state.currentText);
    end;
end;
v17._getInitialPresetName = function(v21) --[[ Line: 47 ]] --[[ Name: _getInitialPresetName ]]
    -- upvalues: v15 (copy)
    local l_props_0 = v21.props;
    if l_props_0.Intent == "Rename" then
        return l_props_0.CurrentPreset;
    else
        local v23 = l_props_0.PresetController:getAllPresets();
        local v24 = l_props_0.Localization:getText("Templates", "NewPreset");
        if v23[v24] == nil then
            return v24;
        else
            for v25 = 1, v15() + 1 do
                local v26 = ("%* %*"):format(v24, v25);
                if v23[v26] == nil then
                    return v26;
                end;
            end;
            return;
        end;
    end;
end;
v17._createMessage = function(v27) --[[ Line: 68 ]] --[[ Name: _createMessage ]]
    -- upvalues: v2 (copy), l_TextLabel_0 (copy)
    local l_props_1 = v27.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_PresetController_0 = l_props_1.PresetController;
    local l_PresetNamePrompt_0 = l_props_1.Stylizer.PresetNamePrompt;
    local v32 = l_PresetNamePrompt_0.LabelSize.X.Offset + l_PresetNamePrompt_0.TextboxSize.X.Offset + l_PresetNamePrompt_0.Padding;
    local l_currentText_0 = v27.state.currentText;
    local v34 = l_PresetController_0:getNumPresetsRemaining();
    local v35 = l_props_1.Intent == "Create";
    local v36 = v34 <= 0;
    local v37 = l_PresetController_0:isLastImport(l_currentText_0) or l_PresetController_0:isStudioDefault(l_currentText_0);
    local v38 = false;
    if l_PresetController_0:getAllPresets()[l_currentText_0] ~= nil then
        v38 = v35 or l_currentText_0 ~= l_props_1.CurrentPreset;
    end;
    local v39 = "";
    local v40 = false;
    local v41 = false;
    if v37 then
        v39 = l_Localization_1:getText("Templates", "OverwritingReservedName");
        v40 = true;
    elseif v38 then
        v39 = l_Localization_1:getText("Templates", "PresetNameOverwriteWarning");
        v41 = true;
    elseif v36 and v35 then
        v39 = l_Localization_1:getText("Templates", "TooManyPresets");
        v40 = true;
    elseif v35 then
        v39 = l_Localization_1:getText("Templates", "PresetsRemaining1", {
            presetsRemaining = tostring(v34)
        });
    end;
    local v42 = nil;
    if v40 then
        v42 = "Error";
    elseif v41 then
        v42 = "Warning";
    end;
    return v2.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0, v32, 0, 0), 
        Text = v39, 
        Style = v42, 
        LayoutOrder = 2, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
end;
v17.render = function(v43) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v2 (copy), l_StyledDialog_0 (copy), l_StyleModifier_0 (copy), v16 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_TextInput_0 (copy)
    local l_props_2 = v43.props;
    local l_Localization_2 = l_props_2.Localization;
    local l_PresetController_1 = l_props_2.PresetController;
    local l_PresetNamePrompt_1 = l_props_2.Stylizer.PresetNamePrompt;
    local l_RenameMinContentSize_0 = l_PresetNamePrompt_1.RenameMinContentSize;
    local l_Intent_0 = l_props_2.Intent;
    local v50 = if l_Intent_0 == "Create" then l_Localization_2:getText("Templates", "WindowTitleNewPreset") else if l_Intent_0 == "Rename" then l_Localization_2:getText("Templates", "WindowTitleRenamePreset") else nil;
    local l_currentText_1 = v43.state.currentText;
    local v52 = l_PresetController_1:getNumPresetsRemaining() <= 0;
    local v53 = l_PresetController_1:getAllPresets()[l_currentText_1] ~= nil;
    local v54 = false;
    if l_Intent_0 == "Create" then
        v54 = v52;
    end;
    if l_Intent_0 == "Create" and v52 and v53 then
        v54 = false;
    end;
    if l_PresetController_1:isLastImport(l_currentText_1) or l_PresetController_1:isStudioDefault(l_currentText_1) then
        v54 = true;
    end;
    if utf8.len(l_currentText_1) > v14() or utf8.len(l_currentText_1) < 1 then
        v54 = true;
    end;
    return v2.createElement(l_StyledDialog_0, {
        Title = v50, 
        MinContentSize = l_RenameMinContentSize_0, 
        Buttons = {
            {
                Key = "Cancel", 
                Text = l_Localization_2:getText("Plugin", "Cancel")
            }, 
            {
                Key = "Save", 
                Text = l_Localization_2:getText("Plugin", "Save"), 
                StyleModifier = if v54 then l_StyleModifier_0.Disabled else nil
            }
        }, 
        OnButtonPressed = v43.onButtonPressed, 
        OnClose = l_props_2.OnClose, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Modal = not v16()
    }, {
        Pane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_PresetNamePrompt_1.Padding, 
            Size = UDim2.fromScale(1, 1)
        }, {
            TextBox = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Size = l_PresetNamePrompt_1.TextboxSize, 
                LayoutOrder = 1, 
                Spacing = l_PresetNamePrompt_1.Padding
            }, {
                Label = v2.createElement(l_TextLabel_0, {
                    Text = v43.props.Localization:getText("Properties", "ImportName"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = l_PresetNamePrompt_1.LabelSize, 
                    LayoutOrder = 1
                }), 
                Input = v2.createElement(l_TextInput_0, {
                    Text = v43.state.currentText, 
                    MaxLength = v14(), 
                    LayoutOrder = 2, 
                    OnTextChanged = v43.onTextChanged, 
                    Size = l_PresetNamePrompt_1.TextboxSize
                })
            }), 
            Message = v43:_createMessage()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    PresetController = v13
})(v17));