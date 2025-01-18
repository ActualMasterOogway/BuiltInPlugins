local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_PluginToolbar_0 = v2.UI.PluginToolbar;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v11 = require(l_Components_0.AlertDialog);
local v12 = require(l_Components_0.StatusButton);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v14 = require(l_Controllers_0.ServiceController);
local v15 = v1.PureComponent:extend("MainPlugin");
v15.init = function(v16) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v16.serviceController = v14.new();
    v16:setState({
        alertEnabled = false, 
        deviceName = "", 
        vrEnabled = false
    });
    v16.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "VRStatus"
    });
    v16.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 45 ]]
        return {};
    end, {});
end;
v15.didMount = function(v17) --[[ Line: 50 ]] --[[ Name: didMount ]]
    local l_serviceController_0 = v17.serviceController;
    local v19 = l_serviceController_0:getService("UserGameSettings");
    local v20 = l_serviceController_0:getService("VRService");
    v17:setState({
        deviceName = v20.VRDeviceName, 
        vrEnabled = v19.VREnabled
    });
    v17._deviceNameConnection = v20:GetPropertyChangedSignal("VRDeviceName"):Connect(function() --[[ Line: 58 ]]
        -- upvalues: v17 (copy), v20 (copy)
        v17:setState({
            deviceName = v20.VRDeviceName
        });
    end);
    v17._vrEnabledConnection = v19:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v19 (copy)
        v17:setState({
            vrEnabled = v19.VREnabled
        });
    end);
end;
v15.willUnmount = function(v21) --[[ Line: 70 ]] --[[ Name: willUnmount ]]
    if v21._deviceNameConnection then
        v21._deviceNameConnection:Disconnect();
        v21._deviceNameConnection = nil;
    end;
    if v21._vrEnabledConnection then
        v21._vrEnabledConnection:Disconnect();
        v21._vrEnabledConnection = nil;
    end;
end;
v15.renderButtons = function(v22, v23) --[[ Line: 81 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), v12 (copy)
    local l_state_0 = v22.state;
    return {
        Toggle = v1.createElement(v12, {
            toolbar = v23, 
            enabled = l_state_0.alertEnabled, 
            showAlert = function() --[[ Line: 87 ]] --[[ Name: showAlert ]]
                -- upvalues: v22 (copy)
                v22:setState({
                    alertEnabled = true
                });
            end, 
            deviceName = l_state_0.deviceName, 
            vrEnabled = l_state_0.vrEnabled
        })
    };
end;
v15.render = function(v25) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v7 (copy), v1 (copy), l_PluginToolbar_0 (copy), v11 (copy)
    local l_props_0 = v25.props;
    local l_state_1 = v25.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v7(), 
        v25.localization, 
        v25.analytics, 
        v25.serviceController
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v25.localization:getText("Plugin", "Name"), 
            RenderButtons = function(v29) --[[ Line: 111 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v25 (copy)
                return v25:renderButtons(v29);
            end
        }); 
        v1.createElement(v11, {
            OnClose = function() --[[ Line: 116 ]] --[[ Name: OnClose ]]
                -- upvalues: v25 (copy)
                v25:setState({
                    alertEnabled = false
                });
            end, 
            enabled = l_state_1.alertEnabled, 
            deviceName = l_state_1.deviceName, 
            vrEnabled = l_state_1.vrEnabled
        })
    });
end;
return v15;