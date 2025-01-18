local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("AudioCompressorEditorDarkTheme", {}, {
    ColorInputBox = Color3.fromRGB(30, 30, 30), 
    ColorKnob = Color3.fromRGB(60, 60, 60), 
    ColorKnobBackArc = Color3.fromRGB(10, 10, 10), 
    ColorTopButton = Color3.fromRGB(80, 80, 80), 
    DoubleArrow = "rbxasset://studio_svg_textures/Lua/AudioCompressorEditor/Dark/Standard/DoubleArrowDefaultDark.png"
});