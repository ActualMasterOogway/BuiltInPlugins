local l_game_FastInt_0 = game:GetFastInt("StudioAudioDiscoveryMaxAssetIdsPerRequest");
local l_game_FastInt_1 = game:GetFastInt("StudioAudioDiscoveryPerRequestCooldown");
local l_game_FastInt_2 = game:GetFastInt("StudioAudioDiscoveryCooldownAfterHttp429");
local l_game_FastInt_3 = game:GetFastInt("StudioAudioDiscoveryMaxRecentRequests");
local l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 = game:GetFastFlag("DEBUG_StudioAudioDiscoveryPermissionCheckErrors");
local l_AddNonPermCase_0 = game:GetFastFlag("AddNonPermCase");
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Packages.Framework);
local v8 = v7.RobloxAPI.Url.new();
local l_Signal_0 = v7.Util.Signal;
local _ = require(l_Parent_0.Src.Types);
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local v13 = require(l_Parent_0.Src.Util.Analytics);
local v14 = {};
v14.__index = v14;
v14.new = function(v15, v16) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_game_FastInt_0 (copy), l_game_FastInt_1 (copy), l_game_FastInt_2 (copy), l_game_FastInt_3 (copy), v14 (copy)
    local v17 = {
        soundsFound = l_Signal_0.new(), 
        _soundAssets = {}, 
        _nonSoundAssetIds = {}, 
        _currentBatch = {}, 
        _pendingAssetIds = {}, 
        _batchesToSend = {}, 
        _batchRequestsInFlight = 0, 
        _maxAssetsPerRequest = v16 and v16.maxAssetsPerRequest or l_game_FastInt_0, 
        _perRequestCooldown = v16 and v16.perRequestCooldown or l_game_FastInt_1, 
        _cooldownAfterHttp429 = v16 and v16.cooldownAfterHttp429 or l_game_FastInt_2, 
        _maxRecentRequests = v16 and v16.maxRecentRequests or l_game_FastInt_3, 
        _lastSentRequests = {}, 
        _hit429 = 0, 
        _started = false, 
        _dead = false, 
        _httpTask = nil, 
        _renderSteppedConnection = nil, 
        _goodAssets = 0, 
        _badAssets = 0, 
        _resolvedAssets = {}, 
        _networking = v15
    };
    setmetatable(v17, v14);
    return v17;
end;
v14.start = function(v18) --[[ Line: 111 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy)
    if v18._started or v18._dead then
        return;
    else
        v18._started = true;
        v18._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(v19) --[[ Line: 117 ]]
            -- upvalues: v18 (copy)
            v18:_renderStepped(v19);
        end);
        v18._httpTask = coroutine.create(function() --[[ Line: 121 ]]
            -- upvalues: v18 (copy)
            while not v18._dead do
                v18:_stepHttpTask();
            end;
        end);
        v18:_wakeUpHttpTask();
        return;
    end;
end;
v14.destroy = function(v20) --[[ Line: 130 ]] --[[ Name: destroy ]]
    v20._dead = true;
    if v20._renderSteppedConnection then
        v20._renderSteppedConnection:Disconnect();
        v20._renderSteppedConnection = nil;
    end;
    if v20._httpTask then
        coroutine.close(v20._httpTask);
        v20._httpTask = nil;
    end;
end;
v14._wakeUpHttpTask = function(v21) --[[ Line: 144 ]] --[[ Name: _wakeUpHttpTask ]]
    if v21._dead or not v21._httpTask or coroutine.status(v21._httpTask) ~= "suspended" then
        return;
    else
        coroutine.resume(v21._httpTask);
        return;
    end;
end;
v14.addAssetId = function(v22, v23) --[[ Line: 152 ]] --[[ Name: addAssetId ]]
    assert(type(v23) == "string");
    if v23 == "" or v23 == "0" then
        return;
    elseif v22._soundAssets[v23] or v22._nonSoundAssetIds[v23] or v22._pendingAssetIds[v23] then
        return;
    else
        table.insert(v22._currentBatch, v23);
        v22._pendingAssetIds[v23] = true;
        if #v22._currentBatch >= v22._maxAssetsPerRequest then
            v22:flush();
        end;
        return;
    end;
end;
v14.flush = function(v24) --[[ Line: 170 ]] --[[ Name: flush ]]
    local l__currentBatch_0 = v24._currentBatch;
    v24._currentBatch = {};
    if #l__currentBatch_0 > 0 then
        table.insert(v24._batchesToSend, l__currentBatch_0);
        v24:_wakeUpHttpTask();
    end;
end;
v14.resolved = function(v26, v27) --[[ Line: 180 ]] --[[ Name: resolved ]]
    if not v26._resolvedAssets[v27] then
        v26._resolvedAssets[v27] = true;
        v26._badAssets = v26._badAssets - 1;
    end;
end;
v14._hasBatchesToSend = function(v28) --[[ Line: 187 ]] --[[ Name: _hasBatchesToSend ]]
    return #v28._batchesToSend > 0;
end;
v14._stepHttpTask = function(v29) --[[ Line: 191 ]] --[[ Name: _stepHttpTask ]]
    if v29._dead then
        return;
    else
        if not v29:_hasBatchesToSend() then
            coroutine.yield();
        end;
        if v29._hit429 > 0 or #v29._lastSentRequests >= v29._maxRecentRequests then
            coroutine.yield();
        end;
        v29:_sendBatch((table.remove(v29._batchesToSend, 1)));
        coroutine.yield();
        return;
    end;
end;
v14._renderStepped = function(v30, v31) --[[ Line: 213 ]] --[[ Name: _renderStepped ]]
    if v30._dead then
        return;
    else
        local v32 = 1;
        while v32 <= #v30._lastSentRequests do
            local l__lastSentRequests_0 = v30._lastSentRequests;
            l__lastSentRequests_0[v32] = l__lastSentRequests_0[v32] - v31;
            if v30._lastSentRequests[v32] <= 0 then
                table.remove(v30._lastSentRequests, v32);
            else
                v32 = v32 + 1;
            end;
        end;
        v30._hit429 = v30._hit429 - v31;
        if v30._hit429 <= 0 then
            v30._hit429 = 0;
        end;
        if v30:_hasBatchesToSend() and v30._hit429 <= 0 and #v30._lastSentRequests < v30._maxRecentRequests then
            v30:_wakeUpHttpTask();
        end;
        return;
    end;
end;
v14._sendBatch = function(v34, v35) --[[ Line: 245 ]] --[[ Name: _sendBatch ]]
    -- upvalues: v8 (copy)
    local v36 = table.concat(v35, ",");
    local v37 = v8.composeUrl(v8.APIS_URL, "toolbox-service/v1/items/details", {
        assetIds = v36
    });
    table.insert(v34._lastSentRequests, v34._perRequestCooldown);
    v34._batchRequestsInFlight = v34._batchRequestsInFlight + 1;
    local function v40(v38) --[[ Line: 254 ]] --[[ Name: noLongerInFlight ]]
        -- upvalues: v34 (copy)
        local l_v34_0 = v34;
        l_v34_0._batchRequestsInFlight = l_v34_0._batchRequestsInFlight - 1;
        return v38;
    end;
    local v41 = v34._networking:get(v37):andThen(v40, v40);
    v34._networking:parseJson(v41):andThen(function(v42) --[[ Line: 261 ]]
        -- upvalues: v34 (copy), v35 (copy)
        v34:_onBatchResponse(v35, v42.responseBody);
    end, function(v43) --[[ Line: 263 ]]
        -- upvalues: v34 (copy), v35 (copy)
        if v43.responseCode == 429 then
            v34._hit429 = v34._cooldownAfterHttp429;
            table.insert(v34._batchesToSend, v35);
            return;
        elseif v43.responseCode < 400 or v43.responseCode >= 500 then
            table.insert(v34._batchesToSend, v35);
            return;
        else
            warn(("Fetching sound asset details failed: %d %s"):format(v43.responseCode, v43.responseBody.message));
            return;
        end;
    end);
end;
local l_CreatorId_0 = game.CreatorId;
local l_CreatorType_0 = game.CreatorType;
v14._checkSound = function(_, v47, v48) --[[ Line: 323 ]] --[[ Name: _checkSound ]]
    -- upvalues: l_CreatorId_0 (copy), l_CreatorType_0 (copy)
    return v48 == Enum.CreatorType.User and (v47 == 1 or v47 == 1750384777) or l_CreatorId_0 == v47 and l_CreatorType_0 == v48;
end;
v14._onBatchCheckUniversePermissionResponse = function(v49, v50, v51, v52) --[[ Line: 328 ]] --[[ Name: _onBatchCheckUniversePermissionResponse ]]
    -- upvalues: v13 (copy), l_AddNonPermCase_0 (copy), l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 (copy)
    v13:reportPermissionCheck(v50);
    local v53 = {};
    local l_results_0 = v50.responseBody.results;
    for v55, v56 in pairs(v52) do
        if l_AddNonPermCase_0 then
            if l_results_0[v55].value then
                if l_results_0[v55].value.status == "HasPermission" then
                    v51[v56].OK = "ok";
                    v49._goodAssets = v49._goodAssets + 1;
                else
                    v51[v56].OK = "error";
                    v49._badAssets = v49._badAssets + 1;
                end;
            elseif l_results_0[v55].error then
                if l_results_0[v55].error.message then
                    if l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 then
                        warn(("Fetching sound asset universe permissions failed: %s"):format(l_results_0[v55].error.code));
                    end;
                    v49._badAssets = v49._badAssets + 1;
                end;
            else
                v49._badAssets = v49._badAssets + 1;
            end;
        elseif l_results_0[v55].value.status == "HasPermission" then
            v51[v56].OK = "ok";
            v49._goodAssets = v49._goodAssets + 1;
        elseif l_results_0[v55].error.message ~= nil then
            if l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 then
                warn(("Fetching sound asset universe permissions failed: %s"):format(l_results_0[v55].error.code));
            end;
            v49._badAssets = v49._badAssets + 1;
        else
            v49._badAssets = v49._badAssets + 1;
        end;
        v49._soundAssets[v56] = v51[v56];
        table.insert(v53, v51[v56]);
    end;
    if #v53 > 0 then
        v49.soundsFound:Fire(v53);
    end;
    if not v49:_hasBatchesToSend() and v49._batchRequestsInFlight == 0 then
        v13:reportBreakdown(v49._goodAssets, v49._badAssets);
    end;
end;
v14._sendBatchCheckUniversePermission = function(v57, v58) --[[ Line: 386 ]] --[[ Name: _sendBatchCheckUniversePermission ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy)
    local v59 = {
        ["Content-Type"] = "application/json"
    };
    local v60 = v8.composeUrl(v8.APIS_URL, "asset-permissions-api/v1/assets/check-permissions");
    local l_game_FastInt_4 = game:GetFastInt("AudioDiscoveryPermCheckMaxAssetIdsPerRequest");
    local v62 = 0;
    local v63 = {};
    local v64 = {};
    for v65, _ in pairs(v58) do
        if v62 == l_game_FastInt_4 then
            local v67 = l_HttpService_0:JSONEncode({
                requests = v63
            });
            local v68 = v57._networking:post(v60, v67, v59);
            v57._networking:parseJson(v68):andThen(function(v69) --[[ Line: 403 ]]
                -- upvalues: v57 (copy), v58 (copy), v64 (ref)
                v57:_onBatchCheckUniversePermissionResponse(v69, v58, v64);
            end, function(v70) --[[ Line: 405 ]]
                warn(("Fetching sound asset permissions failed: %d %s"):format(v70.responseCode, v70.responseBody.message));
            end);
            v63 = {};
            v64 = {};
            v62 = 0;
        else
            table.insert(v63, {
                subject = {
                    subjectType = "Universe", 
                    subjectId = tostring(game.GameId)
                }, 
                action = "use", 
                assetId = tostring(v65)
            });
            table.insert(v64, v65);
            v62 = v62 + 1;
        end;
    end;
    local v71 = l_HttpService_0:JSONEncode({
        requests = v63
    });
    local v72 = v57._networking:post(v60, v71, v59);
    v57._networking:parseJson(v72):andThen(function(v73) --[[ Line: 439 ]]
        -- upvalues: v57 (copy), v58 (copy), v64 (ref)
        v57:_onBatchCheckUniversePermissionResponse(v73, v58, v64);
    end, function(v74) --[[ Line: 441 ]]
        warn(("Fetching sound asset permissions failed: %d %s"):format(v74.responseCode, v74.responseBody.message));
    end);
end;
v14._onBatchResponse = function(v75, v76, v77) --[[ Line: 452 ]] --[[ Name: _onBatchResponse ]]
    -- upvalues: v13 (copy)
    local v78 = {};
    for _, v80 in ipairs(v76) do
        v78[v80] = true;
    end;
    local v81 = {};
    local v82 = {};
    for _, v84 in ipairs(v77.data) do
        local l_id_0 = v84.asset.id;
        v75._pendingAssetIds[l_id_0] = nil;
        v78[l_id_0] = nil;
        if v84.asset.typeId ~= 3 then
            v75._nonSoundAssetIds[l_id_0] = true;
        else
            local v86 = if v84.creator.type == 1 then Enum.CreatorType.User else Enum.CreatorType.Group;
            local v87 = v75:_checkSound(v84.creator.id, v86);
            local v88 = {
                OK = v87 and "ok" or "error", 
                Id = tostring(l_id_0), 
                Name = v84.asset.name, 
                CreatorId = v84.creator.id, 
                CreatorType = v84.creator.type == 1 and "User" or "Group", 
                Creator = v84.creator.name, 
                Time = v84.asset.duration
            };
            v82[l_id_0] = v88;
            if game.GameId == 0 then
                if v87 then
                    v75._goodAssets = v75._goodAssets + 1;
                else
                    v75._badAssets = v75._badAssets + 1;
                end;
                v75._soundAssets[l_id_0] = v88;
                table.insert(v81, v88);
            end;
        end;
    end;
    for v89 in pairs(v78) do
        v75._pendingAssetIds[v89] = nil;
        v75._nonSoundAssetIds[v89] = true;
    end;
    if game.GameId ~= 0 then
        v75:_sendBatchCheckUniversePermission(v82);
        return;
    else
        if #v81 > 0 then
            v75.soundsFound:Fire(v81);
        end;
        if not v75:_hasBatchesToSend() and v75._batchRequestsInFlight == 0 then
            v13:reportBreakdown(v75._goodAssets, v75._badAssets);
        end;
        return;
    end;
end;
return v14;