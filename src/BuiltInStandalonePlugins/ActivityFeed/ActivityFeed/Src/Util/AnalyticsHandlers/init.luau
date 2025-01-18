local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local function v5(v3) --[[ Line: 5 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v4 = v3 or {};
        v4 = v1.Dictionary.join({
            studioSid = v2:GetSessionId(), 
            clientId = v2:GetClientId()
        }, v4);
        v2:SendEventDeferred("studio", "ActivityHistory", "ActivityHistoryAction", v4);
    end;
    return {
        bubblesSeenOnSessionEnd = function(_, v7, v8, v9) --[[ Line: 15 ]] --[[ Name: bubblesSeenOnSessionEnd ]]
            -- upvalues: v5 (copy)
            v5({
                analyticsEventType = "bubblesSeenOnSessionEnd", 
                bubblesSeenOnSessionEndCount = v7, 
                placeId = v8, 
                universeId = v9
            });
        end, 
        deeplink = function(_, v11, v12, v13, v14) --[[ Line: 24 ]] --[[ Name: deeplink ]]
            -- upvalues: v5 (copy)
            if game:GetFastFlag("ActivityHistoryFeatureTelemetry") then
                v5({
                    analyticsEventType = "deeplink", 
                    eventtype = v11, 
                    deeplinktype = v12, 
                    placeId = v13, 
                    universeId = v14
                });
                return;
            else
                v5({
                    analyticsEventType = "deeplink", 
                    eventtype = v11, 
                    deeplinktype = v12
                });
                return;
            end;
        end, 
        applyFilters = function(_, v16, v17, v18, v19, v20, v21, v22, v23) --[[ Line: 37 ]] --[[ Name: applyFilters ]]
            -- upvalues: v5 (copy)
            v5({
                analyticsEventType = "applyFilters", 
                filterUsersNumSelected = v16, 
                filterUsersNumOptions = v17, 
                filterEventCategoriesNumSelected = v18, 
                filterEventCategoriesNumOptions = v19, 
                filterEventCategoriesSelected = v20, 
                filterJumpToDaysAgo = v21, 
                placeId = v22, 
                universeId = v23
            });
        end, 
        clearFilters = function(_, v25, v26) --[[ Line: 60 ]] --[[ Name: clearFilters ]]
            -- upvalues: v5 (copy)
            v5({
                analyticsEventType = "clearFilters", 
                placeId = v25, 
                universeId = v26
            });
        end
    };
end;