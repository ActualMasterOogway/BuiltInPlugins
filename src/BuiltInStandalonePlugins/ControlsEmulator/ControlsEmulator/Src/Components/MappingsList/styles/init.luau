local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-MappingsList", {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Size = UDim2.new(0, 280, 0, 0), 
    AnchorPoint = Vector2.new(1, 0), 
    Position = UDim2.new(1, 0, 0, 0)
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, 20), 
        PaddingBottom = UDim.new(0, 20), 
        PaddingRight = UDim.new(0, 20)
    }), 
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, 2)
    })
});