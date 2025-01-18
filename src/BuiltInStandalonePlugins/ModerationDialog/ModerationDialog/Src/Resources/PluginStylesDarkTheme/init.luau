local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("ModerationDialogDarkTheme", {}, {
    CheckboxHoveredImage = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_hover_dark.png"
});