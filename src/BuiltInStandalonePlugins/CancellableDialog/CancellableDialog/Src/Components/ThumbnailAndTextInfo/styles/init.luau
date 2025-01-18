local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-ThumbnailAndTextInfo", {}, {
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, 16)
    }), 
    l_createStyleRule_0(">> .Thumbnail", {
        Size = "$ThumbnailSize", 
        BackgroundTransparency = "$Transparent"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    })
}, {
    ThumbnailSize = UDim2.fromOffset(50, 50), 
    ThumbnailToContentPadding = UDim.new(0, 16), 
    ShimmerSize = UDim2.new(2, 0, 1, 0), 
    ShimmerInitialPosition = UDim2.new(0, 0, 0, 0), 
    Transparent = 1, 
    ShimmerAngle = 45
});