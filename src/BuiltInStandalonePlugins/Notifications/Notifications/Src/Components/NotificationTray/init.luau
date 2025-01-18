local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.LuauPolyfill);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
local l_setInterval_0 = v3.setInterval;
local l_clearInterval_0 = v3.clearInterval;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
    return game:GetService("RibbonNotificationService");
end);
local v10 = if l_status_0 then l_result_0 else nil;
local v11 = require(script.Parent.EmptyNotificationTray);
local v12 = require(script.Parent.NotificationCard);
local v13 = require(l_Parent_0.Src.Contexts.NotificationsContext);
local v14 = require(l_Parent_0.Src.Contexts.TrayVisibleContext);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
local v16 = require(script.Parent.NotificationHeader);
local v17 = require(l_Parent_0.Src.Util.TimeConstants);
local v18 = require(l_Parent_0.Src.Util.SharedFlags.getFFlagNotificationPluginSignalRReadEvents);
return function() --[[ Line: 39 ]] --[[ Name: NotificationTray ]]
    -- upvalues: v1 (copy), v13 (copy), v14 (copy), v10 (copy), v18 (copy), l_setInterval_0 (copy), v17 (copy), l_clearInterval_0 (copy), v12 (copy), l_LoadingIndicator_0 (copy), v16 (copy), v4 (copy), v11 (copy)
    local v19, v20 = v1.useState(true);
    local v21, v22 = v1.useState(false);
    local v23, v24 = v1.useState({
        newNotificationAvailable = false, 
        syncBroadcastedNotifications = false
    });
    local v25 = v1.useContext(v13);
    local v26 = v1.useContext(v14);
    local v27 = v1.useRef(false);
    local v39 = v1.useCallback(function(v28, v29) --[[ Line: 50 ]]
        -- upvalues: v25 (copy), v24 (copy), v20 (copy), v22 (copy), v10 (ref), v26 (copy)
        if v25.allLoaded then
            return;
        else
            local v30 = true;
            if v25.cursor ~= "" then
                v30 = not v25.cursor;
            end;
            v30 = v30 or v29;
            if v30 then
                v24({
                    newNotificationAvailable = false, 
                    syncBroadcastedNotifications = false
                });
            end;
            v20(true);
            local v31 = nil;
            v31 = v25.notificationClient.getNotifications(v28, if v29 then nil else v25.cursor);
            if v31.responseCode >= 200 and v31.responseCode < 300 then
                v22(false);
                if v31.responseBody.nextCursor == "" or v31.responseBody.nextCursor == nil then
                    v25.setCursor(nil);
                else
                    v25.setCursor(v31.responseBody.nextCursor);
                end;
                if #v31.responseBody.creatorStreamNotifications == 0 then
                    v25.setAllLoaded(true);
                end;
                local v32 = {};
                if not v29 then
                    for _, v34 in v25.notifications do
                        table.insert(v32, v34);
                    end;
                end;
                for _, v36 in pairs(v31.responseBody.creatorStreamNotifications) do
                    table.insert(v32, v36);
                end;
                if v30 and #v32 > 0 and v10 then
                    local l_notificationId_0 = v32[1].notificationId;
                    local v38 = if v26.trayVisible then l_notificationId_0 else "";
                    v10:OnNotificationUpdateFromPlugin(l_notificationId_0, v38);
                end;
                v25.logNotificationImpressions(v31.responseBody.creatorStreamNotifications, v30);
                v25.setNotifications(v32);
            else
                v22(true);
                v25.setCursor(nil);
            end;
            v20(false);
            return;
        end;
    end, {
        v25.notifications, 
        v25.cursor, 
        v25.allLoaded, 
        v26.trayVisible
    });
    local v40 = nil;
    v40 = function(v41) --[[ Line: 124 ]]
        -- upvalues: v39 (copy)
        v39(v41, true);
    end;
    v1.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v18 (ref), v10 (ref), v27 (copy), v24 (copy), v25 (copy), v39 (copy), l_setInterval_0 (ref), v17 (ref), l_clearInterval_0 (ref)
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        if v18() then
            if v10 then
                v42 = v10.NewNotificationFromRibbon:Connect(function(_) --[[ Line: 137 ]]
                    -- upvalues: v27 (ref), v24 (ref)
                    v27.current = false;
                    v24(function(v46) --[[ Line: 139 ]]
                        return {
                            newNotificationAvailable = true, 
                            syncBroadcastedNotifications = v46.syncBroadcastedNotifications
                        };
                    end);
                end);
                v43 = v10.NotificationReadFromRibbon:Connect(function(v47) --[[ Line: 149 ]]
                    -- upvalues: v25 (ref)
                    v25.markNotificationReadFromId(v47);
                end);
                v44 = v10.AllNotificationsReadFromRibbon:Connect(function() --[[ Line: 155 ]]
                    -- upvalues: v25 (ref)
                    v25.markAllNotificationsRead();
                end);
            end;
        else
            v42 = v10.NewNotificationFromRibbon:Connect(function(_) --[[ Line: 164 ]]
                -- upvalues: v27 (ref), v24 (ref)
                v27.current = false;
                v24(function(v49) --[[ Line: 166 ]]
                    return {
                        newNotificationAvailable = true, 
                        syncBroadcastedNotifications = v49.syncBroadcastedNotifications
                    };
                end);
            end);
        end;
        v39(true, true);
        local v50 = l_setInterval_0(function() --[[ Line: 179 ]]
            -- upvalues: v24 (ref)
            v24({
                newNotificationAvailable = true, 
                syncBroadcastedNotifications = true
            });
        end, v17.HOUR_IN_SECONDS * v17.SECONDS_IN_MS);
        return function() --[[ Line: 186 ]]
            -- upvalues: v42 (ref), v43 (ref), v44 (ref), l_clearInterval_0 (ref), v50 (copy)
            if v42 then
                v42:Disconnect();
            end;
            if v43 then
                v43:Disconnect();
            end;
            if v44 then
                v44:Disconnect();
            end;
            l_clearInterval_0(v50);
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v23 (copy), v26 (copy), v19 (copy), v27 (copy), v40 (ref)
        if v23.newNotificationAvailable and not v26.trayVisible and not v19 and not v27.current then
            v40(v23.syncBroadcastedNotifications, true);
            v27.current = true;
        end;
    end, {
        v23, 
        v26.trayVisible, 
        v19, 
        v40
    });
    v1.useEffect(function() --[[ Line: 217 ]]
        -- upvalues: v26 (copy), v25 (copy), v10 (ref)
        if v26.trayVisible and v25.notifications[1] and v10 then
            v10:OnNotificationUpdateFromPlugin("", v25.notifications[1].notificationId);
        end;
    end, {
        v26.trayVisible, 
        v25.notifications
    });
    local v52 = v1.useCallback(function(v51) --[[ Line: 226 ]]
        -- upvalues: v19 (copy), v25 (copy), v39 (copy)
        if v19 or #v25.notifications >= 75 or v25.allLoaded then
            return;
        else
            if v51.AbsoluteCanvasSize.y - (v51.CanvasPosition.y + v51.AbsoluteSize.y) < 10 then
                v39();
            end;
            return;
        end;
    end, {
        #v25.notifications, 
        v25.allLoaded, 
        v39, 
        v19
    });
    local v56 = v1.useMemo(function() --[[ Line: 239 ]]
        -- upvalues: v25 (copy), v1 (ref), v12 (ref)
        local v53 = {};
        for v54, v55 in ipairs(v25.notifications) do
            v53[v54] = v1.createElement(v12, {
                key = v55.notificationId, 
                Index = v54, 
                Notification = v55, 
                LayoutOrder = v54
            });
        end;
        return v53;
    end, {
        v25.notifications
    });
    local v57 = v1.useMemo(function() --[[ Line: 254 ]]
        -- upvalues: v19 (copy), v1 (ref), l_LoadingIndicator_0 (ref)
        if not v19 then
            return nil;
        else
            return v1.createElement("Frame", {
                LayoutOrder = 150, 
                [v1.Tag] = "Component-NotificationTrayLoading"
            }, {
                v1.createElement(l_LoadingIndicator_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            });
        end;
    end, {
        v19
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-NotificationTray"
    }, {
        Header = v1.createElement(v16, {
            LayoutOrder = 1
        }), 
        ScrollingTray = if #v56 > 0 then v1.createElement("ScrollingFrame", {
            LayoutOrder = 2, 
            [v1.Change.CanvasPosition] = v52, 
            [v1.Tag] = "Component-NotificationTrayScrollingFrame"
        }, v4.List.join(v56, {
            v57
        })) else v1.createElement(v11, {
            Loading = v19 and #v56 == 0, 
            OnLoadError = v21, 
            LayoutOrder = 2, 
            OnRetry = v40
        })
    });
end;