local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Packages.Framework).Style.StyleKey;
return {
    Padding = 2, 
    HeaderHeight = 33, 
    ButtonSize = 32, 
    IconSize = 24, 
    HeaderBorderColor = l_StyleKey_0.Border, 
    SelectedIconColor = l_StyleKey_0.DialogMainButton, 
    IconColor = l_StyleKey_0.MainText
};