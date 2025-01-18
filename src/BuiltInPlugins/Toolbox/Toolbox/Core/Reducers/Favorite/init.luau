local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local v3 = require(l_Packages_0.Cryo);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.GetFavoriteCounts);
local v6 = require(l_Actions_0.GetFavorited);
local v7 = require(l_Actions_0.CreateFavorite);
local v8 = require(l_Actions_0.DeleteFavorite);
return (v2.createReducer({
    assetIdToCountsMap = {}, 
    assetIdToFavoritedMap = {}
}, {
    [v5.name] = function(v9, v10) --[[ Line: 17 ]]
        -- upvalues: v3 (copy)
        local v11 = v3.Dictionary.join(v9.assetIdToCountsMap, {
            [v10.assetId] = v10.favoriteCounts
        });
        return v3.Dictionary.join(v9, {
            assetIdToCountsMap = v11
        });
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        local v14 = v3.Dictionary.join(v12.assetIdToFavoritedMap, {
            [v13.assetId] = v13.favorited
        });
        return v3.Dictionary.join(v12, {
            assetIdToFavoritedMap = v14
        });
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 37 ]]
        -- upvalues: v3 (copy)
        local l_assetId_0 = v16.assetId;
        local v18 = v3.Dictionary.join(v15.assetIdToCountsMap, {
            [v16.assetId] = (v15.assetIdToCountsMap[l_assetId_0] or 0) + 1
        });
        local v19 = v3.Dictionary.join(v15.assetIdToFavoritedMap, {
            [v16.assetId] = true
        });
        return v3.Dictionary.join(v15, {
            assetIdToCountsMap = v18, 
            assetIdToFavoritedMap = v19
        });
    end, 
    [v8.name] = function(v20, v21) --[[ Line: 54 ]]
        -- upvalues: v3 (copy)
        local l_assetId_1 = v21.assetId;
        local v23 = v3.Dictionary.join(v20.assetIdToCountsMap, {
            [v21.assetId] = (v20.assetIdToCountsMap[l_assetId_1] or 0) - 1
        });
        local v24 = v3.Dictionary.join(v20.assetIdToFavoritedMap, {
            [v21.assetId] = false
        });
        return v3.Dictionary.join(v20, {
            assetIdToCountsMap = v23, 
            assetIdToFavoritedMap = v24
        });
    end
}));