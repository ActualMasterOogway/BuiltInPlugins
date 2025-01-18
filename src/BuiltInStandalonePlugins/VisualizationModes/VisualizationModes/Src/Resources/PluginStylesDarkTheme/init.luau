local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = {
    VisualizationModesHighlightColor = "$Blue70", 
    VisualizationModesHighlightTextColor = "$White", 
    VisualizationModesDivider = "$Gray110", 
    VisualizationModesDimActionHover = "$Gray80", 
    VisualizationModesBadgeBackground = "$Gray70", 
    VisualizationModesBadgeText = "$White"
};
return v1.Styling.createStyleSheet("VisualizationModesDarkTheme", {}, v2);