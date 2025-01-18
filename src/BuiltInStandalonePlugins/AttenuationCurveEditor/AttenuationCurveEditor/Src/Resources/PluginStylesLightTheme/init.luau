local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("AttenuationCurveEditorLightTheme", {}, {
    ColorGridLine = Color3.fromRGB(100, 100, 100), 
    ColorKeypointHighlight = Color3.fromRGB(50, 50, 50), 
    ColorScrollbarButton = Color3.fromRGB(200, 200, 200), 
    ColorScrollbarButtonPressed = Color3.fromRGB(170, 170, 170), 
    ColorScrollbarButtonHovered = Color3.fromRGB(230, 230, 230), 
    ColorScrollbarButtonBorder = Color3.fromRGB(100, 100, 100), 
    ColorScrollbarButtonText = Color3.fromRGB(0, 0, 0)
});