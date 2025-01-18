local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactRoblox);
local v5 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v5.UI.DockWidget;
local l_registerPluginStyles_0 = v5.Styling.registerPluginStyles;
local l_ContextServices_0 = v5.ContextServices;
local l_Networking_0 = v5.Http.Networking;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v14 = require(l_Actions_0.Window.SelectItem);
local v15 = require(l_Parent_0.Src.Util.createStore);
local v16 = require(l_Parent_0.Src.Util.recordChange);
local v17 = require(l_Parent_0.Src.Resources.MakeTheme);
local v18 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v19 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local v20 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Components_0 = l_Parent_0.Src.Components;
local v22 = require(l_Components_0.AppRoot);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v24 = require(l_Thunks_0.Telemetry.SendPluginMountedEvent);
local v25 = require(l_Thunks_0.Telemetry.SendPluginUnmountedEvent);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v28 = v3.PureComponent:extend("MainPlugin");
v28.init = function(v29) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v5 (copy), v19 (copy), l_MessageBusService_0 (copy), l_registerPluginStyles_0 (copy), v15 (copy), l_Networking_0 (copy), v16 (copy), l_ChangeHistoryService_0 (copy), v20 (copy), v14 (copy), v25 (copy)
    local l_props_0 = v29.props;
    v29.firstRender = true;
    v29:setState({
        enabled = false
    });
    v29.toggleEnabled = function() --[[ Line: 64 ]]
        -- upvalues: v29 (copy)
        v29:setState(function(v31) --[[ Line: 65 ]]
            return {
                enabled = not v31.enabled
            };
        end);
    end;
    v29.onClose = function() --[[ Line: 72 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            enabled = false
        });
    end;
    v29.onRestore = function(v32) --[[ Line: 78 ]]
        -- upvalues: v29 (copy)
        v29:setState(function(v33) --[[ Line: 79 ]]
            -- upvalues: v32 (copy)
            return {
                enabled = v32 or v33.enabled
            };
        end);
    end;
    v29.onWidgetEnabledChanged = function(v34) --[[ Line: 86 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            enabled = v34.Enabled
        });
    end;
    v29.onDockWidgetCreated = function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy)
        v29.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v29.toggleEnabled);
    end;
    v29.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StyleEditor", 
        libraries = {
            [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.Resources.SourceStrings, 
                translationResourceTable = v5.Resources.LocalizedStrings
            }
        }
    });
    v29.telemetry = v19.new(l_MessageBusService_0);
    v29.design = l_registerPluginStyles_0(l_props_0.Plugin);
    v29.store = v15({
        Localization = v29.localization, 
        Networking = l_Networking_0.new({
            isInternal = true
        }), 
        Plugin = l_props_0.Plugin, 
        Telemetry = v29.telemetry, 
        recordChange = v16(l_ChangeHistoryService_0)
    });
    v29.selectStyle = function(v35) --[[ Line: 119 ]]
        -- upvalues: v20 (ref), v29 (copy), v14 (ref)
        if v35 and v35:IsA("StyleBase") then
            local v36 = v20.createItemId(v35);
            v29.store:dispatch(v14(v36));
        end;
    end;
    v29.openConnection = l_props_0.PluginLoaderContext.signals["GuiService.OpenStyleEditor"]:Connect(function(v37) --[[ Line: 127 ]]
        -- upvalues: v29 (copy)
        v29.selectStyle(v37);
        v29:setState({
            enabled = true
        });
    end);
    l_props_0.Plugin.Unloading:Connect(function() --[[ Line: 135 ]]
        -- upvalues: v29 (copy), v25 (ref)
        if v29.store then
            v29.store:dispatch(v25());
            v29.store:flush();
        end;
        if v29.openConnection then
            v29.openConnection:Disconnect();
        end;
    end);
end;
v28.didUpdate = function(v38) --[[ Line: 147 ]] --[[ Name: didUpdate ]]
    -- upvalues: v24 (copy)
    v38.props.PluginLoaderContext.mainButton:SetActive(v38.state.enabled);
    if v38.firstRender then
        v38.firstRender = false;
        local v39 = (os.clock() - v38.props.LoadStartTimestamp) * 1000;
        v38.store:dispatch(v24(v39));
    end;
end;
v28.render = function(v40) --[[ Line: 159 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v18 (copy), v17 (copy), v3 (copy), l_DockWidget_0 (copy), v4 (copy), v22 (copy)
    local l_props_1 = v40.props;
    local l_state_0 = v40.state;
    local l_Plugin_1 = l_props_1.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v40.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v40.localization, 
        v18.new(v40.telemetry), 
        v17()
    }, {
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = "StyleEditor", 
            Enabled = l_enabled_0, 
            Title = v40.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(580, 500), 
            OnClose = v40.onClose, 
            ShouldRestore = true, 
            Widget = l_props_1.PluginLoaderContext.mainDockWidget, 
            OnWidgetRestored = v40.onRestore, 
            OnWidgetCreated = v40.onDockWidgetCreated, 
            [v4.Change.Enabled] = v40.onWidgetEnabledChanged
        }, {
            AppRoot = v3.createElement(v22), 
            StyleLink = v3.createElement("StyleLink", {
                StyleSheet = v40.design
            })
        })
    });
end;
return v28;