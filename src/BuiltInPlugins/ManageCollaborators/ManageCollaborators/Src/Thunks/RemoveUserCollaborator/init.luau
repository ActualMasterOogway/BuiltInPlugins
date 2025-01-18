local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, _) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v6, _) --[[ Line: 8 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (copy), v2 (ref)
        local v8 = v6:getState();
        local v9 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        local v10 = v9[v3.UserSubjectKey];
        local v11 = v1.Dictionary.join(v9, {
            [v3.UserSubjectKey] = v1.Dictionary.join(v10, {
                [v4] = v1.None
            })
        });
        v6:dispatch(v2(v11));
    end;
end;