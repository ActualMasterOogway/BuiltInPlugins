local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Framework).Style.StyleKey;
return {
    Color = l_StyleKey_0.MainBackground, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    PressedColor = l_StyleKey_0.DialogMainButton, 
    BorderColor = l_StyleKey_0.Border, 
    SliceCenter = Rect.new(3, 3, 4, 4), 
    BackgroundImageLeft = "rbxasset://textures/AvatarToolsShared/RoundedBackgroundLeft.png", 
    BorderImageLeft = "rbxasset://textures/AvatarToolsShared/RoundedBorderLeft.png", 
    BackgroundImageRight = "rbxasset://textures/AvatarToolsShared/RoundedBackgroundRight.png", 
    BorderImageRight = "rbxasset://textures/AvatarToolsShared/RoundedBorderRight.png"
};