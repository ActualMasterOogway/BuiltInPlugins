local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.optional);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
createAnalyticsHandler = function(v5) --[[ Line: 9 ]] --[[ Name: createAnalyticsHandler ]]
    -- upvalues: v2 (copy), v3 (copy)
    local function v9(v6, v7) --[[ Line: 10 ]] --[[ Name: sendEvent ]]
        -- upvalues: v2 (ref), v5 (copy)
        local v8 = v7 or {};
        v8 = v2.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId
        }, v8);
        v5:SendEventDeferred("studio", "NotificationTray", v6, v8);
    end;
    return {
        notificationClicked = function(v10, v11) --[[ Line: 23 ]] --[[ Name: notificationClicked ]]
            -- upvalues: v9 (copy), v3 (ref)
            v9("NotificationClicked", {
                id = v3(v10, "notificationId"), 
                type = v3(v10, "creatorStreamNotificationContent", "clickAction"), 
                clickAction = v3(v10, "notificationType"), 
                read = v3(v10, "read"), 
                trayIndex = v11
            });
        end, 
        markAllAsRead = function() --[[ Line: 32 ]] --[[ Name: markAllAsRead ]]
            -- upvalues: v9 (copy)
            v9("MarkAllAsRead");
        end, 
        settingsButtonClicked = function() --[[ Line: 35 ]] --[[ Name: settingsButtonClicked ]]
            -- upvalues: v9 (copy)
            v9("SettingsButtonClicked");
        end, 
        trayOpened = function(v12) --[[ Line: 38 ]] --[[ Name: trayOpened ]]
            -- upvalues: v9 (copy)
            v9("NotificationTrayOpened", {
                bellUnseen = v12
            });
        end, 
        logNotificationImpressions = function(v13) --[[ Line: 45 ]]
            -- upvalues: v9 (copy)
            v9("NotificationImpressions", {
                notificationIds = v13
            });
        end
    };
end;
return (l_ContextServices_0.Analytics.new(createAnalyticsHandler));