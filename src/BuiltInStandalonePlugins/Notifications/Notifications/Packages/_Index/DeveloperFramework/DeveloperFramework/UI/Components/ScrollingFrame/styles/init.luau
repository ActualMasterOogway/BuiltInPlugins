local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-ScrollingFrame", {}, {
    v1("> ScrollingFrame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TopImage = "rbxasset://textures/StudioSharedUI/ScrollBarTop.png", 
        MidImage = "rbxasset://textures/StudioSharedUI/ScrollBarMiddle.png", 
        BottomImage = "rbxasset://textures/StudioSharedUI/ScrollBarBottom.png", 
        ScrollingEnabled = true, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 8, 
        ScrollBarImageTransparency = 0, 
        ScrollBarImageColor3 = "$SecondaryMain", 
        VerticalScrollBarInset = Enum.ScrollBarInset.Always
    }), 
    v1(".modern > ScrollingFrame", {
        ScrollBarImageTransparency = 0, 
        ScrollBarImageColor3 = "$ScrollBarColor"
    })
});