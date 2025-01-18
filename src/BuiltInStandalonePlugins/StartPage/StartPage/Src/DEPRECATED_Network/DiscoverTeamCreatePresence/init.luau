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
return function(v12) --[[ Line: 39 ]] --[[ Name: DiscoverTeamCreatePresence ]]
    -- upvalues: v6 (copy), v10 (copy), v8 (copy), v4 (copy), l_Url_0 (copy), v3 (copy), l_StartPageManager_0 (copy)
    local l_gameIds_0 = v12.gameIds;
    local l_setter_0 = v12.setter;
    if #v12.gameIds == 0 then
        return v12;
    else
        local v15 = {
            ids = l_gameIds_0, 
            maxUsers = 10
        };
        local v16 = (v6.TEAM_CREATE_ACTIVE_SESSION_MEMBERS_URL.Prefix .. v6.TEAM_CREATE_ACTIVE_SESSION_MEMBERS_URL.Url()) .. "?maxUsers=" .. v15.maxUsers;
        for _, v18 in v15.ids do
            v16 = v16 .. "&ids=" .. v18;
        end;
        local v19 = v10:get(v16);
        v10:parseJson(v19):andThen(v8(v4.validate)):andThen(function(v20) --[[ Line: 62 ]]
            local v21 = {};
            if v20.data then
                for _, v23 in v20.data do
                    if v23.id and v23.activeUsers then
                        v21[v23.id] = v23.activeUsers;
                    end;
                end;
            end;
            return v21;
        end):andThen(function(v24) --[[ Line: 76 ]]
            local v25 = {};
            for _, v27 in v24 do
                for _, v29 in v27 do
                    if v29.id then
                        table.insert(v25, v29.id);
                    end;
                end;
            end;
            return {
                experienceIdToActiveUsers = v24, 
                userIds = v25
            };
        end):andThen(function(v30) --[[ Line: 93 ]]
            -- upvalues: l_Url_0 (ref), v6 (ref), v10 (ref), v8 (ref), v3 (ref), l_setter_0 (copy), l_StartPageManager_0 (ref)
            if #v30.userIds <= 0 then
                return;
            else
                local v31 = {
                    userIds = v30.userIds, 
                    size = "48x48", 
                    format = "png", 
                    isCircular = true
                };
                local v32 = l_Url_0.new().composeUrl(v6.AVATAR_ICON_URL.Prefix, v6.AVATAR_ICON_URL.Url(), v31);
                v10:parseJson(v10:get(v32)):andThen(v8(v3.validate)):andThen(function(v33) --[[ Line: 110 ]]
                    local v34 = {};
                    if v33.data then
                        for _, v36 in v33.data do
                            if v36.targetId and v36.imageUrl then
                                v34[v36.targetId] = v36.imageUrl;
                            end;
                        end;
                    end;
                    return v34;
                end):andThen(function(v37) --[[ Line: 124 ]]
                    -- upvalues: l_setter_0 (ref), v30 (copy), l_StartPageManager_0 (ref)
                    l_setter_0(function(v38) --[[ Line: 125 ]]
                        -- upvalues: v30 (ref), v37 (copy)
                        for _, v40 in v38 do
                            assert(not v40.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                            if v40.Id then
                                local v41 = v30.experienceIdToActiveUsers[v40.Id];
                                if v41 then
                                    v40.TeamCreateCDNUrls = {};
                                    assert(v40.TeamCreateCDNUrls, "Force Luau to know that TeamCreateCDNUrls is non-nil");
                                    for _, v43 in v41 do
                                        if v43.id then
                                            table.insert(v40.TeamCreateCDNUrls, v37[v43.id]);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end);
                    for _, v45 in v37 do
                        l_StartPageManager_0:generateTempUrlInContentProvider(v45);
                    end;
                end):catch(function(v46) --[[ Line: 158 ]]
                    warn((("DiscoverTeamCreatePresence::Icons experienced an error: %*"):format(v46)));
                end);
                return;
            end;
        end):catch(function(v47) --[[ Line: 162 ]]
            warn((("DiscoverTeamCreatePresence experienced an error: %*"):format(v47)));
        end);
        return v12;
    end;
end;