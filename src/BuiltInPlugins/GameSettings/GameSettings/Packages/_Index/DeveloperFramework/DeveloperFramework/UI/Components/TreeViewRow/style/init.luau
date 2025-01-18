local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.StyleModifier);
local v2 = require(l_Parent_0.Style.StyleKey);
return {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = v2.MainText
    }, 
    Border = v2.SubBackground, 
    Background = v2.MainBackground, 
    Indent = 17, 
    [v1.Hover] = {
        Background = v2.ButtonHover
    }, 
    [v1.Selected] = {
        Background = v2.ActionSelected
    }, 
    Tooltip = {
        MaxWidth = 1000
    }, 
    RowHeight = 24, 
    Spacing = 5, 
    TailPadding = {
        Top = 0, 
        Bottom = 0, 
        Left = 3, 
        Right = 10
    }, 
    Padding = {
        Top = 1, 
        Bottom = 1, 
        Left = 5, 
        Right = 5
    }
};