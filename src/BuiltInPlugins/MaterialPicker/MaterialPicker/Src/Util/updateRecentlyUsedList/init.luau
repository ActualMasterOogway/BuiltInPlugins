local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local l_getSerializedMaterialIdentifier_0 = require(l_script_FirstAncestor_0.Packages.MaterialFramework).Util.getSerializedMaterialIdentifier;
return function(v2, v3) --[[ Line: 10 ]] --[[ Name: updateRecentlyUsedList ]]
    -- upvalues: l_getSerializedMaterialIdentifier_0 (copy)
    local v4 = v2:GetSetting("RecentlyUsed") or {
        "Plastic"
    };
    local v5 = l_getSerializedMaterialIdentifier_0(v3);
    local v6 = table.find(v4, v5);
    if v6 then
        table.remove(v4, v6);
    end;
    table.insert(v4, v5);
    if #v4 > 9999 then
        table.remove(v4, 1);
    end;
    v2:SetSetting("RecentlyUsed", v4);
end;