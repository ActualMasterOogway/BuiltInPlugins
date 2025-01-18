local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".MinimalButton", {
    BackgroundTransparency = 1, 
    Size = "$HeaderButtonSize"
}, {
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ActionHover", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(".Disabled", {}, {
        l_createStyleRule_0(":hover", {
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("> ImageLabel", {
            ImageTransparency = "$IconDisabled"
        })
    }), 
    l_createStyleRule_0(".Enabled > ImageLabel", {
        ImageColor3 = "$ActionSelected"
    })
});