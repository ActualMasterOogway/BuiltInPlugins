local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleConstants);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-WidgetHeader", {
    Font = v2.defaultFont, 
    TextColor3 = "$TextPrimary", 
    BackgroundColor3 = "$HeaderBackgroundColor", 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 0, v2.deviceHeaderHeight)
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8)
    }), 
    l_createStyleRule_0("::UISizeConstraint", {
        MinSize = Vector2.new(260, 0)
    }), 
    l_createStyleRule_0(">> .LeftContents", {
        BorderSizePixel = 0, 
        Size = UDim2.new(0, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        TextSize = v2.headerFontSize
    }, {
        l_createStyleRule_0("::UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Wraps = false
        })
    }), 
    l_createStyleRule_0(">> .RightContents", {
        Position = UDim2.new(0, 0, 0, 0), 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        TextSize = v2.headerFontSize
    }, {
        l_createStyleRule_0("::UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 4), 
            Wraps = false
        })
    })
});