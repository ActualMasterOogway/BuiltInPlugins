local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local l_parseMaterial_0 = require(l_script_FirstAncestor_0.Packages.MaterialFramework).Util.parseMaterial;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: setCurrentMaterial ]]
    -- upvalues: l_parseMaterial_0 (copy)
    local v4, v5 = l_parseMaterial_0(v2);
    if v5 then
        v3:SetCurrentMaterial(v4, (tostring(v5)));
        return;
    else
        v3:SetCurrentMaterial(v4, "");
        return;
    end;
end;