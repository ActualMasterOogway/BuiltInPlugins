local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = v1.MainText
    }, 
    Indent = 20, 
    CellSpacing = 5, 
    CellPadding = {
        Top = 1, 
        Bottom = 1, 
        Left = 5, 
        Right = 5
    }, 
    SchemaCellPadding = {
        Top = 1, 
        Bottom = 1, 
        Left = 1, 
        Right = 1
    }, 
    IconSize = 24
};