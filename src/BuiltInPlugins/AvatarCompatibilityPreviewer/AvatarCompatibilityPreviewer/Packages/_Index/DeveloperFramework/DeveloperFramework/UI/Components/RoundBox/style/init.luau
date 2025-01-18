local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Color = v1.MainBackground, 
    BorderColor = v1.Border, 
    Transparency = 0, 
    BorderTransparency = 0, 
    BackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
    BorderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
    SliceCenter = Rect.new(3, 3, 13, 13)
};