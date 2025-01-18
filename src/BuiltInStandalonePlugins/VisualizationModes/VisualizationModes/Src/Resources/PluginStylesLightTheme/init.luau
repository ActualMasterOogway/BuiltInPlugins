local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = {
    VisualizationModesHighlightColor = "$Blue70", 
    VisualizationModesDivider = "$Gray50", 
    VisualizationModesHighlightTextColor = "$White", 
    VisualizationModesDimActionHover = "$Gray30"
};
return v1.Styling.createStyleSheet("VisualizationModesLightTheme", {}, v2);