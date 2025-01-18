local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("DirectionalCurveEditorLightTheme", {}, {
    ColorGridLine = Color3.fromRGB(100, 100, 100), 
    ColorGridLinePath = Color3.fromRGB(75, 75, 75), 
    ColorControlPointHighlight = Color3.fromRGB(50, 50, 50)
});