local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseThumbnailResponse);
local v6 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v8 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v2.RobloxAPI.Url;
local v10 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local v11 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v13 = v8(v5.validate);
local function v14(v15, v16) --[[ Line: 46 ]] --[[ Name: DiscoverGameIcons ]]
    -- upvalues: l_Url_0 (copy), v6 (copy), v10 (copy), v13 (copy), l_collectArray_0 (copy), v11 (copy), l_StartPageManager_0 (copy), v14 (copy)
    local v17 = l_Url_0.new().composeUrl(v6.EXPERIENCES_ICON_URL.Prefix, v6.EXPERIENCES_ICON_URL.Url(), v15);
    local v18 = v10:get(v17);
    v10:parseJson(v18):andThen(function(v19) --[[ Line: 51 ]]
        -- upvalues: v13 (ref), l_collectArray_0 (ref), v11 (ref), l_StartPageManager_0 (ref)
        local v20 = v13(v19);
        if not v20.data then
            return;
        else
            local v23 = l_collectArray_0(v20.data, function(_, v22) --[[ Line: 58 ]]
                -- upvalues: v11 (ref)
                if not v22.targetId or not v22.imageUrl then
                    return;
                else
                    return {
                        Id = v22.targetId, 
                        CDNUrl = v22.imageUrl, 
                        ImageUrl = v11.tempUrls[v22.imageUrl]
                    };
                end;
            end);
            v11:upsertItems(v23);
            for _, v25 in v20.data do
                if v25.imageUrl then
                    l_StartPageManager_0:generateTempUrlInContentProvider(v25.imageUrl);
                end;
            end;
            return;
        end;
    end):catch(function() --[[ Line: 76 ]]
        -- upvalues: v15 (copy), v14 (ref), v16 (copy), v11 (ref)
        warn("DiscoverGameIcons batch load failed, loading thumbnails individually");
        if v15.universeIds and #v15.universeIds > 1 then
            for _, v27 in v15.universeIds do
                local v28 = table.clone(v15);
                v28.universeIds = {
                    v27
                };
                v14(v28, v16);
            end;
            return;
        else
            v11:updateItemsInListByFilter(v16, function(v29) --[[ Line: 91 ]]
                if v29.CDNUrl then
                    return v29;
                else
                    return {
                        Id = v29.Id, 
                        NoLoadableImage = true
                    };
                end;
            end);
            return;
        end;
    end):catch(function(v30) --[[ Line: 100 ]]
        warn((("DiscoverGameIcons experienced an error: %*"):format(v30)));
    end);
end;
return v14;