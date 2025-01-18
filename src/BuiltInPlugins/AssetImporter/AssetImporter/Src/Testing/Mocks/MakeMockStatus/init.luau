local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2, v3, v4) --[[ Line: 6 ]]
    return {
        Level = v2, 
        Type = v3, 
        Context = v4
    };
end;