return (table.freeze(((function() --[[ Line: 1 ]] --[[ Name: getBaseMaterials ]]
    local l_EnumItems_0 = Enum.Material:GetEnumItems();
    table.sort(l_EnumItems_0, function(v1, v2) --[[ Line: 3 ]]
        return v1.Name < v2.Name;
    end);
    local v3 = nil;
    v3 = {
        Enum.Material.Air, 
        Enum.Material.Water
    };
    for _, v5 in ipairs(v3) do
        local v6 = table.find(l_EnumItems_0, v5);
        table.remove(l_EnumItems_0, v6);
    end;
    return l_EnumItems_0;
end)())));