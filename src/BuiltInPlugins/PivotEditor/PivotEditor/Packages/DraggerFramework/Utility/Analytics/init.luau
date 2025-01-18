local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Utility.DebugFlags);
local v6 = {};
if not pcall(function() --[[ Line: 33 ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref)
    local _ = l_RbxAnalyticsService_0.Name;
end) then
    l_RbxAnalyticsService_0 = {
        SendEventDeferred = function(_) --[[ Line: 37 ]] --[[ Name: SendEventDeferred ]]

        end, 
        ReportCounter = function(_) --[[ Line: 38 ]] --[[ Name: ReportCounter ]]

        end, 
        GetSessionId = function(_) --[[ Line: 39 ]] --[[ Name: GetSessionId ]]

        end, 
        GetClientId = function(_) --[[ Line: 40 ]] --[[ Name: GetClientId ]]

        end, 
        ReportStats = function(_) --[[ Line: 41 ]] --[[ Name: ReportStats ]]

        end
    };
    l_TelemetryService_0 = {
        LogCounter = function(_) --[[ Line: 44 ]] --[[ Name: LogCounter ]]

        end
    };
end;
if not l_StudioService_0 then
    l_StudioService_0 = {
        GetUserId = function(_) --[[ Line: 50 ]] --[[ Name: GetUserId ]]

        end
    };
end;
v6.sendEvent = function(_, v16, v17) --[[ Line: 53 ]] --[[ Name: sendEvent ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref), l_StudioService_0 (ref), v5 (copy), l_HttpService_0 (copy)
    local v18 = {
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        userId = l_StudioService_0:GetUserId()
    };
    for v19, v20 in pairs(v17) do
        v18[v19] = v20;
    end;
    if v5.LogAnalytics() then
        print(("%s SendEvent eventName=%s args=%s"):format("Modeling", tostring(v16), l_HttpService_0:JSONEncode(v18)));
    end;
    l_RbxAnalyticsService_0:SendEventDeferred("studio", "Modeling", v16, v18);
end;
v6.reportCounter = function(_, v22, v23) --[[ Line: 77 ]] --[[ Name: reportCounter ]]
    -- upvalues: v5 (copy), l_RbxAnalyticsService_0 (ref)
    if v5.LogAnalytics() then
        print(("%s ReportCounter counterName=%s count=%s"):format("Modeling", tostring(v22), (tostring(v23))));
    end;
    l_RbxAnalyticsService_0:ReportCounter(v22, v23 or 1);
end;
v6.logTelemetryCounter = function(_, v25, v26) --[[ Line: 91 ]] --[[ Name: logTelemetryCounter ]]
    -- upvalues: l_TelemetryService_0 (ref)
    l_TelemetryService_0:LogCounter(v26, {
        customFields = {
            tool = v25
        }
    });
end;
v6.reportStats = function(_, v28, v29) --[[ Line: 95 ]] --[[ Name: reportStats ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref)
    l_RbxAnalyticsService_0:ReportStats(v28, v29);
end;
return v6;