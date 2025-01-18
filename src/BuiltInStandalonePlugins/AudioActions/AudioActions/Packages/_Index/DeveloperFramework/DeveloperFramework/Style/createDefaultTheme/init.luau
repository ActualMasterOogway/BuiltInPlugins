local l_Parent_0 = script.Parent.Parent;
local l_Style_0 = l_Parent_0.Style;
local v2 = require(l_Style_0.Themes.BaseTheme);
local v3 = require(l_Parent_0.UI.ContextServices.Stylizer);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.new(v4.themesList[v4.getThemeName()], v4):extend(v2);
end;