local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Util.strict);
return v1({
    Colors = require(script.Colors), 
    ComponentSymbols = require(script.ComponentSymbols), 
    createDefaultTheme = require(script.createDefaultTheme), 
    makeTheme = require(script.makeTheme), 
    getRawComponentStyle = require(script.getRawComponentStyle), 
    Padding = require(script.Padding), 
    StyleKey = require(script.StyleKey), 
    Stylizer = require(l_Parent_0.UI.ContextServices.Stylizer), 
    ThemeSwitcher = require(script.ThemeSwitcher), 
    Themes = v1({
        BaseTheme = require(script.Themes.BaseTheme), 
        DarkTheme = require(script.Themes.DarkTheme), 
        LightTheme = require(script.Themes.LightTheme), 
        StudioTheme = require(script.Themes.StudioTheme)
    }), 
    ColorSystem = require(script.ColorSystem), 
    StudioColorClasses = require(script.ColorSystem.StudioColorClasses)
});