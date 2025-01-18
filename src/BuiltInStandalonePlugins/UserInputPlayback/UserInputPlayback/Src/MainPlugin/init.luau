local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.Src.Reducers.MainReducer);
local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.MainView);
local v18 = require(l_Parent_0.Src.Util.DMBridge);
local v19 = require(l_Parent_0.Src.Util.Enums);
local v20 = v1.PureComponent:extend("MainPlugin");
v20.init = function(v21, _) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v2 (copy), v12 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v21.state = {
        enabled = false
    };
    v18.setPluginEnabled(false);
    v21.toggleEnabled = function() --[[ Line: 44 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v23) --[[ Line: 45 ]]
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function() --[[ Line: 52 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24) --[[ Line: 58 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25) --[[ Line: 64 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.store = v2.Store.new(v12, nil, {
        v2.thunkMiddleware
    }, nil);
    v21.roduxStateChangedConnection = v21.store.changed:connect(function(v26, _) --[[ Line: 74 ]]
        -- upvalues: v18 (ref)
        v18.setRoduxState(v26);
    end);
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "UserInputPlayback"
    });
    v21.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 84 ]]
        return {};
    end, {});
end;
v20.renderButtons = function(v28, v29) --[[ Line: 89 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v28.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v29, 
            Active = l_enabled_0, 
            Title = v28.localization:getText("Plugin", "Button"), 
            Tooltip = v28.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v28.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.didMount = function(_) --[[ Line: 105 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy), v19 (copy)
    v18.setPluginState(v19.PluginState.Default);
end;
v20.didUpdate = function(v32, _, _) --[[ Line: 109 ]] --[[ Name: didUpdate ]]
    -- upvalues: v18 (copy)
    v18.setPluginEnabled(v32.state.enabled);
end;
v20.willUnmount = function(v35) --[[ Line: 113 ]] --[[ Name: willUnmount ]]
    if v35.roduxStateChangedConnection then
        v35.roduxStateChangedConnection.disconnect();
    end;
end;
v20.render = function(v36) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v13 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v17 (copy)
    local l_props_0 = v36.props;
    local l_state_0 = v36.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v36.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v13(), 
        v36.localization, 
        v36.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v36.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v41) --[[ Line: 135 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v36 (copy)
                return v36:renderButtons(v41);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "UserInputPlayback", 
            Enabled = l_enabled_1, 
            Title = v36.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(360, 480), 
            MinSize = Vector2.new(360, 200), 
            OnClose = v36.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v36.onRestore, 
            [v1.Change.Enabled] = v36.onWidgetEnabledChanged
        }, {
            MainView = l_enabled_1 and v1.createElement(v17)
        })
    });
end;
return v20;