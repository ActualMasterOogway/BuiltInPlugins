local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Framework).Style.StyleKey;
return {
    TileSize = UDim2.new(0, 140, 0, 160), 
    TileInnerBorder = Vector2.new(10, 10), 
    ThumbnailFrameSize = UDim2.new(0, 120, 0, 118), 
    TextLabelSize = UDim2.new(0, 120, 0, 22), 
    ButtonBackgroundColor = l_StyleKey_0.Button, 
    ButtonPressedColor = l_StyleKey_0.ButtonHover, 
    TextSize = 18, 
    ThumbnailBackgroundColor = l_StyleKey_0.CategoryItem
};