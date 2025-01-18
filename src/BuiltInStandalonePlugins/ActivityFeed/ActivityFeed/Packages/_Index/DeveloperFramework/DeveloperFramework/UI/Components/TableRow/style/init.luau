local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.StyleModifier);
local v2 = require(l_Parent_0.Style.StyleKey);
return {
    Text = v2.MainText, 
    Border = v2.SubBackground, 
    BackgroundOdd = v2.MainBackground, 
    BackgroundEven = v2.SubBackground2, 
    [v1.Hover] = {
        Text = v2.BrightText, 
        BackgroundOdd = v2.ActionHover, 
        BackgroundEven = v2.ActionHover, 
        Border = v2.SubBackground, 
        Tooltip = {
            MaxWidth = 1000
        }, 
        RowHeight = 24
    }, 
    [v1.Selected] = {
        Text = v2.BrightText, 
        BackgroundOdd = v2.ActionSelected, 
        BackgroundEven = v2.ActionSelected, 
        Border = v2.SubBackground, 
        Tooltip = {
            MaxWidth = 1000
        }, 
        RowHeight = 24
    }, 
    Tooltip = {
        MaxWidth = 1000
    }, 
    RowHeight = 24
};