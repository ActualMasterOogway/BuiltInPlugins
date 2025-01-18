local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Padding = 2, 
    Spacing = 5, 
    ButtonSize = 32, 
    IconSize = 24, 
    IconColor = v1.Icon, 
    InputWidth = 38
};