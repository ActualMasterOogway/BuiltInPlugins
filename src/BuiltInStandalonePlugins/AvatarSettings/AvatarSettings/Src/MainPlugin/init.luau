local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSettings");
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
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v12 = require(l_Components_0.BasicExample);
local v13 = v1.PureComponent:extend("MainPlugin");
v13.init = function(v14, v15) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v14.state = {
        enabled = false
    };
    v14.toggleEnabled = function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy)
        v14:setState(function(v16) --[[ Line: 38 ]]
            return {
                enabled = not v16.enabled
            };
        end);
    end;
    v14.onClose = function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            enabled = false
        });
    end;
    v14.onRestore = function(v17) --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            enabled = v17
        });
    end;
    v14.onWidgetEnabledChanged = function(v18) --[[ Line: 57 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            enabled = v18.Enabled
        });
    end;
    v14.onDockWidgetCreated = function() --[[ Line: 63 ]]
        -- upvalues: v14 (copy)
        v14.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v14.toggleEnabled);
    end;
    v14.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AvatarSettings"
    });
    v14.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 79 ]]
        return {};
    end, {});
    v14.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v14.design = l_registerPluginStyles_0(v15.Plugin);
end;
v13.didUpdate = function(v19) --[[ Line: 87 ]] --[[ Name: didUpdate ]]
    v19.props.PluginLoaderContext.mainButton:SetActive(v19.state.enabled);
end;
v13.render = function(v20) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), v12 (copy)
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v20.localization, 
        v20.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AvatarSettings", 
            Enabled = l_enabled_0, 
            Title = v20.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v20.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v20.onDockWidgetCreated, 
            [v1.Change.Enabled] = v20.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement("Frame", {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                BasicExample = v1.createElement(v12, {
                    showContent = true
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v20.design
            })
        })
    });
end;
return v13;