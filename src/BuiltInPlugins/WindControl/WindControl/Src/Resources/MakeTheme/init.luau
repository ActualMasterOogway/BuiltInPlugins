local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioTheme_0 = require(l_Parent_0.Packages.Framework).Style.Themes.StudioTheme;
local v2 = {
    MainGui = {
        BackgroundPane = {
            ZIndex = 0, 
            Position = UDim2.new(0, -50, 0, 40), 
            Size = UDim2.fromOffset(210, 120), 
            Style = "CornerBox", 
            BackgroundColor = Color3.new(0.4, 0.4, 0.4), 
            Transparency = 0.65
        }, 
        ViewportFrame = {
            Size = UDim2.fromOffset(180, 160), 
            Position = UDim2.fromOffset(55, 15)
        }, 
        CameraFOV = 70
    }, 
    WindspeedDisplay = {
        Size = UDim2.fromOffset(85, 60), 
        Position = UDim2.fromScale(-0.2, 0.5), 
        ArrowDown = "rbxasset://textures/WindControl/ArrowDown.png", 
        ArrowUp = "rbxasset://textures/WindControl/ArrowUp.png", 
        TextLabel = {
            Size = UDim2.fromScale(1, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Style = {
                Font = Enum.Font.SourceSansSemibold, 
                TextSize = 26, 
                TextColor = Color3.new(1, 1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }
        }, 
        Slider = {
            Size = UDim2.fromOffset(195, 15), 
            Position = UDim2.fromScale(0, 1)
        }, 
        ButtonTextSize = 16, 
        ButtonSize = UDim2.fromScale(1, 0.33), 
        ButtonTransparency = 0.7, 
        MinusButtonPosition = UDim2.new(0.25, 0, 1, -20), 
        BigMinusButtonPosition = UDim2.new(0.05, 0, 1, -20), 
        PlusButtonPosition = UDim2.new(0.25, 0, 0, 0), 
        BigPlusButtonPosition = UDim2.new(0.05, 0, 0, 0), 
        activeLabelColor = Color3.new(1, 1, 1), 
        inactiveLabelColor = Color3.new(0.8, 0.8, 0.8)
    }
};
return function(v3) --[[ Line: 69 ]]
    -- upvalues: l_StudioTheme_0 (copy), v2 (copy)
    local _ = nil;
    return (if v3 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v2);
end;