local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.StatusPropertyMap);
return function(v2, v3) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    if v1[v3] then
        return v1[v3][v2] ~= nil;
    else
        return false;
    end;
end;