local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-PopoverBase", {
    BackgroundColor3 = require(l_Parent_0.Bin.Common.defineLuaFlags).fflagAnnotationsModernColors and "$SemanticColorSurface200" or "$ForegroundContrast", 
    BackgroundTransparency = 0.1, 
    AutomaticSize = Enum.AutomaticSize.Y
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = 18
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, 12), 
        PaddingLeft = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 16)
    })
});