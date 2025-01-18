local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.getUserId);
local v3 = require(l_Parent_0.Core.Actions.CollaboratorSearchActions);
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagDeprecateFriendsAPI);
local l_Get_0 = require(l_Parent_0.Core.Networking.Requests.DeprecatedUserFriends).Get;
local v6 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local _ = function(v7) --[[ Line: 16 ]] --[[ Name: iterPageItems ]]
    return coroutine.wrap(function() --[[ Line: 17 ]]
        -- upvalues: v7 (copy)
        local v8 = 1;
        while true do
            for _, v10 in ipairs(v7:GetCurrentPage()) do
                coroutine.yield(v10, v8);
            end;
            if not v7.IsFinished then
                v7:AdvanceToNextPageAsync();
                v8 = v8 + 1;
            else
                break;
            end;
        end;
    end);
end;
return function(v12, v13, _) --[[ Line: 32 ]]
    -- upvalues: v3 (copy), v4 (copy), l_Get_0 (copy), v2 (copy), v6 (copy)
    return function(v15) --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v13 (copy), v4 (ref), l_Get_0 (ref), v12 (copy), v2 (ref), v6 (ref)
        local v16 = v15:getState();
        v15:dispatch(v3.SearchTextChanged(v13));
        if v13 == "" then
            return;
        else
            if not v16.localUserFriends then
                v15:dispatch(v3.LoadingLocalUserFriends());
                spawn(function() --[[ Line: 43 ]]
                    -- upvalues: v4 (ref), l_Get_0 (ref), v12 (ref), v2 (ref), v15 (copy), v3 (ref), v6 (ref)
                    if not v4() then
                        local v17, v18 = l_Get_0(v12, (tostring(v2()))):await();
                        v15:dispatch(v3.LoadedLocalUserFriends(v17, v18));
                        return;
                    else
                        local l_FriendsAsync_0 = game:GetService("Players"):GetFriendsAsync(v2());
                        local v20 = false;
                        local v21 = {};
                        if l_FriendsAsync_0 then
                            v20 = true;
                            for v25, _ in coroutine.wrap(function() --[[ Line: 17 ]]
                                -- upvalues: l_FriendsAsync_0 (copy)
                                local v22 = 1;
                                while true do
                                    for _, v24 in ipairs(l_FriendsAsync_0:GetCurrentPage()) do
                                        coroutine.yield(v24, v22);
                                    end;
                                    if not l_FriendsAsync_0.IsFinished then
                                        l_FriendsAsync_0:AdvanceToNextPageAsync();
                                        v22 = v22 + 1;
                                    else
                                        break;
                                    end;
                                end;
                            end) do
                                table.insert(v21, {
                                    [v6.SubjectNameKey] = v25.Username, 
                                    [v6.SubjectIdKey] = v25.Id
                                });
                            end;
                        end;
                        v15:dispatch(v3.LoadedLocalUserFriends(v20, v21));
                        return;
                    end;
                end);
            end;
            return;
        end;
    end;
end;