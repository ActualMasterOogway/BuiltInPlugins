local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("DirectionalCurveEditorDarkTheme", {}, {
    ColorGridLine = Color3.fromRGB(155, 155, 155), 
    ColorGridLinePath = Color3.fromRGB(100, 100, 100), 
    ColorControlPointHighlight = Color3.fromRGB(250, 250, 250)
});