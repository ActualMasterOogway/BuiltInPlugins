local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CheckButton", {
    BorderSizePixel = 0, 
    Size = UDim2.new(0, 16, 0, 32)
}, {
    l_createStyleRule_0("> .CheckButton-Image", {
        Size = UDim2.new(0, 16, 0, 16), 
        BorderSizePixel = 0
    })
});