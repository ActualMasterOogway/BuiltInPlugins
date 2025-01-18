local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_defaultPadding_0 = v2.defaultPadding;
local v4 = l_defaultPadding_0 * 3;
local v5 = v2.normalFontSize + v4 + l_defaultPadding_0;
return l_createStyleRule_0(".Component-ActivityHistoryBubbleListSectionHeader", {
    Size = UDim2.new(1, 0, 0, v5)
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, v4), 
        PaddingBottom = UDim.new(0, l_defaultPadding_0), 
        PaddingLeft = UDim.new(0, l_defaultPadding_0), 
        PaddingRight = UDim.new(0, l_defaultPadding_0)
    }), 
    l_createStyleRule_0("> #Title", {
        TextColor3 = "$TextPrimary", 
        Font = v2.boldedFont
    })
});