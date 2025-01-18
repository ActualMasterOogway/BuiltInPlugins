local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
return function(v2, v3, v4, v5, v6) --[[ Line: 5 ]] --[[ Name: localizePlural ]]
    -- upvalues: v1 (copy)
    return v2:getText(v3, if v5 == 1 then ("%*_Singular"):format(v4) else ("%*_Plural"):format(v4), v1.join({
        amount = if v5 == 1 then nil else v5
    }, v6));
end;