local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Models.ApiArrayResponseThumbnailResponse);
local v4 = require(l_script_FirstAncestor_0.Src.Models.MultiGetUniversesActiveSessionMembersResponse);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v8 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v5.RobloxAPI.Url;
local v10 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v12 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_collect_0 = v12.collect;
local l_collectArray_0 = v12.collectArray;
local v15 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local v16 = v8(v4.validate);
local v17 = v8(v3.validate);
return function(v18) --[[ Line: 43 ]] --[[ Name: DiscoverTeamCreatePresence ]]
    -- upvalues: v6 (copy), v10 (copy), v16 (copy), l_collect_0 (copy), l_Url_0 (copy), v17 (copy), l_collectArray_0 (copy), v15 (copy), l_StartPageManager_0 (copy)
    if #v18 == 0 then
        return;
    else
        local v19 = {
            ids = v18, 
            maxUsers = 10
        };
        local v20 = (v6.TEAM_CREATE_ACTIVE_SESSION_MEMBERS_URL.Prefix .. v6.TEAM_CREATE_ACTIVE_SESSION_MEMBERS_URL.Url()) .. "?maxUsers=" .. v19.maxUsers;
        for _, v22 in v19.ids do
            v20 = v20 .. "&ids=" .. v22;
        end;
        local v23 = v10:get(v20);
        v10:parseJson(v23):andThen(function(v24) --[[ Line: 62 ]]
            -- upvalues: v16 (ref), l_collect_0 (ref), l_Url_0 (ref), v6 (ref), v10 (ref), v17 (ref), l_collectArray_0 (ref), v15 (ref), l_StartPageManager_0 (ref)
            local v25 = v16(v24);
            local v28 = l_collect_0(v25.data, function(_, v27) --[[ Line: 65 ]]
                return v27.id, v27.activeUsers;
            end);
            local v29 = {};
            for _, v31 in v28 do
                for _, v33 in v31 do
                    if v33.id then
                        table.insert(v29, v33.id);
                    end;
                end;
            end;
            if #v29 <= 0 then
                return;
            else
                local v34 = {
                    userIds = v29, 
                    size = "48x48", 
                    format = "png", 
                    isCircular = true
                };
                local v35 = l_Url_0.new().composeUrl(v6.AVATAR_ICON_URL.Prefix, v6.AVATAR_ICON_URL.Url(), v34);
                local v36 = v10:get(v35);
                v10:parseJson(v36):andThen(function(v37) --[[ Line: 98 ]]
                    -- upvalues: v17 (ref), l_collect_0 (ref), l_collectArray_0 (ref), v28 (copy), v15 (ref), l_StartPageManager_0 (ref)
                    local v38 = v17(v37);
                    local v41 = l_collect_0(v38.data, function(_, v40) --[[ Line: 101 ]]
                        return v40.targetId, v40.imageUrl;
                    end);
                    local v47 = l_collectArray_0(v28, function(v42, v43) --[[ Line: 107 ]]
                        -- upvalues: l_collectArray_0 (ref), v41 (copy)
                        local v46 = l_collectArray_0(v43, function(_, v45) --[[ Line: 108 ]]
                            -- upvalues: v41 (ref)
                            return v41[v45.id];
                        end);
                        return {
                            Id = v42, 
                            TeamCreateCDNUrls = v46
                        };
                    end);
                    v15:upsertItems(v47);
                    for _, v49 in v41 do
                        l_StartPageManager_0:generateTempUrlInContentProvider(v49);
                    end;
                end):catch(function(v50) --[[ Line: 124 ]]
                    warn((("DiscoverTeamCreatePresence::Icons experienced an error: %*"):format(v50)));
                end);
                return;
            end;
        end):catch(function(v51) --[[ Line: 128 ]]
            warn((("DiscoverTeamCreatePresence experienced an error: %*"):format(v51)));
        end);
        return;
    end;
end;