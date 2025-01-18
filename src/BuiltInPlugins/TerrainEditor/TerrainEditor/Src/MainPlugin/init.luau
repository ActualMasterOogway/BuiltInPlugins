local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.MaterialFramework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioServices_0 = v4.Context.StudioServices;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v14 = require(l_Components_0.App);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v16 = require(l_Controllers_0.ShortcutController);
local v17 = require(l_Controllers_0.PluginController);
local v18 = require(l_Controllers_0.ToolController);
local v19 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local l_Tool_0 = require(l_Parent_0.Src.Types).Tool;
local v21 = v1.PureComponent:extend("MainPlugin");
v21.init = function(v22, v23) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_Tool_0 (copy), l_ContextServices_0 (copy), v4 (copy), v3 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v19 (copy), v16 (copy), v17 (copy), l_StudioServices_0 (copy), v10 (copy), v18 (copy)
    local l_Plugin_1 = v23.Plugin;
    local v25 = false;
    if v23.PluginLoaderContext then
        local l_mainDockWidget_0 = v23.PluginLoaderContext.mainDockWidget;
        local v27 = false;
        if l_mainDockWidget_0 ~= nil then
            v27 = l_mainDockWidget_0.Enabled;
        end;
        v25 = v27;
    end;
    v22:setState({
        enabled = v25
    });
    v22.toggleEnabled = function() --[[ Line: 50 ]]
        -- upvalues: v22 (copy)
        if v22.state.enabled then
            v22.onClose();
            return;
        else
            v22.onRestore(true);
            return;
        end;
    end;
    v22.onClose = function() --[[ Line: 58 ]]
        -- upvalues: v22 (copy), l_Tool_0 (ref)
        v22:setState({
            enabled = false
        });
        if v22.toolController and v22.toolController:getTool()._name ~= l_Tool_0.Empty then
            v22.toolIndex = v22.toolController:getToolIndex();
            v22.tabIndex = v22.toolController:getTabIndex();
            v22.toolController:setTabAndToolIndex(v22.tabIndex, v22.toolIndex);
        end;
    end;
    v22.onCreated = function() --[[ Line: 72 ]]
        -- upvalues: v22 (copy)
        if v22.props.PluginLoaderContext then
            v22.props.PluginLoaderContext.mainButton:SetActive(v22.state.enabled);
            v22.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v22.toggleEnabled);
        end;
    end;
    v22.onRestore = function(v28) --[[ Line: 79 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            enabled = v28
        });
        if v22.toolController and v22.tabIndex and v22.toolIndex then
            v22.toolController:setTabAndToolIndex(v22.tabIndex, v22.toolIndex);
            v22.toolIndex = nil;
            v22.tabIndex = nil;
        end;
    end;
    v22.onWidgetEnabledChanged = function(v29) --[[ Line: 93 ]]
        -- upvalues: v22 (copy)
        if v29.Enabled then
            v22.onRestore(v29.Enabled);
            return;
        else
            v22.onClose();
            return;
        end;
    end;
    v22.localization = l_ContextServices_0.Localization.new({
        libraries = {
            [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v4.Resources.SourceStrings, 
                translationResourceTable = v4.Resources.LocalizedStrings
            }, 
            [v3.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v3.Resources.SourceStrings, 
                translationResourceTable = v3.Resources.LocalizedStrings
            }
        }, 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TerrainEditor"
    });
    v22.analytics = l_ContextServices_0.Analytics.new(v19);
    v22.shortcutController = v16.new(l_Plugin_1, v22.localization);
    v22.pluginController = v17.new(l_Plugin_1);
    v22.studioServices = l_StudioServices_0.new();
    v22.stylizer = v10();
    v22.toolController = v18.new(v22.pluginController, v22.shortcutController, v22.analytics, v22.localization, v22.stylizer);
    v22.onFocused = function() --[[ Line: 129 ]]
        -- upvalues: v22 (copy)
        v22.pluginController:resume();
    end;
    v22.onUnfocused = function() --[[ Line: 133 ]]
        -- upvalues: v22 (copy)
        v22.pluginController:pause();
    end;
    v22.button = if v22.props.PluginLoaderContext then v22.props.PluginLoaderContext.mainButton else nil;
end;
v21.didUpdate = function(v30) --[[ Line: 140 ]] --[[ Name: didUpdate ]]
    v30.button:SetActive(v30.state.enabled);
end;
v21.willUnmount = function(v31) --[[ Line: 144 ]] --[[ Name: willUnmount ]]
    v31.pluginController:destroy();
    v31.toolController:destroy();
end;
v21.render = function(v32) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), v2 (copy), v14 (copy)
    local l_props_0 = v32.props;
    local l_state_0 = v32.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v32.stylizer, 
        v32.localization, 
        v32.analytics, 
        v32.shortcutController, 
        v32.pluginController, 
        v32.studioServices, 
        v32.toolController
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "TerrainEditor", 
            Enabled = l_enabled_0, 
            Title = v32.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(350, 200), 
            OnClose = v32.onClose, 
            ShouldRestore = true, 
            OnWidgetCreated = v32.onCreated, 
            OnWidgetFocused = v32.onFocused, 
            OnWidgetFocusReleased = v32.onUnfocused, 
            OnWidgetRestored = v32.onRestore, 
            Widget = if v32.props.PluginLoaderContext then v32.props.PluginLoaderContext.mainDockWidget else nil, 
            [v2.Change.Enabled] = v32.onWidgetEnabledChanged
        }, {
            App = v1.createElement(v14)
        })
    }, true);
end;
return v21;