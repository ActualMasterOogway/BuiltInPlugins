local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Parent_0.Core.Types.RequestReason);
local v4 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v5 = require(l_Parent_0.Core.Util.Constants);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v7 = require(l_Parent_0.Core.Networking.Requests.GetToolboxManageableGroupsRequest);
local v8 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getIsUseWebView);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxExcludeGroupCreations);
local _ = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableWebView);
local v15 = require(l_Parent_0.Core.Types.Category);
local v16 = require(l_Parent_0.Core.Actions.StopAllSounds);
return function(v17, v18, _, v20, v21, v22) --[[ Line: 29 ]]
    -- upvalues: v15 (copy), v10 (copy), v2 (copy), l_showRobloxCreatedAssets_0 (copy), v13 (copy), v12 (copy), v9 (copy), v4 (copy), v5 (copy), v8 (copy), v3 (copy), v11 (copy), v7 (copy), v16 (copy)
    return function(v23) --[[ Line: 30 ]]
        -- upvalues: v15 (ref), v18 (copy), v10 (ref), v22 (copy), v2 (ref), l_showRobloxCreatedAssets_0 (ref), v21 (copy), v13 (ref), v12 (ref), v9 (ref), v4 (ref), v5 (ref), v8 (ref), v17 (copy), v20 (copy), v3 (ref), v11 (ref), v7 (ref), v16 (ref)
        local v24 = v15.getCategories(v18, v23:getState().roles, if v10() then v22 else nil);
        local l_None_0 = v2.None;
        if l_showRobloxCreatedAssets_0() then
            l_None_0 = v21.creator or v2.None;
        end;
        local v26 = nil;
        v26 = v13() and true or not v12() and nil;
        if v9(v22) then
            local l_categoryName_0 = v21.categoryName;
            if v15.getTabKeyForCategoryName(l_categoryName_0) == v15.MARKETPLACE_KEY then
                v4.setEventTarget(v5.ANALYTICS_TARGET.Webview);
            else
                v4.setEventTarget(v5.ANALYTICS_TARGET.Studio);
            end;
        end;
        v23:dispatch(v8(v17, v20, {
            audioSearchInfo = v2.None, 
            additionalAudioSearchInfo = v2.None, 
            creator = l_None_0, 
            currentTab = v18, 
            categories = v24, 
            requestReason = v3.ChangeTabs, 
            categoryName = v21.categoryName, 
            excludeGroupCreations = v26, 
            searchTerm = v21.searchTerm, 
            sortIndex = v21.sortIndex, 
            groupIndex = v21.groupIndex, 
            targetPage = 1, 
            currentPage = 0, 
            selectedBackgroundIndex = v21.selectedBackgroundIndex, 
            includeUnverifiedCreators = not v11() and nil, 
            creatorTargetIds = if v11() then v2.None else nil, 
            groupTargetIds = if v11() then v2.None else nil, 
            uiSortIntent = if v11() then v2.None else nil, 
            queryParams = v2.None, 
            sortDirection = v2.None
        }));
        local v28 = true;
        if v18 ~= v15.INVENTORY_KEY then
            v28 = v18 == v15.CREATIONS_KEY;
        end;
        if v28 then
            v23:dispatch(v7(v17));
        end;
        v23:dispatch(v16());
    end;
end;