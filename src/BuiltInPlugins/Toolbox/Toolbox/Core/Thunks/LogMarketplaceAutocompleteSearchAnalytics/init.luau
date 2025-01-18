local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Types.AnalyticsTypes);
local v4 = require(l_Util_0.PageInfoHelper);
return function(v5, v6, v7, v8, v9, v10, _) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v12) --[[ Line: 9 ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (ref), v5 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
        local l_pageInfo_0 = v12:getState().pageInfo;
        local v14 = v4.getCurrentTab(l_pageInfo_0);
        local v15 = v4.getSortTypeForPageInfo(l_pageInfo_0);
        local l_creator_0 = l_pageInfo_0.creator;
        local v17 = l_creator_0 and l_creator_0.Id or nil;
        local v18 = l_pageInfo_0.searchId or "";
        local v19 = {
            assetType = v6, 
            creatorID = v17, 
            searchId = v18, 
            sort = v15, 
            toolboxTab = v14
        };
        v2.marketplaceAutocompleteSearch(v5, v7, v8, v9, v10, v19);
    end;
end;