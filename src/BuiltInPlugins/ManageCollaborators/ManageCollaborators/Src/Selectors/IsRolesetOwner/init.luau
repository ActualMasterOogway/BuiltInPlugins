local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local l_creatorId_0 = v2.GameOwnerMetadata.creatorId;
    local l_creatorType_0 = v2.GameOwnerMetadata.creatorType;
    local v6 = (v2.Permissions.NewPermissions or v2.Permissions.CurrentPermissions)[v1.RoleSubjectKey][v3];
    local v7 = v6[v1.GroupIdKey];
    local v8 = v6[v1.SubjectRankKey];
    local v9 = false;
    if l_creatorType_0 == Enum.CreatorType.Group then
        v9 = false;
        if l_creatorId_0 == v7 then
            v9 = v8 == 255;
        end;
    end;
    return v9;
end;