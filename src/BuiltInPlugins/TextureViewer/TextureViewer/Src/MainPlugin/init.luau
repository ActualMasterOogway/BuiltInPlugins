local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_PluginToolbar_0 = v3.UI.PluginToolbar;
local l_PluginButton_0 = v3.UI.PluginButton;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v14 = require(l_Components_0.App);
local v15 = v1.PureComponent:extend("MainPlugin");
v15.init = function(v16, _) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v16:setState({
        enabled = false
    });
    v16.toggleEnabled = function() --[[ Line: 48 ]]
        -- upvalues: v16 (copy)
        v16:setState(function(v18) --[[ Line: 49 ]]
            return {
                enabled = not v18.enabled
            };
        end);
    end;
    v16.onClose = function() --[[ Line: 56 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = false
        });
    end;
    v16.onRestore = function(v19) --[[ Line: 62 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = v19
        });
    end;
    v16.onWidgetEnabledChanged = function(v20) --[[ Line: 68 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            enabled = v20.Enabled
        });
    end;
    v16.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TextureViewer"
    });
    v16.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 86 ]]
        return {};
    end, {});
end;
v15.renderButtons = function(v21, v22) --[[ Line: 91 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v21.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v22, 
            Active = l_enabled_0, 
            Id = "template_button", 
            Title = v21.localization:getText("Plugin", "Button"), 
            Tooltip = v21.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v21.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v15.render = function(v24) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v2 (copy), v14 (copy)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v24.localization, 
        v24.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v24.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v29) --[[ Line: 124 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v24 (copy)
                return v24:renderButtons(v29);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Enabled = l_enabled_1, 
            Title = v24.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(680, 480), 
            MinSize = Vector2.new(415, 100), 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            [v2.Change.Enabled] = v24.onWidgetEnabledChanged
        }, {
            App = v1.createElement(v14)
        })
    });
end;
return v15;