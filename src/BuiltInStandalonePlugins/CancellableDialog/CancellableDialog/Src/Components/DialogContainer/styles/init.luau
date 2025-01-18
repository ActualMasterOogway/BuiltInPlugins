local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-DialogContainer", {
    BackgroundColor3 = "$ForegroundMain", 
    BorderSizePixel = 0, 
    BackgroundTransparency = 0
}, {
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 16), 
        SortOrder = Enum.SortOrder.LayoutOrder
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, 16), 
        PaddingRight = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16), 
        PaddingLeft = UDim.new(0, 16)
    })
}, {
    MinimumDialogSize = Vector2.new(400, 130)
});