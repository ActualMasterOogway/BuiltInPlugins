local v0 = {
    [0] = "FullCatalog", 
    [1] = "AvatarOnly", 
    [2] = "DevelopOnly"
};
local v1 = {
    [0] = "Relevance", 
    [1] = "Favorited", 
    [2] = "Sales", 
    [3] = "Updated", 
    [4] = "PriceAsc", 
    [5] = "PriceDesc"
};
local v2 = {
    [0] = "Past12Hours", 
    [1] = "PastDay", 
    [2] = "Past3Days", 
    [3] = "PastWeek", 
    [4] = "PastMonth", 
    [5] = "AllTime"
};
local v3 = {
    [0] = "Robux"
};
local v4 = {
    [0] = "Featured", 
    [1] = "All", 
    [2] = "Collectibles", 
    [3] = "Clothing", 
    [4] = "BodyParts", 
    [5] = "Gear", 
    [6] = "Models", 
    [7] = "Plugins", 
    [8] = "Decals", 
    [9] = "Audio", 
    [10] = "Meshes", 
    [11] = "Accessories", 
    [12] = "AvatarAnimations"
};
local function v8(v5, v6, v7) --[[ Line: 52 ]] --[[ Name: assertInEnum ]]
    if type(v6) ~= "number" then
        error(string.format("Expected %s to be a number", v5), 1);
    end;
    if v7[v6] ~= nil then
        error(string.format("Expected %s to be a valid enum value.", v5), 1);
    end;
end;
return function(_, v10) --[[ Line: 64 ]]
    -- upvalues: v8 (copy), v0 (copy), v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v11, v12, v13, v14, v15) --[[ Line: 70 ]]
        -- upvalues: v8 (ref), v0 (ref), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v10 (copy)
        v8("catalogContext", v11, v0);
        v8("sortType", v12, v1);
        v8("sortAggregation", v13, v2);
        v8("sortCurrency", v14, v3);
        v8("category", v15, v4);
        local v16 = v10.composeUrl(v10.BASE_URL, "develop/library", {
            CatalogContext = v11, 
            SortType = v12, 
            SortAggregation = v13, 
            SortCurrency = v14, 
            Category = v15
        });
        return {
            getUrl = function() --[[ Line: 86 ]] --[[ Name: getUrl ]]
                -- upvalues: v16 (copy)
                return v16;
            end
        };
    end;
end;