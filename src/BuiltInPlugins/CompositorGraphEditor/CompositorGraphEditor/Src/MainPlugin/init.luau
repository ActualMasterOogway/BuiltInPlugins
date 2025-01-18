local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.ExampleComponent);
local v19 = require(l_Components_0.ExampleRoactRoduxComponent);
local v20 = v1.PureComponent:extend("MainPlugin");
v20.init = function(v21, _) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v21:setState({
        enabled = false
    });
    v21.toggleEnabled = function() --[[ Line: 54 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v23) --[[ Line: 55 ]]
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function() --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24) --[[ Line: 68 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25) --[[ Line: 74 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.store = v3.Store.new(v13, nil, {
        v3.thunkMiddleware
    }, nil);
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CompositorGraphEditor"
    });
    v21.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 96 ]]
        return {};
    end, {});
end;
v20.renderButtons = function(v26, v27) --[[ Line: 101 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v26.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v27, 
            Active = l_enabled_0, 
            Id = "template_button", 
            Title = v26.localization:getText("Plugin", "Button"), 
            Tooltip = v26.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v26.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.render = function(v29) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v14 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v2 (copy), v18 (copy), v19 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v29.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v29.localization, 
        v29.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v29.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v34) --[[ Line: 135 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v29 (copy)
                return v29:renderButtons(v34);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "CompositorGraphEditor", 
            Enabled = l_enabled_1, 
            Title = v29.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v29.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v29.onRestore, 
            [v2.Change.Enabled] = v29.onWidgetEnabledChanged
        }, {
            ExampleComponent = v1.createElement(v18), 
            ExampleRoactRoduxComponent = v1.createElement(v19)
        })
    });
end;
return v20;