local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Util_0.PageInfoHelper);
local v6 = require(l_Util_0.AssetQualityUtil);
local v7 = require(l_Parent_0.Core.Actions.UpdateLastLoggedSearchId);
local v8 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v9 = require(l_Parent_0.Core.Types.Category);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v12 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local _ = function(v13) --[[ Line: 20 ]] --[[ Name: dictionaryToCSV ]]
    local v14 = {};
    for v15, _ in v13 do
        table.insert(v14, v15);
    end;
    return table.concat(v14, ",");
end;
return function(v18, v19, v20, v21, v22) --[[ Line: 28 ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy), v11 (copy), v12 (copy), v6 (copy), v10 (copy), v8 (copy), v2 (copy), v7 (copy)
    return function(v23) --[[ Line: 35 ]]
        -- upvalues: v5 (ref), v9 (ref), v4 (ref), v11 (ref), v12 (ref), v6 (ref), v10 (ref), v21 (copy), v22 (copy), v20 (copy), v8 (ref), v2 (ref), v18 (copy), v19 (copy), v7 (ref)
        local l_pageInfo_0 = v23:getState().pageInfo;
        local v25 = v5.getCurrentTab(l_pageInfo_0);
        local v26 = v5.getSortTypeForPageInfo(l_pageInfo_0);
        local l_creator_0 = l_pageInfo_0.creator;
        local v28 = l_creator_0 and l_creator_0.Id or nil;
        local v29 = l_pageInfo_0.searchId or "";
        local l_categoryName_0 = l_pageInfo_0.categoryName;
        local l_includeUnverifiedCreators_0 = l_pageInfo_0.includeUnverifiedCreators;
        local v32 = v9.getEngineAssetType(v9.getCategoryByName(l_categoryName_0).assetType);
        if v32 == Enum.AssetType.Decal then
            v32 = Enum.AssetType.Image;
        end;
        local v33 = string.lower(v32.Name);
        local l_lastLoggedSearchId_0 = l_pageInfo_0.lastLoggedSearchId;
        if l_lastLoggedSearchId_0 == v29 then
            if v4.shouldDebugWarnings() then
                warn("SearchId was already logged for ", l_lastLoggedSearchId_0);
            end;
            return;
        else
            local v35;
            if v11() and l_pageInfo_0.creatorTargetIds then
                local l_creatorTargetIds_0 = l_pageInfo_0.creatorTargetIds;
                local v37 = {};
                for v38, _ in l_creatorTargetIds_0 do
                    table.insert(v37, v38);
                end;
                v35 = table.concat(v37, ",");
            else
                v35 = nil;
            end;
            local v40;
            if v11() and l_pageInfo_0.groupTargetIds then
                local l_groupTargetIds_0 = l_pageInfo_0.groupTargetIds;
                local v42 = {};
                for v43, _ in l_groupTargetIds_0 do
                    table.insert(v42, v43);
                end;
                v40 = table.concat(v42, ",");
            else
                v40 = nil;
            end;
            local v45 = nil;
            if v12() and v9.categoryIsModel(l_categoryName_0) then
                v45 = v6.convertQualityFilterDataToTagsCSV(l_pageInfo_0.qualityFilterData);
            end;
            local v46 = {
                assetType = v33, 
                categoryName = l_categoryName_0, 
                creatorID = if v11() then nil else v28, 
                creatorIDs = if v11() then v35 or v28 else nil, 
                excludeGroupCreations = if v11() then l_pageInfo_0.excludeGroupCreations else nil, 
                groupIDs = if v11() then v40 else nil, 
                originalUserQuery = if v10() then v21 or "" else nil, 
                originalCorrection = if v10() then v22 or "" else nil, 
                previousSearchId = if v10() then l_lastLoggedSearchId_0 else nil, 
                querySource = if v10() then v20 or v8.QuerySource.OriginalUserQuery else nil, 
                searchId = v29, 
                sort = v26, 
                toolboxTab = v25, 
                includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                qualityFilterTags = v45
            };
            v2.marketplaceSearch(v18, v19 or false, v46);
            v23:dispatch(v7(v29));
            return;
        end;
    end;
end;