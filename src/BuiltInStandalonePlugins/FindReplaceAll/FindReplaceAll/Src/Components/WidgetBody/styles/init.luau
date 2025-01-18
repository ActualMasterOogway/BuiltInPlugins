local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants);
return l_createStyleRule_0(".Component-WidgetBody", {
    BorderSizePixel = 1, 
    TextColor3 = "$TextPrimary", 
    Size = UDim2.new(1, 0, 1, 0)
}, {
    l_createStyleRule_0(":: UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalFlex = Enum.UIFlexAlignment.None, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        ItemLineAlignment = Enum.ItemLineAlignment.Start
    }), 
    l_createStyleRule_0("> .ResultsLine", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, v2.widgetHeaderLineHeight), 
        BackgroundColor3 = "$ForegroundContrast"
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0("> .ResultsText", {
            BackgroundColor3 = "$BackgroundDefault", 
            TextColor3 = "$TextSecondary", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v2.labelTextSize
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 15), 
                PaddingRight = UDim.new(0, 10)
            }), 
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        })
    }), 
    l_createStyleRule_0(".ResultsTree", {
        BackgroundColor3 = "$BackgroundDefault", 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0
    })
});