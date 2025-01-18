local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.StyleModifier);
local v2 = require(l_Parent_0.Style.StyleKey);
return {
    BorderSize = 1, 
    Spacing = 5, 
    Padding = {
        Left = 20, 
        Top = 4, 
        Bottom = 0, 
        Right = 20
    }, 
    TopLineHeight = 3, 
    Color = v2.ButtonText, 
    BackgroundColor = v2.SubBackground, 
    BorderColor = v2.SubBackground, 
    TopLineColor = v2.DialogMainButton, 
    BottomLineColor = v2.Border, 
    [v1.Hover] = {
        Color = v2.DialogMainButton
    }, 
    [v1.Selected] = {
        BottomLineColor = v2.SubBackground, 
        BackgroundColor = v2.MainBackground, 
        BorderColor = v2.Border
    }, 
    [v1.Disabled] = {
        Color = v2.ButtonTextDisabled
    }
};