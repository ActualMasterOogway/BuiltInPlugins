local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
local v6 = {
    SORT_OPTIONS = {
        {
            name = "Relevance", 
            sort = "Relevance"
        }, 
        {
            name = "MostTaken", 
            sort = "MostTaken"
        }, 
        {
            name = "Favorites", 
            sort = "Favorites"
        }, 
        {
            name = "Updated", 
            sort = "Updated"
        }, 
        {
            name = "Ratings", 
            sort = "Ratings"
        }
    }, 
    canSort = function(v2, v3) --[[ Line: 18 ]] --[[ Name: canSort ]]
        -- upvalues: v1 (copy)
        local v4 = false;
        if v2 ~= "" then
            v4 = v1.categoryIsFreeAsset(v3);
        end;
        return v4;
    end, 
    getDefaultSortForCategory = function(v5) --[[ Line: 22 ]] --[[ Name: getDefaultSortForCategory ]]
        -- upvalues: v1 (copy)
        if v1.categoryIsPackage(v5) then
            return 4;
        else
            return 1;
        end;
    end
};
v6.getDefaultSortNameForCategory = function(v7) --[[ Line: 29 ]] --[[ Name: getDefaultSortNameForCategory ]]
    -- upvalues: v6 (copy)
    return v6.SORT_OPTIONS[v6.getDefaultSortForCategory(v7)];
end;
v6.getDefaultSortForGroups = function(v8) --[[ Line: 37 ]] --[[ Name: getDefaultSortForGroups ]]
    -- upvalues: v6 (copy)
    return v6.getDefaultSortForCategory(v8.categoryName);
end;
return v6;