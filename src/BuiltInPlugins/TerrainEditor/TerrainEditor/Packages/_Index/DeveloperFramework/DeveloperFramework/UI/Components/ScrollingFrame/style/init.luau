local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    BackgroundColor3 = v1.MainBackground, 
    TopImage = "rbxasset://textures/StudioSharedUI/ScrollBarTop.png", 
    MidImage = "rbxasset://textures/StudioSharedUI/ScrollBarMiddle.png", 
    BottomImage = "rbxasset://textures/StudioSharedUI/ScrollBarBottom.png", 
    AutoSizeCanvas = true, 
    AutoSizeLayoutElement = "UIListLayout", 
    AutoSizeLayoutOptions = {
        Padding = UDim.new(0, 4)
    }, 
    ScrollBarBackgroundColor = v1.ScrollBarBackground, 
    ScrollingEnabled = true, 
    ScrollingDirection = Enum.ScrollingDirection.Y, 
    ScrollBarThickness = 8, 
    ScrollBarImageTransparency = 0, 
    ScrollBarImageColor3 = v1.ScrollBar, 
    VerticalScrollBarInset = Enum.ScrollBarInset.Always
};