local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("AttenuationCurveEditorDarkTheme", {}, {
    ColorGridLine = Color3.fromRGB(155, 155, 155), 
    ColorKeypointHighlight = Color3.fromRGB(250, 250, 250), 
    ColorScrollbarButton = Color3.fromRGB(60, 60, 60), 
    ColorScrollbarButtonPressed = Color3.fromRGB(40, 40, 40), 
    ColorScrollbarButtonHovered = Color3.fromRGB(90, 90, 90), 
    ColorScrollbarButtonBorder = Color3.fromRGB(0, 0, 0), 
    ColorScrollbarButtonText = Color3.fromRGB(255, 255, 255)
});