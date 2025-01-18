local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("AudioCompressorEditorLightTheme", {}, {
    ColorInputBox = Color3.fromRGB(220, 220, 220), 
    ColorKnob = Color3.fromRGB(200, 200, 200), 
    ColorKnobBackArc = Color3.fromRGB(160, 160, 160), 
    ColorTopButton = Color3.fromRGB(160, 160, 160), 
    DoubleArrow = "rbxasset://studio_svg_textures/Lua/AudioCompressorEditor/Light/Standard/DoubleArrowDefaultLight.png"
});