local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: l_deepJoin_0 (copy), v3 (copy), v2 (copy)
    return function(v6, _) --[[ Line: 10 ]]
        -- upvalues: l_deepJoin_0 (ref), v3 (ref), v4 (copy), v5 (copy), v2 (ref)
        local v8 = v6:getState();
        local v9 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        local v10 = l_deepJoin_0(v9, {
            [v3.UserSubjectKey] = {
                [v4] = {
                    [v3.ActionKey] = v5
                }
            }
        });
        v6:dispatch(v2(v10));
    end;
end;