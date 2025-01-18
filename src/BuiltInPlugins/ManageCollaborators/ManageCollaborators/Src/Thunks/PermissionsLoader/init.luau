local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v3 = require(l_Parent_0.Src.Actions.SetLoadState);
local v4 = require(l_Parent_0.Src.Util.LoadState);
local v5 = require(l_Parent_0.Src.Actions.SetCurrentUserPermissions);
local v6 = require(l_Parent_0.Src.Actions.SetCurrentGroupMetadata);
local v7 = require(l_Parent_0.Src.Actions.SetCreatorType);
local v8 = require(l_Parent_0.Src.Actions.SetCreatorName);
local v9 = require(l_Parent_0.Src.Actions.SetCreatorId);
local v10 = require(l_Parent_0.Src.Actions.SetCreatorFriends);
local v11 = require(l_Parent_0.Src.Actions.SetGroupOwnerId);
local v12 = require(l_Parent_0.Src.Actions.SetGroupRolePermissions);
local v13 = require(l_Parent_0.Src.Actions.SetUserMinimumAge);
GetLoadFriendsJob = function(v14, v15) --[[ Line: 20 ]] --[[ Name: GetLoadFriendsJob ]]
    -- upvalues: v10 (copy)
    local l_gameMetadataController_0 = v15.gameMetadataController;
    local l_socialController_0 = v15.socialController;
    local l_GameId_0 = game.GameId;
    return function() --[[ Line: 25 ]]
        -- upvalues: l_gameMetadataController_0 (copy), l_GameId_0 (copy), l_socialController_0 (copy), v14 (copy), v10 (ref)
        local v19 = l_gameMetadataController_0:getCreatorId(l_GameId_0);
        local v20 = l_socialController_0:getUserFriends(v19);
        v14:dispatch(v10(v20));
    end;
end;
GetPermissionsLoadJobs = function(v21, v22) --[[ Line: 33 ]] --[[ Name: GetPermissionsLoadJobs ]]
    -- upvalues: v5 (copy), v6 (copy), v7 (copy), v11 (copy), l_StudioService_0 (copy), v12 (copy), v8 (copy), v9 (copy), v13 (copy)
    local l_gameMetadataController_1 = v22.gameMetadataController;
    local l_groupMetadataController_0 = v22.groupMetadataController;
    local l_groupRolePermisionsController_0 = v22.groupRolePermisionsController;
    local l_gamePermissionsController_0 = v22.gamePermissionsController;
    local l_GameId_1 = game.GameId;
    local v28 = GetLoadFriendsJob(v21, v22);
    return {
        function() --[[ Line: 44 ]]
            -- upvalues: l_gameMetadataController_1 (copy), l_GameId_1 (copy), l_gamePermissionsController_0 (copy), v21 (copy), v5 (ref), v6 (ref)
            local v29 = l_gameMetadataController_1:getCreatorName(l_GameId_1);
            local v30 = l_gameMetadataController_1:getCreatorId(l_GameId_1);
            local v31 = l_gameMetadataController_1:getCreatorType(l_GameId_1);
            local v32, v33 = l_gamePermissionsController_0:getPermissions(l_GameId_1, v29, v30, v31);
            v21:dispatch(v5(v32));
            v21:dispatch(v6(v33));
        end, 
        function() --[[ Line: 55 ]]
            -- upvalues: l_gameMetadataController_1 (copy), l_GameId_1 (copy), v21 (copy), v7 (ref), l_groupMetadataController_0 (copy), v11 (ref), l_StudioService_0 (ref), l_groupRolePermisionsController_0 (copy), v12 (ref), v28 (copy)
            local v34 = l_gameMetadataController_1:getCreatorType(l_GameId_1);
            v21:dispatch(v7(v34));
            if v34 == Enum.CreatorType.Group then
                local v35 = l_gameMetadataController_1:getCreatorId(l_GameId_1);
                local v36 = l_groupMetadataController_0:getOwnerId(v35);
                v21:dispatch(v11(v36));
                if v36 == l_StudioService_0:GetUserId() then
                    l_groupRolePermisionsController_0:clearCache();
                    local v37 = l_groupRolePermisionsController_0:getGroupRolePermissions(v35);
                    v21:dispatch(v12(v37));
                    return;
                end;
            elseif v34 == Enum.CreatorType.User then
                v28();
            end;
        end, 
        function() --[[ Line: 76 ]]
            -- upvalues: l_gameMetadataController_1 (copy), l_GameId_1 (copy), v21 (copy), v8 (ref)
            local v38 = l_gameMetadataController_1:getCreatorName(l_GameId_1);
            v21:dispatch(v8(v38));
        end, 
        function() --[[ Line: 80 ]]
            -- upvalues: l_gameMetadataController_1 (copy), l_GameId_1 (copy), v21 (copy), v9 (ref)
            local v39 = l_gameMetadataController_1:getCreatorId(l_GameId_1);
            v21:dispatch(v9(v39));
        end, 
        function() --[[ Line: 84 ]]
            -- upvalues: l_gamePermissionsController_0 (copy), l_GameId_1 (copy), v21 (copy), v13 (ref)
            local v40 = l_gamePermissionsController_0:getMinimumAgeRecommendation(l_GameId_1);
            if v40 then
                v21:dispatch(v13(v40));
            end;
        end
    };
end;
v0.LoadFriends = function(_) --[[ Line: 93 ]] --[[ Name: LoadFriends ]]
    return function(v42, v43) --[[ Line: 94 ]]
        local v44 = GetLoadFriendsJob(v42, v43);
        coroutine.wrap(function() --[[ Line: 98 ]]
            -- upvalues: v44 (copy)
            pcall(v44);
        end)();
    end;
end;
v0.LoadPermissions = function(_) --[[ Line: 106 ]] --[[ Name: LoadPermissions ]]
    -- upvalues: v3 (copy), v4 (copy)
    return function(v46, v47) --[[ Line: 107 ]]
        -- upvalues: v3 (ref), v4 (ref)
        local v48 = GetPermissionsLoadJobs(v46, v47);
        v46:dispatch(v3(v4.Loading));
        local v49 = 0;
        local v50 = false;
        for _, v52 in ipairs(v48) do
            coroutine.wrap(function() --[[ Line: 117 ]]
                -- upvalues: v52 (copy), v50 (ref), v46 (copy), v3 (ref), v4 (ref), v49 (ref), v48 (copy)
                local l_status_0, l_result_0 = pcall(v52);
                if not l_status_0 and not v50 then
                    warn("Failed", l_result_0);
                    v50 = true;
                    v46:dispatch(v3(v4.LoadFailed));
                end;
                v49 = v49 + 1;
                if v49 == #v48 and not v50 then
                    v46:dispatch(v3(v4.Loaded));
                end;
            end)();
        end;
    end;
end;
return v0;