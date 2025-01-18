local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(script.Parent.TelemetryProtocolTypes);
local v2 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat"
};
local v3 = {
    addPlaceId = "addPlaceId", 
    addUniverseId = "addUniverseId", 
    addPlaceInstanceId = "addPlaceInstanceId", 
    addSessionId = "addSessionId"
};
local v4 = {
    TelemetryBackends = v2, 
    StandardizedFields = v3, 
    LOG_EVENT_WITH_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "logEventWithTimestamp"), 
    GET_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "getTimestamp"), 
    LOG_EVENT_FROM_LUA = l_MessageBusService_0:GetMessageId("Logging", "logEventFromLua"), 
    ONE_HUNDRED_PERCENT = 10000
};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBusService_0 (copy), v4 (copy)
    local v6 = {
        messageBus = v5 or l_MessageBusService_0
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.logEventWithTimestamp = function(v7, v8, v9, v10) --[[ Line: 58 ]] --[[ Name: logEventWithTimestamp ]]
    local v11 = {
        eventName = v8, 
        timestamp = v9, 
        metadata = v10
    };
    v7.messageBus:Call(v7.LOG_EVENT_WITH_TIMESTAMP, v11);
end;
v4.logEvent = function(v12, v13, v14) --[[ Line: 67 ]] --[[ Name: logEvent ]]
    v12:logEventWithTimestamp(v13, 0, v14);
end;
v4.getTimestamp = function(v15) --[[ Line: 72 ]] --[[ Name: getTimestamp ]]
    return v15.messageBus:Call(v15.GET_TIMESTAMP, {});
end;
v4.logRobloxTelemetryEvent = function(v16, v17, v18, v19, v20) --[[ Line: 76 ]] --[[ Name: logRobloxTelemetryEvent ]]
    local v21 = {
        eventType = "RobloxTelemetry", 
        config = v17, 
        data = {
            standardizedFields = v18, 
            customFields = v19, 
            eventContext = v20
        }
    };
    v16.messageBus:Call(v16.LOG_EVENT_FROM_LUA, v21);
end;
v4.logEphemeralCounterEvent = function(v22, v23, v24) --[[ Line: 94 ]] --[[ Name: logEphemeralCounterEvent ]]
    local v25 = {
        eventType = "EphemeralCounter", 
        config = v23, 
        data = if v24 then {
            incrementValue = v24
        } else nil
    };
    v22.messageBus:Call(v22.LOG_EVENT_FROM_LUA, v25);
end;
v4.logEphemeralStatEvent = function(v26, v27, v28) --[[ Line: 108 ]] --[[ Name: logEphemeralStatEvent ]]
    local v29 = {
        eventType = "EphemeralStat", 
        config = v27, 
        data = {
            statValue = v28
        }
    };
    v26.messageBus:Call(v26.LOG_EVENT_FROM_LUA, v29);
end;
v4.default = v4.new();
return v4;