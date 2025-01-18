local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_script_FirstAncestor_0.Src.Components.App);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v17 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v19 = require(l_script_FirstAncestor_0.Src.Networking);
local v20 = v1.PureComponent:extend("MainPlugin");
v20.init = function(v21, v22) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy), v19 (copy), v17 (copy), v15 (copy), v18 (copy), v16 (copy)
    v21.state = {
        enabled = false
    };
    v21.toggleEnabled = function() --[[ Line: 41 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v23) --[[ Line: 42 ]]
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function() --[[ Line: 49 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24) --[[ Line: 55 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25) --[[ Line: 61 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.onDockWidgetCreated = function() --[[ Line: 67 ]]
        -- upvalues: v21 (copy)
        v21.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v21.toggleEnabled);
    end;
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AssetManager"
    });
    v21.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 77 ]]
        return {};
    end, {});
    v21.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v21.design = l_registerPluginStyles_0(v22.Plugin);
    v21.networking = v19.new();
    v21.pluginController = v17.new(v22.Plugin, v21.networking, v21.localization);
    v21.explorerController = v15.new(v21.pluginController, v21.networking);
    v21.searchController = v18.new(v21.pluginController, v21.explorerController, v21.networking);
    v21.itemsController = v16.new(v21.pluginController, v21.searchController, v21.networking);
end;
v20.didUpdate = function(v26) --[[ Line: 91 ]] --[[ Name: didUpdate ]]
    v26.props.PluginLoaderContext.mainButton:SetActive(v26.state.enabled);
end;
v20.willUnmount = function(v27) --[[ Line: 95 ]] --[[ Name: willUnmount ]]
    v27.pluginController:destroy();
    v27.explorerController:destroy();
    v27.itemsController:destroy();
    v27.searchController:destroy();
end;
v20.render = function(v28) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), v14 (copy), l_KeyboardListener_0 (copy)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v28.DEPRECATED_stylizer, 
        v28.localization, 
        v28.analytics, 
        v28.pluginController, 
        v28.explorerController, 
        v28.itemsController, 
        v28.searchController, 
        v28.networking
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AssetManager", 
            Enabled = l_enabled_0, 
            Title = v28.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v28.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v28.onDockWidgetCreated, 
            [v1.Change.Enabled] = v28.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                App = v1.createElement(v14), 
                KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(v33) --[[ Line: 140 ]] --[[ Name: OnKeyPressed ]]
                        -- upvalues: v28 (copy)
                        v28.pluginController:addKeyPress(v33.KeyCode);
                    end, 
                    OnKeyReleased = function(v34) --[[ Line: 143 ]] --[[ Name: OnKeyReleased ]]
                        -- upvalues: v28 (copy)
                        v28.pluginController:removeKeyPress(v34.KeyCode);
                    end
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v28.design
            })
        })
    });
end;
return v20;