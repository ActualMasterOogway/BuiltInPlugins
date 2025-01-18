local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Src.Clients.MockedNotifications);
return {
    getNotifications = function(_, v4) --[[ Line: 9 ]]
        -- upvalues: v2 (copy), l_Promise_0 (copy)
        local v5 = tonumber(v4);
        local v6 = 1;
        if v5 ~= nil then
            v6 = v5;
        end;
        local v7 = {};
        for v8 = 1, 12 do
            local v9 = v8 + v6;
            table.insert(v7, (v2[v9 % #v2 + 1](v9)));
        end;
        l_Promise_0.new(function(v10, _) --[[ Line: 24 ]]
            task.spawn(function() --[[ Line: 25 ]]
                -- upvalues: v10 (copy)
                v10();
            end);
        end):await();
        return {
            responseBody = {
                creatorStreamNotifications = v7, 
                nextCursor = tostring(v6 + 12)
            }, 
            responseCode = 200
        };
    end, 
    markNotificationRead = function(_) --[[ Line: 41 ]]
        return {
            responseBody = nil, 
            responseCode = 200
        };
    end, 
    markAllNotificationsRead = function() --[[ Line: 48 ]]
        return {
            responseBody = nil, 
            responseCode = 200
        };
    end
};