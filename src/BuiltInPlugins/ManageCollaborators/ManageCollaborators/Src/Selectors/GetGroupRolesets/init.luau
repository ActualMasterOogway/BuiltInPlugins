local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = (v2.Permissions.NewPermissions or v2.Permissions.CurrentPermissions)[v1.RoleSubjectKey];
    local v5 = {};
    for v6, v7 in pairs(v4) do
        local v8 = v7[v1.GroupIdKey];
        local v9 = v7[v1.SubjectRankKey];
        if v3 == v8 then
            table.insert(v5, {
                Rank = v9, 
                Id = v6
            });
        end;
    end;
    table.sort(v5, function(v10, v11) --[[ Line: 18 ]]
        return v10.Rank > v11.Rank;
    end);
    local v12 = {};
    for _, v14 in ipairs(v5) do
        table.insert(v12, v14.Id);
    end;
    return v12;
end;