local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Rodux);
local v5 = require(l_Parent_0.Core.Util.DebugFlags);
local v6 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v7 = require(l_Parent_0.Core.Types.Category);
local v8 = require(l_Parent_0.Core.Types.Sort);
local v9 = require(l_Parent_0.Core.Types.RequestReason);
local v10 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v11 = require(l_Parent_0.Core.Types.LayoutMode);
local _ = require(l_Parent_0.Core.Types.BackendTypes);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v14 = require(l_Actions_0.SetToolboxManageableGroups);
local v15 = require(l_Actions_0.UpdatePageInfo);
local v16 = require(l_Actions_0.UpdateSearchTerm);
local v17 = require(l_Actions_0.SetCurrentPage);
local v18 = require(l_Actions_0.SetLayoutMode);
local v19 = require(l_Actions_0.UpdateLastLoggedSearchId);
local v20 = require(l_Actions_0.SetAutocorrect);
local l_disableMarketplaceAndRecents_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableMarketplaceAndRecents;
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local _ = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v25 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixDefaultTabForCreations);
local v26 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxExcludeGroupCreations);
local l_SORT_OPTIONS_0 = v8.SORT_OPTIONS;
local v28 = nil;
v28 = if v25() then v7.DEFAULT_TAB else if l_disableMarketplaceAndRecents_0() then v7.INVENTORY else v7.MARKETPLACE;
local function v31(v29, v30) --[[ Line: 51 ]] --[[ Name: warnIfUpdatePageInfoChangesInvalid ]]
    if v30.sorts then
        warn("Lua Toolbox: Cannot change sorts array through UpdatePageInfo");
    end;
    if v30.groups then
        warn("Lua Toolbox: Cannot change groups array through UpdatePageInfo");
    end;
    if v30.sortIndex and (v30.sortIndex < 1 or v30.sortIndex > #v29.sorts) then
        warn("Lua Toolbox: sortIndex out of range in UpdatePageInfo");
    end;
    if v30.groupIndex ~= nil and v30.groupIndex > 0 and (v30.groupIndex < (#v29.groups > 0 and 1 or 0) or v30.groupIndex > #v29.groups) then
        warn("Lua Toolbox: groupIndex out of range in UpdatePageInfo");
    end;
    if v30.sortIndex and not v29.sorts[v30.sortIndex] then
        warn("Lua Toolbox: Changing sortIndex but sortType is not valid in UpdatePageInfo");
    end;
    if v30.groupIndex and v30.groupIndex > 0 then
        if #v29.groups == 0 then
            if v30.groupIndex ~= 0 then
                warn("Lua Toolbox: Changing groupIndex but groupId is not valid in UpdatePageInfo");
                return;
            end;
        elseif not v29.groups[v30.groupIndex] then
            warn("Lua Toolbox: Changing groupIndex but groupId is not valid in UpdatePageInfo");
        end;
    end;
end;
local v32 = nil;
v32 = v26() and true or not v24() and nil;
return v4.createReducer({
    audioSearchInfo = nil, 
    additionalAudioSearchInfo = nil, 
    categories = v28, 
    categoryName = v7.DEFAULT.name, 
    searchTerm = "", 
    sorts = l_SORT_OPTIONS_0, 
    sortIndex = 1, 
    groups = {}, 
    groupIndex = 0, 
    targetPage = 1, 
    currentPage = 0, 
    selectedBackgroundIndex = 1, 
    hoveredBackgroundIndex = 0, 
    requestReason = v9.InitLoad, 
    lastLoggedSearchId = "", 
    correctionState = v10.AutocorrectResponseState.NoCorrection, 
    correctedQuery = "", 
    userQuery = "", 
    creatorTargetIds = nil, 
    excludeGroupCreations = v32, 
    groupTargetIds = nil, 
    includeUnverifiedCreators = nil, 
    uiSortIntent = nil, 
    sortDirection = nil, 
    layoutMode = if v22() then v11.Grid else nil
}, {
    [v16.name] = function(v33, v34) --[[ Line: 169 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v33, {
            searchTerm = v34.searchTerm
        });
    end, 
    [v15.name] = function(v35, v36) --[[ Line: 175 ]]
        -- upvalues: v5 (copy), v31 (copy), v3 (copy), v9 (copy), l_HttpService_0 (copy)
        if not v36.changes then
            if v5.shouldDebugWarnings() then
                warn("Toolbox UpdatePageInfo action.changes = nil");
            end;
            return v35;
        else
            if v5.shouldDebugWarnings() then
                v31(v35, v36.changes);
            end;
            local v37 = v3.Dictionary.join(v35, v36.changes);
            if not v9.IsUpdate(v37.requestReason) then
                v37.searchId = l_HttpService_0:GenerateGUID(false);
            end;
            if v36.settings then
                v36.settings:updateFromPageInfo(v37);
            end;
            return v37;
        end;
    end, 
    [v17.name] = function(v38, v39) --[[ Line: 203 ]]
        -- upvalues: v5 (copy), v3 (copy)
        if not v39.currentPage and v5.shouldDebugWarnings() then
            warn("Toolbox SetCurrentPage action.currentPage = nil");
        end;
        return v3.Dictionary.join(v38, {
            currentPage = v39.currentPage
        });
    end, 
    [v18.name] = v22() and function(v40, v41) --[[ Line: 215 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v40, {
            layoutMode = v41.layoutMode
        });
    end or nil, 
    [v14.name] = function(v42, v43) --[[ Line: 222 ]]
        -- upvalues: v5 (copy), v3 (copy), v6 (copy)
        if not v43.groups then
            if v5.shouldDebugWarnings() then
                warn("Toolbox SetToolboxManageableGroups action.groups = nil");
            end;
            return v42;
        else
            local v44 = {};
            for v45, v46 in ipairs(v43.groups) do
                v44[v45] = {
                    id = v46.id, 
                    name = v46.name
                };
            end;
            local v47 = v3.Dictionary.join(v42, {
                groups = v44
            });
            if #v44 > 0 then
                local v48 = 1;
                local v49 = v6.getGroupIdForPageInfo(v42);
                for v50, v51 in ipairs(v44) do
                    if v51.id == v49 then
                        v48 = v50;
                        break;
                    end;
                end;
                v47.groupIndex = v48;
                return v47;
            else
                v47.groupIndex = 0;
                if v47.categoryName == "" then
                    v47.categoryName = v47.categories[1].name;
                end;
                return v47;
            end;
        end;
    end, 
    [v19.name] = function(v52, v53) --[[ Line: 264 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v52, {
            lastLoggedSearchId = v53.searchId
        });
    end, 
    [v20.name] = function(v54, v55) --[[ Line: 270 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v54, {
            correctionState = v55.correctionState, 
            correctedQuery = v55.correctedQuery, 
            userQuery = v55.userQuery
        });
    end
});