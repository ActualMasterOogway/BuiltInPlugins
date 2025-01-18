local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v2 = game:DefineFastInt("ExplorerHeartbeatInterval", 30);
return function(v3) --[[ Line: 7 ]] --[[ Name: createSessionHeartbeat ]]
    -- upvalues: v2 (copy)
    local v7 = task.spawn(function() --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v3 (copy)
        while true do
            task.wait(v2);
            local v4 = os.clock();
            local v5 = v3.guestRpcInterface.getClockAsync();
            local v6 = os.clock();
            v3.analyticsInterface.logStat({
                eventName = "LuaExplorerHeartbeatTimeToReachGuest", 
                backends = {
                    "RobloxTelemetryStat"
                }, 
                throttlingPercentage = game:DefineFastInt("LuaExplorerHeartbeatTimeToReachGuestThrottlingHundredthsPercent", 10000), 
                description = "Time it takes for the heartbeat request to reach the guest.", 
                lastUpdated = "2024-12-05"
            }, {}, v5 - v4);
            v3.analyticsInterface.logStat({
                eventName = "LuaExplorerHeartbeatTimeToReachHost", 
                backends = {
                    "RobloxTelemetryStat"
                }, 
                throttlingPercentage = game:DefineFastInt("LuaExplorerHeartbeatTimeToReachHostThrottlingHundredthsPercent", 10000), 
                description = "Time it takes for the heartbeat response to reach the host.", 
                lastUpdated = "2024-12-05"
            }, {}, v6 - v5);
        end;
    end);
    return {
        destroy = function() --[[ Line: 42 ]] --[[ Name: destroy ]]
            -- upvalues: v7 (copy)
            task.cancel(v7);
        end
    };
end;