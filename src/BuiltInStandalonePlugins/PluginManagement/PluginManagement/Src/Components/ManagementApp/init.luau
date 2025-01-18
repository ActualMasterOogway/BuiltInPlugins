local v0 = game:DefineFastFlag("PluginManagementFixBlankPage", false);
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local _ = require(l_Parent_0.Src.Components.ManagementMainView);
local v4 = require(l_Parent_0.Src.Components.Navigation.NavigationContainer);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local v7 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local _ = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v15 = require(l_Parent_0.Src.Resources.makeTheme);
local v16 = v2.PureComponent:extend("ManagementApp");
v16.init = function(v17) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v15 (copy), v0 (copy)
    local _ = v17.props.plugin;
    v17.state = {
        enabled = false, 
        killDockWidget = false
    };
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PluginInstallation"
    });
    v17.theme = v15;
    v17.toggleState = function() --[[ Line: 55 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = not v17.state.enabled
        });
    end;
    v17.onClose = function() --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = false
        });
    end;
    if v0 then
        v17.onWidgetEnabledChanged = function(v19) --[[ Line: 68 ]]
            -- upvalues: v17 (copy)
            v17:setState({
                enabled = v19.Enabled
            });
        end;
    end;
    v17.props.plugin.MultipleDocumentInterfaceInstance.DataModelSessionEnded:connect(function(_) --[[ Line: 75 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            enabled = false, 
            killDockWidget = true
        });
    end);
end;
v16.getDerivedStateFromProps = function(_, v22) --[[ Line: 86 ]] --[[ Name: getDerivedStateFromProps ]]
    if v22.enabled then
        return {
            killDockWidget = false
        };
    else
        return;
    end;
end;
v16.renderButtons = function(v23, v24) --[[ Line: 94 ]] --[[ Name: renderButtons ]]
    -- upvalues: v2 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v23.state.enabled;
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v24, 
            Active = l_enabled_0, 
            Title = "luaManagePluginsButton", 
            OnClick = v23.toggleState
        })
    };
end;
v16.render = function(v26) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v7 (copy), v2 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v0 (copy), v4 (copy)
    local l_props_0 = v26.props;
    local l_plugin_1 = l_props_0.plugin;
    local l_store_0 = l_props_0.store;
    local l_api_0 = l_props_0.api;
    local l_analytics_0 = l_props_0.analytics;
    local l_enabled_1 = v26.state.enabled;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_plugin_1), 
        v7.new(l_api_0)
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = "luaManagePluginsToolbar", 
            RenderButtons = function(v33) --[[ Line: 125 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v26 (copy)
                return v26:renderButtons(v33);
            end
        }), 
        MainWidget = not v26.state.killDockWidget and v2.createElement(l_DockWidget_0, {
            Id = "PluginManagement", 
            Enabled = l_enabled_1, 
            Title = v26.localization:getText("Manage", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(600, 560), 
            MinSize = Vector2.new(600, 180), 
            OnClose = v26.onClose, 
            ShouldRestore = false, 
            [v2.Change.Enabled] = if v0 then v26.onWidgetEnabledChanged else nil
        }, {
            MainProvider = l_enabled_1 and l_ContextServices_0.provide({
                v26.localization, 
                v26.theme, 
                l_ContextServices_0.Store.new(l_store_0), 
                l_ContextServices_0.Mouse.new(l_plugin_1:GetMouse()), 
                l_analytics_0
            }, {
                MainView = v2.createElement(v4)
            })
        })
    });
end;
return v16;