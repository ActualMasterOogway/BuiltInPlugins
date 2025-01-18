local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v2.ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v10 = require(l_Components_0.Header);
local v11 = require(l_Components_0.CountModifier);
local v12 = v1.PureComponent:extend("MainPlugin");
v12.init = function(v13, _) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    v13.state = {
        enabled = false
    };
    v13.toggleEnabled = function() --[[ Line: 31 ]]
        -- upvalues: v13 (copy)
        v13:setState(function(v15) --[[ Line: 32 ]]
            return {
                enabled = not v15.enabled
            };
        end);
    end;
    v13.onClose = function() --[[ Line: 39 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = false
        });
    end;
    v13.onRestore = function(v16) --[[ Line: 45 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v16
        });
    end;
    v13.onWidgetEnabledChanged = function(v17) --[[ Line: 51 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            enabled = v17.Enabled
        });
    end;
    v13.renderButtons = function(v18) --[[ Line: 57 ]]
        -- upvalues: v13 (copy), v1 (ref), l_PluginButton_0 (ref)
        local l_enabled_0 = v13.state.enabled;
        return {
            Toggle = v1.createElement(l_PluginButton_0, {
                Toolbar = v18, 
                Active = l_enabled_0, 
                ClickableWhenViewportHidden = true, 
                Title = v13.props.Localization:getText("Plugin", "Button"), 
                Tooltip = v13.props.Localization:getText("Plugin", "Description"), 
                Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
                OnClick = v13.toggleEnabled
            })
        };
    end;
end;
v12.render = function(v20) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), v10 (copy), v11 (copy)
    local l_props_0 = v20.props;
    local l_enabled_1 = v20.state.enabled;
    return l_ContextServices_0.provide({
        l_props_0.Plugin, 
        l_props_0.Mouse, 
        l_props_0.Store, 
        l_props_0.Theme, 
        l_props_0.Localization, 
        l_props_0.Analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v20.props.Localization:getText("Plugin", "Toolbar"), 
            RenderButtons = v20.renderButtons
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "StandaloneExperimental", 
            Enabled = l_enabled_1, 
            Title = v20.props.Localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            ShouldRestore = true, 
            OnClose = v20.onClose, 
            OnWidgetRestored = v20.onRestore, 
            [v1.Change.Enabled] = v20.onWidgetEnabledChanged
        }, l_enabled_1 and {
            Background = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Style = "Box"
            }, {
                App = v1.createElement(l_Pane_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    Header = v1.createElement(v10, {
                        Size = UDim2.fromScale(1, 0.5), 
                        LayoutOrder = 1
                    }), 
                    CountModifier = v1.createElement(v11, {
                        Size = UDim2.fromScale(1, 0.5), 
                        LayoutOrder = 2
                    })
                })
            })
        } or nil)
    });
end;
return v12;