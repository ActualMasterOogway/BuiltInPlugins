local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Networking.Requests.DeserializeFromRequest);
local v3 = require(l_Parent_0.Src.Networking.Requests.SerializeForRequest);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
local l_StudioService_0 = game:GetService("StudioService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v8 = l_HttpService_0:GenerateGUID(false);
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return (setmetatable({
        __networking = v10
    }, v9));
end;
v9.universesV1GET = function(v11, v12) --[[ Line: 28 ]] --[[ Name: universesV1GET ]]
    return v11.__networking:get("develop", "/v1/universes/" .. v12);
end;
v9.universesActivateV1POST = function(v13, v14) --[[ Line: 34 ]] --[[ Name: universesActivateV1POST ]]
    return v13.__networking:post("develop", "/v1/universes/" .. v14 .. "/activate", {
        Body = {}
    });
end;
v9.universesDeactivateV1POST = function(v15, v16) --[[ Line: 42 ]] --[[ Name: universesDeactivateV1POST ]]
    return v15.__networking:post("develop", "/v1/universes/" .. v16 .. "/deactivate", {
        Body = {}
    });
end;
v9.configurationV2GET = function(v17, v18) --[[ Line: 50 ]] --[[ Name: configurationV2GET ]]
    return v17.__networking:get("develop", "/v2/universes/" .. v18 .. "/configuration");
end;
v9.configurationV2PATCH = function(v19, v20, v21) --[[ Line: 56 ]] --[[ Name: configurationV2PATCH ]]
    return v19.__networking:patch("develop", "/v2/universes/" .. v20 .. "/configuration", {
        Body = v21
    });
end;
v9.permissionsV2GET = function(v22, v23) --[[ Line: 64 ]] --[[ Name: permissionsV2GET ]]
    return v22.__networking:get("develop", "/v2/universes/" .. v23 .. "/permissions");
end;
v9.permissionsBatchedV2POST = function(v24, v25, v26) --[[ Line: 70 ]] --[[ Name: permissionsBatchedV2POST ]]
    return v24.__networking:post("develop", "/v2/universes/" .. v25 .. "/permissions_batched", {
        Body = v26
    });
end;
v9.permissionsBatchedV2DELETE = function(v27, v28, v29) --[[ Line: 78 ]] --[[ Name: permissionsBatchedV2DELETE ]]
    return v27.__networking:delete("develop", "/v2/universes/" .. v28 .. "/permissions_batched", {
        Body = v29
    });
end;
v9.apisSearchUsers = function(v30, v31) --[[ Line: 86 ]] --[[ Name: apisSearchUsers ]]
    -- upvalues: v8 (copy), v4 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 87 ]]
        -- upvalues: v30 (copy), v31 (copy), v8 (ref), v4 (ref)
        local v32 = v30.__networking:get("apis", "/search-api/omni-search", {
            Params = {
                searchQuery = v31, 
                sessionId = v8, 
                pageType = "all", 
                verticalType = "user"
            }
        }):await();
        if v32.responseCode ~= 200 then
            return {};
        else
            local l_contents_0 = v32.responseBody.searchResults[1].contents;
            local v34 = {};
            for v35 = 1, v4.MaxSearchResultsPerSubjectTypeUsers do
                local v36 = l_contents_0[v35];
                if v36 then
                    table.insert(v34, {
                        UserId = v36.contentId, 
                        Name = v36.username
                    });
                else
                    break;
                end;
            end;
            return v34;
        end;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return {};
    end;
end;
v9.usersGetByUsernamesV1POST = function(v39, v40) --[[ Line: 154 ]] --[[ Name: usersGetByUsernamesV1POST ]]
    return v39.__networking:post("users", "/v1/usernames/users", {
        Body = {
            usernames = v40
        }
    });
end;
v9.searchGroupsV1GET = function(v41, v42) --[[ Line: 164 ]] --[[ Name: searchGroupsV1GET ]]
    -- upvalues: v4 (copy)
    return v41.__networking:get("groups", "/v1/groups/search/lookup", {
        Params = {
            groupName = v42, 
            maxRows = v4.MaxSearchResultsPerSubjectType
        }
    });
end;
v9.isFriendsOnly = function(v43, v44) --[[ Line: 175 ]] --[[ Name: isFriendsOnly ]]
    return v43:configurationV2GET(v44):await().responseBody.isFriendsOnly;
end;
v9.setFriendsOnly = function(v45, v46, v47) --[[ Line: 181 ]] --[[ Name: setFriendsOnly ]]
    v45:configurationV2PATCH(v46, {
        isFriendsOnly = v47
    }):await();
end;
v9.isActive = function(v48, v49) --[[ Line: 185 ]] --[[ Name: isActive ]]
    return v48:universesV1GET(v49):await().responseBody.isActive;
end;
v9.setActive = function(v50, v51, v52) --[[ Line: 191 ]] --[[ Name: setActive ]]
    if v52 then
        v50:universesActivateV1POST(v51):await();
        return;
    else
        v50:universesDeactivateV1POST(v51):await();
        return;
    end;
end;
v9.getPermissions = function(v53, v54, v55, v56, v57) --[[ Line: 199 ]] --[[ Name: getPermissions ]]
    -- upvalues: v2 (copy)
    local l_data_0 = v53:permissionsV2GET(v54):await().responseBody.data;
    return v2.DeserializePermissions(l_data_0, v55, v56, v57);
end;
v9.setPermissions = function(v59, v60, v61, v62) --[[ Line: 206 ]] --[[ Name: setPermissions ]]
    -- upvalues: v3 (copy)
    local v63, v64 = v3.SerializePermissions(v61, v62);
    local v65 = #v63 + #v64;
    if v65 > 60 then
        error("Too many changes (" .. v65 .. ") to permissions. Maximum at once is " + 60);
    end;
    if #v63 > 0 then
        v59:permissionsBatchedV2POST(v60, v63):await();
    end;
    if #v64 > 0 then
        v59:permissionsBatchedV2DELETE(v60, v64):await();
    end;
    return v63, v64;
end;
v9.searchUsers = function(v66, v67) --[[ Line: 224 ]] --[[ Name: searchUsers ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    local v68 = v66:apisSearchUsers(v67);
    local v69 = {};
    if #v68 > 0 then
        for _, v71 in pairs(v68) do
            table.insert(v69, {
                [v4.SubjectNameKey] = v71.Name, 
                [v4.SubjectIdKey] = v71.UserId
            });
        end;
    else
        pcall(function() --[[ Line: 237 ]]
            -- upvalues: l_Players_0 (ref), v67 (copy), v69 (copy), v4 (ref)
            local l_l_Players_0_UserIdFromNameAsync_0 = l_Players_0:GetUserIdFromNameAsync(v67);
            local l_l_Players_0_NameFromUserIdAsync_0 = l_Players_0:GetNameFromUserIdAsync(l_l_Players_0_UserIdFromNameAsync_0);
            table.insert(v69, {
                [v4.SubjectNameKey] = l_l_Players_0_NameFromUserIdAsync_0, 
                [v4.SubjectIdKey] = l_l_Players_0_UserIdFromNameAsync_0
            });
        end);
    end;
    return {
        [v4.UserSubjectKey] = v69
    };
end;
v9.searchGroups = function(v74, v75) --[[ Line: 253 ]] --[[ Name: searchGroups ]]
    -- upvalues: v4 (copy)
    local l_data_1 = v74:searchGroupsV1GET(v75):await().responseBody.data;
    local v77 = {};
    if l_data_1 then
        local v78 = {};
        for _, v80 in pairs(l_data_1) do
            table.insert(v78, {
                [v4.GroupNameKey] = v80.name, 
                [v4.GroupIdKey] = v80.id, 
                [v4.GroupMemberCountKey] = v80.memberCount
            });
        end;
        v77[v4.GroupSubjectKey] = v78;
    end;
    return v77;
end;
v9.creatorEligibilitiesPOST = function(v81, v82, v83) --[[ Line: 275 ]] --[[ Name: creatorEligibilitiesPOST ]]
    -- upvalues: l_StudioService_0 (copy)
    return v81.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-creator-eligibility", {
        Body = {
            action = 1, 
            universeId = v82, 
            userIds = v83, 
            locale = l_StudioService_0.StudioLocaleId
        }
    });
end;
v9.search = function(v84, v85, v86) --[[ Line: 287 ]] --[[ Name: search ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v87 = v84:searchUsers(v85);
    local v88 = v87[v4.UserSubjectKey];
    for v89 = 1, #v88 do
        v88[v89][v4.IsEligibleKey] = not v86;
    end;
    if v86 then
        local v90 = {};
        local v91 = {};
        for v92 = 1, #v88 do
            v90[v92] = v88[v92][v4.SubjectIdKey];
            v91[v90[v92]] = v88[v92];
        end;
        local v93 = v84:creatorEligibilitiesPOST(game.GameId, v90):await();
        for _, v95 in pairs(v93.responseBody.eligibilityByCreator) do
            v91[v95.userId][v4.IsEligibleKey] = v95.userIsEligible;
            v91[v95.userId][v4.EligibilityTextKey] = v95.displayText;
        end;
    end;
    local v96 = v84:searchGroups(v85);
    return (v1.Dictionary.join(v87, v96));
end;
v9.guidelinesPOST = function(v97, v98) --[[ Line: 318 ]] --[[ Name: guidelinesPOST ]]
    return v97.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-age-recommendation", {
        Body = {
            universeIds = {
                v98
            }
        }
    });
end;
v9.getMinimumAgeRecommendation = function(v99, v100) --[[ Line: 327 ]] --[[ Name: getMinimumAgeRecommendation ]]
    local v101 = v99:guidelinesPOST(v100):await().responseBody.ageRecommendationDetailsByUniverse[1];
    assert(v101);
    assert(v101.universeId == v100);
    if v101 then
        local l_ageRecommendation_0 = v101.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
        if l_ageRecommendation_0 then
            return l_ageRecommendation_0.minimumAge;
        end;
    end;
    return nil;
end;
return v9;