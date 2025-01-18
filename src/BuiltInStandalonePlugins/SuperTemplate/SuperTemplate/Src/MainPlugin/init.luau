local l_script_FirstAncestor_0 = script:FindFirstAncestor("SuperTemplate");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Foundation);
local l_FoundationProvider_0 = v3.FoundationProvider;
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.BasicExample);
local v15 = v1.PureComponent:extend("MainPlugin");
v15.init = function(v16, v17) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v16.state = {
        enabled = false
    };
    v16.toggleEnabled = function() --[[ Line: 39 ]]
        -- upvalues: v16 (copy)
        v16:setState(function(v18) --[[ Line: 40 ]]
            return {
                enabled = not v18.enabled
            };
        end);
    end;
    v16.onClose = function() --[[ Line: 47 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = false
        });
    end;
    v16.onRestore = function(v19) --[[ Line: 53 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = v19
        });
    end;
    v16.onWidgetEnabledChanged = function(v20) --[[ Line: 59 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = v20.Enabled
        });
    end;
    v16.onDockWidgetCreated = function() --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        v16.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v16.toggleEnabled);
    end;
    v16.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "SuperTemplate"
    });
    v16.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 81 ]]
        return {};
    end, {});
    v16.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v16.design = l_registerPluginStyles_0(v17.Plugin);
end;
v15.didUpdate = function(v21) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    v21.props.PluginLoaderContext.mainButton:SetActive(v21.state.enabled);
end;
v15.render = function(v22) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), l_FoundationProvider_0 (copy), v3 (copy), v14 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v22.localization, 
        v22.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "SuperTemplate", 
            Enabled = l_enabled_0, 
            Title = v22.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v22.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v22.onDockWidgetCreated, 
            [v1.Change.Enabled] = v22.onWidgetEnabledChanged
        }, {
            FoundationProvider = v1.createElement(l_FoundationProvider_0, {
                theme = v3.Enums.Theme.Dark, 
                device = "Desktop"
            }, {
                Wrapper = v1.createElement("Frame", {
                    [v1.Tag] = "X-Fill X-Column"
                }, {
                    BasicExample = v1.createElement(v14, {
                        showContent = true
                    })
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v22.design
                })
            })
        })
    });
end;
return v15;