local l_COLLAB2699FixSaveChangesLogic_0 = game:GetFastFlag("COLLAB2699FixSaveChangesLogic");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.PermissionsConstants);
checkForDifferenceInCollaborators = function(v3, v4) --[[ Line: 6 ]] --[[ Name: checkForDifferenceInCollaborators ]]
    -- upvalues: v2 (copy)
    for v5, v6 in pairs(v3) do
        if v4[v5] == nil or v4[v5][v2.ActionKey] ~= v6[v2.ActionKey] then
            return true;
        end;
    end;
    for v7, _ in pairs(v4) do
        if v3[v7] == nil then
            return true;
        end;
    end;
    return false;
end;
return function(v9) --[[ Line: 25 ]]
    -- upvalues: l_COLLAB2699FixSaveChangesLogic_0 (copy), v2 (copy)
    assert(l_COLLAB2699FixSaveChangesLogic_0);
    if not v9.Permissions.NewPermissions then
        return false;
    else
        local v10 = v9.Permissions.NewPermissions[v2.UserSubjectKey];
        local v11 = v9.Permissions.CurrentPermissions[v2.UserSubjectKey];
        local v12 = v9.Permissions.NewPermissions[v2.RoleSubjectKey];
        local v13 = v9.Permissions.CurrentPermissions[v2.RoleSubjectKey];
        return checkForDifferenceInCollaborators(v10, v11) or checkForDifferenceInCollaborators(v12, v13);
    end;
end;