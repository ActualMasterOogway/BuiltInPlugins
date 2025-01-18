local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
local v2 = require(l_Parent_0.Core.Types.Sort);
local v3 = require(l_Parent_0.Core.Types.RequestReason);
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Cryo);
local v6 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v7 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v8 = require(l_Parent_0.Core.Actions.StopAllSounds);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagResetSortingOnCategoryChange);
return function(v11, v12, v13) --[[ Line: 17 ]]
    -- upvalues: v8 (copy), v2 (copy), l_showRobloxCreatedAssets_0 (copy), v6 (copy), v1 (copy), v5 (copy), v3 (copy), v10 (copy), v7 (copy)
    return function(v14) --[[ Line: 18 ]]
        -- upvalues: v8 (ref), v2 (ref), v13 (copy), l_showRobloxCreatedAssets_0 (ref), v6 (ref), v1 (ref), v5 (ref), v3 (ref), v10 (ref), v7 (ref), v11 (copy), v12 (copy)
        v14:dispatch(v8());
        local v15 = v2.getDefaultSortForCategory(v13);
        local v16 = nil;
        if l_showRobloxCreatedAssets_0() then
            v16 = if v6.getCurrentTab(v14:getState().pageInfo) == v1.MARKETPLACE_KEY and v1.categoryIsVideo(v13) then v1.CREATOR_ROBLOX_DEVELOP_API else v1.CREATOR_ROBLOX;
        end;
        local v17 = {
            audioSearchInfo = v5.None, 
            additionalAudioSearchInfo = v5.None, 
            categoryName = v13, 
            creator = v16, 
            searchTerm = "", 
            sortIndex = v15, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v3.ChangeCategory, 
            queryParams = v5.None
        };
        if v10() then
            v17.uiSortIntent = v5.None;
            v17.sortDirection = v5.None;
        end;
        v14:dispatch(v7(v11, v12, v17));
    end;
end;