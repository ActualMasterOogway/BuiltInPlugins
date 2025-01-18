local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Actions.SetGroupMetadata);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_deepJoin_0 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v7, v8) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), l_deepJoin_0 (ref), v4 (ref), v6 (copy), v2 (ref), v3 (ref)
        local v9 = v7:getState();
        local l_groupMetadataController_0 = v8.groupMetadataController;
        local l_name_0 = l_groupMetadataController_0:getGroupMetadata(v5).name;
        local v12 = v9.GroupMetadata.NewGroupMetadata or v9.GroupMetadata.CurrentGroupMetadata;
        local v13 = l_deepJoin_0(v12, {
            [v5] = {
                Name = l_name_0
            }
        });
        local v14 = v9.Permissions.NewPermissions or v9.Permissions.CurrentPermissions;
        local v15 = l_groupMetadataController_0:getRolesets(v5);
        for v16, v17 in pairs(v15) do
            v14 = l_deepJoin_0(v14, {
                [v4.RoleSubjectKey] = {
                    [v16] = {
                        [v4.GroupIdKey] = v5, 
                        [v4.SubjectNameKey] = v17.name, 
                        [v4.SubjectRankKey] = v17.rank, 
                        [v4.ActionKey] = v6
                    }
                }
            });
        end;
        v7:dispatch(v2(v14));
        v7:dispatch(v3(v13));
    end;
end;