local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local _ = require(script.Parent.Types);
local v5 = {
    RobloxTelemetry = "RobloxTelemetry", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat"
};
local v6 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat"
};
local v7 = {
    addPlaceId = "addPlaceId", 
    addUniverseId = "addUniverseId", 
    addPlaceInstanceId = "addPlaceInstanceId", 
    addSessionId = "addSessionId"
};
local v8 = l_t_0.interface({
    eventName = l_t_0.string, 
    backends = l_t_0.array(l_t_0.valueOf(v6))
});
local v9 = l_t_0.interface({
    eventType = l_t_0.valueOf(v5), 
    config = v8, 
    data = l_t_0.union(l_t_0.none, l_t_0.interface({
        customFields = l_t_0.optional(l_t_0.keys(l_t_0.string))
    }), l_t_0.interface({
        incrementValue = l_t_0.number
    }), l_t_0.interface({
        statValue = l_t_0.number
    }))
});
local v10 = {
    EventTypes = v5, 
    Backends = v6, 
    StandardizedFields = v7, 
    LOG_EVENT_WITH_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "logEventWithTimestamp"), 
    GET_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "getTimestamp"), 
    LOG_EVENT_FROM_LUA = l_MessageBusService_0:GetMessageId("Logging", "logEventFromLua"), 
    ONE_HUNDRED_PERCENT = 10000
};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 94 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBusService_0 (copy), v10 (copy)
    local v12 = {
        _messageBus = v11 or l_MessageBusService_0
    };
    setmetatable(v12, v10);
    return v12;
end;
v10.logEventWithTimestamp = function(v13, v14, v15, v16) --[[ Line: 102 ]] --[[ Name: logEventWithTimestamp ]]
    local v17 = {
        eventName = v14, 
        timestamp = v15, 
        metadata = v16
    };
    v13._messageBus:Call(v13.LOG_EVENT_WITH_TIMESTAMP, v17);
end;
v10.logEvent = function(v18, v19, v20) --[[ Line: 111 ]] --[[ Name: logEvent ]]
    v18:logEventWithTimestamp(v19, 0, v20);
end;
v10.getTimestamp = function(v21) --[[ Line: 116 ]] --[[ Name: getTimestamp ]]
    return v21._messageBus:Call(v21.GET_TIMESTAMP, {});
end;
v10.logTelemetryEvent = function(v22, v23) --[[ Line: 120 ]] --[[ Name: logTelemetryEvent ]]
    -- upvalues: v9 (copy), v3 (copy)
    assert(v9(v23));
    if v3.LogTelemetry() then
        print(("StyleEditor logged telemetry event '%*':"):format(v23.config.eventName), v23);
    end;
    v22._messageBus:Call(v22.LOG_EVENT_FROM_LUA, v23);
end;
return v10;