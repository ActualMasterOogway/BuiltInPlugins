local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v11 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v15 = require(l_Components_0.Aggregator);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, _) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v17.state = {
        enabled = false
    };
    v17.toggleEnabled = function() --[[ Line: 45 ]]
        -- upvalues: v17 (copy)
        v17:setState(function(v19) --[[ Line: 46 ]]
            return {
                enabled = not v19.enabled
            };
        end);
    end;
    v17.onClose = function() --[[ Line: 53 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = false
        });
    end;
    v17.onRestore = function(v20) --[[ Line: 59 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = v20
        });
    end;
    v17.onWidgetEnabledChanged = function(v21) --[[ Line: 65 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = v21.Enabled
        });
    end;
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "BootcampPlugin"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 76 ]]
        return {};
    end, {});
end;
v16.renderButtons = function(v22, v23) --[[ Line: 81 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v22.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v23, 
            Active = l_enabled_0, 
            Id = "BootcampPluginButton", 
            Title = v22.localization:getText("Plugin", "Button"), 
            Tooltip = v22.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v22.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v16.render = function(v25) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v11 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v2 (copy), v15 (copy)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v11(), 
        v25.localization, 
        v25.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v25.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v30) --[[ Line: 113 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v25 (copy)
                return v25:renderButtons(v30);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "Bootcamp", 
            Enabled = l_enabled_1, 
            Title = v25.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v25.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v25.onRestore, 
            [v2.Change.Enabled] = v25.onWidgetEnabledChanged
        }, {
            Aggregator = v1.createElement(v15, {})
        })
    });
end;
return v16;