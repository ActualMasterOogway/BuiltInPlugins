local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return (v2.Permissions.NewPermissions or v2.Permissions.CurrentPermissions)[v1.UserSubjectKey][v3][v1.SubjectNameKey];
end;