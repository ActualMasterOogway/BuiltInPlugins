local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-Shimmer", {
    BackgroundTransparency = "$Transparent"
}, {
    l_createStyleRule_0(">> .ShimmerForeground", {
        BackgroundColor3 = "$SemanticColorBackdrop", 
        BackgroundTransparency = "$NotTransparent"
    }), 
    l_createStyleRule_0(">> .RoundedCorner8 ::UICorner", {
        CornerRadius = "$CornerSize8"
    }), 
    l_createStyleRule_0(">> .NoBorder", {
        BorderSizePixel = 0
    })
});