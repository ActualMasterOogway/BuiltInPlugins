local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCheckFaceItems);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: getPaletteFromKey ]]
    -- upvalues: v3 (copy), v1 (copy)
    if v3() and v5 ~= nil then
        for _, v7 in v5 do
            for _, v9 in v1[v7] do
                if v9.Key == v4 then
                    return v9, v7;
                end;
            end;
        end;
    end;
    for v10, v11 in v1 do
        for _, v13 in v11 do
            if v13.Key == v4 then
                return v13, v10;
            end;
        end;
    end;
    return nil, nil;
end;