local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactUtils);
local v5 = require(l_Parent_0.Packages.ReactRoblox);
local v6 = require(l_Parent_0.Packages.Rodux);
local v7 = require(l_Parent_0.SharedPluginConstants);
local l_ContextStack_0 = v4.ContextStack;
local l_DockWidget_0 = v1.UI.DockWidget;
local l_ContextServices_0 = v1.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_StudioServices_0 = v2.Context.StudioServices;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.App);
local v18 = require(l_Components_0.GenerationProvider);
local v19 = require(l_Components_0.GeneratedMaterialsProvider);
local v20 = require(l_Components_0.PluginSettingsProvider);
local v21 = require(l_Components_0.PreviewProvider);
local v22 = require(l_Components_0.MainView);
local v23 = require(l_Parent_0.Src.Controllers.MaterialPreviewController);
local v24 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v25 = require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere);
local v26 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerUIChanges);
local v27 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v28 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerFixButtonState);
local v29 = require(l_Parent_0.Src.Reducers.MainReducer);
local v30 = require(l_Parent_0.Src.Resources.MakeTheme);
local v31 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v34 = require(l_Parent_0.Src.Util.Constants);
local v35 = v3.PureComponent:extend("MainPlugin");
v35.init = function(v36, _) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v25 (copy), v26 (copy), l_MemStorageService_0 (copy), v7 (copy), v28 (copy), v6 (copy), v29 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v31 (copy), v24 (copy), l_StudioServices_0 (copy), v23 (copy), v27 (copy)
    if v25() then
        v36:setState({
            enabled = false, 
            explicitlyOpened = false
        });
    else
        v36:setState({
            enabled = false
        });
    end;
    v36.setEnabled = function(v38) --[[ Line: 64 ]]
        -- upvalues: v26 (ref), l_MemStorageService_0 (ref), v7 (ref), v36 (copy)
        if v26() then
            l_MemStorageService_0:setItem(v7.MATERIAL_GENERATOR_ENABLED, (tostring(v38)));
        end;
        v36:setState({
            enabled = v38
        });
    end;
    v36.toggleEnabled = function() --[[ Line: 74 ]]
        -- upvalues: v25 (ref), v28 (ref), v36 (copy)
        if v25() then
            if v28() then
                v36.setEnabled(not v36.state.enabled);
                v36:setState({
                    explicitlyOpened = true
                });
                return;
            else
                v36:setState(function(v39) --[[ Line: 82 ]]
                    return {
                        enabled = not v39.enabled, 
                        explicitlyOpened = true
                    };
                end);
                return;
            end;
        elseif v28() then
            v36.setEnabled(not v36.state.enabled);
            return;
        else
            v36:setState(function(v40) --[[ Line: 93 ]]
                return {
                    enabled = not v40.enabled
                };
            end);
            return;
        end;
    end;
    v36.onClose = function() --[[ Line: 102 ]]
        -- upvalues: v28 (ref), v36 (copy)
        if v28() then
            v36.setEnabled(false);
            return;
        else
            v36:setState({
                enabled = false
            });
            return;
        end;
    end;
    v36.onRestore = function(v41) --[[ Line: 112 ]]
        -- upvalues: v25 (ref), v28 (ref), v36 (copy)
        if v25() then
            if v28() then
                if not v36.state.explicitlyOpened then
                    v36.setEnabled(v41);
                    return;
                end;
            elseif not v36.state.explicitlyOpened then
                v36:setState({
                    enabled = v41
                });
                return;
            end;
        elseif v28() then
            v36.setEnabled(v41);
            return;
        else
            v36:setState({
                enabled = v41
            });
        end;
    end;
    v36.onDockWidgetCreated = function() --[[ Line: 136 ]]
        -- upvalues: v36 (copy)
        v36.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v36.toggleEnabled);
    end;
    v36.onWidgetEnabledChanged = function(v42) --[[ Line: 140 ]]
        -- upvalues: v28 (ref), v36 (copy)
        if v28() then
            v36.setEnabled(v42.Enabled);
            return;
        else
            v36:setState({
                enabled = v42.Enabled
            });
            return;
        end;
    end;
    v36.store = v6.Store.new(v29, nil, {
        v6.thunkMiddleware
    }, nil);
    v36.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialGenerator"
    });
    v36.analytics = l_ContextServices_0.Analytics.new(v31);
    if v24() then
        v36.studioServices = l_StudioServices_0.new();
    else
        v36.materialPreviewController = v23.new(v36.store);
    end;
    if v25() then
        l_MemStorageService_0:Bind(v7.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT, function() --[[ Line: 169 ]]
            -- upvalues: v28 (ref), v36 (copy)
            if v28() then
                v36.setEnabled(true);
                v36:setState({
                    explicitlyOpened = true
                });
                return;
            else
                v36:setState({
                    enabled = true, 
                    explicitlyOpened = true
                });
                return;
            end;
        end);
        if not v27() then
            l_MemStorageService_0:Bind(v7.DEPRECATED_HIDE_MATERIAL_GENERATOR_PLUGIN_EVENT, function() --[[ Line: 184 ]]
                -- upvalues: v36 (copy)
                v36.onClose();
            end);
        end;
    end;
end;
v35.willUnmount = function(v43) --[[ Line: 191 ]] --[[ Name: willUnmount ]]
    -- upvalues: v24 (copy)
    if v24() then
        if v43.studioServices then
            v43.studioServices:destroy();
            return;
        end;
    elseif v43.materialPreviewController then
        v43.materialPreviewController:destroy();
    end;
end;
v35.didUpdate = function(v44) --[[ Line: 203 ]] --[[ Name: didUpdate ]]
    v44.props.pluginLoaderContext.mainButton:SetActive(v44.state.enabled);
end;
v35.render = function(v45) --[[ Line: 207 ]] --[[ Name: render ]]
    -- upvalues: v28 (copy), v26 (copy), l_MemStorageService_0 (copy), v7 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v30 (copy), v24 (copy), l_Store_0 (copy), l_StudioServices_0 (copy), l_ContextServices_0 (copy), v3 (copy), l_DockWidget_0 (copy), v34 (copy), v5 (copy), l_ContextStack_0 (copy), v19 (copy), v18 (copy), v20 (copy), v21 (copy), v17 (copy), v22 (copy)
    local l_props_0 = v45.props;
    local l_state_0 = v45.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if not v28() and v26() then
        l_MemStorageService_0:setItem(v7.MATERIAL_GENERATOR_ENABLED, l_enabled_0 and "true" or "false");
    end;
    local v50 = {
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v30(), 
        v45.localization, 
        v45.analytics
    };
    if v24() then
        table.insert(v50, v45.studioServices);
    else
        table.insert(v50, l_Store_0.new(v45.store));
        table.insert(v50, v45.materialPreviewController);
        table.insert(v50, l_StudioServices_0.new());
    end;
    return l_ContextServices_0.provide(v50, {
        MainWidget = if v24() then v3.createElement(l_DockWidget_0, {
            Id = "MaterialGenerator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v45.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = if v24() then v34.PLUGIN_SIZE else Vector2.new(640, 480), 
            MinSize = if v24() then v34.PLUGIN_MIN_SIZE else Vector2.new(250, 200), 
            OnClose = v45.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v45.onRestore, 
            OnWidgetCreated = v45.onDockWidgetCreated, 
            [v5.Change.Enabled] = v45.onWidgetEnabledChanged
        }, {
            Content = v3.createElement(l_ContextStack_0, {
                providers = {
                    v3.createElement(v19), 
                    v3.createElement(v18), 
                    v3.createElement(v20), 
                    v3.createElement(v21, {
                        enabled = l_enabled_0
                    })
                }
            }, {
                App = if l_enabled_0 then v3.createElement(v17) else nil
            })
        }) else v3.createElement(l_DockWidget_0, {
            Id = "MaterialGenerator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v45.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = if v24() then v34.PLUGIN_SIZE else Vector2.new(640, 480), 
            MinSize = if v24() then v34.PLUGIN_MIN_SIZE else Vector2.new(250, 200), 
            OnClose = v45.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v45.onRestore, 
            OnWidgetCreated = v45.onDockWidgetCreated, 
            [v5.Change.Enabled] = v45.onWidgetEnabledChanged
        }, l_enabled_0 and {
            Contents = v3.createElement(v22)
        } or nil)
    });
end;
return v35;