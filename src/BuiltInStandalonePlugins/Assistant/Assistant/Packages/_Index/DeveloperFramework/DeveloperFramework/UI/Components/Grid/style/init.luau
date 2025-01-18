local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.UI.Components.UIFolderData);
local l_Arrow_0 = require(v2.ExpandablePane.style).Header.Arrow;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
return {
    BackgroundColor = v1.ScrollBarBackground, 
    CellGroupHeader = {
        Arrow = l_join_0(l_Arrow_0, {
            ImageColor3 = v1.TextSecondary
        }), 
        ArrowButtonSize = UDim2.fromOffset(16, 16), 
        BackgroundColor = v1.CategoryItem, 
        Padding = {
            Left = 8
        }, 
        Size = UDim2.new(1, 0, 0, 28), 
        Spacing = 6, 
        Style = "RoundBox", 
        TextColor = v1.TextSecondary, 
        TextSize = 16
    }, 
    CellSize = UDim2.fromOffset(64, 64), 
    CellPadding = UDim2.fromScale(0, 0), 
    GridCell = {
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