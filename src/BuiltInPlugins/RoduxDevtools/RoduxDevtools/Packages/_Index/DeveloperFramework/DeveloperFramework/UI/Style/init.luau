local l_Parent_0 = script.Parent.Parent;
return {
    Colors = require(l_Parent_0.Style.Colors), 
    ColorSystem = require(l_Parent_0.Style.ColorSystem), 
    ComponentSymbols = require(l_Parent_0.Style.ComponentSymbols), 
    createDefaultTheme = require(l_Parent_0.Style.createDefaultTheme), 
    getRawComponentStyle = require(l_Parent_0.Style.getRawComponentStyle), 
    makeTheme = require(l_Parent_0.Style.makeTheme), 
    Padding = require(l_Parent_0.Style.Padding), 
    StudioColorClasses = require(l_Parent_0.Style.ColorSystem.StudioColorClasses), 
    StyleKey = require(l_Parent_0.Style.StyleKey), 
    ThemeSwitcher = require(l_Parent_0.Style.ThemeSwitcher), 
    Themes = {
        BaseTheme = require(l_Parent_0.Style.Themes.BaseTheme), 
        DarkTheme = require(l_Parent_0.Style.Themes.DarkTheme), 
        LightTheme = require(l_Parent_0.Style.Themes.LightTheme), 
        StudioTheme = require(l_Parent_0.Style.Themes.StudioTheme)
    }
};