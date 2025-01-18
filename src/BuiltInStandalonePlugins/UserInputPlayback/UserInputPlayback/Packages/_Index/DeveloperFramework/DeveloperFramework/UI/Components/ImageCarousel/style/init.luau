local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    LeftButton = {
        Icon = "rbxasset://textures/DeveloperFramework/icon_backward.png", 
        Padding = {
            Right = 3
        }, 
        Position = UDim2.new(0, 20, 0.5, 0), 
        ShouldMoveRight = false, 
        ZIndex = 2
    }, 
    MoveButtons = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor = v1.SecondaryMain, 
        Color = v1.SecondaryMuted, 
        Cursor = "PointingHand", 
        HoverColor = v1.SecondaryStatesHoverBackground, 
        IconScaleType = Enum.ScaleType.Fit, 
        IconSize = 16, 
        ImageTransparency = 0.5, 
        Size = UDim2.new(0, 24, 0, 24)
    }, 
    RightButton = {
        Icon = "rbxasset://textures/DeveloperFramework/icon_forward.png", 
        Padding = {
            Left = 3
        }, 
        Position = UDim2.new(1, -20, 0.5, 0), 
        ShouldMoveRight = true, 
        ZIndex = 3
    }, 
    ImageScaleType = Enum.ScaleType.Fit, 
    Size = UDim2.new(1, 0, 1, 0)
};