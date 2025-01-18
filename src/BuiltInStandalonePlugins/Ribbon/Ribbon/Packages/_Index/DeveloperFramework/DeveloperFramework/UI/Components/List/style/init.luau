local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    RowHeight = 24, 
    ListRow = {
        Padding = 5, 
        Spacing = 10
    }, 
    ScrollingFrame = {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TopImage = "rbxasset://textures/StudioSharedUI/ScrollBarTop.png", 
        MidImage = "rbxasset://textures/StudioSharedUI/ScrollBarMiddle.png", 
        BottomImage = "rbxasset://textures/StudioSharedUI/ScrollBarBottom.png", 
        ScrollBarThickness = 8, 
        ScrollBarImageTransparency = 0, 
        ScrollBarImageColor3 = v1.ScrollBar, 
        VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
        HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    }
};