local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Packages.LuauPolyfill);
local v3 = require(l_script_FirstAncestor_0.Core.Util.getUserId);
local v4 = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
return function(v5, v6, v7, v8) --[[ Line: 25 ]] --[[ Name: fetchCategoryAssets ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = nil;
    return v5:getToolboxItems(v1.Dictionary.join({
        categoryName = v6, 
        sectionName = v7, 
        ownerId = v3()
    }, if v8 then {
        limit = v8.pageSize, 
        includeOnlyVerifiedCreators = not v8.includeUnverifiedCreators, 
        cursor = v8.nextPageCursor, 
        assetsInCameraVicinity = v8.assetsInCameraVicinity, 
        assetsInCameraViewport = v8.assetsInCameraViewport
    } else {})):andThen(function(v13) --[[ Line: 56 ]]
        -- upvalues: v12 (ref), v11 (copy), v9 (copy), v5 (copy)
        v12 = v13.responseBody.nextPageCursor;
        for _, v15 in v13.responseBody.data do
            if v15.id then
                v11[v15.id] = {
                    searchResultSource = v15.searchResultSource
                };
                table.insert(v9, v15.id);
            end;
        end;
        return v5:getItemDetailsAssetIds(v9);
    end):andThen(function(v16) --[[ Line: 71 ]]
        -- upvalues: v4 (ref), v11 (copy), v10 (copy), v9 (copy), v12 (ref)
        for _, v18 in v16.responseBody.data do
            local v19 = v4.fromItemDetailsRequest(v18);
            if v18.Asset and v18.Asset.id then
                v19 = v4.AddContextToItemDetails(v19, v11[v18.Asset.id]);
            end;
            if v19.Asset then
                v10[v19.Asset.Id] = v19;
            end;
        end;
        return {
            assetIds = v9, 
            assetMap = v10, 
            nextPageCursor = v12
        };
    end);
end;