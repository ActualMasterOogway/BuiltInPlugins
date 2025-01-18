local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-ReactivateDateNote", {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 4), 
        SortOrder = Enum.SortOrder.LayoutOrder
    })
});