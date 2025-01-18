local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-TreeViewRow", {
    Size = UDim2.new(1, 0, 0, 24)
}, {
    v1("::UIPadding", {
        PaddingTop = UDim.new(0, 1), 
        PaddingBottom = UDim.new(0, 1), 
        PaddingLeft = UDim.new(0, 5), 
        PaddingRight = UDim.new(0, 5)
    }), 
    v1(">> .Arrow", {
        Size = UDim2.fromOffset(12, 12), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        ImageColor3 = "$TextPrimary", 
        ImageRectSize = Vector2.new(12, 12)
    }), 
    v1("> .Tail", {
        AnchorPoint = Vector2.new(1, 0), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.fromScale(0, 1), 
        ZIndex = 2
    }, {
        v1("::UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 3), 
            PaddingRight = UDim.new(0, 10)
        })
    })
}, {
    ArrowSize = 12, 
    ArrowExpandedOffset = Vector2.new(24, 0), 
    ArrowCollapsedOffset = Vector2.new(12, 0), 
    RowHeight = 24, 
    Indent = 17
});