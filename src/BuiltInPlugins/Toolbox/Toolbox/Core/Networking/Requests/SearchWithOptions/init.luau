local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Parent_0.Core.Types.Category);
local v4 = require(l_Parent_0.Core.Types.RequestReason);
local v5 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v6 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v7 = require(l_Parent_0.Core.Actions.ClearAssets);
local v8 = require(l_Parent_0.Core.Actions.SetLiveSearch);
local v9 = require(l_Parent_0.Core.Actions.SetLoading);
local v10 = require(l_Parent_0.Core.Actions.StopPreviewSound);
local v11 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v12 = require(l_Parent_0.Core.Util.CreatorInfoHelper);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableSortingWithCreatorForSearchWithOptions);
local _ = function(v17, v18, _) --[[ Line: 29 ]] --[[ Name: searchUsers ]]
    -- upvalues: v12 (copy)
    return v17:getUsers(v18, 3):andThen(function(v20) --[[ Line: 34 ]]
        -- upvalues: v18 (copy), v12 (ref)
        if #v20 > 0 then
            local v21 = 1;
            local v22 = string.lower(v18);
            for v23, v24 in ipairs(v20) do
                if string.lower(v24.Name) == v22 then
                    v21 = v23;
                    break;
                end;
            end;
            local v25 = v20[v21];
            return {
                Name = v25.Name, 
                Id = v25.UserId, 
                Type = v12.clientToBackend(Enum.CreatorType.User.Value)
            };
        else
            return {
                Name = v18, 
                Id = -1, 
                Type = v12.clientToBackend(Enum.CreatorType.User.Value)
            };
        end;
    end);
end;
return function(v27, v28, v29) --[[ Line: 61 ]]
    -- upvalues: v9 (copy), v7 (copy), v2 (copy), v10 (copy), v6 (copy), v15 (copy), v4 (copy), v14 (copy), v16 (copy), v11 (copy), v12 (copy), l_showRobloxCreatedAssets_0 (copy), v5 (copy), v3 (copy), v8 (copy)
    return function(v30) --[[ Line: 62 ]]
        -- upvalues: v9 (ref), v7 (ref), v29 (copy), v2 (ref), v10 (ref), v6 (ref), v27 (copy), v28 (copy), v15 (ref), v4 (ref), v14 (ref), v16 (ref), v11 (ref), v12 (ref), l_showRobloxCreatedAssets_0 (ref), v5 (ref), v3 (ref), v8 (ref)
        v30:dispatch(v9(true));
        v30:dispatch(v7());
        local v31 = v29.AudioSearch or v2.None;
        local v32 = v29.AdditionalAudioSearch or v2.None;
        local l_includeUnverifiedCreators_0 = v29.includeUnverifiedCreators;
        local l_sound_0 = v30:getState().sound;
        if l_sound_0 ~= nil and l_sound_0.isPlaying then
            v30:dispatch(v10());
        end;
        if v29.Creator and v29.Creator ~= "" then
            local function v36(v35) --[[ Line: 76 ]]
                -- upvalues: v30 (copy), v9 (ref), v6 (ref), v27 (ref), v28 (ref), v31 (copy), v32 (copy), l_includeUnverifiedCreators_0 (copy), v15 (ref), v29 (ref), v4 (ref), v14 (ref), v16 (ref), v11 (ref)
                v30:dispatch(v9(false));
                v30:dispatch(v6(v27, v28, {
                    audioSearchInfo = v31, 
                    additionalAudioSearchInfo = v32, 
                    includeUnverifiedCreators = l_includeUnverifiedCreators_0, 
                    targetPage = 1, 
                    currentPage = 0, 
                    creator = v35, 
                    excludeGroupCreations = if v15() then v29.excludeGroupCreations else nil, 
                    searchTerm = v29.searchTerm, 
                    sortIndex = v29.SortIndex or 1, 
                    requestReason = v4.StartSearch, 
                    qualityFilterData = v29.qualityFilterData, 
                    uiSortIntent = if v14() and v16() then v29.uiSortIntent else nil, 
                    sortDirection = if v16() then v29.sortDirection else nil
                }));
                v11.onCreatorSearched(v35.Name, v35.Id);
            end;
            if type(v29.Creator) == "string" then
                local l_v27_0 = v27;
                local l_Creator_0 = v29.Creator;
                l_v27_0:getUsers(l_Creator_0, 3):andThen(function(v39) --[[ Line: 34 ]]
                    -- upvalues: l_Creator_0 (copy), v12 (ref)
                    if #v39 > 0 then
                        local v40 = 1;
                        local v41 = string.lower(l_Creator_0);
                        for v42, v43 in ipairs(v39) do
                            if string.lower(v43.Name) == v41 then
                                v40 = v42;
                                break;
                            end;
                        end;
                        local v44 = v39[v40];
                        return {
                            Name = v44.Name, 
                            Id = v44.UserId, 
                            Type = v12.clientToBackend(Enum.CreatorType.User.Value)
                        };
                    else
                        return {
                            Name = l_Creator_0, 
                            Id = -1, 
                            Type = v12.clientToBackend(Enum.CreatorType.User.Value)
                        };
                    end;
                end):andThen(v36, function(_) --[[ Line: 106 ]]

                end);
                return;
            elseif type(v29.Creator) == "table" then
                v36({
                    Name = v29.Creator.Name, 
                    Id = v29.Creator.Id, 
                    Type = v12.clientToBackend(Enum.CreatorType.User.Value)
                });
                return;
            end;
        else
            local l_None_0 = v2.None;
            local v47 = nil;
            local v48 = nil;
            if l_showRobloxCreatedAssets_0() then
                local v49 = v5.getCurrentTab(v30:getState().pageInfo);
                if v49 == v3.MARKETPLACE_KEY then
                    l_None_0 = v3.CREATOR_ROBLOX;
                elseif v14() and v49 == v3.INVENTORY_KEY then
                    l_None_0 = v3.CREATOR_ROBLOX;
                    v47 = v29.creatorTargetIds;
                    v48 = v29.groupTargetIds;
                end;
            elseif v14() then
                v47 = v29.creatorTargetIds;
                v48 = v29.groupTargetIds;
            end;
            if v14() then
                if v47 then
                    for _, v51 in v47 do
                        local v52 = if v51.Type then v51.Type.Name else nil;
                        v11.onCreatorSearched(v51.Name, v51.Id, v52);
                    end;
                end;
                if v48 then
                    for _, v54 in v48 do
                        local v55 = if v54.Type then v54.Type.Name else nil;
                        v11.onCreatorSearched(v54.Name, v54.Id, v55);
                    end;
                end;
            end;
            v30:dispatch(v9(false));
            v30:dispatch(v8("", {}));
            v30:dispatch(v6(v27, v28, {
                audioSearchInfo = v31, 
                additionalAudioSearchInfo = v32, 
                includeUnverifiedCreators = l_includeUnverifiedCreators_0, 
                targetPage = 1, 
                currentPage = 0, 
                sortIndex = v29.SortIndex or 1, 
                creator = l_None_0, 
                creatorTargetIds = if v14() then v47 else nil, 
                excludeGroupCreations = if v15() then v29.excludeGroupCreations else nil, 
                groupTargetIds = if v14() then v48 else nil, 
                requestReason = v4.StartSearch, 
                searchTerm = v29.searchTerm, 
                uiSortIntent = if v14() then v29.uiSortIntent else nil, 
                sortDirection = v29.sortDirection, 
                qualityFilterData = v29.qualityFilterData
            }));
        end;
    end;
end;