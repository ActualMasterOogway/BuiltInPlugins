local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-SizedScrollingFrame", {
    ScrollingDirection = Enum.ScrollingDirection.Y, 
    ScrollBarThickness = 4, 
    BorderSizePixel = 0, 
    BackgroundTransparency = 1
}, {
    l_createStyleRule_0("PadScrollBar", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingRight = UDim.new(0, 12)
        })
    })
});