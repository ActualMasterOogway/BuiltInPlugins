local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Selectors.IsGroupOwner);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = v2.GroupMetadata.NewGroupMetadata or v2.GroupMetadata.CurrentGroupMetadata;
    local l_CurrentGroupMetadata_0 = v2.GroupMetadata.CurrentGroupMetadata;
    local v5 = {};
    for v6, v7 in pairs(v3) do
        local l_Name_0 = v7.Name;
        if not v1(v2, v6) then
            table.insert(v5, {
                Name = l_Name_0, 
                Id = v6
            });
        end;
    end;
    table.sort(v5, function(v9, v10) --[[ Line: 17 ]]
        return v9.Name < v10.Name;
    end);
    local v11 = {};
    local v12 = {};
    for _, v14 in ipairs(v5) do
        if not l_CurrentGroupMetadata_0[v14.Id] then
            table.insert(v11, v14.Id);
        end;
    end;
    for _, v16 in ipairs(v5) do
        if l_CurrentGroupMetadata_0[v16.Id] then
            table.insert(v12, v16.Id);
        end;
    end;
    return v11, v12;
end;