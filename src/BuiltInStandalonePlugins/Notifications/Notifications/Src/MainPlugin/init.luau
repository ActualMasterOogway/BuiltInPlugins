local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Styling_0 = v2.Styling;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
    return game:GetService("RibbonNotificationService");
end);
local v8 = if l_status_0 then l_result_0 else nil;
local l_ContextServices_0 = v2.ContextServices;
local l_registerPluginStyles_0 = l_Styling_0.registerPluginStyles;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Focus_0 = l_ContextServices_0.Focus;
local v14 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v15 = require(l_Parent_0.Src.Contexts.TrayVisibleProvider);
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local v17 = require(l_Parent_0.Src.Util.AttachmentConstants);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v20 = require(l_Parent_0.Src.Util.TraySize);
local l_TRAY_WIDTH_0 = v20.TRAY_WIDTH;
local l_TRAY_HEIGHT_0 = v20.TRAY_HEIGHT;
local l_Components_0 = l_Parent_0.Src.Components;
local v24 = require(l_Components_0.App);
local l_EnableRibbonPlugin_0 = game:GetFastFlag("EnableRibbonPlugin");
local v26 = v1.PureComponent:extend("MainPlugin");
v26.init = function(v27, v28) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), l_EnableRibbonPlugin_0 (copy), v14 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_registerPluginStyles_0 (copy), v8 (copy)
    v27.state = {
        enabled = false, 
        widget = nil
    };
    v27.attachmentInfo = v17.DatamodelSessionUnloadedAttachmentInfo;
    v27.toggleEnabled = function(v29, v30, v31) --[[ Line: 46 ]]
        -- upvalues: v27 (copy), v28 (copy), l_EnableRibbonPlugin_0 (ref), v14 (ref)
        local v32 = not v27.state.enabled and v29;
        if v27.state.widget and (v32 or v30) then
            local l_Uri_0 = v28.Plugin:GetUri();
            local v34 = {
                DataModel = l_Uri_0.DataModel, 
                PluginType = l_Uri_0.PluginType, 
                PluginId = l_Uri_0.PluginId, 
                Category = "Panels", 
                ItemId = "Notifications"
            };
            v28.Plugin:GetPluginComponent("Panels"):SetAttachmentAsync(v34, {
                TargetWidgetUri = if l_EnableRibbonPlugin_0 then {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "RightMezzanine/Notifications"
                } else {
                    PluginId = "MainWindow", 
                    Category = "Widgets", 
                    ItemId = "WhatsNewAction"
                }, 
                TargetAnchorPoint = Vector2.new(1, 1), 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                Offset = Vector2.new(0, 0)
            });
            v27.state.widget.Enabled = true;
        end;
        if v27.state.widget and v32 and v31 then
            v14.eventHandlers.trayOpened();
        end;
        v27:setState({
            enabled = v29
        });
    end;
    v27.onRestore = function(v35) --[[ Line: 89 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            enabled = v35
        });
    end;
    v27.onWidgetEnabledChanged = function(v36) --[[ Line: 95 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            enabled = v36.Enabled
        });
    end;
    v27.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Notifications"
    });
    v27.design = l_registerPluginStyles_0(v28.Plugin);
    v27.toggleNotificationTrayConnection = v8.ToggleNotificationTray:Connect(function(v37, v38) --[[ Line: 109 ]]
        -- upvalues: v27 (copy)
        v27.toggleEnabled(v37, false, v38);
    end);
    local l_MultipleDocumentInterfaceInstance_0 = v28.Plugin.MultipleDocumentInterfaceInstance;
    v27.dmOpenSession = l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_) --[[ Line: 115 ]]
        -- upvalues: v27 (copy), v17 (ref)
        v27.attachmentInfo = v17.DatamodelSessionLoadedAttachmentInfo;
        if v27.state.enabled then
            v27.toggleEnabled(v27.state.enabled, true, false);
        end;
    end);
    v27.dmCloseSession = l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_) --[[ Line: 122 ]]
        -- upvalues: v27 (copy), v17 (ref)
        v27.attachmentInfo = v17.DatamodelSessionUnloadedAttachmentInfo;
        if v27.state.enabled then
            v27.toggleEnabled(v27.state.enabled, true, false);
        end;
    end);
end;
v26.didMount = function(v42) --[[ Line: 130 ]] --[[ Name: didMount ]]
    -- upvalues: l_Parent_0 (copy), l_TRAY_WIDTH_0 (copy), l_TRAY_HEIGHT_0 (copy)
    if v42.state.widget then
        return;
    else
        v42:setState({
            widget = v42.props.Plugin:CreateQWidgetPluginGui(l_Parent_0.Name, {
                Size = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                MinSize = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                Modal = false, 
                Callout = true, 
                InitialEnabled = false
            })
        });
        return;
    end;
end;
v26.willUnmount = function(v43) --[[ Line: 148 ]] --[[ Name: willUnmount ]]
    v43.toggleNotificationTrayConnection:Disconnect();
    v43.dmOpenSession:Disconnect();
    v43.dmCloseSession:Disconnect();
end;
v26.render = function(v44) --[[ Line: 154 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Focus_0 (copy), v16 (copy), v14 (copy), v1 (copy), l_DockWidget_0 (copy), l_TRAY_WIDTH_0 (copy), l_TRAY_HEIGHT_0 (copy), v15 (copy), v24 (copy)
    local l_props_0 = v44.props;
    local l_state_0 = v44.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if not v44.state.widget then
        return;
    else
        return l_ContextServices_0.provide({
            l_Plugin_0.new(l_Plugin_1), 
            l_Mouse_0.new(l_Plugin_1:getMouse()), 
            l_Focus_0.new(v44.state.widget), 
            v16(), 
            v44.localization, 
            v14
        }, {
            MainWidget = v1.createElement(l_DockWidget_0, {
                Id = "StudioNotifications", 
                Enabled = l_enabled_0, 
                Title = v44.localization:getText("Plugin", "Name"), 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Left, 
                Size = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                MinSize = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                ShouldRestore = true, 
                OnWidgetRestored = v44.onRestore, 
                Widget = v44.state.widget, 
                [v1.Change.Enabled] = v44.onWidgetEnabledChanged
            }, {
                AppWithProvider = v1.createElement(v15, {
                    trayVisible = l_enabled_0
                }, {
                    App = v1.createElement(v24)
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v44.design
                })
            })
        }, true);
    end;
end;
return v26;