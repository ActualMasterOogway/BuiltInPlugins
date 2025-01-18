local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_deepJoin_0 (copy), v3 (copy), v2 (copy)
    return function(v7, _) --[[ Line: 10 ]]
        -- upvalues: l_deepJoin_0 (ref), v3 (ref), v4 (copy), v5 (copy), v6 (copy), v2 (ref)
        local v9 = v7:getState();
        local v10 = v9.Permissions.NewPermissions or v9.Permissions.CurrentPermissions;
        local v11 = l_deepJoin_0(v10, {
            [v3.UserSubjectKey] = {
                [v4] = {
                    [v3.SubjectNameKey] = v5, 
                    [v3.SubjectIdKey] = v4, 
                    [v3.ActionKey] = v6
                }
            }
        });
        v7:dispatch(v2(v11));
    end;
end;