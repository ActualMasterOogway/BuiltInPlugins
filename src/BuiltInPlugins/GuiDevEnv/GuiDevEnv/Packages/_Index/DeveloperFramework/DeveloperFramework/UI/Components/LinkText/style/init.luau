local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Font = Enum.Font.SourceSans, 
    TextSize = 18, 
    TextColor = v1.LinkText, 
    TextColorHovered = v1.LinkTextHover, 
    ["&Body"] = {
        TextSize = 14
    }, 
    ["&Underlined"] = {
        ForceUnderline = true, 
        ShowUnderline = true
    }, 
    ["&Unobtrusive"] = {
        ShowUnderline = false, 
        TextColor = v1.MainText, 
        TextColorHovered = v1.LinkTextHover, 
        TextSize = 14
    }
};