local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("ToastNotification");
v1.new = function(v2) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    if not v2 then
        v2 = game:GetService("ToastNotificationService");
    end;
    return (setmetatable({
        _notificationService = v2
    }, v1));
end;
v1.destroy = function(v3) --[[ Line: 26 ]] --[[ Name: destroy ]]
    v3._notificationService = nil;
end;
v1.showNotification = function(v4, v5, v6) --[[ Line: 30 ]] --[[ Name: showNotification ]]
    if v4._notificationService then
        v4._notificationService:ShowNotification(v5, v6);
    end;
end;
v1.hideNotification = function(v7, v8) --[[ Line: 36 ]] --[[ Name: hideNotification ]]
    if v7._notificationService then
        v7._notificationService:HideNotification(v8);
    end;
end;
return v1;