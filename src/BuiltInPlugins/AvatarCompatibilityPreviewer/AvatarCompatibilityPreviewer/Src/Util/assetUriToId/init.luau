local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
return function(v2) --[[ Line: 8 ]] --[[ Name: assetUriToId ]]
    -- upvalues: v1 (copy)
    if v1() then
        local v3 = string.match(v2, "(%d+)$");
        if v3 then
            return (tonumber(v3));
        else
            return nil;
        end;
    else
        return (tonumber(string.match(v2, "(%d+)$")));
    end;
end;