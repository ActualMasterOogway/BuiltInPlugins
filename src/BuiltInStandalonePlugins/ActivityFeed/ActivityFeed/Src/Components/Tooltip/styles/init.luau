local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_defaultPadding_0 = v2.defaultPadding;
local l_detailFontSize_0 = v2.detailFontSize;
local v5 = 16 / l_detailFontSize_0;
return l_createStyleRule_0(".Component-Tooltip", {
    BackgroundColor3 = "$ForegroundContrast", 
    BorderSizePixel = 1, 
    BorderColor3 = "$Divider", 
    Position = UDim2.new(0, 0, 1, 0), 
    Size = UDim2.new(0.5, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.Y
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, l_defaultPadding_0), 
        PaddingBottom = UDim.new(0, l_defaultPadding_0), 
        PaddingLeft = UDim.new(0, l_defaultPadding_0), 
        PaddingRight = UDim.new(0, l_defaultPadding_0)
    }), 
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, l_defaultPadding_0)
    }), 
    l_createStyleRule_0("> TextLabel", {
        TextColor3 = "$TextPrimary", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextSize = l_detailFontSize_0, 
        TextWrapped = true, 
        LineHeight = v5
    })
});