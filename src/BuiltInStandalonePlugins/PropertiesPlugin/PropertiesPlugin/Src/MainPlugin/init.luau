local l_script_FirstAncestor_0 = script:FindFirstAncestor("PropertiesPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v11 = require(l_script_FirstAncestor_0.Src.Host.App);
local v12 = v1.PureComponent:extend("MainPlugin");
v12.init = function(v13, v14) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v13.state = {
        enabled = false
    };
    v13.toggleEnabled = function() --[[ Line: 36 ]]
        -- upvalues: v13 (copy)
        v13:setState(function(v15) --[[ Line: 37 ]]
            return {
                enabled = not v15.enabled
            };
        end);
    end;
    v13.onClose = function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = false
        });
    end;
    v13.onRestore = function(v16) --[[ Line: 50 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v16
        });
    end;
    v13.onWidgetEnabledChanged = function(v17) --[[ Line: 56 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v17.Enabled
        });
    end;
    v13.onDockWidgetCreated = function() --[[ Line: 62 ]]
        -- upvalues: v13 (copy)
        v13.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v13.toggleEnabled);
    end;
    v13.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PropertiesPlugin"
    });
    v13.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 78 ]]
        return {};
    end, {});
    v13.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v13.design = l_registerPluginStyles_0(v14.Plugin);
end;
v12.didUpdate = function(v18) --[[ Line: 86 ]] --[[ Name: didUpdate ]]
    v18.props.PluginLoaderContext.mainButton:SetActive(v18.state.enabled);
end;
v12.render = function(v19) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), v11 (copy)
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v19.localization, 
        v19.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "PropertiesPlugin", 
            Enabled = l_enabled_0, 
            Title = v19.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v19.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v19.onDockWidgetCreated, 
            [v1.Change.Enabled] = v19.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement("Frame", {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                App = v1.createElement(v11, {})
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v19.design
            })
        })
    });
end;
return v12;