local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = v2.Permissions.NewPermissions or v2.Permissions.CurrentPermissions;
    local v5 = true;
    local v6 = true;
    for _, v8 in pairs(v4[v1.RoleSubjectKey]) do
        if v8[v1.ActionKey] ~= v1.PlayKey and v8[v1.GroupIdKey] == v3 then
            v5 = false;
        end;
        if v8[v1.ActionKey] ~= v1.NoAccessKey and v8[v1.GroupIdKey] == v3 then
            v6 = false;
        end;
    end;
    if v5 then
        return v1.PlayKey;
    elseif v6 then
        return v1.NoAccessKey;
    else
        return v1.MultipleKey;
    end;
end;