local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = v1.RobloxAPI.Url.new();
local v3 = v1.Http.Networking.new({
    isInternal = true, 
    loggingLevel = 0
});
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
local v6 = require(l_Parent_0.Src.Enums.NotificationChannel);
return {
    getNotifications = function(v7, v8) --[[ Line: 62 ]]
        -- upvalues: l_StudioService_0 (copy), v6 (copy), v2 (copy), v3 (copy), l_HttpService_0 (copy)
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local v10 = nil;
        v10 = {
            count = tostring(10), 
            notificationChannel = tostring(v6.Studio.rawValue())
        };
        if v7 then
            v10["full-refresh"] = tostring(true);
        end;
        if v8 then
            v10.cursor = v8;
        end;
        local v11 = v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notifications"):format(l_l_StudioService_0_UserId_0), v10);
        local v13 = v3:handleRetry(v3:get(v11)):catch(function(v12) --[[ Line: 83 ]]
            return v12;
        end):await();
        if v13.responseCode >= 200 and v13.responseCode < 300 then
            v13.responseBody = l_HttpService_0:JSONDecode(v13.responseBody);
        end;
        return v13;
    end, 
    markNotificationRead = function(v14) --[[ Line: 95 ]]
        -- upvalues: l_StudioService_0 (copy), v2 (copy), l_HttpService_0 (copy), v3 (copy)
        local l_l_StudioService_0_UserId_1 = l_StudioService_0:GetUserId();
        local v16 = v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notification/%*"):format(l_l_StudioService_0_UserId_1, v14));
        local v17 = {
            Status = true
        };
        local v18 = {
            Url = v16, 
            Body = l_HttpService_0:JSONEncode(v17), 
            Method = "PUT", 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        };
        return v3:handleRetry(v3:request(v18)):catch(function(v19) --[[ Line: 115 ]]
            return v19;
        end):await();
    end, 
    markAllNotificationsRead = function() --[[ Line: 121 ]]
        -- upvalues: l_StudioService_0 (copy), v2 (copy), v6 (copy), l_HttpService_0 (copy), v3 (copy)
        local l_l_StudioService_0_UserId_2 = l_StudioService_0:GetUserId();
        local v21 = v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notifications"):format(l_l_StudioService_0_UserId_2));
        local v22 = {
            ["notification-channel"] = v6.Studio.rawValue()
        };
        local v23 = {
            Url = v21, 
            Body = l_HttpService_0:JSONEncode(v22), 
            Method = "PUT", 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        };
        return v3:handleRetry(v3:request(v23)):catch(function(v24) --[[ Line: 139 ]]
            return v24;
        end):await();
    end
};