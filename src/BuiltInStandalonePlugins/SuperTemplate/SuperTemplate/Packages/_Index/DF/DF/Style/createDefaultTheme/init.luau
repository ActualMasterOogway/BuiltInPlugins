local l_Parent_0 = script.Parent.Parent;
local l_Style_0 = l_Parent_0.Style;
local v2 = require(l_Style_0.Themes.BaseTheme);
local v3 = require(l_Parent_0.UI.ContextServices.Stylizer);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(typeof(v4) == "table", "createDefaultTheme expects themeProps parameter to be a table");
    assert(typeof(v4.themesList) == "table", "createDefaultTheme expects themeProps to contain a table `themesList`");
    assert(typeof(v4.getThemeName) == "function", "createDefaultTheme expects themeProps to contain a function `getThemeName`");
    return v3.new(v4.themesList[v4.getThemeName()], v4):extend(v2);
end;