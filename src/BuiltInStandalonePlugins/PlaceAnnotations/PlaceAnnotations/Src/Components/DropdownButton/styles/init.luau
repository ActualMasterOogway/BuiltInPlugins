local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-DropdownButton", {
    Size = UDim2.fromOffset(16, 16), 
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0(":hover", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$ResolveIconBase"
    }), 
    l_createStyleRule_0(":pressed", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$ResolveIconSelected"
    }), 
    l_createStyleRule_0(".Disabled", {
        ImageTransparency = 0.4
    })
});