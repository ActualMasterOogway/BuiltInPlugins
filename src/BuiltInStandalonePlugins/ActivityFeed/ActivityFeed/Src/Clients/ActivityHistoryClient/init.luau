local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local l_Promise_0 = v1.Util.Promise;
local v4 = v1.RobloxAPI.Url.new();
local v5 = v1.Http.Networking.new({
    isInternal = true, 
    loggingLevel = 0
});
local l_game_FastInt_0 = game:GetFastInt("ActivityFeedEndpointFetchCount");
local l_FixActivityHistoryJSONParseError2_0 = game:GetFastFlag("FixActivityHistoryJSONParseError2");
local l_HttpService_0 = game:GetService("HttpService");
local function _(v9) --[[ Line: 36 ]] --[[ Name: jsonToTable ]]
    -- upvalues: l_HttpService_0 (copy)
    local v10 = {};
    local v11 = l_HttpService_0:JSONDecode(v9);
    for v12, v13 in pairs(v11) do
        v10[v12] = v13;
    end;
    return v10;
end;
local function v24(v15) --[[ Line: 45 ]] --[[ Name: parseMetaData ]]
    -- upvalues: l_FixActivityHistoryJSONParseError2_0 (copy), l_HttpService_0 (copy)
    if l_FixActivityHistoryJSONParseError2_0 then
        if type(v15) ~= "string" then
            return v15;
        elseif #v15 <= 0 then
            return {};
        end;
    elseif type(v15) ~= "string" or #v15 <= 0 then
        if #v15 <= 0 then
            return nil;
        else
            return v15;
        end;
    end;
    local v16 = {};
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
        -- upvalues: v16 (ref), v15 (copy), l_HttpService_0 (ref)
        local l_v15_0 = v15;
        local v18 = {};
        local v19 = l_HttpService_0:JSONDecode(l_v15_0);
        for v20, v21 in pairs(v19) do
            v18[v20] = v21;
        end;
        v16 = v18;
    end);
    if not l_status_0 then
        print("error decoding json " .. tostring(v15) .. ": " .. tostring(l_result_0));
    end;
    return v16;
end;
local function v49(_, v26, v27, v28, v29, v30) --[[ Line: 68 ]] --[[ Name: fetchActivityHistory ]]
    -- upvalues: l_game_FastInt_0 (copy), v4 (copy), l_HttpService_0 (copy), l_FixActivityHistoryJSONParseError2_0 (copy), v24 (copy), v5 (copy)
    if v26 == nil then
        return;
    else
        local v31 = {
            entryCount = l_game_FastInt_0, 
            clientType = 0, 
            universeId = v26, 
            reverseOrder = v29
        };
        if v26 == nil or v26 <= 0 then
            return;
        else
            if v27 then
                v31.cursor = v27;
            end;
            if v28 then
                v31.startDate = DateTime.fromUnixTimestampMillis(v28):ToIsoDate();
            end;
            local v32 = v4.composeUrl(v4.APIS_URL, "activity-feed-api/v1/history", v31);
            local function v34(v33) --[[ Line: 101 ]]
                print("fetchActivityHistory error " .. tostring(v33.responseCode));
            end;
            local function v47(v35) --[[ Line: 106 ]]
                -- upvalues: l_HttpService_0 (ref), l_FixActivityHistoryJSONParseError2_0 (ref), v24 (ref), v30 (copy)
                if v35.responseCode >= 200 and v35.responseCode < 300 then
                    v35.responseBody = l_HttpService_0:JSONDecode(v35.responseBody);
                end;
                for _, v37 in pairs(v35.responseBody.events) do
                    if l_FixActivityHistoryJSONParseError2_0 then
                        v37.metaData = v24(v37.metaData);
                    elseif type(v37.metaData) == "string" and #v37.metaData > 0 then
                        local v38 = {};
                        do
                            local l_v38_0 = v38;
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 118 ]]
                                -- upvalues: l_v38_0 (ref), v37 (copy), l_HttpService_0 (ref)
                                local l_metaData_0 = v37.metaData;
                                local v41 = {};
                                local v42 = l_HttpService_0:JSONDecode(l_metaData_0);
                                for v43, v44 in pairs(v42) do
                                    v41[v43] = v44;
                                end;
                                l_v38_0 = v41;
                            end);
                            if not l_status_1 then
                                print("error decoding json " .. tostring(v37.metaData) .. ": " .. tostring(l_result_1));
                            end;
                            v37.metaData = l_v38_0;
                        end;
                    end;
                end;
                v30(v35);
            end;
            v5:handleRetry(v5:get(v32)):catch(function(v48) --[[ Line: 133 ]]
                return v48;
            end):andThen(v47, v34);
            return;
        end;
    end;
end;
local function v52(v50) --[[ Line: 139 ]] --[[ Name: convertJSONToActivityHistoryEvent ]]
    -- upvalues: l_HttpService_0 (copy), l_FixActivityHistoryJSONParseError2_0 (copy), v24 (copy)
    local v51 = l_HttpService_0:JSONDecode(v50);
    if l_FixActivityHistoryJSONParseError2_0 then
        return {
            id = v51.Id or l_HttpService_0:GenerateGUID(false), 
            eventType = v51.EventType, 
            userId = v51.UserId, 
            universeId = v51.UniverseId, 
            placeId = v51.PlaceId, 
            resourceId = v51.ResourceId, 
            metaData = v24(v51.MetaData), 
            createdUnixTimeMs = v51.CreatedUnixTimeMs
        };
    else
        return {
            id = v51.Id or l_HttpService_0:GenerateGUID(false), 
            eventType = v51.EventType, 
            userId = v51.UserId, 
            universeId = v51.UniverseId, 
            placeId = v51.PlaceId, 
            resourceId = v51.ResourceId, 
            metaData = v51.MetaData and l_HttpService_0:JSONDecode(v51.MetaData), 
            createdUnixTimeMs = v51.CreatedUnixTimeMs
        };
    end;
end;
return {
    fetchActivityHistory = v49, 
    DEPRECATED_activityFeedRTEEffect = function(v53, v54, v55) --[[ Line: 167 ]] --[[ Name: DEPRECATED_activityFeedRTEEffect ]]
        -- upvalues: v52 (copy)
        return function() --[[ Line: 168 ]]
            -- upvalues: v53 (copy), v54 (copy), v55 (copy), v52 (ref)
            if v53 == nil or v54 == 0 or v54 == nil or v55 == nil then
                return;
            else
                local l_v53_PluginComponent_0 = v53:GetPluginComponent("ActivityHistoryManager");
                if l_v53_PluginComponent_0 == nil then
                    return;
                elseif not pcall(function() --[[ Line: 179 ]]
                    -- upvalues: l_v53_PluginComponent_0 (copy), v54 (ref)
                    l_v53_PluginComponent_0:SubscribeEventNotificationsAsync(v54);
                end) then
                    return;
                else
                    local v58 = l_v53_PluginComponent_0.EventNotificationReceived:connect(function(v57) --[[ Line: 189 ]]
                        -- upvalues: v55 (ref), v52 (ref)
                        if v57 == nil then
                            return;
                        else
                            v55((v52(v57)));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 196 ]]
                        -- upvalues: l_v53_PluginComponent_0 (copy), v54 (ref), v58 (copy)
                        pcall(function() --[[ Line: 198 ]]
                            -- upvalues: l_v53_PluginComponent_0 (ref), v54 (ref)
                            l_v53_PluginComponent_0:UnsubscribeEventNotificationsAsync(v54);
                        end);
                        if v58 then
                            v58:Disconnect();
                        end;
                    end;
                end;
            end;
        end;
    end, 
    activityFeedRTEEffect = function(v59, v60, v61) --[[ Line: 210 ]] --[[ Name: activityFeedRTEEffect ]]
        -- upvalues: v52 (copy)
        return function() --[[ Line: 211 ]]
            -- upvalues: v59 (copy), v60 (copy), v61 (copy), v52 (ref)
            if v59 == nil or v60 == 0 or v60 == nil or v61 == nil then
                return;
            else
                local v62 = v59.getActivityHistoryManager();
                if v62 == nil then
                    return;
                elseif not pcall(function() --[[ Line: 222 ]]
                    -- upvalues: v62 (copy), v60 (ref)
                    v62:SubscribeEventNotificationsAsync(v60);
                end) then
                    return;
                else
                    local v64 = v62.EventNotificationReceived:connect(function(v63) --[[ Line: 232 ]]
                        -- upvalues: v61 (ref), v52 (ref)
                        if v63 == nil then
                            return;
                        else
                            v61((v52(v63)));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 239 ]]
                        -- upvalues: v62 (copy), v60 (ref), v64 (copy)
                        pcall(function() --[[ Line: 241 ]]
                            -- upvalues: v62 (ref), v60 (ref)
                            v62:UnsubscribeEventNotificationsAsync(v60);
                        end);
                        if v64 then
                            v64:Disconnect();
                        end;
                    end;
                end;
            end;
        end;
    end, 
    fetchUsernames = function(v65, v66) --[[ Line: 253 ]] --[[ Name: fetchUsernames ]]
        -- upvalues: l_Promise_0 (copy)
        local v67 = {};
        local v68 = 0;
        for _, v70 in pairs(v65) do
            v68 = v68 + 1;
            table.insert(v67, (l_Promise_0.new(function(v71, v72) --[[ Line: 259 ]]
                -- upvalues: v70 (copy)
                local v73 = "";
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 261 ]]
                    -- upvalues: v73 (ref), v70 (ref)
                    v73 = game.Players:GetNameFromUserIdAsync(v70);
                end);
                if l_status_2 then
                    v71(v70, v73);
                else
                    v72(l_result_2);
                end;
            end)));
        end;
        local v76 = {};
        local v77 = 0;
        local function _() --[[ Line: 275 ]]
            -- upvalues: v77 (ref), v68 (ref), v66 (copy), v76 (copy)
            if v77 == v68 then
                v66(v76);
            end;
        end;
        for _, v80 in pairs(v67) do
            v80:andThen(function(v81, v82) --[[ Line: 282 ]]
                -- upvalues: v77 (ref), v76 (copy), v68 (ref), v66 (copy)
                v77 = v77 + 1;
                v76[v81] = v82;
                if v77 == v68 then
                    v66(v76);
                end;
            end):catch(function(_) --[[ Line: 287 ]]
                -- upvalues: v77 (ref), v68 (ref), v66 (copy), v76 (copy)
                v77 = v77 + 1;
                if v77 == v68 then
                    v66(v76);
                end;
            end);
        end;
    end
};