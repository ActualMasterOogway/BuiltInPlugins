local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Enums.NotificationTargetType);
return {
    function(v2) --[[ Line: 5 ]]
        -- upvalues: v1 (copy)
        return {
            notificationId = tostring(v2), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 5000, 
            read = false, 
            notificationType = "Notification_Type_A", 
            parameters = {
                titleParam = ("Testing titleParameter with index %*."):format(v2)
            }, 
            creatorStreamNotificationContent = {
                title = "DevForum Product Announcement: <b>Studio Notifications</b>", 
                body = "Studio Notifications have been released. Click here to learn more.", 
                targetId = "CreateFilledEmphasis", 
                targetType = v1.Static.rawValue(), 
                clickAction = "https://create.roblox.com"
            }
        };
    end, 
    function(v3) --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        return {
            notificationId = tostring(v3), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 120000, 
            read = false, 
            notificationType = "Notification_Type_B", 
            parameters = {
                titleParam = ("Parameter test with index: %*."):format(v3)
            }, 
            creatorStreamNotificationContent = {
                title = "<b>LinksGoat</b> sent you a new message.", 
                body = "ChatGPTum dialogus continuo generat contentum. Linguae machinales potentiam demonstrant in generatione textus. Conversatio artificialis", 
                targetId = "2067243959", 
                targetType = v1.User.rawValue(), 
                clickAction = "https://www.roblox.com/users/2067243959/profile"
            }
        };
    end, 
    function(v4) --[[ Line: 43 ]]
        -- upvalues: v1 (copy)
        return {
            notificationId = tostring(v4), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 3700000, 
            read = false, 
            notificationType = "Notification_Type_C", 
            parameters = {
                titleParam = ("Parameter test with index: %*."):format(v4)
            }, 
            creatorStreamNotificationContent = {
                title = "You've received an invitation to collaborate on <b>Word Bomb</b>.", 
                body = "", 
                targetId = "2653064683", 
                targetType = v1.Universe.rawValue(), 
                clickAction = "https://www.roblox.com/games/2653064683/Word-Bomb"
            }
        };
    end, 
    function(v5) --[[ Line: 61 ]]
        -- upvalues: v1 (copy)
        return {
            notificationId = tostring(v5), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis, 
            read = false, 
            notificationType = "Notification_Type_D", 
            parameters = {
                titleParam = ("Testing titleParameter with index %*."):format(v5)
            }, 
            creatorStreamNotificationContent = {
                title = "This is an example of a notification w/o an action. {titleParam}", 
                body = "This is the body of the notification", 
                targetId = "", 
                targetType = v1.Static.rawValue(), 
                clickAction = ""
            }
        };
    end
};