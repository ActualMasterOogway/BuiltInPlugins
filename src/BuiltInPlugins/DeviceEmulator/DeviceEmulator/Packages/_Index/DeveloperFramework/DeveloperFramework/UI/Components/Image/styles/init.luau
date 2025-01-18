local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-Image", {
    Size = UDim2.fromScale(1, 1), 
    BackgroundTransparency = 1, 
    BorderSizePixel = 1
}, {
    v1(".Icon16", {
        Size = UDim2.fromOffset(16, 16)
    }), 
    v1(".Primary", {
        ImageColor3 = "$TextPrimary"
    }), 
    v1(".ArrowIcon", {
        Image = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        ImageColor3 = "$TextPrimary", 
        Size = UDim2.fromOffset(12, 12)
    }), 
    v1(".ErrorIcon", {
        Image = "rbxasset://textures/DeveloperFramework/StudioTheme/clear.png", 
        ImageColor3 = "$TextError", 
        Size = UDim2.fromOffset(16, 16)
    })
});