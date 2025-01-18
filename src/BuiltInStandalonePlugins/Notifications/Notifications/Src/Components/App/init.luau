local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Clients.NotificationClient);
local v3 = require(l_Parent_0.Src.Contexts.NotificationsProvider);
local v4 = require(l_Parent_0.Src.Contexts.MenuVisibleProvider);
local v5 = require(l_Parent_0.Src.Components.NotificationTray);
return function() --[[ Line: 9 ]] --[[ Name: App ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    return v1.createElement(v4, {}, {
        v1.createElement(v3, {
            notificationClient = v2
        }, {
            NotificationTray = v1.createElement(v5)
        })
    });
end;