local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("CancellableDialogLightTheme", {}, {
    LoadingSpinnerImage = "rbxasset://studio_svg_textures/Lua/Dialog/Light/Standard/Spinner.png", 
    CancelButtonBorderSizePixel = 1, 
    CancelButtonBorderColor3 = "$Gray50", 
    CancelButtonBorderTransparency = 0, 
    SemanticColorBackdrop = Color3.fromHex("#000000")
});