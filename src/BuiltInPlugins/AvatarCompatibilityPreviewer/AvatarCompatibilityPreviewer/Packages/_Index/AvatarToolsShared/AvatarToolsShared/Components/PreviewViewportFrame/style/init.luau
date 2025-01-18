local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return {
    BackgroundColor = require(l_Parent_0.Framework).Style.StyleKey.SubBackground, 
    PopoutButtonSize = 48, 
    PopoutButtonOffset = 12, 
    IconSize = 28, 
    Icon = "rbxasset://textures/AvatarToolsShared/Preview Undock.png", 
    RecenterIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Center Camera to Mannequin.png", 
    LayerOrderManagerSize = UDim2.fromOffset(42, 210), 
    LayerOrderManagerPosition = UDim2.new(1, -10, 0, 10), 
    LayerOrderManagerAnchorPoint = Vector2.new(1, 0), 
    PreviewAvatarWheelSize = UDim2.fromOffset(144, 48), 
    PreviewAvatarWheelPosition = UDim2.new(0.5, 0, 1, -10), 
    PreviewAvatarWheelAnchorPoint = Vector2.new(0.5, 1)
};