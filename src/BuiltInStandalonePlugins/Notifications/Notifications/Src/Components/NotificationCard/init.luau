local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_Styling_0 = require(l_Parent_0.Packages.Framework).Styling;
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(script.Parent.NotificationText);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
local v6 = require(l_Parent_0.Src.Contexts.NotificationsContext);
local v7 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v8 = require(l_Parent_0.Src.Contexts.MenuVisibleContext);
local v9 = require(l_Parent_0.Src.Enums.NotificationTargetType);
local v10 = require(l_Parent_0.Src.Util.IconGetters);
local l_getDynamicIconPath_0 = v10.getDynamicIconPath;
local l_getReadStatusIconTag_0 = v10.getReadStatusIconTag;
local l_getStaticIconTag_0 = v10.getStaticIconTag;
local v14 = require(l_Parent_0.Src.Util.interpolateNotificationSubject);
local v15 = require(l_Parent_0.Src.Util.useRelativeTime);
local v16 = require(l_Parent_0.Src.Util.optional);
local v17 = require(l_Parent_0.Src.Util.TimeConstants);
return function(v18) --[[ Line: 34 ]] --[[ Name: NotificationCard ]]
    -- upvalues: v16 (copy), v1 (copy), v17 (copy), v9 (copy), v6 (copy), v8 (copy), v7 (copy), v15 (copy), l_getDynamicIconPath_0 (copy), l_getStaticIconTag_0 (copy), v14 (copy), l_getReadStatusIconTag_0 (copy), l_GuiService_0 (copy), l_Styling_0 (copy), v4 (copy)
    local v19 = v16(v18, "Notification", "notificationId");
    local v20 = v16(v18, "Notification", "creatorStreamNotificationContent", "title");
    local v21 = v16(v18, "Notification", "parameters");
    local v22 = v16(v18, "Notification", "creatorStreamNotificationContent", "body");
    local v23 = v16(v18, "Notification", "creatorStreamNotificationContent", "targetId");
    local v24 = v16(v18, "Notification", "creatorStreamNotificationContent", "targetType");
    local v25 = v16(v18, "Notification", "read");
    local v26 = v16(v18, "Notification", "creatorStreamNotificationContent", "clickAction");
    local v27 = v16(v18, "Notification", "createdUtcTimeInMs");
    local v28 = v1.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v27 (copy), v17 (ref)
        if v27 == nil then
            return nil;
        else
            return (math.floor(v27 / v17.SECONDS_IN_MS));
        end;
    end, {
        v27
    });
    local v29 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v9 (ref), v24 (copy)
        return v9.fromRawValue(v24);
    end, {
        v24
    });
    local v30 = v1.useContext(v6);
    local v31 = v1.useContext(v8);
    local v32 = v7:use();
    local v33 = v15(v28);
    local v35 = v1.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v26 (copy)
        local v34 = true;
        if v26 ~= nil then
            v34 = v26 == "";
        end;
        return v34;
    end, {
        v26
    });
    local v36 = v1.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: l_getDynamicIconPath_0 (ref), v23 (copy), v29 (copy)
        return l_getDynamicIconPath_0(v23, v29);
    end, {
        v23, 
        v29
    });
    local v37 = v1.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: l_getStaticIconTag_0 (ref), v23 (copy), v29 (copy)
        return l_getStaticIconTag_0(v23, v29);
    end, {
        v23, 
        v29
    });
    local v38 = v1.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v14 (ref), v20 (copy), v21 (copy)
        return v14(v20, v21);
    end, {
        v20, 
        v21
    });
    local v39 = v1.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: l_getReadStatusIconTag_0 (ref), v25 (copy), v35 (copy)
        return l_getReadStatusIconTag_0(v25, v35);
    end, {
        v25, 
        v35
    });
    local v40 = v1.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v35 (copy), l_GuiService_0 (ref), v26 (copy), v30 (copy), v18 (copy), v32 (copy), v25 (copy), v19 (copy)
        if v35 then
            return;
        else
            l_GuiService_0:OpenBrowserWindow(v26);
            v30.markNotificationRead(v18.Index);
            v32.eventHandlers.notificationClicked(v18.Notification, v18.Index);
            if not v25 and not v35 then
                v30.notificationClient.markNotificationRead(v19);
            end;
            return;
        end;
    end, {
        v26, 
        v35, 
        v19, 
        v25, 
        v18.Index, 
        v18.Notification, 
        v30, 
        v32
    });
    local v41 = v1.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v35 (copy), v31 (copy)
        return not v35 and not v31.menuVisible;
    end, {
        v35, 
        v31.menuVisible
    });
    return v1.createElement("Frame", {
        LayoutOrder = v18.LayoutOrder, 
        [v1.Tag] = "Component-InnerNotificationCard"
    }, {
        InnerCard = v1.createElement("TextButton", {
            LayoutOrder = v18.LayoutOrder, 
            Selectable = v41, 
            AutoButtonColor = false, 
            [v1.Event.MouseButton1Click] = v40, 
            [v1.Tag] = l_Styling_0.joinTags("X-Left", v41 and "Plugin-NotificationCard-Hover" or "Plugin-NotificationCard-HoverDisabled")
        }, {
            Icon = v1.createElement("ImageLabel", {
                Image = v36, 
                LayoutOrder = 1, 
                [v1.Tag] = l_Styling_0.joinTags(("%*"):format(v37), v29 == v9.User and "Component-NotificationCard-User" or nil)
            }), 
            Content = v1.createElement(v4, {
                Subject = v38, 
                Subline = v22, 
                ElapsedTime = v33, 
                LayoutOrder = 2
            }), 
            StatusIndicator = v1.createElement("Frame", {
                [v1.Tag] = "X-Middle", 
                LayoutOrder = 3
            }, {
                Indicator = v1.createElement("ImageLabel", {
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    [v1.Tag] = ("%*"):format(v39)
                })
            })
        })
    });
end;