local l_AICOChatBot_0 = game:GetFastFlag("AICOChatBot");
local l_CAPNewUserExperiment_0 = game:GetFastFlag("CAPNewUserExperiment");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Parent_0.SharedPluginConstants);
local v9 = require(l_Parent_0.Core.Util.Constants);
local _ = require(l_Parent_0.Core.Util.Images);
local v11 = require(l_Parent_0.Core.Components.ExternalServicesWrapper);
local v12 = require(l_Parent_0.Core.Components.PluginWidget.DockWidget);
local v13 = require(l_Parent_0.Core.Components.Toolbox);
local v14 = require(l_Parent_0.Core.Actions.StopAllSounds);
local v15 = require(l_Util_0.makeTheme);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_Packages_0.Framework).Util;
local v19 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v20 = require(l_Util_0.Analytics.Analytics);
local v21 = v5.PureComponent:extend("ToolboxPlugin");
v21.init = function(v22, v23) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v20 (copy)
    v22.theme = v15();
    v22.localization = v23.localization;
    v22.plugin = v23.plugin;
    if not v22.plugin then
        error("ToolboxPlugin component requires plugin to be passed as prop");
    end;
    v22.state = {
        enabled = true, 
        pluginGui = nil
    };
    v22.toolbar = v23.pluginLoaderContext.toolbar;
    v22.toolboxButton = v23.pluginLoaderContext.mainButton;
    v22.onDockWidgetEnabledChanged = function(_) --[[ Line: 56 ]]
        -- upvalues: v22 (copy), v20 (ref)
        if v22.dockWidget.Enabled == false then
            v22.props.stopAllSounds();
        end;
        v22.toolboxButton:SetActive(v22.dockWidget.Enabled);
        if v22.dockWidget.Enabled then
            v20.onToolboxDisplayed();
            return;
        else
            v20.onToolboxHidden();
            return;
        end;
    end;
    v22.onAncestryChanged = function(_, _, v27) --[[ Line: 70 ]]
        -- upvalues: v22 (copy)
        if not v27 and v22.props.onPluginWillDestroy then
            v22.props.onPluginWillDestroy();
        end;
    end;
    v22.dockWidgetRefFunc = function(v28) --[[ Line: 76 ]]
        -- upvalues: v22 (copy)
        v22.dockWidget = v28;
        v22.toolboxButton:SetActive(v22.dockWidget.Enabled);
    end;
    local v29 = nil;
    v22.onDockWidgetInteraction = function() --[[ Line: 83 ]]
        -- upvalues: v22 (copy), v29 (ref), v20 (ref)
        local l_AbsoluteSize_0 = v22.dockWidget.AbsoluteSize;
        if v29 == nil or v29.X ~= l_AbsoluteSize_0.X or v29.Y ~= l_AbsoluteSize_0.Y then
            v20.onToolboxWidgetInteraction(l_AbsoluteSize_0);
            v29 = l_AbsoluteSize_0;
        end;
    end;
end;
v21.didMount = function(v31) --[[ Line: 93 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy), l_StudioService_0 (copy), v8 (copy), l_AICOChatBot_0 (copy), l_CAPNewUserExperiment_0 (copy), v9 (copy)
    v31.props.pluginLoaderContext.mainButtonClickedSignal:Connect(function() --[[ Line: 94 ]]
        -- upvalues: v31 (copy), v20 (ref)
        v31.dockWidget.Enabled = not v31.dockWidget.Enabled;
        if v31.dockWidget.Enabled then
            v20.onPluginButtonClickOpen();
            return;
        else
            v20.onPluginButtonClickClose();
            return;
        end;
    end);
    local v32 = l_StudioService_0:getStartupAssetId();
    if v32 and #v32 > 0 then
        v31.dockWidget.Enabled = true;
    end;
    v31.onDockWidgetEnabledChanged(v31.dockWidget);
    v31._dockWidgetInteractionConnection = v31.dockWidget.WindowFocused:Connect(v31.onDockWidgetInteraction);
    v31:setState({
        pluginGui = v31.dockWidget
    });
    v31._showPluginsConnection = v31.props.pluginLoaderContext.signals["MemStorageService." .. v8.SHOW_TOOLBOX_PLUGINS_EVENT]:Connect(function() --[[ Line: 121 ]]
        -- upvalues: v31 (copy)
        v31.dockWidget.Enabled = true;
        v31.dockWidget:RequestRaise();
    end);
    if l_AICOChatBot_0 or l_CAPNewUserExperiment_0 then
        v31._showPluginsConnection = v31.props.pluginLoaderContext.signals["MemStorageService." .. v8.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT]:Connect(function() --[[ Line: 129 ]]
            -- upvalues: v31 (copy)
            v31.dockWidget.Enabled = true;
            v31.dockWidget:RequestRaise();
        end);
    end;
    v31._changeMarketplaceTabConnection = v31.props.pluginLoaderContext.signals["MemStorageService." .. v9.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE]:Connect(function() --[[ Line: 137 ]]
        -- upvalues: v31 (copy)
        v31.dockWidget.Enabled = true;
        v31.dockWidget:RequestRaise();
    end);
end;
v21.willUnmount = function(v33) --[[ Line: 144 ]] --[[ Name: willUnmount ]]
    if v33.disconnectLocalizationListener then
        v33.disconnectLocalizationListener();
    end;
    if v33._showPluginsConnection then
        v33._showPluginsConnection:Disconnect();
        v33._showPluginsConnection = nil;
    end;
    if v33._changeMarketplaceTabConnection then
        v33._changeMarketplaceTabConnection:Disconnect();
        v33._changeMarketplaceTabConnection = nil;
    end;
    if v33._dockWidgetInteractionConnection then
        v33._dockWidgetInteractionConnection:Disconnect();
        v33._dockWidgetInteractionConnection = nil;
    end;
end;
v21.render = function(v34) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v5 (copy), v12 (copy), l_ContextServices_0 (copy), v19 (copy), v11 (copy), v13 (copy)
    local l_props_0 = v34.props;
    local l_state_0 = v34.state;
    local l_plugin_0 = l_props_0.plugin;
    local l_theme_0 = l_props_0.theme;
    local l_networkInterface_0 = l_props_0.networkInterface;
    local l_localization_0 = l_props_0.localization;
    local l_backgrounds_0 = l_props_0.backgrounds;
    local l_suggestions_0 = l_props_0.suggestions;
    local l_tryOpenAssetConfig_0 = l_props_0.tryOpenAssetConfig;
    local _ = l_state_0.enabled;
    local l_pluginGui_0 = l_state_0.pluginGui;
    local v46 = l_pluginGui_0 and l_pluginGui_0.AbsoluteSize.x or v9.TOOLBOX_MIN_WIDTH;
    local v47 = l_pluginGui_0 ~= nil;
    local v48 = v34.props.Localization:getText("General", "ToolboxToolbarName");
    return v5.createElement(v12, {
        Id = "Toolbox", 
        Title = v48, 
        Name = "Toolbox", 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
        MinWidth = v9.TOOLBOX_MIN_WIDTH, 
        MinHeight = v9.TOOLBOX_MIN_HEIGHT, 
        [v5.Ref] = v34.dockWidgetRefFunc, 
        [v5.Change.Enabled] = v34.onDockWidgetEnabledChanged, 
        [v5.Event.AncestryChanged] = v34.onAncestryChanged
    }, {
        Toolbox = v47 and l_ContextServices_0.provide({
            l_ContextServices_0.Focus.new(v34.state.pluginGui), 
            v19.new()
        }, {
            v5.createElement(v11, {
                plugin = l_plugin_0, 
                pluginGui = l_pluginGui_0, 
                theme = l_theme_0, 
                networkInterface = l_networkInterface_0, 
                localization = l_localization_0
            }, {
                v5.createElement(v13, {
                    initialWidth = v46, 
                    backgrounds = l_backgrounds_0, 
                    suggestions = l_suggestions_0, 
                    tryOpenAssetConfig = l_tryOpenAssetConfig_0, 
                    pluginGui = l_pluginGui_0, 
                    pluginLoaderContext = l_props_0.pluginLoaderContext, 
                    onMouseEnter = v34.onDockWidgetInteraction
                })
            })
        })
    });
end;
v21 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v21);
return v6.connect(nil, function(v49) --[[ Line: 230 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        stopAllSounds = function() --[[ Line: 232 ]] --[[ Name: stopAllSounds ]]
            -- upvalues: v49 (copy), v14 (ref)
            v49(v14());
        end
    };
end)(v21);