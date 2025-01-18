local l_Parent_0 = script.Parent.Parent.Parent;
local l_Url_0 = require(l_Parent_0.Framework).Url;
local l_ASSET_GAME_URL_0 = l_Url_0.new().ASSET_GAME_URL;
constructAssetGameAssetIdUrl = function(v3, v4, v5, v6) --[[ Line: 10 ]] --[[ Name: constructAssetGameAssetIdUrl ]]
    -- upvalues: l_Url_0 (copy), l_ASSET_GAME_URL_0 (copy)
    return l_Url_0.composeUrl(l_ASSET_GAME_URL_0, "asset/", {
        id = v3, 
        assetName = v4
    }) .. l_Url_0.makeQueryString({
        assetTypeId = v5.Value, 
        isPackage = v6
    }, "#");
end;
return constructAssetGameAssetIdUrl;