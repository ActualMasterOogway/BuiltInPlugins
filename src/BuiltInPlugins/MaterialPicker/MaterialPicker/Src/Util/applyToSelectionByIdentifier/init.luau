local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local l_applyToInstances_0 = require(l_script_FirstAncestor_0.Packages.MaterialFramework).Util.applyToInstances;
applyToSelectionByIdentifier = function(v2, v3) --[[ Line: 7 ]] --[[ Name: applyToSelectionByIdentifier ]]
    -- upvalues: l_applyToInstances_0 (copy)
    local v4 = string.split(v2, "__");
    local v5 = v3:Get();
    if #v4 == 2 then
        l_applyToInstances_0(v5, v4[2], v4[1]);
        return;
    else
        l_applyToInstances_0(v5, v2);
        return;
    end;
end;
return applyToSelectionByIdentifier;