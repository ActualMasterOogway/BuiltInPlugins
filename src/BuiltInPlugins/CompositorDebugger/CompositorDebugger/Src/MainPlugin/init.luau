local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v10 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_StudioTheme_0 = v4.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v4.Styling.registerPluginStyles;
local l_Resources_0 = l_script_FirstAncestor_0.Src.Resources;
local v14 = require(l_Resources_0.AnalyticsHandlers);
local l_SourceStrings_0 = l_Resources_0.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Resources_0.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v18 = require(l_Components_0.MainComponent);
local v19 = v2.PureComponent:extend("MainPlugin");
v19.init = function(v20, v21) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v10 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v14 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v20.state = {
        enabled = false
    };
    v20.toggleEnabled = function() --[[ Line: 43 ]]
        -- upvalues: v20 (copy)
        v20:setState(function(v22) --[[ Line: 44 ]]
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v20.onClose = function() --[[ Line: 51 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = false
        });
    end;
    v20.onRestore = function(v23) --[[ Line: 57 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v23
        });
    end;
    v20.onWidgetEnabledChanged = function(v24) --[[ Line: 63 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v24.Enabled
        });
    end;
    v20.onDockWidgetCreated = function() --[[ Line: 69 ]]
        -- upvalues: v20 (copy)
        v20.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v20.toggleEnabled);
    end;
    v20.store = v3.Store.new(v10, nil, {
        v3.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CompositorDebugger"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(v14);
    v20.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v20.design = l_registerPluginStyles_0(v21.Plugin);
end;
v19.didUpdate = function(v25) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    v25.props.PluginLoaderContext.mainButton:SetActive(v25.state.enabled);
end;
v19.render = function(v26) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Store_0 (copy), v2 (copy), l_DockWidget_0 (copy), v18 (copy)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        l_Store_0.new(v26.store), 
        v26.localization, 
        v26.analytics, 
        v26.DEPRECATED_stylizer
    }, {
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = "CompositorDebugger", 
            Enabled = l_enabled_0, 
            Title = v26.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v26.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v26.onDockWidgetCreated, 
            [v2.Change.Enabled] = v26.onWidgetEnabledChanged
        }, {
            MainComponent = l_enabled_0 and v2.createElement(v18), 
            StyleLink = v2.createElement("StyleLink", {
                StyleSheet = v26.design
            })
        })
    });
end;
return v19;