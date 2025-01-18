local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_Style_0 = l_Parent_0.Style;
local v3 = require(l_Style_0.StyleKey);
local v4 = {
    BackgroundColor = v3.AlertBackgroundDefault, 
    BackgroundColorHoverDarkerMultiplier = 0.15, 
    StrokeColor = v3.OtherDivider, 
    StrokeTransparency = 0.5, 
    TitleFont = Enum.Font.SourceSansBold, 
    PrimaryActionFont = Enum.Font.SourceSans, 
    TextColor = v3.TextPrimary, 
    TextSize = 18, 
    TopPadding = UDim.new(0, 7), 
    HorizontalPadding = UDim.new(0, -10), 
    IconPosition = UDim2.fromOffset(0, 2), 
    IconSize = UDim2.fromOffset(16, 16), 
    ContentsSpacing = 8, 
    CornerRadius = UDim.new(0, 8), 
    InnerPadding = 12, 
    MaxWidth = 500, 
    HoverCircleAdditionalSize = UDim2.fromOffset(6, 6), 
    HoverCircleColor = v3.TextSecondary, 
    HoverCircleTransparency = 0.7, 
    CloseButtonImage = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Close.png"
};
return v1.join(v4, {
    ["&Warning"] = v1.join(v4, {
        BackgroundColor = v3.AlertBackgroundWarning, 
        Icon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Warning.png", 
        HoverCircleColor = Color3.new(0.4, 0.4, 0.4), 
        TextColor = Color3.fromRGB(28, 28, 28), 
        StrokeThickness = 0
    }), 
    ["&Error"] = v1.join(v4, {
        BackgroundColor = v3.AlertBackgroundError, 
        Icon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Error.png", 
        StrokeThickness = 0, 
        HoverCircleColor = Color3.new(1, 1, 1), 
        TextColor = Color3.new(1, 1, 1)
    }), 
    ["&Success"] = v1.join(v4, {
        BackgroundColor = v3.AlertBackgroundSuccess, 
        Icon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Success.png", 
        StrokeThickness = 0, 
        HoverCircleColor = Color3.new(1, 1, 1), 
        HoverCircleTransparency = 0.8, 
        TextColor = Color3.new(1, 1, 1)
    }), 
    ["&Info"] = v1.join(v4, {
        BackgroundColor = v3.AlertBackgroundInfo, 
        Icon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Info.png", 
        StrokeThickness = 0, 
        HoverCircleColor = Color3.new(1, 1, 1), 
        TextColor = Color3.new(1, 1, 1)
    }), 
    ["&Notice"] = v1.join(v4, {
        Icon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Large/" .. "Info.png", 
        StrokeThickness = 0, 
        HoverCircleColor = Color3.new(1, 1, 1), 
        TextColor = Color3.new(1, 1, 1)
    })
});