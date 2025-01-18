local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_deepEqual_0 = require(l_Packages_0.Framework).Util.deepEqual;
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local v4 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v5 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Util.Constants);
local v10 = {
    getCurrentTab = function(v7) --[[ Line: 13 ]] --[[ Name: getCurrentTab ]]
        -- upvalues: v5 (copy)
        return (v5.getTabKeyForCategoryName(v7.categoryName));
    end, 
    getCategory = function(v8) --[[ Line: 17 ]] --[[ Name: getCategory ]]
        -- upvalues: v5 (copy), v3 (copy)
        local v9 = v5.getCategoryByName(v8);
        if not v9 or not v9.category then
            if v3.shouldDebugWarnings() then
                warn(("Lua toolbox: No category for category name %s"):format((tostring(v8))));
            end;
            return "";
        else
            return v9.category;
        end;
    end
};
v10.getCategoryForPageInfo = function(v11) --[[ Line: 30 ]] --[[ Name: getCategoryForPageInfo ]]
    -- upvalues: v10 (copy)
    return v10.getCategory(v11.categoryName);
end;
v10.getSortType = function(v12, v13) --[[ Line: 34 ]] --[[ Name: getSortType ]]
    -- upvalues: v3 (copy)
    if not v12 or not v13 then
        return nil;
    else
        local v14 = v12[v13];
        if not v14 or not v14.sort then
            if v3.shouldDebugWarnings() then
                warn(("Lua Toolbox: no sort for sort index %s"):format((tostring(v13))));
            end;
            return "";
        else
            return v14.sort;
        end;
    end;
end;
v10.getSortTypeForPageInfo = function(v15) --[[ Line: 50 ]] --[[ Name: getSortTypeForPageInfo ]]
    -- upvalues: v10 (copy)
    return v10.getSortType(v15.sorts, v15.sortIndex);
end;
v10.getGroupId = function(v16, v17) --[[ Line: 54 ]] --[[ Name: getGroupId ]]
    -- upvalues: v3 (copy)
    if v17 == 0 then
        return 0;
    elseif v17 < 1 or #v16 < v17 or not v16[v17].id then
        if v3.shouldDebugWarnings() then
            warn(("Lua Toolbox: no group for group index %s"):format((tostring(v17))));
        end;
        return 0;
    else
        return v16[v17].id;
    end;
end;
v10.getGroupIdForPageInfo = function(v18) --[[ Line: 69 ]] --[[ Name: getGroupIdForPageInfo ]]
    -- upvalues: v10 (copy)
    return v10.getGroupId(v18.groups, v18.groupIndex);
end;
v10.getEngineAssetTypeForPageInfoCategory = function(v19) --[[ Line: 73 ]] --[[ Name: getEngineAssetTypeForPageInfoCategory ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v20 = v5.getCategoryByName(v19.categoryName);
    if not v20 or not v20.assetType then
        if v3.shouldDebugWarnings() then
            warn(("Lua toolbox: No assetType for category name %s"):format((tostring(v19.categoryName))));
        end;
        return nil;
    else
        return v5.getEngineAssetType(v20.assetType);
    end;
end;
v10.getBackendNameForPageInfoCategory = function(v21) --[[ Line: 86 ]] --[[ Name: getBackendNameForPageInfoCategory ]]
    -- upvalues: v10 (copy)
    local v22 = v10.getEngineAssetTypeForPageInfoCategory(v21);
    return v22 and v22.Name or nil;
end;
v10.isDeveloperCategory = function(v23) --[[ Line: 91 ]] --[[ Name: isDeveloperCategory ]]
    -- upvalues: v10 (copy), v4 (copy)
    local v24 = v10.getCategoryForPageInfo(v23);
    return v4.developCategoryType[v24];
end;
v10.isPackagesCategory = function(v25) --[[ Line: 96 ]] --[[ Name: isPackagesCategory ]]
    -- upvalues: v10 (copy), v4 (copy)
    local v26 = v10.getCategoryForPageInfo(v25);
    return v4.packagesCategoryType[v26];
end;
v10.getRequestInfo = function(v27) --[[ Line: 101 ]] --[[ Name: getRequestInfo ]]
    -- upvalues: v10 (copy), v5 (copy)
    local v28 = v10.getCategoryForPageInfo(v27) or "";
    local v29 = v27.searchTerm or "";
    local v30 = v27.targetPage or 1;
    local v31 = v10.getSortTypeForPageInfo(v27) or "";
    local v32 = v5.categoryIsGroupAsset(v27.categoryName) and v10.getGroupIdForPageInfo(v27) or 0;
    local v33 = v27.creator and v27.creator.Id or "";
    local v34 = v27.creator and v27.creator.Type or 1;
    return {
        category = v28, 
        creatorId = v33, 
        creatorType = v34, 
        groupId = v32, 
        searchTerm = v29, 
        sortType = v31, 
        targetPage = v30
    };
end;
v10.isPageInfoStale = function(v35, v36) --[[ Line: 127 ]] --[[ Name: isPageInfoStale ]]
    -- upvalues: v10 (copy), l_deepEqual_0 (copy)
    local v37 = v10.getRequestInfo(v35);
    local v38 = v10.getRequestInfo(v36:getState().pageInfo);
    return not l_deepEqual_0(v37, v38);
end;
return v10;