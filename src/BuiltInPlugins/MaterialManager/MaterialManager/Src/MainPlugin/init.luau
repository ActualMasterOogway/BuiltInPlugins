local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.SharedPluginConstants);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v14 = require(l_Parent_0.Src.Reducers.MainReducer);
local v15 = require(l_Parent_0.Src.Resources.MakeTheme);
local v16 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v20 = require(l_Components_0.MaterialBrowser);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v22 = require(l_Controllers_0.GeneralServiceController);
local v23 = require(l_Controllers_0.ImageUploader);
local v24 = require(l_Controllers_0.ImportAssetHandler);
local v25 = require(l_Controllers_0.ImageLoader);
local v26 = require(l_Controllers_0.MaterialServiceController);
local v27 = require(l_Controllers_0.PluginController);
local v28 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerUIChanges);
local v29 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v30 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerFixButtonState);
local v31 = v1.PureComponent:extend("MainPlugin");
v31.init = function(v32, v33) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), v24 (copy), v25 (copy), v28 (copy), l_MemStorageService_0 (copy), v12 (copy), v30 (copy), v2 (copy), v14 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v16 (copy), v26 (copy), v22 (copy), v27 (copy), v29 (copy)
    local l_Plugin_1 = v33.Plugin;
    v32.state = {
        enabled = false
    };
    local v35 = v23.new();
    v32.assetHandler = v24.new(v35);
    v32.imageLoader = v25.new();
    v32.setEnabled = function(v36) --[[ Line: 56 ]]
        -- upvalues: v28 (ref), l_MemStorageService_0 (ref), v12 (ref), v32 (copy)
        if v28() then
            l_MemStorageService_0:setItem(v12.MATERIAL_MANAGER_ENABLED, (tostring(v36)));
        end;
        v32:setState({
            enabled = v36
        });
    end;
    v32.toggleEnabled = function() --[[ Line: 66 ]]
        -- upvalues: v30 (ref), v32 (copy)
        if v30() then
            v32.setEnabled(not v32.state.enabled);
            return;
        else
            v32:setState(function(v37) --[[ Line: 70 ]]
                return {
                    enabled = not v37.enabled
                };
            end);
            return;
        end;
    end;
    v32.onClose = function() --[[ Line: 78 ]]
        -- upvalues: v30 (ref), v32 (copy)
        if v30() then
            v32.setEnabled(false);
            return;
        else
            v32:setState({
                enabled = false
            });
            return;
        end;
    end;
    v32.onRestore = function(v38) --[[ Line: 88 ]]
        -- upvalues: v30 (ref), v32 (copy)
        if v30() then
            v32.setEnabled(v38);
            return;
        else
            v32:setState({
                enabled = v38
            });
            return;
        end;
    end;
    v32.onWidgetEnabledChanged = function(v39) --[[ Line: 98 ]]
        -- upvalues: v30 (ref), v32 (copy)
        if v30() then
            v32.setEnabled(v39.Enabled);
            return;
        else
            v32:setState({
                enabled = v39.Enabled
            });
            return;
        end;
    end;
    v32.store = v2.Store.new(v14, nil, {
        v2.thunkMiddleware
    }, nil);
    v32.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialManager"
    });
    v32.analytics = l_ContextServices_0.Analytics.new(v16);
    v32.materialServiceController = v26.new(v32.store);
    v32.generalServiceController = v22.new();
    v32.pluginController = v27.new(l_Plugin_1, v32.store, l_Plugin_1:getMouse(), v32.generalServiceController);
    v32.pluginController:initialize();
    if game:GetEngineFeature("MaterialPickerBetaEnabled") or game:GetFastFlag("ShowMaterialManagerFromElsewhere") then
        l_MemStorageService_0:Bind(v12.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT, function() --[[ Line: 126 ]]
            -- upvalues: v30 (ref), v32 (copy)
            if v30() then
                v32.setEnabled(true);
                return;
            else
                v32:setState({
                    enabled = true
                });
                return;
            end;
        end);
        if not v29() then
            l_MemStorageService_0:Bind(v12.DEPRECATED_HIDE_MATERIAL_MANAGER_PLUGIN_EVENT, function() --[[ Line: 137 ]]
                -- upvalues: v32 (copy)
                v32.onClose();
            end);
        end;
    end;
end;
v31.willUnmount = function(v40) --[[ Line: 144 ]] --[[ Name: willUnmount ]]
    if v40.imageLoader then
        v40.imageLoader:destroy();
    end;
    if v40.materialServiceController then
        v40.materialServiceController:destroy();
    end;
    if v40.generalServiceController then
        v40.generalServiceController:destroy();
    end;
    if v40.pluginController then
        v40.pluginController:destroy();
    end;
end;
v31.renderButtons = function(v41, v42) --[[ Line: 159 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v41.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v42, 
            Active = l_enabled_0, 
            Title = "MaterialManager", 
            Tooltip = "", 
            Icon = "", 
            OnClick = v41.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v31.render = function(v44) --[[ Line: 175 ]] --[[ Name: render ]]
    -- upvalues: v30 (copy), v28 (copy), l_MemStorageService_0 (copy), v12 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v15 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v20 (copy)
    local l_props_0 = v44.props;
    local l_state_0 = v44.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    if not v30() and v28() then
        l_MemStorageService_0:setItem(v12.MATERIAL_MANAGER_ENABLED, l_enabled_1 and "true" or "false");
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Store_0.new(v44.store), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v15(), 
        v44.localization, 
        v44.analytics, 
        v44.generalServiceController, 
        v44.materialServiceController, 
        v44.imageLoader, 
        v44.assetHandler, 
        v44.pluginController
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = "Edit", 
            RenderButtons = function(v49) --[[ Line: 205 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v44 (copy)
                return v44:renderButtons(v49);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "MaterialManager", 
            Enabled = l_enabled_1, 
            Title = v44.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(300, 200), 
            OnClose = v44.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v44.onRestore, 
            [v1.Change.Enabled] = if v30() then v44.toggleEnabled else nil
        }, {
            v1.createElement(v20)
        })
    });
end;
return v31;