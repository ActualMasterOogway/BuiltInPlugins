local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local l_applyToInstances_0 = require(l_script_FirstAncestor_0.Packages.MaterialFramework).Util.applyToInstances;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: applyToSelection ]]
    -- upvalues: l_applyToInstances_0 (copy)
    local v4 = nil;
    local v5 = nil;
    if typeof(v2) == "Instance" and v2:IsA("MaterialVariant") then
        v5 = v2.BaseMaterial;
        v4 = v2.Name;
    else
        v5 = v2;
    end;
    local v6 = v3:Get();
    l_applyToInstances_0(v6, v5, v4);
end;