local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_ThemeSwitcher_0 = require(l_script_FirstAncestor_0.Packages.Framework).Style.ThemeSwitcher;
local v2 = {};
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioActionsRespectNilIcon);
v2.getPathForIcon = function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_ThemeSwitcher_0 (copy)
    if v4 and v4:sub(1, 3) == "rbx" then
        return v4;
    else
        local v6 = v5 == "Small" and "Standard" or "Medium";
        if v3 then
            if not v4 or v4 == "" then
                return nil;
            end;
        elseif not v4 then
            v4 = "Placeholder";
        end;
        local v7 = if v5 == "Small" then v5 else "";
        return (("rbxasset://studio_svg_textures/Shared/Ribbon/%*/%*/Ribbon%*%*.png"):format(l_ThemeSwitcher_0.getThemeName(), v6, v4, v7));
    end;
end;
return v2;