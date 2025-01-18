local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_UI_0 = v1.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v14 = require(l_script_FirstAncestor_0.Src.Components.Dialogs.PresetNamePrompt);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v18 = v2.PureComponent:extend("PresetMenu");
v18.init = function(v19) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v17 (copy), l_StyleModifier_0 (copy), v2 (copy), l_Button_0 (copy), l_TextLabel_0 (copy)
    local l_Localization_1 = v19.props.Localization;
    local v21 = l_Localization_1:getText("Templates", "Reset");
    local v22 = l_Localization_1:getText("Templates", "Rename");
    local v23 = l_Localization_1:getText("Templates", "Delete");
    local v24 = l_Localization_1:getText("Templates", "SaveChanges");
    local v25 = l_Localization_1:getText("Templates", "SaveNewPreset");
    local v26 = l_Localization_1:getText("Templates", "SetAsDefault");
    v19.dropdownItems = {
        v21, 
        v24, 
        v25, 
        v26, 
        v22, 
        v23
    };
    v19.state = {
        isFocused = if v16() then nil else false, 
        isHovered = if v16() then nil else false, 
        showNameDialog = false, 
        promptIntent = 0
    };
    if not v16() then
        v19.focused = function() --[[ Line: 56 ]]
            -- upvalues: v19 (copy)
            v19:setState({
                isFocused = true
            });
        end;
        v19.unfocused = function() --[[ Line: 62 ]]
            -- upvalues: v19 (copy)
            v19:setState({
                isFocused = false
            });
        end;
        v19.onHoveredItemChanged = function(_) --[[ Line: 68 ]]
            -- upvalues: v19 (copy)
            v19:setState({
                isHovered = true
            });
        end;
    end;
    v19.onItemActivated = function(v28, _) --[[ Line: 75 ]]
        -- upvalues: v19 (copy), v16 (ref), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_props_0 = v19.props;
        local v31 = if v16() then l_props_0.ActiveQueueItem.currentPreset else l_props_0.CurrentPreset;
        local l_PresetController_0 = l_props_0.PresetController;
        if v28 == v21 then
            if v16() then
                l_PresetController_0:resolvePreset(v31, l_props_0.ActiveQueueItem);
                return;
            else
                l_PresetController_0:DEPRECATED_resolvePreset(v31);
                return;
            end;
        elseif v28 == v22 then
            v19:setState({
                showNameDialog = true, 
                promptIntent = "Rename"
            });
            return;
        elseif v28 == v23 then
            l_props_0.PresetController:delete(v31);
            return;
        elseif v28 == v24 then
            l_PresetController_0:save(v31);
            return;
        elseif v28 == v25 then
            v19:setState({
                showNameDialog = true, 
                promptIntent = "Create"
            });
            return;
        else
            if v28 == v26 then
                l_props_0.PresetController:setDefault(v31);
            end;
            return;
        end;
    end;
    v19.isItemEnabled = function(v33) --[[ Line: 109 ]]
        -- upvalues: v19 (copy), v16 (ref), v17 (ref), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_props_1 = v19.props;
        local v35 = if v16() then l_props_1.ActiveQueueItem.currentPreset else l_props_1.CurrentPreset;
        local v36 = l_props_1.PresetController:isStudioDefault(v35);
        local v37 = l_props_1.PresetController:isLastImport(v35);
        local v38 = l_props_1.PresetController:isDefault(v35);
        local v39 = not v36 and not v37;
        local v40 = if v17() then l_props_1.ActiveQueueItem.settingsChanged else l_props_1.SettingsChanged;
        if v33 == v21 then
            return v40;
        elseif v33 == v22 then
            return v39;
        elseif v33 == v23 then
            return v39;
        elseif v33 == v24 then
            return v40 and v39;
        elseif v33 == v25 then
            return not v36 or v40;
        elseif v33 == v26 then
            return not v38;
        else
            return false;
        end;
    end;
    v19.onRenderItem = function(v41, v42, v43, v44) --[[ Line: 142 ]]
        -- upvalues: v19 (copy), l_StyleModifier_0 (ref), v2 (ref), l_Button_0 (ref), v16 (ref), l_TextLabel_0 (ref)
        local l_TopBar_0 = v19.props.Stylizer.TopBar;
        local v46 = if not v19.isItemEnabled(v41) then l_StyleModifier_0.Disabled else if v44 then l_StyleModifier_0.Hover else nil;
        return v2.createElement(l_Button_0, {
            LayoutOrder = v42, 
            OnClick = v43, 
            OnMouseEnter = not v16() and function() --[[ Line: 154 ]]
                -- upvalues: v19 (ref), v42 (copy)
                v19.onHoveredItemChanged(v42);
            end or nil, 
            Size = l_TopBar_0.MenuItemSize, 
            StyleModifier = v46, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            TextLabel = v2.createElement(l_TextLabel_0, {
                Text = v41, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 1), 
                StyleModifier = v46, 
                AutomaticSize = Enum.AutomaticSize.X
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_TopBar_0.Padding.Left), 
                    PaddingRight = UDim.new(0, l_TopBar_0.Padding.Right)
                })
            })
        });
    end;
    v19.onNameDialogClose = function() --[[ Line: 177 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showNameDialog = false
        });
    end;
    v19.onNameDialogButtonPressed = function(v47, v48) --[[ Line: 183 ]]
        -- upvalues: v19 (copy), v16 (ref)
        local l_PresetController_1 = v19.props.PresetController;
        if v47 == "Save" then
            if v19.state.promptIntent == "Create" then
                l_PresetController_1:save(v48);
            elseif v19.state.promptIntent == "Rename" then
                if v16() then
                    l_PresetController_1:rename(v48, v19.props.ActiveQueueItem.currentPreset);
                else
                    l_PresetController_1:DEPRECATED_rename(v48);
                end;
            end;
        end;
        v19:setState({
            showNameDialog = false
        });
    end;
end;
v18.render = function(v50) --[[ Line: 203 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy), v14 (copy), v16 (copy)
    local l_props_2 = v50.props;
    local l_state_0 = v50.state;
    local l_TopBar_1 = l_props_2.Stylizer.TopBar;
    return v2.createElement(l_Pane_0, {
        Size = l_TopBar_1.MenuButtonSize, 
        LayoutOrder = l_props_2.LayoutOrder
    }, {
        PresetMenu = v2.createElement(l_SelectInput_0, {
            Items = v50.dropdownItems, 
            HideText = true, 
            OnItemActivated = v50.onItemActivated, 
            OnRenderItem = v50.onRenderItem, 
            OnMouseEnter = v50.focused, 
            OnMouseLeave = v50.unfocused, 
            Size = UDim2.new(1, 0, 1, 0), 
            ExpandIcon = l_TopBar_1.MenuImage, 
            ShowSelection = false, 
            UseAutoWidth = true
        }), 
        PresetNamePrompt = if l_state_0.showNameDialog then v2.createElement(v14, {
            CurrentPreset = if v16() then l_props_2.ActiveQueueItem.currentPreset else v50.props.CurrentPreset, 
            Intent = l_state_0.promptIntent, 
            IsHintError = false, 
            OnClose = v50.onNameDialogClose, 
            OnButtonPressed = v50.onNameDialogButtonPressed
        }) else nil
    });
end;
v18 = l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    PresetController = v15
})(v18);
return v3.connect(function(v54) --[[ Line: 248 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v16 (copy), v17 (copy)
    return {
        ActiveQueueItem = if v16() then v54.Preview.activeQueueItem else nil, 
        AssetImportSession = if v16() then nil else v54.Preview.assetImportSession, 
        CurrentPreset = if v16() then nil else v54.Preview.currentPreset, 
        SettingsChanged = if not v17() then v54.Preview.settingsChanged else nil
    };
end, nil)(v18);