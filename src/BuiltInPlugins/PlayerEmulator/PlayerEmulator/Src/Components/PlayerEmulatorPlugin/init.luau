local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_DockWidget_0 = v3.UI.DockWidget;
local v6 = require(l_Parent_0.Src.Components.MainView);
local v7 = require(l_Parent_0.Src.Util.CreatePluginGlobals);
local v8 = require(l_Parent_0.Src.Util.Constants);
local v9 = v2.PureComponent:extend("PlayerEmulatorPlugin");
local v10 = Vector2.new(320, 330);
v9.updateToolbarButtonActiveState = function(v11) --[[ Line: 20 ]] --[[ Name: updateToolbarButtonActiveState ]]
    local l_active_0 = v11.state.active;
    if v11.button then
        v11.button:SetActive(l_active_0);
    end;
end;
v9.initPluginWidgetStatus = function(v13) --[[ Line: 27 ]] --[[ Name: initPluginWidgetStatus ]]
    -- upvalues: v8 (copy)
    local l_Setting_0 = v13.props.plugin:GetSetting(v8.PLUGIN_WIDGET_STATE);
    if l_Setting_0 ~= v13.state.active then
        v13:setState({
            active = l_Setting_0
        });
    end;
end;
v9.init = function(v15) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), v7 (copy), v8 (copy)
    v15.state = {
        active = false
    };
    v15.contextItems = {
        l_ContextServices_0.Plugin.new(v15.props.plugin), 
        v7.localization, 
        v7.theme, 
        v7.networking, 
        v7.store, 
        l_ContextServices_0.Mouse.new(v15.props.plugin:GetMouse())
    };
    v15.toggleActive = function() --[[ Line: 51 ]]
        -- upvalues: v15 (copy), v8 (ref)
        local l_plugin_0 = v15.props.plugin;
        local v17 = not v15.state.active;
        v15:setState({
            active = v17
        });
        l_plugin_0:SetSetting(v8.PLUGIN_WIDGET_STATE, v17);
    end;
    v15.onClose = function() --[[ Line: 60 ]]
        -- upvalues: v15 (copy), v8 (ref)
        v15:setState({
            active = false
        });
        v15.props.plugin:SetSetting(v8.PLUGIN_WIDGET_STATE, false);
    end;
    v15.onWidgetEnabledChanged = function(v18) --[[ Line: 68 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            active = v18.Enabled
        });
    end;
    v15.onAncestryChanged = function(_, _, v21) --[[ Line: 74 ]]
        -- upvalues: v15 (copy)
        if not v21 and v15.props.onPluginWillDestroy then
            v15.props.onPluginWillDestroy();
        end;
    end;
    v15.button = v15.props.pluginLoaderContext.mainButton;
    v15.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v15.toggleActive);
end;
v9.didMount = function(v22) --[[ Line: 84 ]] --[[ Name: didMount ]]
    v22:initPluginWidgetStatus();
    v22:updateToolbarButtonActiveState();
end;
v9.didUpdate = function(v23) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    v23:updateToolbarButtonActiveState();
end;
v9.render = function(v24) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_RunService_0 (copy), l_ContextServices_0 (copy), v2 (copy), l_DockWidget_0 (copy), v7 (copy), v10 (copy), v6 (copy)
    local l_active_1 = v24.state.active;
    local v26 = l_RunService_0:IsEdit();
    return l_ContextServices_0.provide(v24.contextItems, {
        MainWidget = v26 and v2.createElement(l_DockWidget_0, {
            Id = "PlayerEmulator", 
            Enabled = l_active_1, 
            Title = v7.localization:getText("Meta", "PluginTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = v10, 
            MinSize = v10, 
            OnClose = v24.onClose, 
            ShouldRestore = false, 
            [v2.Change.Enabled] = v24.onWidgetEnabledChanged
        }, {
            MainView = l_active_1 and v2.createElement(v6)
        })
    });
end;
return v9;