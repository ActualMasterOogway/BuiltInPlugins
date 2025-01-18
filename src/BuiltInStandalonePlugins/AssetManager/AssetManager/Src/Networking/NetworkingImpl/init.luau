local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(script.Parent.Urls);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_StudioService_0 = game:GetService("StudioService");
local l_UserService_0 = game:GetService("UserService");
local v8 = require(l_script_FirstAncestor_0.Src.Util.convertAssetTypeStringToEnum);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetManagerThumbnailPermissions);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAmrAssetFetchCount);
local v12 = {
    _fetchScopeId = 0, 
    _fetchTotalAssets = 0, 
    _fetchLimit = v11(), 
    _fetchAssetsTrackers_DEPRECATED = {}, 
    _fetchAssetsTypeTotals_DEPRECATED = {}
};
v12.incrementFetchSessionId = function() --[[ Line: 39 ]]
    -- upvalues: v12 (copy)
    local l_v12_0 = v12;
    l_v12_0._fetchScopeId = l_v12_0._fetchScopeId + 1;
    if v12._fetchScopeId == 1e999 then
        v12._fetchScopeId = 0;
    end;
end;
local function _(v14, v15) --[[ Line: 47 ]] --[[ Name: updateFetchTotalAssets ]]
    -- upvalues: v12 (copy)
    local l_v12_1 = v12;
    l_v12_1._fetchTotalAssets = l_v12_1._fetchTotalAssets + v14;
    v15:Fire((math.clamp(v12._fetchTotalAssets / v12._fetchLimit, 0, 1)));
end;
v12.fetchUsername = function(v18) --[[ Line: 53 ]]
    -- upvalues: l_StudioService_0 (copy), l_UserService_0 (copy)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
        -- upvalues: l_UserService_0 (ref), l_l_StudioService_0_UserId_0 (copy)
        return l_UserService_0:GetUserInfosByUserIdsAsync({
            l_l_StudioService_0_UserId_0
        });
    end);
    if l_status_0 then
        v18(l_result_0[1].Username, false);
        return;
    else
        v18("", true);
        return;
    end;
end;
v12.fetchGameName = function() --[[ Line: 67 ]]
    -- upvalues: v10 (copy), l_MarketplaceService_0 (copy)
    if game.GameId == 0 then
        if v10() then
            warn("Game has not yet been published, cannot fetch game name");
        end;
        return false, "";
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 75 ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            return l_MarketplaceService_0:GetProductInfo(game.PlaceId).Name;
        end);
        return l_status_1, l_result_1;
    end;
end;
v12.fetchGroupsAsync = function(v24, v25) --[[ Line: 81 ]]
    -- upvalues: v3 (copy)
    v3.CreateFetchGroupsRequest():makeRequest():andThen(function(v26) --[[ Line: 86 ]]
        -- upvalues: v24 (copy)
        v24(v26.responseBody);
    end, v25);
end;
local function _(v27) --[[ Line: 92 ]] --[[ Name: isAssetOk ]]
    -- upvalues: v8 (copy)
    local l_asset_0 = v27.assetItem.asset;
    return l_asset_0 and l_asset_0.creationContext.creator and l_asset_0.createTime and l_asset_0.updateTime and v8(l_asset_0.assetType);
end;
local function v41(v30) --[[ Line: 101 ]] --[[ Name: convertResponseToItemsData ]]
    -- upvalues: v8 (copy), v10 (copy), v2 (copy), v1 (copy)
    local v31 = {};
    local v32 = {};
    for _, v34 in v30 do
        local l_asset_1 = v34.assetItem.asset;
        if not (l_asset_1 and l_asset_1.creationContext.creator and l_asset_1.createTime and l_asset_1.updateTime and v8(l_asset_1.assetType)) then
            if v10() then
                warn((("Could not convert asset response for asset %*"):format((v2.pretty(v34)))));
            end;
        else
            local l_asset_2 = v34.assetItem.asset;
            l_asset_1 = v34.assetItem.asset.creationContext.creator;
            local v37 = if l_asset_1.userId then l_asset_1.userId else l_asset_1.groupId;
            local v38 = if l_asset_1.name then l_asset_1.name else tostring(v37);
            local v39 = if l_asset_1.userId then v1.Scope.User else v1.Scope.Group;
            local v40 = {
                AssetId = l_asset_2.assetId, 
                AssetType = v8(l_asset_2.assetType), 
                DisplayName = l_asset_2.displayName, 
                Created = DateTime.fromIsoDate(l_asset_2.createTime), 
                Modified = DateTime.fromIsoDate(l_asset_2.updateTime), 
                ModerationStatus = v1.ModerationStatus.Placeholder, 
                Creator = {
                    Id = v37, 
                    Name = v38, 
                    Scope = v39
                }
            };
            table.insert(v31, v40);
            v32[v40.Creator.Name] = v40.Creator;
        end;
    end;
    return v31, v32;
end;
v12._checkResponse = function(v42, v43, v44, v45, v46) --[[ Line: 138 ]]
    -- upvalues: v12 (copy)
    if v42.FetchSessionId ~= v12._fetchScopeId then
        local l_OnFetchProgressChanged_0 = v42.OnFetchProgressChanged;
        local l_v12_2 = v12;
        l_v12_2._fetchTotalAssets = l_v12_2._fetchTotalAssets + 0;
        l_OnFetchProgressChanged_0:Fire((math.clamp(v12._fetchTotalAssets / v12._fetchLimit, 0, 1)));
        v45({}, {});
        return false;
    elseif v43 ~= 200 then
        v46(tostring(v43), v43);
        return false;
    elseif v44 == 0 then
        local l_OnFetchProgressChanged_1 = v42.OnFetchProgressChanged;
        local l_v12_3 = v12;
        l_v12_3._fetchTotalAssets = l_v12_3._fetchTotalAssets + 0;
        l_OnFetchProgressChanged_1:Fire((math.clamp(v12._fetchTotalAssets / v12._fetchLimit, 0, 1)));
        v42.OnFetchFinished:Fire();
        v45({}, {});
        return false;
    else
        return true;
    end;
end;
v12._fetchAssetsImplAsync = function(v51, v52, v53, v54, v55, v56) --[[ Line: 168 ]]
    -- upvalues: v12 (copy), v41 (copy), v2 (copy)
    local v57 = {
        maxPageSize = v55, 
        pageToken = v56
    };
    v54(v51.Id, v57):makeRequest():andThen(function(v58) --[[ Line: 180 ]]
        -- upvalues: v12 (ref), v51 (copy), v52 (copy), v53 (copy), v41 (ref), v54 (copy), v55 (copy)
        if not v12._checkResponse(v51, v58.responseCode, #v58.responseBody.items, v52, v53) then
            return;
        else
            local v59, v60 = v41(v58.responseBody.items);
            local v61 = #v59;
            local l_OnFetchProgressChanged_2 = v51.OnFetchProgressChanged;
            local l_v12_4 = v12;
            l_v12_4._fetchTotalAssets = l_v12_4._fetchTotalAssets + v61;
            l_OnFetchProgressChanged_2:Fire((math.clamp(v12._fetchTotalAssets / v12._fetchLimit, 0, 1)));
            v52(v59, v60);
            if v58.responseBody.nextPageToken and v58.responseBody.nextPageToken ~= "" and v12._fetchTotalAssets < v12._fetchLimit then
                v12._fetchAssetsImplAsync(v51, v52, v53, v54, v55, v58.responseBody.nextPageToken);
                return;
            else
                v51.OnFetchFinished:Fire();
                return;
            end;
        end;
    end, function(v64) --[[ Line: 212 ]]
        -- upvalues: v51 (copy), v53 (copy), v2 (ref)
        v51.OnFetchFinished:Fire();
        v53(v2.pretty(v64.responseBody.errors));
    end);
end;
v12.fetchAssetsAsync = function(v65, v66, v67) --[[ Line: 219 ]]
    -- upvalues: v12 (copy), v1 (copy), v3 (copy), v10 (copy)
    v12.incrementFetchSessionId();
    v65.FetchSessionId = v12._fetchScopeId;
    v12._fetchTotalAssets = 0;
    local v68 = nil;
    if v65.Scope == v1.Scope.User then
        v68 = v3.CreateFetchAssetsForUserRequest;
    elseif v65.Scope == v1.Scope.Group then
        v68 = v3.CreateFetchAssetsForGroupRequest;
    elseif v65.Scope == v1.Scope.Universe then
        v68 = v3.CreateFetchAssetsForUniverseRequest;
    else
        if v10() then
            warn((("ExplorerRow: Unsupported Scope type for fetchAssetsAsync %*"):format(v65.Scope)));
        end;
        return;
    end;
    v12._fetchAssetsImplAsync(v65, v66, v67, v68, 750, "");
end;
v12._searchAssetsImplAsync = function(v69, v70, v71, v72, v73) --[[ Line: 246 ]]
    -- upvalues: v3 (copy), v12 (copy), v41 (copy), v2 (copy)
    local v74 = {
        Type = v69.ScopeInfo.Scope, 
        Id = v69.ScopeInfo.Id
    };
    v3.CreateSearchAssetsRequest(v69.SearchTerm, v69.AssetType, v74, v72, v73):makeRequest():andThen(function(v75) --[[ Line: 259 ]]
        -- upvalues: v12 (ref), v69 (copy), v70 (copy), v71 (copy), v41 (ref), v72 (copy)
        if not v12._checkResponse(v69, v75.responseCode, #v75.responseBody.items, v70, v71) then
            return;
        else
            local v76, v77 = v41(v75.responseBody.items);
            local v78 = #v76;
            local l_OnFetchProgressChanged_3 = v69.OnFetchProgressChanged;
            local l_v12_5 = v12;
            l_v12_5._fetchTotalAssets = l_v12_5._fetchTotalAssets + v78;
            l_OnFetchProgressChanged_3:Fire((math.clamp(v12._fetchTotalAssets / v12._fetchLimit, 0, 1)));
            v70(v76, v77);
            if v75.responseBody.nextPageToken and v75.responseBody.nextPageToken ~= "" and v12._fetchTotalAssets < v12._fetchLimit then
                v12._searchAssetsImplAsync(v69, v70, v71, v72, v75.responseBody.nextPageToken);
                return;
            else
                v69.OnFetchFinished:Fire();
                return;
            end;
        end;
    end, function(v81) --[[ Line: 290 ]]
        -- upvalues: v69 (copy), v71 (copy), v2 (ref)
        v69.OnFetchFinished:Fire();
        v71(v2.pretty(v81));
    end);
end;
v12.searchAssetsAsync = function(v82, v83, v84) --[[ Line: 297 ]]
    -- upvalues: v12 (copy)
    v12.incrementFetchSessionId();
    v82.FetchSessionId = v12._fetchScopeId;
    v12._fetchTotalAssets = 0;
    v12._searchAssetsImplAsync(v82, v83, v84, 750, "");
end;
v12.grantUniverseUseAssetsPermissions = function(v85) --[[ Line: 307 ]]
    -- upvalues: v3 (copy), v10 (copy), v2 (copy)
    local v87 = v3.PatchAssetsPermissionsRequest(v85, "Universe", game.GameId, "Use"):makeRequest():catch(function(v86) --[[ Line: 315 ]]
        return v86;
    end):await();
    if v87 and v87.errors and #v87.errors then
        if v10() then
            warn((("Failed to grant permissions to assets: %*\")"):format((v2.pretty(v87.errors)))));
        end;
        return false, v87.errors;
    elseif v87 and v87.error then
        if v10() then
            warn((("Failed to grant permissions to assets: %*\")"):format((v2.pretty(v87.error)))));
        end;
        return false, {};
    elseif v87 and v87.responseCode ~= 200 then
        if v10() then
            warn((("Failed to grant permissions to assets: %*"):format(v87.responseCode)));
        end;
        return false, {};
    else
        return true, {};
    end;
end;
v12.getThumbnailUriForScope = function(v88) --[[ Line: 339 ]]
    -- upvalues: v1 (copy), v10 (copy)
    if v88.Scope == v1.Scope.User then
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v88.Id));
    elseif v88.Scope == v1.Scope.Group then
        return (("rbxthumb://type=GroupIcon&id=%*&w=150&h=150"):format(v88.Id));
    elseif v88.Scope == v1.Scope.Universe then
        return (("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(v88.Id));
    else
        if v10() then
            warn("ExplorerRow: Unsupported Scope type for image icon", v88.Scope);
        end;
        return "";
    end;
end;
v12.getThumbnailForScopeAsync = function(v89, v90) --[[ Line: 354 ]]
    -- upvalues: v12 (copy), l_ContentProvider_0 (copy), v10 (copy)
    local v91 = v12.getThumbnailUriForScope(v89);
    l_ContentProvider_0:PreloadAsync({
        v91
    }, function(v92, v93) --[[ Line: 356 ]]
        -- upvalues: v90 (copy), v10 (ref), v89 (copy)
        if v93 == Enum.AssetFetchStatus.Success then
            v90(v92);
            return;
        else
            if v10() then
                warn("Failed to fetch thumbnail for scope", v89);
            end;
            v90("");
            return;
        end;
    end);
end;
v12.getThumbnailForItem = function(v94) --[[ Line: 369 ]]
    -- upvalues: v9 (copy)
    if v9() then
        return (("rbxthumb://type=CreatorContextAsset&id=%*&w=150&h=150"):format(v94));
    else
        return (("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v94));
    end;
end;
v12.getThumbnailForItemAsync = function(v95, v96) --[[ Line: 377 ]]
    -- upvalues: v12 (copy), l_ContentProvider_0 (copy)
    local v97 = v12.getThumbnailForItem(v95);
    task.spawn(function() --[[ Line: 379 ]]
        -- upvalues: l_ContentProvider_0 (ref), v97 (copy), v96 (copy)
        l_ContentProvider_0:PreloadAsync({
            v97
        }, v96);
    end);
end;
return v12;