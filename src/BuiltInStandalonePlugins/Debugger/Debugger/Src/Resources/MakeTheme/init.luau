local l_Parent_0 = script.Parent.Parent.Parent;
local l_Style_0 = require(l_Parent_0.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local v3 = {
    MainBackground = l_Style_0.StyleKey.MainBackground, 
    Separator = {
        Weight = 1, 
        StretchMargin = 15, 
        Color = Color3.fromRGB(150, 150, 150)
    }, 
    BorderColor = Color3.fromRGB(229, 229, 229)
};
return function(v4) --[[ Line: 31 ]]
    -- upvalues: l_StudioTheme_0 (copy), v3 (copy)
    local _ = nil;
    return (if v4 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v3);
end;