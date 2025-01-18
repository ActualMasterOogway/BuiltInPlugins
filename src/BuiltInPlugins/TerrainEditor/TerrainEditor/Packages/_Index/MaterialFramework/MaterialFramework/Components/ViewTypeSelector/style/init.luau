local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Framework).Style.StyleKey;
return {
    BackgroundColor = l_StyleKey_0.Button, 
    IconColor = l_StyleKey_0.ButtonText, 
    IconSize = 16, 
    ItemSize = UDim2.new(1, 0, 0, 40), 
    GridIcon = "rbxasset://textures/MaterialFramework/Grid.png", 
    ListIcon = "rbxasset://textures/MaterialFramework/List.png", 
    Size = UDim2.fromOffset(50, 30), 
    SliderAnchorPoint = Vector2.new(0.5, 0.5), 
    SliderPosition = UDim2.fromScale(0.5, 0.5), 
    SliderSize = UDim2.new(1, -10, 0, 20)
};