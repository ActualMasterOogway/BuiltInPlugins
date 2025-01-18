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
local v18 = require(l_Components_0.mainUIComponent);
local v19 = v1.PureComponent:extend("MainPlugin");
v19.init = function(v20, _) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v20:setState({
        enabled = false
    });
    v20.toggleEnabled = function() --[[ Line: 52 ]]
        -- upvalues: v20 (copy)
        v20:setState(function(v22) --[[ Line: 53 ]]
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v20.onClose = function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = false
        });
    end;
    v20.onRestore = function(v23) --[[ Line: 66 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v23
        });
    end;
    v20.onWidgetEnabledChanged = function(v24) --[[ Line: 72 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v24.Enabled
        });
    end;
    v20.store = v3.Store.new(v13, nil, {
        v3.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "BulkFaceImporter"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 87 ]]
        return {};
    end, {});
end;
v19.renderButtons = function(v25, v26) --[[ Line: 92 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v25.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v26, 
            Active = l_enabled_0, 
            Id = "template_button", 
            Title = v25.localization:getText("Plugin", "Button"), 
            Tooltip = v25.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v25.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v19.render = function(v28) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v14 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v2 (copy), v18 (copy)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v28.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v28.localization, 
        v28.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v28.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v33) --[[ Line: 125 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v28 (copy)
                return v28:renderButtons(v33);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "BulkFaceImporter", 
            Enabled = l_enabled_1, 
            Title = v28.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v28.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v28.onRestore, 
            [v2.Change.Enabled] = v28.onWidgetEnabledChanged
        }, {
            mainUIComponent = v1.createElement(v18)
        })
    });
end;
return v19;