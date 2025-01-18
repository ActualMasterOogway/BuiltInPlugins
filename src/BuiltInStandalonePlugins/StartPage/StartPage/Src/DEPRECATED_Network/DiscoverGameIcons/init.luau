local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseThumbnailResponse);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v2.RobloxAPI.Url;
local v9 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local function v11(v12, v13) --[[ Line: 38 ]] --[[ Name: DiscoverGameIcons ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v9 (copy), v7 (copy), v4 (copy), l_StartPageManager_0 (copy), v11 (copy)
    local v14 = l_Url_0.new().composeUrl(v5.EXPERIENCES_ICON_URL.Prefix, v5.EXPERIENCES_ICON_URL.Url(), v13);
    local v15 = v9:get(v14);
    v9:parseJson(v15):andThen(v7(v4.validate)):andThen(function(v16) --[[ Line: 45 ]]
        if not v16.data then
            return {};
        else
            local v17 = {};
            for _, v19 in v16.data do
                if v19.targetId and v19.imageUrl then
                    v17[v19.targetId] = v19.imageUrl;
                end;
            end;
            return v17;
        end;
    end):andThen(function(v20) --[[ Line: 60 ]]
        -- upvalues: v12 (copy), l_StartPageManager_0 (ref)
        v12(function(v21) --[[ Line: 61 ]]
            -- upvalues: v20 (copy)
            for _, v23 in v21 do
                assert(not v23.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                if v23.Id and v20[v23.Id] then
                    v23.CDNUrl = v20[v23.Id];
                end;
            end;
            return v21;
        end);
        for _, v25 in v20 do
            l_StartPageManager_0:generateTempUrlInContentProvider(v25);
        end;
    end):catch(function() --[[ Line: 79 ]]
        -- upvalues: v13 (copy), v11 (ref), v12 (copy)
        if v13.universeIds and #v13.universeIds > 1 then
            for _, v27 in v13.universeIds do
                local v28 = table.clone(v13);
                v28.universeIds = {
                    v27
                };
                v11(function(v29) --[[ Line: 92 ]]
                    -- upvalues: v12 (ref), v27 (copy)
                    v12(function(v30) --[[ Line: 93 ]]
                        -- upvalues: v27 (ref), v29 (copy)
                        for _, v32 in v30 do
                            assert(not v32.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                            if v32.Id == v27 then
                                v29({
                                    v32
                                });
                            end;
                        end;
                    end);
                end, v28);
            end;
            return;
        else
            v12(function(v33) --[[ Line: 109 ]]
                for _, v35 in v33 do
                    assert(not v35.IsPlaceholder, "Data cannot be a placeholder here");
                    v35.NoLoadableImage = true;
                end;
                return v33;
            end);
            return;
        end;
    end);
end;
return v11;