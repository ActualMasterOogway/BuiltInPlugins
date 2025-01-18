local l_EnableRibbonPlugin_0 = game:GetFastFlag("EnableRibbonPlugin");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local v6 = if v4.SharedFlags.getFFlagDevFrameworkBetterInit() then l_UI_0.DockWidget else v4.StudioUI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v14 = require(l_Components_0.CollaboratorList);
local v15 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v16 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local l_CrossPluginCommunication_0 = v4.Util.CrossPluginCommunication;
local l_RunService_0 = game:GetService("RunService");
local v19 = v2.PureComponent:extend("MainPlugin");
v19.init = function(v20, v21) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v16 (copy), l_EnableRibbonPlugin_0 (copy), l_CrossPluginCommunication_0 (copy)
    v20:setState({
        enabled = false
    });
    v20.toggleEnabled = function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy)
        v20.analytics:report("panelToggled", not v20.state.enabled);
        v20:setState(function(v22) --[[ Line: 59 ]]
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v20.onClose = function() --[[ Line: 66 ]]
        -- upvalues: v20 (copy)
        v20.analytics:report("panelToggled", false);
        v20:setState({
            enabled = false
        });
    end;
    v20.onRestore = function(v23) --[[ Line: 73 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v23
        });
    end;
    v20.onWidgetEnabledChanged = function(v24) --[[ Line: 79 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            enabled = v24.Enabled
        });
    end;
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "SocialPresence"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(v16);
    if l_EnableRibbonPlugin_0 then
        v20.communication = l_CrossPluginCommunication_0.new("SocialPresence");
        v20.communication:Connect("ToggleSocialPresenceWidget", function() --[[ Line: 95 ]]
            -- upvalues: v20 (copy)
            v20.toggleEnabled();
        end);
    end;
    v21.EnableSignal.Event:Connect(v20.toggleEnabled);
end;
v19.render = function(v25) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), v15 (copy), v2 (copy), v6 (copy), l_RunService_0 (copy), v3 (copy), v14 (copy)
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v25.localization, 
        v25.analytics, 
        v15.new(l_CollaboratorsService_0)
    }, {
        MainWidget = v2.createElement(v6, {
            Id = "SocialPresence", 
            Enabled = l_enabled_0 and l_RunService_0:IsEdit(), 
            Title = v25.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v25.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v25.onRestore, 
            [v3.Change.Enabled] = v25.onWidgetEnabledChanged
        }, {
            CollaboratorList = v2.createElement(v14)
        })
    });
end;
return v19;