local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = UDim2.fromOffset(16, 16);
return l_createStyleRule_0(".HeaderOptions", {}, {
    l_createStyleRule_0("> .ClearFilter", {
        Size = v2
    }), 
    l_createStyleRule_0("> .HoverableButton", {
        Size = "$HeaderButtonSize"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover", 
            BackgroundTransparency = 0
        })
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingRight = UDim.new(0, 20), 
        PaddingTop = UDim.new(0, 5), 
        PaddingBottom = UDim.new(0, 5)
    })
}, {
    FilterSize = UDim2.fromOffset(80, 32), 
    FilterIconSize = v2
});