local l_Parent_0 = script.Parent.Parent.Parent;
local l_Style_0 = require(l_Parent_0.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v4 = {
    mainWindow = {
        backgroundColor = l_StyleKey_0.MainBackground
    }
};
local v5 = {
    mainWindow = {
        backgroundColor = l_StyleKey_0.MainBackground
    }
};
local v6 = {};
return function(v7) --[[ Line: 35 ]]
    -- upvalues: l_StudioTheme_0 (copy), v4 (copy), v5 (copy), v6 (copy)
    local _ = nil;
    return (if v7 then l_StudioTheme_0.mock(v4, v5) else l_StudioTheme_0.new(v4, v5)):extend(v6);
end;