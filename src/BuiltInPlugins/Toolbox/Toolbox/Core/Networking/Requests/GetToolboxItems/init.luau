local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetLoading);
local v6 = require(l_Actions_0.UpdateSearchTerm);
local v7 = require(l_Actions_0.SetAutocorrect);
local v8 = require(l_Parent_0.Core.Networking.Requests.GetItemDetails);
local v9 = require(l_Parent_0.Core.Networking.Requests.GetCreatorName);
local v10 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.GetToolboxItemsResponseTypes);
local v12 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local l_Util_0 = l_Parent_0.Core.Util;
local v14 = require(l_Util_0.getUserId);
local v15 = require(l_Util_0.PagedRequestCursor);
local v16 = require(l_Util_0.Constants);
local v17 = require(l_Util_0.CreatorInfoHelper);
local v18 = require(l_Util_0.PageInfoHelper);
local v19 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v20 = require(l_Parent_0.Core.Types.BackendTypes);
local _ = require(l_Parent_0.Core.Types.CreatorTypes);
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Dash_0 = require(l_Packages_0.Framework).Dash;
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v25 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v26 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAudioTypeFiltering);
return function(v27, v28, v29, v30, _, _) --[[ Line: 40 ]]
    -- upvalues: v5 (copy), v17 (copy), v9 (copy), v15 (copy), v10 (copy), v14 (copy), v18 (copy), v22 (copy), v2 (copy), v20 (copy), v26 (copy), v8 (copy), l_Dash_0 (copy), v16 (copy), v24 (copy), v19 (copy), v12 (copy), v25 (copy), v7 (copy), v6 (copy), v4 (copy)
    return function(v33) --[[ Line: 41 ]]
        -- upvalues: v5 (ref), v30 (copy), v17 (ref), v9 (ref), v27 (copy), v15 (ref), v10 (ref), v28 (copy), v14 (ref), v18 (ref), v22 (ref), v2 (ref), v20 (ref), v26 (ref), v8 (ref), l_Dash_0 (ref), v29 (copy), v16 (ref), v24 (ref), v19 (ref), v12 (ref), v25 (ref), v7 (ref), v6 (ref), v4 (ref)
        v33:dispatch(v5(true));
        local l_creator_0 = v30.creator;
        local v35 = not (l_creator_0 and l_creator_0.Id == -1) and l_creator_0 and l_creator_0.Id or nil;
        local v36 = v30.additionalAudioSearchInfo or {};
        local l_currentCursor_0 = v33:getState().assets.currentCursor;
        if l_creator_0 ~= nil then
            if l_creator_0.Name ~= nil and l_creator_0.Name ~= "" and v35 == nil then
                v33:dispatch(v5(false));
                return;
            elseif v35 ~= nil and not v17.isCached(v33, v35, l_creator_0.Type) then
                v33:dispatch(v9(v27, v35, l_creator_0.Type));
            end;
        end;
        if v15.isNextPageAvailable(l_currentCursor_0) then
            local l_nextPageCursor_0 = l_currentCursor_0.nextPageCursor;
            local v39 = v30.sorts[v30.sortIndex];
            local v40 = nil;
            v40 = v39 and v39.name;
            local v41 = nil;
            local v42 = v10.getCategoryByName(v28);
            if not v42 then
                error(string.format("Could not find categoryData for %s", v28));
            end;
            if v42.ownershipType == v10.OwnershipType.MY or v42.ownershipType == v10.OwnershipType.RECENT then
                v41 = v14();
            elseif v42.ownershipType == v10.OwnershipType.GROUP then
                v41 = v18.getGroupIdForPageInfo(v30);
            end;
            local l_includeUnverifiedCreators_0 = v30.includeUnverifiedCreators;
            local v44 = {};
            if v36.categories then
                for _, v46 in ipairs(v36.categories) do
                    table.insert(v44, v46);
                end;
            end;
            if v36.genre then
                table.insert(v44, v36.genre);
            end;
            local v47 = nil;
            local v48 = nil;
            local v49 = nil;
            if v22() then
                v47 = {};
                local l_creatorTargetIds_0 = v30.creatorTargetIds;
                if l_creatorTargetIds_0 then
                    for v51, _ in l_creatorTargetIds_0 do
                        table.insert(v47, v51);
                    end;
                end;
                v48 = {};
                local l_groupTargetIds_0 = v30.groupTargetIds;
                if l_groupTargetIds_0 then
                    for v54, _ in l_groupTargetIds_0 do
                        table.insert(v48, v54);
                    end;
                end;
                v49 = if v30.uiSortIntent and v30.uiSortIntent ~= v2.None then v30.uiSortIntent else v20.UiSortIntent.Default;
            end;
            local v56 = nil;
            if v30.sortDirection and v30.sortDirection ~= v2.None then
                v56 = v30.sortDirection;
            end;
            local v57 = nil;
            if v26() and v36.audioType then
                v57 = {
                    v36.audioType
                };
            end;
            local l_tutorialLimits_0 = v33:getState().tutorialLimits;
            if l_tutorialLimits_0 and l_tutorialLimits_0.assetIds then
                v33:dispatch(v8(v27, l_Dash_0.map(l_tutorialLimits_0.assetIds, function(v59) --[[ Line: 142 ]]
                    return {
                        id = v59
                    };
                end), 1, v29, v30.targetPage, {}, v30, l_Dash_0.collect(l_tutorialLimits_0.assetIds, function(_, v61) --[[ Line: 150 ]]
                    return v61, {
                        searchResultSource = "Tutorial"
                    };
                end)));
                return;
            else
                return v27:getToolboxItems({
                    categoryName = v28, 
                    sortType = v40, 
                    keyword = v30.searchTerm or "", 
                    cursor = l_nextPageCursor_0, 
                    limit = v16.TOOLBOX_ITEM_SEARCH_LIMIT, 
                    ownerId = v41, 
                    creatorType = v30.creatorType, 
                    creatorTargetId = v35, 
                    creatorTargetIds = if v22() then v47 else nil, 
                    excludeGroupCreations = if v24() then v30.excludeGroupCreations else nil, 
                    groupTargetIds = if v22() then v48 else nil, 
                    minDuration = v29 and v29.minDuration or nil, 
                    maxDuration = v29 and v29.maxDuration or nil, 
                    artist = v36.artist, 
                    album = v36.album, 
                    audioTypes = if v26() then v57 else nil, 
                    tags = v44, 
                    uiSortIntent = if v22() then v49 else nil, 
                    sortDirection = v56, 
                    includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                    searchSource = v30.searchSource, 
                    queryParams = v30.queryParams, 
                    querySource = if v19() then v30.querySource or v12.QuerySource.OriginalUserQuery else nil, 
                    originalUserQuery = if v19() then v30.originalUserQuery or "" else nil, 
                    originalCorrection = if v19() then v30.originalCorrection or "" else nil, 
                    qualityFilterData = if v25() then v30.qualityFilterData else nil
                }):andThen(function(v62) --[[ Line: 190 ]]
                    -- upvalues: v18 (ref), v30 (ref), v33 (copy), v5 (ref), v15 (ref), v8 (ref), v27 (ref), v29 (ref), v19 (ref), v7 (ref), v6 (ref)
                    if v18.isPageInfoStale(v30, v33) then
                        return;
                    else
                        v33:dispatch(v5(false));
                        local l_responseBody_0 = v62.responseBody;
                        local v64 = {};
                        local l_data_0 = l_responseBody_0.data;
                        if l_data_0 then
                            for _, v67 in ipairs(l_data_0) do
                                v64[v67.id] = {
                                    searchResultSource = v67.searchResultSource
                                };
                            end;
                        end;
                        local v68 = v15.createCursor(l_responseBody_0);
                        if l_responseBody_0 and l_responseBody_0.totalResults > 0 then
                            v33:dispatch(v8(v27, l_responseBody_0.data, l_responseBody_0.totalResults, v29, v30.targetPage, v68, v30, v64));
                        end;
                        if v19() and l_responseBody_0 then
                            v33:dispatch(v7(l_responseBody_0.spellCheckerResult or {}));
                        end;
                        if v30.searchTerm and v30.searchTerm ~= "" and l_responseBody_0 and l_responseBody_0.filteredKeyword and #l_responseBody_0.filteredKeyword > 0 then
                            v33:dispatch(v6(l_responseBody_0.filteredKeyword));
                        end;
                        return;
                    end;
                end, function(v69) --[[ Line: 236 ]]
                    -- upvalues: v33 (copy), v5 (ref), v4 (ref)
                    v33:dispatch(v5(false));
                    v33:dispatch(v4(v69));
                end);
            end;
        else
            return;
        end;
    end;
end;