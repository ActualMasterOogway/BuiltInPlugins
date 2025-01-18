local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = require(l_Parent_0.Src.Types.Category);
local v6 = {
    getCategory = function(v3, v4) --[[ Line: 8 ]] --[[ Name: getCategory ]]
        -- upvalues: v1 (copy)
        local v5 = v3[v4];
        if not v5 or not v5.category then
            if v1.shouldDebugWarnings() then
                warn(("Lua toolbox: No category for category index %s"):format((tostring(v4))));
            end;
            return "";
        else
            return v5.category;
        end;
    end
};
v6.getCategoryForPageInfo = function(v7) --[[ Line: 21 ]] --[[ Name: getCategoryForPageInfo ]]
    -- upvalues: v6 (copy)
    return v6.getCategory(v7.categories, v7.categoryIndex);
end;
v6.getSortType = function(v8, v9) --[[ Line: 25 ]] --[[ Name: getSortType ]]
    -- upvalues: v1 (copy)
    local v10 = v8[v9];
    if not v10 or not v10.sort then
        if v1.shouldDebugWarnings() then
            warn(("Lua Toolbox: no sort for sort index %s"):format((tostring(v9))));
        end;
        return "";
    else
        return v10.sort;
    end;
end;
v6.getSortTypeForPageInfo = function(v11) --[[ Line: 38 ]] --[[ Name: getSortTypeForPageInfo ]]
    -- upvalues: v6 (copy)
    return v6.getSortType(v11.sorts, v11.sortIndex);
end;
v6.getGroupId = function(v12, v13) --[[ Line: 42 ]] --[[ Name: getGroupId ]]
    -- upvalues: v1 (copy)
    if v13 == 0 then
        return 0;
    elseif v13 < 1 or #v12 < v13 or not v12[v13].id then
        if v1.shouldDebugWarnings() then
            warn(("Lua Toolbox: no group for group index %s"):format((tostring(v13))));
        end;
        return 0;
    else
        return v12[v13].id;
    end;
end;
v6.getGroupIdForPageInfo = function(v14) --[[ Line: 57 ]] --[[ Name: getGroupIdForPageInfo ]]
    -- upvalues: v6 (copy)
    return v6.getGroupId(v14.groups, v14.groupIndex);
end;
v6.getEngineAssetTypeForPageInfoCategory = function(v15) --[[ Line: 61 ]] --[[ Name: getEngineAssetTypeForPageInfoCategory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v16 = v15.categories[v15.categoryIndex];
    if not v16 or not v16.assetType then
        if v1.shouldDebugWarnings() then
            warn(("Lua toolbox: No assetType for category index %s"):format((tostring(v15.categoryIndex))));
        end;
        return nil;
    else
        return v2.getEngineAssetType(v16.assetType);
    end;
end;
return v6;