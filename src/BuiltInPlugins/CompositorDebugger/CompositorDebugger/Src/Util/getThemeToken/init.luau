local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_ThemeSwitcher_0 = require(l_script_FirstAncestor_0.Packages.Framework).Style.ThemeSwitcher;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_ThemeSwitcher_0 (copy), l_script_FirstAncestor_0 (copy)
    return (if l_ThemeSwitcher_0.getThemeName() == "Dark" then require(l_script_FirstAncestor_0.Src.Resources.PluginStylesDarkTheme) else require(l_script_FirstAncestor_0.Src.Resources.PluginStylesLightTheme)):GetAttribute(v2);
end;