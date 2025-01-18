local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.Src.Util.applyToSelectionByIdentifier);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isMaterialVariantByIdentifier);
local v3 = require(l_script_FirstAncestor_0.Src.Constants.MATERIAL_VARIANT_APPEARANCE_PROPERTIES);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v6 = require(l_script_FirstAncestor_0.Packages.React);
local v7 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Popup_0 = l_UI_0.Popup;
local l_ContextServices_0 = v4.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_StudioServices_0 = v5.Context.StudioServices;
local l_ViewType_0 = v5.Enums.ViewType;
local l_parseMaterial_0 = v5.Util.parseMaterial;
local l_getSerializedMaterialIdentifier_0 = v5.Util.getSerializedMaterialIdentifier;
local v19 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v20 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v21 = require(l_script_FirstAncestor_0.Src.Resources.createThemeTable);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDropdownIconCanOpenPlugin);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialActionAsTool);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v27 = require(l_Components_0.MainView);
local v28 = v6.PureComponent:extend("MainPlugin");
local v29 = string.format("rbxasset://textures/MaterialFramework/%s/Material.png", "Light");
local v30 = string.format("rbxasset://textures/MaterialFramework/%s/Material.png", "Dark");
local function _() --[[ Line: 48 ]] --[[ Name: getDefaultMainRibbonIcon ]]
    -- upvalues: v29 (copy), v30 (copy)
    if settings().Studio.Theme.Name == "Light" then
        return v29;
    else
        return v30;
    end;
end;
v28.init = function(v32, _) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_ViewType_0 (copy), v24 (copy), v25 (copy), l_parseMaterial_0 (copy), l_getSerializedMaterialIdentifier_0 (copy), v3 (copy), v29 (copy), v30 (copy), v7 (copy), v19 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v5 (copy), v20 (copy), l_StudioServices_0 (copy), v21 (copy)
    v32.pluginButtonRef = v6.createRef();
    v32.savedFilterChips = {
        recents = false, 
        appliedInPlace = false, 
        customMaterials = false
    };
    v32.savedListCanvasPosition = Vector2.new(0, 0);
    v32.savedGridCanvasPosition = Vector2.new(0, 0);
    v32.selectedMaterialConnection = nil;
    v32:setState({
        enabled = false, 
        viewType = l_ViewType_0.Grid, 
        selectedMaterialIdentifier = if v24() then nil else Enum.Material.Plastic.Name, 
        isMaterialFillToolEnabled = not v25() and nil
    });
    v32.toggleEnabled = function() --[[ Line: 77 ]]
        -- upvalues: v32 (copy)
        if not v32.state.enabled then
            v32.analytics:report("PopupOpened");
        end;
        v32:setState(function(v34) --[[ Line: 83 ]]
            return {
                enabled = not v34.enabled
            };
        end);
    end;
    v32.openPopup = function(v35) --[[ Line: 90 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            enabled = v35
        });
        v32.analytics:report("PopupOpened");
    end;
    v32.setButtonIcon = function(v36) --[[ Line: 98 ]]
        -- upvalues: v32 (copy)
        v32.pluginButtonRef:getValue().button.Icon = v36;
    end;
    v32.DEPRECATED_setSelectedMaterial = function(v37) --[[ Line: 104 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            selectedMaterialIdentifier = v37
        });
    end;
    v32.setSelectedMaterial = function(v38) --[[ Line: 110 ]]
        -- upvalues: l_parseMaterial_0 (ref), l_getSerializedMaterialIdentifier_0 (ref), v32 (copy), v3 (ref)
        local v39, v40 = l_parseMaterial_0(v38);
        local v41 = l_getSerializedMaterialIdentifier_0(v38);
        local v42 = v32.studioServices:getService("MaterialService");
        v32:setState({
            selectedMaterialIdentifier = v41
        });
        if v32.selectedMaterialConnection then
            v32.selectedMaterialConnection:Disconnect();
        end;
        if v40 then
            v32.selectedMaterialConnection = v38.Changed:Connect(function(v43) --[[ Line: 124 ]]
                -- upvalues: v42 (copy), v39 (copy), v40 (copy), v3 (ref), v32 (ref)
                if not v42:getMaterialVariant(v39, (tostring(v40))) or v3[v43] then
                    v32.clearSelectedMaterial();
                end;
            end);
            return;
        else
            v32.selectedMaterialConnection = v42:GetMaterialOverrideChanged(v38):Connect(function() --[[ Line: 134 ]]
                -- upvalues: v32 (ref)
                v32.clearSelectedMaterial();
            end);
            return;
        end;
    end;
    v32.clearSelectedMaterial = function() --[[ Line: 140 ]]
        -- upvalues: v32 (copy), v29 (ref), v30 (ref)
        if v32.selectedMaterialConnection then
            v32.selectedMaterialConnection:Disconnect();
            v32.selectedMaterialConnection = nil;
        end;
        v32.state.selectedMaterialIdentifier = nil;
        v32.setButtonIcon(if settings().Studio.Theme.Name == "Light" then v29 else v30);
    end;
    v32.onClose = function() --[[ Line: 150 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            enabled = false
        });
    end;
    v32.onWidgetEnabledChanged = function(v44) --[[ Line: 156 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            enabled = v44.Enabled
        });
    end;
    v32.setViewType = function(v45) --[[ Line: 162 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            viewType = v45
        });
    end;
    v32.onFilterChipsUpdate = function(v46) --[[ Line: 168 ]]
        -- upvalues: v32 (copy)
        v32.savedFilterChips = v46;
    end;
    v32.createOnScrollUpdate = function(v47) --[[ Line: 172 ]]
        -- upvalues: l_ViewType_0 (ref), v32 (copy)
        return function(v48) --[[ Line: 173 ]]
            -- upvalues: v47 (copy), l_ViewType_0 (ref), v32 (ref)
            if v47 == l_ViewType_0.List then
                v32.savedListCanvasPosition = v48;
                return;
            else
                if v47 == l_ViewType_0.Grid then
                    v32.savedGridCanvasPosition = v48;
                end;
                return;
            end;
        end;
    end;
    v32.store = v7.Store.new(v19, nil, {
        v7.thunkMiddleware
    }, nil);
    v32.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialPicker", 
        libraries = {
            [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.Resources.SourceStrings, 
                translationResourceTable = v5.Resources.LocalizedStrings
            }
        }
    });
    v32.analytics = l_ContextServices_0.Analytics.new(v20);
    v32.studioServices = l_StudioServices_0.new();
    if v24() then
        v32.themeChangedConnection = settings().Studio.ThemeChanged:Connect(function() --[[ Line: 203 ]]
            -- upvalues: v32 (copy), v29 (ref), v30 (ref)
            if v32.state.selectedMaterialIdentifier == nil then
                v32.setButtonIcon(if settings().Studio.Theme.Name == "Light" then v29 else v30);
            end;
        end);
    end;
    if v25() then
        v32.materialActionAsToolConnection = v32.studioServices:getService("MaterialService").MaterialFillToolEnabledChanged:Connect(function(v49) --[[ Line: 213 ]]
            -- upvalues: v32 (copy)
            v32:setState({
                isMaterialFillToolEnabled = v49
            });
        end);
    end;
    v32.themeTable = v21();
end;
v28.willUnmount = function(v50) --[[ Line: 223 ]] --[[ Name: willUnmount ]]
    -- upvalues: v24 (copy), v25 (copy)
    if v24() then
        v50.themeChangedConnection:Disconnect();
        if v50.selectedMaterialConnection then
            v50.selectedMaterialConnection:Disconnect();
            v50.selectedMaterialConnection = nil;
        end;
    end;
    if v25() then
        v50.materialActionAsToolConnection:Disconnect();
    end;
end;
v28.renderButtons = function(v51, v52) --[[ Line: 238 ]] --[[ Name: renderButtons ]]
    -- upvalues: v6 (copy), l_PluginButton_0 (copy), v25 (copy), v24 (copy), v29 (copy), v30 (copy), v1 (copy), v2 (copy)
    local l_enabled_0 = v51.state.enabled;
    local v54 = v51.studioServices:getService("Selection");
    local v55 = v51.studioServices:getService("ChangeHistoryService");
    return {
        Toggle = v6.createElement(l_PluginButton_0, {
            Toolbar = v52, 
            Active = if v25() then l_enabled_0 or v51.state.isMaterialFillToolEnabled else l_enabled_0, 
            DropdownActive = if v25() then l_enabled_0 else nil, 
            Id = "MaterialPicker", 
            Title = v51.localization:getText("Plugin", "Button"), 
            Tooltip = v51.localization:getText("Plugin", "Description"), 
            Icon = if v24() then if settings().Studio.Theme.Name == "Light" then v29 else v30 else "rbxasset://textures/MaterialFramework/PlasticWithBorder.png", 
            OnClick = function() --[[ Line: 257 ]] --[[ Name: OnClick ]]
                -- upvalues: v25 (ref), v51 (copy), v24 (ref), v1 (ref), v54 (copy), v55 (copy), v2 (ref)
                if v25() then
                    local v56 = v51.studioServices:getService("MaterialService");
                    if v56:GetIsMaterialActionAsToolEnabled() then
                        v56:ToggleMaterialFillToolEnabled();
                        v51:setState({
                            isMaterialFillToolEnabled = not v51.state.isMaterialFillToolEnabled
                        });
                        return;
                    end;
                end;
                if v24() then
                    if v51.state.selectedMaterialIdentifier == nil then
                        v51.openPopup(true);
                        return;
                    else
                        v51.pluginButtonRef:getValue().button:SetActive(true);
                        local l_selectedMaterialIdentifier_0 = v51.state.selectedMaterialIdentifier;
                        v1(l_selectedMaterialIdentifier_0, v54);
                        v55:SetWaypoint((("Applied %* Material to Selection"):format(l_selectedMaterialIdentifier_0)));
                        local v58 = #v54:Get();
                        if v58 > 0 then
                            local v59 = v2(l_selectedMaterialIdentifier_0) and "MaterialVariant" or "BaseMaterial";
                            v51.analytics:report("MaterialApplied", "IconButton", v58, l_selectedMaterialIdentifier_0, v59);
                            return;
                        end;
                    end;
                else
                    v51.pluginButtonRef:getValue().button:SetActive(true);
                    local l_selectedMaterialIdentifier_1 = v51.state.selectedMaterialIdentifier;
                    v1(l_selectedMaterialIdentifier_1, v54);
                    v55:SetWaypoint((("Applied %* Material to Selection"):format(l_selectedMaterialIdentifier_1)));
                    local v61 = #v54:Get();
                    if v61 > 0 then
                        local v62 = v2(l_selectedMaterialIdentifier_1) and "MaterialVariant" or "BaseMaterial";
                        v51.analytics:report("MaterialApplied", "IconButton", v61, l_selectedMaterialIdentifier_1, v62);
                    end;
                end;
            end, 
            OnDropdownClick = v51.toggleEnabled, 
            ButtonType = "Dropdown", 
            ClickableWhenViewportHidden = false, 
            ref = v51.pluginButtonRef
        })
    };
end;
v28.renderPopup = function(v63, v64) --[[ Line: 334 ]] --[[ Name: renderPopup ]]
    -- upvalues: v6 (copy), l_Popup_0 (copy), v27 (copy), v24 (copy)
    local v65 = v63.pluginButtonRef:getValue();
    assert(v65, "PluginButton not initialized");
    return v6.createElement(l_Popup_0, {
        CreateWidgetImmediately = false, 
        Enabled = v63.state.enabled, 
        Modal = false, 
        Title = v63.localization:getText("Plugin", "Title"), 
        Size = v63.themeTable.Popup.Size, 
        OnClose = v63.onClose, 
        PopupTarget = v65.button
    }, {
        MainView = v6.createElement(v27, {
            plugin = v64, 
            onClose = v63.onClose, 
            onFilterChipsUpdate = v63.onFilterChipsUpdate, 
            onMaterialSelected = if v24() then v63.setSelectedMaterial else v63.DEPRECATED_setSelectedMaterial, 
            onScrollUpdate = v63.createOnScrollUpdate(v63.state.viewType), 
            onSnapshotTaken = function(v66) --[[ Line: 355 ]] --[[ Name: onSnapshotTaken ]]
                -- upvalues: v63 (copy)
                v63.setButtonIcon(v66);
                v63.onClose();
            end, 
            savedFilterChips = v63.savedFilterChips, 
            savedListCanvasPosition = v63.savedListCanvasPosition, 
            savedGridCanvasPosition = v63.savedGridCanvasPosition, 
            setViewType = v63.setViewType, 
            selectedMaterialIdentifier = v63.state.selectedMaterialIdentifier, 
            viewType = v63.state.viewType
        })
    });
end;
v28.render = function(v67) --[[ Line: 369 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v6 (copy), l_PluginToolbar_0 (copy)
    local l_props_0 = v67.props;
    local l_state_0 = v67.state;
    local l_Plugin_0 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_Plugin_0), 
        l_Store_0.new(v67.store), 
        l_Mouse_0.new(l_Plugin_0:getMouse()), 
        v67.themeTable.createTheme(), 
        v67.localization, 
        v67.analytics, 
        v67.studioServices
    }, {
        Toolbar = v6.createElement(l_PluginToolbar_0, {
            Title = "Edit", 
            RenderButtons = function(v72) --[[ Line: 386 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v67 (copy)
                return v67:renderButtons(v72);
            end
        }), 
        Popup = if l_enabled_1 then v67:renderPopup(l_Plugin_0) else nil
    });
end;
return v28;