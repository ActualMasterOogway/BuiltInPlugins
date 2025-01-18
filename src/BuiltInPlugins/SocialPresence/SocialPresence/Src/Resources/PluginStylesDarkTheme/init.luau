local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet("SocialPresenceDarkTheme", {}, {
    ActivityRingImage = "rbxasset://studio_svg_textures/Lua/SocialPresence/Dark/Large/ActivityRing.png", 
    AddCollaboratorIcon = "rbxasset://studio_svg_textures/Shared/WidgetIcons/Dark/Standard/AddCollaborator.png"
});