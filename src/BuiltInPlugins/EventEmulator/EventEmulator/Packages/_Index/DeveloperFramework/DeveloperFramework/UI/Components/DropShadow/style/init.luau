local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return {
    Color = require(l_Parent_0.Style.StyleKey).Border, 
    Image = "rbxasset://textures/StudioSharedUI/dropShadow.png", 
    ImageSize = 16, 
    Offset = Vector2.new(), 
    Radius = 6, 
    Transparency = 0
};