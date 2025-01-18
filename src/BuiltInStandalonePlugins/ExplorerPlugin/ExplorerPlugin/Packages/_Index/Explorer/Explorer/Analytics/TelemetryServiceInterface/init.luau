local _ = require(script.Parent.AnalyticsTypes);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 3 ]]
    return game:GetService("TelemetryService");
end);
local v3 = if l_status_0 then l_result_0 else nil;
if v3 == nil then
    local function _(v4) --[[ Line: 10 ]] --[[ Name: createUnavailable ]]
        local v5 = false;
        return function(...) --[[ Line: 14 ]]
            -- upvalues: v5 (ref), v4 (copy)
            if v5 then
                return;
            else
                v5 = true;
                warn((("TelemetryServiceInterface.%* called without TelemetryService available"):format(v4)));
                return;
            end;
        end;
    end;
    local v7 = {};
    local v8 = false;
    local v9 = "logEvent";
    local l_v9_0 = v9 --[[ copy: 8 -> 9 ]];
    local v11;
    do
        local l_v8_0 = v8;
        v11 = function(...) --[[ Line: 14 ]]
            -- upvalues: l_v8_0 (ref), l_v9_0 (copy)
            if l_v8_0 then
                return;
            else
                l_v8_0 = true;
                warn((("TelemetryServiceInterface.%* called without TelemetryService available"):format(l_v9_0)));
                return;
            end;
        end;
    end;
    v7.logEvent = v11;
    v8 = false;
    v9 = "logCounter";
    local l_v9_1 = v9 --[[ copy: 8 -> 10 ]];
    do
        local l_v8_1 = v8;
        v11 = function(...) --[[ Line: 14 ]]
            -- upvalues: l_v8_1 (ref), l_v9_1 (copy)
            if l_v8_1 then
                return;
            else
                l_v8_1 = true;
                warn((("TelemetryServiceInterface.%* called without TelemetryService available"):format(l_v9_1)));
                return;
            end;
        end;
    end;
    v7.logCounter = v11;
    v8 = false;
    v9 = "logStat";
    do
        local l_v8_2 = v8;
        v11 = function(...) --[[ Line: 14 ]]
            -- upvalues: l_v8_2 (ref), v9 (copy)
            if l_v8_2 then
                return;
            else
                l_v8_2 = true;
                warn((("TelemetryServiceInterface.%* called without TelemetryService available"):format(v9)));
                return;
            end;
        end;
    end;
    v7.logStat = v11;
    return v7;
else
    local function v24(v16) --[[ Line: 33 ]] --[[ Name: canonicalizeConfig ]]
        local v17 = table.clone(v16);
        local v18, v19, v20 = string.match(v16.lastUpdated, "^([0-9][0-9][0-9][0-9])%-([0-9][0-9])%-([0-9][0-9])$");
        local v21 = v18 and tonumber(v18);
        local v22 = v19 and tonumber(v19);
        local v23 = v20 and tonumber(v20);
        if v21 == nil or v22 == nil or v23 == nil then
            error("Invalid date, expected ISO-8601 (YYYY-MM-DD)");
            return v17;
        elseif v22 > 12 or v23 > 31 then
            error("Invalid date, you probably flipped the month and day around. YYYY-MM-DD");
            return v17;
        else
            v17.lastUpdated = {
                v21 - 2000, 
                v22, 
                v23
            };
            return v17;
        end;
    end;
    return {
        logCounter = function(v25, v26, v27) --[[ Line: 57 ]] --[[ Name: logCounter ]]
            -- upvalues: v3 (copy), v24 (copy)
            v3:LogCounter(v24(v25), {
                customFields = v26
            }, v27);
        end, 
        logEvent = function(v28, v29) --[[ Line: 63 ]] --[[ Name: logEvent ]]
            -- upvalues: v3 (copy), v24 (copy)
            v3:LogEvent(v24(v28), {
                customFields = v29, 
                standardizedFields = {
                    "addPlaceId", 
                    "addUniverseId", 
                    "addPlaceInstanceId", 
                    "addSessionId", 
                    "addOSInfo", 
                    "addSessionInfo"
                }
            });
        end, 
        logStat = function(v30, v31, v32) --[[ Line: 80 ]] --[[ Name: logStat ]]
            -- upvalues: v3 (copy), v24 (copy)
            v3:LogStat(v24(v30), {
                customFields = v31
            }, v32);
        end
    };
end;