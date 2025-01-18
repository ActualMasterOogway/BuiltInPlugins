local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = {};
if not pcall(function() --[[ Line: 7 ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref)
    local _ = l_RbxAnalyticsService_0.Name;
end) then
    l_RbxAnalyticsService_0 = {
        SendEventDeferred = function(_) --[[ Line: 11 ]] --[[ Name: SendEventDeferred ]]

        end, 
        ReportCounter = function(_) --[[ Line: 12 ]] --[[ Name: ReportCounter ]]

        end, 
        GetSessionId = function(_) --[[ Line: 13 ]] --[[ Name: GetSessionId ]]

        end, 
        GetClientId = function(_) --[[ Line: 14 ]] --[[ Name: GetClientId ]]

        end, 
        ReportStats = function(_) --[[ Line: 15 ]] --[[ Name: ReportStats ]]

        end
    };
end;
v2.sendEvent = function(_, v10, v11) --[[ Line: 18 ]] --[[ Name: sendEvent ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref), l_StudioService_0 (copy)
    local v12 = {
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        userId = l_StudioService_0:GetUserId()
    };
    for v13, v14 in pairs(v11) do
        v12[v13] = v14;
    end;
    l_RbxAnalyticsService_0:SendEventDeferred("studio", "Modeling", v10, v12);
end;
v2.reportCounter = function(_, v16, v17) --[[ Line: 31 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref)
    l_RbxAnalyticsService_0:ReportCounter(v16, v17 or 1);
end;
v2.reportStats = function(_, v19, v20) --[[ Line: 35 ]] --[[ Name: reportStats ]]
    -- upvalues: l_RbxAnalyticsService_0 (ref)
    l_RbxAnalyticsService_0:ReportStats(v19, v20);
end;
return v2;