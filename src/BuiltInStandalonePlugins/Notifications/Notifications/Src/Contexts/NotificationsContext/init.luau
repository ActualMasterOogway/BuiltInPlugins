local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
local v3 = {
    notifications = {}, 
    allLoaded = false, 
    setNotifications = function() --[[ Line: 28 ]] --[[ Name: setNotifications ]]

    end, 
    setCursor = function() --[[ Line: 29 ]] --[[ Name: setCursor ]]

    end, 
    setAllLoaded = function() --[[ Line: 30 ]] --[[ Name: setAllLoaded ]]

    end, 
    markNotificationRead = function() --[[ Line: 31 ]] --[[ Name: markNotificationRead ]]

    end, 
    markNotificationReadFromId = function() --[[ Line: 32 ]] --[[ Name: markNotificationReadFromId ]]

    end, 
    markAllNotificationsRead = function() --[[ Line: 33 ]] --[[ Name: markAllNotificationsRead ]]

    end, 
    logNotificationImpressions = function() --[[ Line: 34 ]] --[[ Name: logNotificationImpressions ]]

    end, 
    notificationClient = nil
};
return (v1.createContext(v3));