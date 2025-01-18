local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_StyleKey_0 = require(l_Parent_1.Framework).Style.StyleKey;
local v3 = require(l_Parent_0.Enums.ViewType);
local v4 = UDim.new(0, 6);
return {
    BackgroundColor = l_StyleKey_0.ScrollBarBackground, 
    GridItemBackgroundColor = l_StyleKey_0.Button, 
    GridItemBackgroundColorApplied = l_StyleKey_0.BackgroundDefault, 
    GridItemBackgroundColorHovered = l_StyleKey_0.ButtonHover, 
    GridItemBorderColor = l_StyleKey_0.Border, 
    GridItemBorderColorSelected = l_StyleKey_0.InputFieldBorderSelected, 
    GridItemCornerRadius = UDim.new(0, 6), 
    GridItemPadding = 4, 
    GridItemSize = 128, 
    GridItemLabelPadding = {
        PaddingBottom = v4, 
        PaddingLeft = v4, 
        PaddingRight = v4
    }, 
    ListItemBackgroundColor = l_StyleKey_0.Button, 
    ListItemHeight = 40, 
    ListItemPadding = 0, 
    ListItemSpacing = 4, 
    MaterialPreviewStyle = "CornerBox", 
    Padding = 0, 
    ShimmerSizeOffset = 2, 
    SnapshotSize = UDim2.fromOffset(64, 64), 
    TextSize = 20, 
    TooltipDelay = 0.3, 
    ViewType = v3.Grid
};