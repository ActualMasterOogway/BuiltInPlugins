local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v3 = require(l_Util_0.Constants);
local v4 = require(l_Parent_0.Core.Types.Sort);
local v5 = require(l_Parent_0.Core.Types.RequestReason);
local v6 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v7 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v8 = require(l_Parent_0.Core.Actions.StopAllSounds);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
return function(v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 16 ]]
    -- upvalues: v8 (copy), v4 (copy), v7 (copy), v1 (copy), v5 (copy), v3 (copy), v9 (copy), v6 (copy)
    return function(v18) --[[ Line: 26 ]]
        -- upvalues: v8 (ref), v4 (ref), v12 (copy), v13 (copy), v7 (ref), v10 (copy), v11 (copy), v1 (ref), v5 (ref), v14 (copy), v3 (ref), v15 (copy), v9 (ref), v6 (ref), v16 (copy), v17 (copy)
        v18:dispatch(v8());
        local l_pageInfo_0 = v18:getState().pageInfo;
        local v20 = v4.canSort(v12, v13 or l_pageInfo_0.categoryName) and l_pageInfo_0.sortIndex or 1;
        v18:dispatch(v7(v10, v11, {
            searchTerm = v12, 
            sortIndex = v20, 
            sortDirection = v1.None, 
            uiSortIntent = v1.None, 
            categoryName = v13, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v5.StartSearch, 
            isTopKeyword = v14 or false, 
            searchSource = if v12 then v3.SEARCH_SOURCE.KEYWORD else nil, 
            querySource = if v15 and v9() then v15 else v6.QuerySource.OriginalUserQuery, 
            originalUserQuery = if v16 and v9() then v16 else nil, 
            originalCorrection = if v17 and v9() then v17 else nil, 
            queryParams = v1.None
        }));
    end;
end;