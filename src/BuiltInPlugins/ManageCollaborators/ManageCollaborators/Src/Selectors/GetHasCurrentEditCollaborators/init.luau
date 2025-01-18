local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = v2.Permissions.CurrentPermissions[v1.UserSubjectKey] or {};
    for _, v5 in v3 do
        if v5[v1.ActionKey] == v1.EditKey and v5[v1.SubjectIdKey] ~= v2.GameOwnerMetadata.creatorId then
            return true;
        end;
    end;
    return false;
end;