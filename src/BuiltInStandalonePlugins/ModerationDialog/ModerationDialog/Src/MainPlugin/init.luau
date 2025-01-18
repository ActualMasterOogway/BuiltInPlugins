local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Design_0 = l_ContextServices_0.Design;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v11 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryProtocol);
local _ = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local v13 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.ModerationUXDialogEvent);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.DialogContainer);
local v16 = v1.PureComponent:extend("MainPlugin");
local l_StudioService_0 = game:GetService("StudioService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
v16.init = function(v19, v20) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_RbxAnalyticsService_0 (copy), l_StudioService_0 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v19.moderationController = v20.Plugin:GetPluginComponent("ModerationController");
    local l_ModerationInfoAsync_0 = v19.moderationController:GetModerationInfoAsync();
    v19.telemetry = v11.new();
    v19.log = function(v22, v23, v24) --[[ Line: 41 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_StudioService_0 (ref), v19 (copy)
        local l_l_RbxAnalyticsService_0_SessionId_0 = l_RbxAnalyticsService_0:GetSessionId();
        local l_l_RbxAnalyticsService_0_ClientId_0 = l_RbxAnalyticsService_0:GetClientId();
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        v19.telemetry:logRobloxTelemetryEvent(v22, nil, {
            userId = l_l_StudioService_0_UserId_0, 
            studioSid = l_l_RbxAnalyticsService_0_SessionId_0, 
            clientId = l_l_RbxAnalyticsService_0_ClientId_0, 
            interventionType = v23, 
            dialogEvent = v24
        });
    end;
    v19.onReactivate = function() --[[ Line: 55 ]]
        -- upvalues: v19 (copy), v13 (ref)
        v19.log(v13, v19.state.type, "Reactivate");
        v19.moderationController:ReactivateAsync();
        v19:setState({
            showDialog = false
        });
    end;
    v19.onLogout = function() --[[ Line: 63 ]]
        -- upvalues: v19 (copy), v13 (ref)
        v19.log(v13, v19.state.type, "Logout");
        v19.moderationController:LogoutAsync();
        v19:setState({
            showDialog = false
        });
    end;
    v19.state = {
        showDialog = l_ModerationInfoAsync_0.InterventionId ~= nil, 
        messageToUser = l_ModerationInfoAsync_0.MessageToUser, 
        reason = if l_ModerationInfoAsync_0.BadUtterances ~= nil and l_ModerationInfoAsync_0.BadUtterances[1] ~= nil then {
            abuseType = l_ModerationInfoAsync_0.BadUtterances[1].AbuseType, 
            utteranceText = l_ModerationInfoAsync_0.BadUtterances[1].UtteranceText
        } else nil, 
        reviewDateTime = l_ModerationInfoAsync_0.BeginDate, 
        type = l_ModerationInfoAsync_0.PunishmentType, 
        bannedDateTime = l_ModerationInfoAsync_0.EndDate
    };
    if v19.state.showDialog then
        v19.log(v13, v19.state.type, "ShowDialog");
    end;
    v19.showModerationDialogConnection = v19.moderationController.ShowModerationDialog:Connect(function(v28) --[[ Line: 90 ]]
        -- upvalues: v19 (copy), v13 (ref)
        local v29 = v28.InterventionId ~= nil;
        if v29 and not v19.state.showDialog then
            v19.log(v13, v28.PunishmentType, "ShowDialog");
        end;
        v19:setState({
            showDialog = v29, 
            messageToUser = v28.MessageToUser, 
            reason = if v28.BadUtterances ~= nil and v28.BadUtterances[1] ~= nil then {
                abuseType = v28.BadUtterances[1].AbuseType, 
                utteranceText = v28.BadUtterances[1].UtteranceText
            } else nil, 
            reviewDateTime = v28.BeginDate, 
            type = v28.PunishmentType, 
            bannedDateTime = v28.EndDate
        });
    end);
    v19.onRestore = function(v30) --[[ Line: 111 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showDialog = v30
        });
    end;
    v19.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ModerationDialog"
    });
    v19.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 129 ]]
        return {};
    end, {});
    v19.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v19.design = l_registerPluginStyles_0(v20.Plugin);
end;
v16.render = function(v31) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Design_0 (copy), v1 (copy), v15 (copy)
    local l_props_0 = v31.props;
    local l_state_0 = v31.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v31.localization, 
        v31.analytics, 
        l_Design_0.new(v31.design)
    }, {
        DialogContainer = l_state_0.showDialog and v1.createElement(v15, {
            Reason = l_state_0.reason, 
            ReviewDateTime = l_state_0.reviewDateTime, 
            ModeratorNote = l_state_0.messageToUser, 
            OnReactivate = v31.onReactivate, 
            OnLogout = v31.onLogout, 
            Type = l_state_0.type, 
            BannedDateTime = l_state_0.bannedDateTime
        }), 
        StyleLink = v1.createElement("StyleLink", {
            StyleSheet = v31.design
        })
    });
end;
return v16;