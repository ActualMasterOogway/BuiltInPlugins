local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedCategoryMap);
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: getLocalizedCategories ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    local v5 = v1(v2);
    for _, v7 in v3 do
        local v8 = table.clone(v7);
        v8.name = v5[v7.name];
        table.insert(v4, v8);
    end;
    return v4;
end;