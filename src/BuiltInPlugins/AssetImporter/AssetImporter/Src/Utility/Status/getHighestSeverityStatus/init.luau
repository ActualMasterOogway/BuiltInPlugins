local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 9 ]]
    for _, v4 in v2 do
        if v4.Level == "Error" then
            return v4;
        end;
    end;
    return v2[1];
end;