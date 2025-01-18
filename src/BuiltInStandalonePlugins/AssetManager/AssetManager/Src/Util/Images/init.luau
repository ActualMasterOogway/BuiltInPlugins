local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.enumerate);
local l_ThemeSwitcher_0 = v1.Style.ThemeSwitcher;
local v4 = {};
local v5 = v2("AvailableImages", {
    Checkmark = 1, 
    Placeholder = 2, 
    SortIcon = 3, 
    SidebarCollapseIcon = 4, 
    SidebarExpandIcon = 5, 
    DefaultThumbnail = 6
});
v4.AvailableImages = v5;
v4.getImageHelper = function(v6) --[[ Line: 24 ]]
    -- upvalues: l_ThemeSwitcher_0 (copy), v5 (copy)
    local v7 = l_ThemeSwitcher_0.getThemeName();
    if v6 == v5.Checkmark then
        return (("rbxasset://studio_svg_textures/Lua/Tutorials/%*/Standard/Checkmark.png"):format(v7));
    elseif v6 == v5.Placeholder then
        return (("rbxasset://studio_svg_textures/Shared/Placeholder/%*/Standard/Placeholder.png"):format(v7));
    elseif v6 == v5.SortIcon then
        return (("rbxasset://studio_svg_textures/Lua/AssetManager/%*/Standard/Sort.png"):format(v7));
    elseif v6 == v5.SidebarCollapseIcon then
        return (("rbxasset://studio_svg_textures/Lua/SystemArrows/%*/Standard/DoubleChevronLeft.png"):format(v7));
    elseif v6 == v5.SidebarExpandIcon then
        return (("rbxasset://studio_svg_textures/Lua/SystemArrows/%*/Standard/DoubleChevronRight.png"):format(v7));
    elseif v6 == v5.DefaultThumbnail then
        return (("rbxasset://studio_svg_textures/Lua/StartPage/%*/SI-Standard/Placeholder.png"):format(v7));
    else
        return "";
    end;
end;
return v4;