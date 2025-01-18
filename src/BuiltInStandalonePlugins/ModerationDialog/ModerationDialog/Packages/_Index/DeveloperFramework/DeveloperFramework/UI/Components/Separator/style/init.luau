local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return {
    Color = require(l_Parent_0.Style.StyleKey).Border, 
    StretchMargin = 0, 
    Weight = 1
};