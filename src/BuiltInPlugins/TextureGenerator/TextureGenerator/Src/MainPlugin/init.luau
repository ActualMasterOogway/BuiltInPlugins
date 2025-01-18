local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactRoblox);
local v5 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
local v14 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v17 = require(l_Parent_0.Src.Util.SelectionWrapper);
local l_Components_0 = l_Parent_0.Src.Components;
local v19 = require(l_Components_0.App);
local v20 = v3.PureComponent:extend("MainPlugin");
v20.init = function(v21, _) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v5 (copy), v14 (copy)
    v21:setState({
        enabled = false
    });
    v21.toggleEnabled = function() --[[ Line: 37 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v23) --[[ Line: 38 ]]
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function() --[[ Line: 45 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24) --[[ Line: 51 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25) --[[ Line: 57 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TextureGenerator", 
        libraries = {
            [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.Resources.SourceStrings, 
                translationResourceTable = v5.Resources.LocalizedStrings
            }
        }
    });
    v21.analytics = l_ContextServices_0.Analytics.new(v14);
end;
v20.renderButtons = function(v26, v27) --[[ Line: 78 ]] --[[ Name: renderButtons ]]
    -- upvalues: v3 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v26.state.enabled;
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Toolbar = v27, 
            Active = l_enabled_0, 
            Id = "textureButton", 
            Title = v26.localization:getText("Plugin", "Button"), 
            OnClick = v26.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.render = function(v29) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v13 (copy), v17 (copy), l_Selection_0 (copy), v3 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v4 (copy), v19 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v13(), 
        v29.localization, 
        v29.analytics, 
        v17.new(l_Selection_0)
    }, {
        Toolbar = v3.createElement(l_PluginToolbar_0, {
            Title = "TextureGenerator", 
            RenderButtons = function(v34) --[[ Line: 109 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v29 (copy)
                return v29:renderButtons(v34);
            end
        }), 
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = "BuiltInTextureGenerator", 
            Enabled = l_enabled_1, 
            Title = v29.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(350, 480), 
            MinSize = Vector2.new(350, 480), 
            OnClose = v29.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v29.onRestore, 
            [v4.Change.Enabled] = v29.onWidgetEnabledChanged
        }, {
            App = v3.createElement(v19, {
                Plugin = l_Plugin_1
            })
        })
    });
end;
return v20;