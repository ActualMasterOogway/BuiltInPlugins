local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    ArrowImage = "rbxasset://textures/DeveloperFramework/arrow_right.png", 
    ArrowSize = UDim2.fromOffset(20, 20), 
    ArrowColor = v1.SubText, 
    DotColor = v1.TextDisabled, 
    DotImage = "rbxasset://textures/StudioSharedUI/dot.png", 
    DotsInset = 50, 
    DotSize = UDim2.fromOffset(6, 6), 
    SelectedColor = v1.TextPrimary
};