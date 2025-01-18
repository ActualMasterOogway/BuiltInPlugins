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
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.InspectorProvider);
local v19 = require(l_Components_0.MainView);
local v20 = v1.PureComponent:extend("MainPlugin");
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v3 (copy), l_PluginActions_0 (copy)
    v21.state = {
        enabled = false
    };
    v21.toggleEnabled = function() --[[ Line: 38 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v22) --[[ Line: 39 ]]
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v21.onClose = function() --[[ Line: 46 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v23) --[[ Line: 52 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v23
        });
    end;
    v21.onWidgetEnabledChanged = function(v24) --[[ Line: 58 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v24.Enabled
        });
    end;
    v21.store = v2.Store.new(v13, nil, {
        v2.thunkMiddleware
    });
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DeveloperInspector", 
        libraries = {
            [v3.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v3.Resources.SourceStrings, 
                translationResourceTable = v3.Resources.LocalizedStrings
            }
        }
    });
    local l_Plugin_1 = v21.props.Plugin;
    v21.pluginActions = l_PluginActions_0.new(l_Plugin_1, {
        ToggleProfileRoact = {
            id = "ToggleProfileRoact", 
            text = "Toggle Roact Profiler", 
            defaultShortcut = "Ctrl+Shift+R", 
            allowBinding = false
        }
    });
end;
v20.renderButtons = function(v26, v27) --[[ Line: 90 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v26.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v27, 
            Active = l_enabled_0, 
            Title = v26.localization:getText("Plugin", "Button"), 
            Tooltip = v26.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/DeveloperInspector/ToolbarIcon.png", 
            OnClick = v26.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.render = function(v29) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v14 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v18 (copy), v19 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Store_0.new(v29.store), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v14(), 
        v29.pluginActions, 
        v29.localization
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v29.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v34) --[[ Line: 121 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v29 (copy)
                return v29:renderButtons(v34);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "DeveloperInspector", 
            Enabled = l_enabled_1, 
            Title = v29.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v29.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v29.onRestore
        }, {
            InspectorProvider = v1.createElement(v18, {
                Active = l_enabled_1
            }, {
                MainView = v1.createElement(v19, {
                    Active = l_enabled_1
                })
            })
        })
    });
end;
return v20;