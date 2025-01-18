local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Border = v1.Border, 
    ScrollHeaderPadding = {
        Right = 10
    }, 
    ListPadding = {
        Top = 1, 
        Left = 0, 
        Bottom = 0, 
        Right = 0
    }, 
    RowHeight = 24, 
    HeaderCellPadding = 5, 
    HeaderHeight = 32, 
    FooterHeight = 36, 
    IconColor = v1.Icon
};