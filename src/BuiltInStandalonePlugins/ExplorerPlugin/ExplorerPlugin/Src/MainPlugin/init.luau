local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_DockWidget_0 = v1.UI.DockWidget;
local l_ContextServices_0 = v1.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v1.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v11 = require(l_script_FirstAncestor_0.Src.Host.App);
local v12 = v2.PureComponent:extend("MainPlugin");
v12.init = function(v13, v14) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: l_Mouse_0 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    local v15 = false;
    if v14.PluginLoaderContext then
        local l_mainDockWidget_0 = v14.PluginLoaderContext.mainDockWidget;
        local v17 = false;
        if l_mainDockWidget_0 ~= nil then
            v17 = l_mainDockWidget_0.Enabled;
        end;
        v15 = v17;
    end;
    v13.state = {
        enabled = v15
    };
    v13.toggleEnabled = function() --[[ Line: 40 ]]
        -- upvalues: v13 (copy)
        v13:setState(function(v18) --[[ Line: 41 ]]
            return {
                enabled = not v18.enabled
            };
        end);
    end;
    v13.onClose = function() --[[ Line: 48 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = false
        });
    end;
    v13.onRestore = function(v19) --[[ Line: 54 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v19
        });
    end;
    v13.onWidgetEnabledChanged = function(v20) --[[ Line: 60 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v20.Enabled
        });
    end;
    v13.onDockWidgetCreated = function() --[[ Line: 66 ]]
        -- upvalues: v13 (copy)
        v13.props.PluginLoaderContext.mainButton:SetActive(v13.state.enabled);
        v13.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v13.toggleEnabled);
    end;
    v13.mouse = l_Mouse_0.new(v14.Plugin:getMouse());
    v13.mouse:__pushCursor("Arrow", 0);
    v13.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ExplorerPlugin"
    });
    v13.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 80 ]]
        return {};
    end, {});
    v13.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v13.design = l_registerPluginStyles_0(v14.Plugin);
end;
v12.didUpdate = function(v21) --[[ Line: 88 ]] --[[ Name: didUpdate ]]
    v21.props.PluginLoaderContext.mainButton:SetActive(v21.state.enabled);
end;
v12.render = function(v22) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), v2 (copy), l_DockWidget_0 (copy), v11 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    assert(l_props_0.PluginLoaderContext.mainDockWidget ~= nil, "Couldn't get main dock widget");
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        v22.mouse, 
        v22.localization, 
        v22.analytics
    }, {
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = "ExplorerPlugin", 
            Enabled = l_enabled_0, 
            Title = v22.localization:getText("Plugin", "Title"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v22.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v22.onDockWidgetCreated, 
            [v2.Change.Enabled] = v22.onWidgetEnabledChanged
        }, {
            App = v2.createElement(v11, {
                dockWidget = l_props_0.PluginLoaderContext.mainDockWidget
            }), 
            StyleLink = v2.createElement("StyleLink", {
                StyleSheet = v22.design
            })
        })
    });
end;
return v12;