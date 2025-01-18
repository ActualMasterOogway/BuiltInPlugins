local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Toolbar", {
    AnchorPoint = Vector2.new(0, 1), 
    Position = UDim2.fromScale(0, 1)
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingBottom = "$Padding"
    }), 
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, 
        Padding = "$Padding", 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Wraps = true, 
        HorizontalFlex = Enum.UIFlexAlignment.None
    })
}, {});