local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-AddAnnotationPopup", {}, {
    l_createStyleRule_0("> #InputArea", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0)
    }), 
    l_createStyleRule_0("> #ErrorWrapper", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 40)
        })
    })
});