local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("CancellableDialogDarkTheme", {}, {
    LoadingSpinnerImage = "rbxasset://studio_svg_textures/Lua/Dialog/Dark/Standard/Spinner.png", 
    CancelButtonBorderSizePixel = 0, 
    CancelButtonBorderColor3 = "$Gray50", 
    CancelButtonBorderTransparency = 1, 
    SemanticColorBackdrop = Color3.fromHex("#EEEEEE")
});