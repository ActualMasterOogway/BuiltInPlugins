local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Framework).Style.StyleKey;
return {
    Color = l_StyleKey_0.DialogMainButton, 
    HoverColor = l_StyleKey_0.DialogMainButtonHover, 
    SliceCenter = Rect.new(3, 3, 4, 4), 
    SliceCenterFull = Rect.new(3, 3, 13, 13), 
    BackgroundImageLeft = "rbxasset://textures/AvatarToolsShared/RoundedBackgroundLeft.png", 
    BackgroundImageRight = "rbxasset://textures/AvatarToolsShared/RoundedBackgroundRight.png", 
    BackgroundImageFull = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
    ArrowSize = 8, 
    ArrowIcon = "rbxasset://textures/DeveloperFramework/button_arrow_down.png", 
    ButtonSpacing = 10, 
    TextSize = 16
};