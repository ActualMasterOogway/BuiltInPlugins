local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Styling_0 = v2.Styling;
local l_DockWidget_0 = v2.UI.DockWidget;
local l_PluginToolbar_0 = v2.UI.PluginToolbar;
local l_PluginButton_0 = v2.UI.PluginButton;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_registerPluginStyles_0 = l_Styling_0.registerPluginStyles;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local l_Components_0 = l_Parent_0.Src.Components;
local v16 = require(l_Components_0.App);
local v17 = v1.PureComponent:extend("MainPlugin");
v17.init = function(v18, v19) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: l_registerPluginStyles_0 (copy), l_Mouse_0 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v14 (copy)
    v18.design = l_registerPluginStyles_0(v19.Plugin);
    v18.state = {
        enabled = false
    };
    v18.mouse = l_Mouse_0.new(v19.Plugin:GetMouse());
    v18.mouse:__pushCursor("Arrow", 0);
    v18.toggleEnabled = function() --[[ Line: 36 ]]
        -- upvalues: v18 (copy)
        v18:setState(function(v20) --[[ Line: 37 ]]
            return {
                enabled = not v20.enabled
            };
        end);
    end;
    v18.onClose = function() --[[ Line: 44 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            enabled = false
        });
    end;
    v18.onRestore = function(v21) --[[ Line: 50 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            enabled = v21
        });
    end;
    v18.onWidgetEnabledChanged = function(v22) --[[ Line: 56 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            enabled = v22.Enabled
        });
    end;
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ActivityFeed"
    });
    v18.analytics = l_ContextServices_0.Analytics.new(v14);
end;
v17.renderButtons = function(v23, v24) --[[ Line: 71 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v23.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v24, 
            Active = l_enabled_0, 
            Title = "activity_feed_button", 
            Tooltip = v23.localization:getText("Plugin", "Description"), 
            OnClick = v23.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v17.render = function(v26) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v16 (copy)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v26.localization, 
        v26.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = "ActivityFeed", 
            RenderButtons = function(v31) --[[ Line: 101 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v26 (copy)
                return v26:renderButtons(v31);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "ActivityFeed", 
            Enabled = l_enabled_1, 
            Title = v26.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v26.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v26.onRestore, 
            [v1.Change.Enabled] = v26.onWidgetEnabledChanged
        }, {
            App = v1.createElement(v16, {
                plugin = l_Plugin_1
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v26.design
            })
        })
    });
end;
return v17;