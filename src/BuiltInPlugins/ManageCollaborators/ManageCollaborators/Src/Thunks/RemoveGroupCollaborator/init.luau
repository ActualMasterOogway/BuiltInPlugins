local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Actions.SetGroupMetadata);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v6, _) --[[ Line: 9 ]]
        -- upvalues: v1 (ref), v5 (copy), v4 (ref), v2 (ref), v3 (ref)
        local v8 = v6:getState();
        local v9 = v8.GroupMetadata.NewGroupMetadata or v8.GroupMetadata.CurrentGroupMetadata;
        local v10 = v1.Dictionary.join(v9, {
            [v5] = v1.None
        });
        local v11 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        for v12, v13 in pairs(v11[v4.RoleSubjectKey]) do
            if v13[v4.GroupIdKey] == v5 then
                v11 = v1.Dictionary.join(v11, {
                    [v4.RoleSubjectKey] = v1.Dictionary.join(v11[v4.RoleSubjectKey], {
                        [v12] = v1.None
                    })
                });
            end;
        end;
        v6:dispatch(v2(v11));
        v6:dispatch(v3(v10));
    end;
end;