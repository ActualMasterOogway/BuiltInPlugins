local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = 1 / (require(l_script_FirstAncestor_0.Src.Util.Constants).NUMBER_OF_HORIZONTAL_BARS_TRIGGER * 2);
return l_createStyleRule_0(".TriggerFrame", {
    AnchorPoint = Vector2.new(0.5, 0), 
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0(":: UIListLayout", {
        Padding = UDim.new(0, v2), 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalFlex = Enum.UIFlexAlignment.SpaceBetween, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        ItemLineAlignment = Enum.ItemLineAlignment.Center
    }), 
    l_createStyleRule_0("> .HorizontalBar", {
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = "$ControlInactiveColor"
    }, {
        l_createStyleRule_0(".Hover", {
            BackgroundColor3 = "$ControlHoverColor"
        }), 
        l_createStyleRule_0(".SelectedBlue", {
            BackgroundColor3 = "$ControlActiveColor"
        })
    })
});