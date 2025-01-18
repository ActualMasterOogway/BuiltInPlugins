local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.StatusLevel);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportWarningIconJump);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = 0;
    local v6 = 0;
    for _, v8 in v4 do
        if v3 then
            if v8.Level == v2.Warning.rawValue() then
                v6 = v6 + 1;
            elseif v8.Level == v2.Error.rawValue() then
                v5 = v5 + 1;
            end;
        elseif v8.Level == "Warning" then
            v6 = v6 + 1;
        elseif v8.Level == "Error" then
            v5 = v5 + 1;
        end;
    end;
    return {
        errors = v5, 
        warnings = v6
    };
end;