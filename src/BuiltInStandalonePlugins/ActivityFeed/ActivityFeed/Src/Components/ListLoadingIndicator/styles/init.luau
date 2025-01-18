local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-ListLoadingIndicator", {
    Size = UDim2.new(1, 0, 0, v2.bubbleHeight), 
    BackgroundColor3 = "$ForegroundMain"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
    }), 
    l_createStyleRule_0("::UIStroke", {
        Color = "$Divider", 
        Thickness = 1
    })
});