local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
local l_UI_0 = v2.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v12 = require(l_Components_0.Header);
local v13 = require(l_Components_0.CountModifier);
local v14 = v1.PureComponent:extend("MainPlugin");
v14.init = function(v15) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    v15.state = {
        enabled = false
    };
    v15.toggleEnabled = function() --[[ Line: 48 ]]
        -- upvalues: v15 (copy)
        v15:setState(function(v16) --[[ Line: 49 ]]
            return {
                enabled = not v16.enabled
            };
        end);
    end;
    v15.onClose = function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            enabled = false
        });
    end;
    v15.onRestore = function(v17) --[[ Line: 62 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            enabled = v17
        });
    end;
    v15.onWidgetEnabledChanged = function(v18) --[[ Line: 68 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            enabled = v18.Enabled
        });
    end;
    v15.renderButtons = function(v19) --[[ Line: 74 ]]
        -- upvalues: v15 (copy), v1 (ref), l_PluginButton_0 (ref)
        local l_props_0 = v15.props;
        local l_enabled_0 = v15.state.enabled;
        return {
            Toggle = v1.createElement(l_PluginButton_0, {
                Toolbar = v19, 
                Active = l_enabled_0, 
                ClickableWhenViewportHidden = true, 
                Id = "experimental_plugin_button", 
                Title = l_props_0.Localization:getText("Plugin", "Button"), 
                Tooltip = l_props_0.Localization:getText("Plugin", "Description"), 
                Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
                OnClick = v15.toggleEnabled
            })
        };
    end;
end;
v14.renderWidgetContents = function(_) --[[ Line: 96 ]] --[[ Name: renderWidgetContents ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v12 (copy), v13 (copy)
    return v1.createFragment({
        Background = v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1), 
            Style = "Box"
        }, {
            App = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Layout = Enum.FillDirection.Vertical
            }, {
                Header = v1.createElement(v12, {
                    Size = UDim2.fromScale(1, 0.5), 
                    LayoutOrder = 1
                }), 
                CountModifier = v1.createElement(v13, {
                    Size = UDim2.fromScale(1, 0.5), 
                    LayoutOrder = 2
                })
            })
        })
    });
end;
v14.render = function(v23) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy)
    local l_props_1 = v23.props;
    local l_enabled_1 = v23.state.enabled;
    return l_ContextServices_0.provide({
        l_props_1.Plugin, 
        l_props_1.Mouse, 
        l_props_1.Store, 
        l_props_1.Theme, 
        l_props_1.Localization, 
        l_props_1.Analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = l_props_1.Localization:getText("Plugin", "Toolbar"), 
            RenderButtons = v23.renderButtons
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "Experimental", 
            Enabled = l_enabled_1, 
            Title = l_props_1.Localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            ShouldRestore = true, 
            OnClose = v23.onClose, 
            OnWidgetRestored = v23.onRestore, 
            [v1.Change.Enabled] = v23.onWidgetEnabledChanged
        }, l_enabled_1 and {
            Contents = v23:renderWidgetContents()
        } or nil)
    });
end;
return v14;