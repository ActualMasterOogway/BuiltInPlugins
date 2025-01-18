local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return {
    Base = v1.Styling.createStyleSheet("Explorer", {
        l_createStyleRule_0(".BG-Surface100", {
            BackgroundColor3 = "$RDLSemanticColorSurface100", 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }), 
        l_createStyleRule_0(".Text-Default", {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            BackgroundTransparency = 1, 
            TextColor3 = "$RDLSemanticColorContentDefault"
        }), 
        l_createStyleRule_0(".Text-Emphasis", {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            BackgroundTransparency = 1, 
            TextColor3 = "$RDLSemanticColorContentEmphasis"
        }), 
        l_createStyleRule_0(".Text-Emphasis-Bold", {
            Font = Enum.Font.SourceSansBold, 
            TextSize = 16, 
            BackgroundTransparency = 1, 
            TextColor3 = "$RDLSemanticColorContentEmphasis"
        }), 
        l_createStyleRule_0(".Properties-Rounded ::UICorner", {
            CornerRadius = "$RDLSemanticNumberRadiusSmall"
        }), 
        l_createStyleRule_0(".Properties-Textbox", {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            BackgroundColor3 = "$RDLSemanticColorShift200", 
            BackgroundTransparency = "$RDLSemanticNumberShift200", 
            TextColor3 = "$RDLSemanticColorContentEmphasis"
        }), 
        l_createStyleRule_0(".Properties-Textbox ::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        l_createStyleRule_0(".Properties-Editing ::UIStroke", {
            Color = "$RDLSemanticColorSystemEmphasis", 
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }), 
        l_createStyleRule_0(".Properties-Editing > #Chip", {
            BackgroundTransparency = 1
        })
    }, {}), 
    Dark = v1.Styling.createStyleSheet("ExplorerDark", {}, {
        RDLSemanticColorActionPrimaryBrandFill = Color3.fromHex("#3C64FA"), 
        RDLSemanticColorActionSecondary = Color3.fromHex("#BBC2D1"), 
        RDLSemanticColorActionSecondaryTransparency = 0.88, 
        RDLSemanticColorContentMuted = Color3.fromHex("#BBBCBE"), 
        RDLSemanticColorContentDefault = Color3.fromHex("#A5A9B6"), 
        RDLSemanticColorContentEmphasis = Color3.fromHex("#F4F4F6"), 
        RDLSemanticColorSystemEmphasis = Color3.fromHex("#335FFF"), 
        RDLSemanticColorSurface100 = Color3.fromHex("#1F2024"), 
        RDLSemanitcColorShift200 = Color3.fromHex("#D0D9FB"), 
        RDLSemanticNumberShift200 = 0.9215686274509804, 
        RDLSemanticNumberRadiusSmall = UDim.new(0, 4), 
        RDLSemanticColorStatesHover = Color3.fromHex("#BBC2D1")
    }), 
    Light = v1.Styling.createStyleSheet("ExplorerLight", {}, {
        RDLSemanticColorActionPrimaryBrandFill = Color3.fromHex("#3C64FA"), 
        RDLSemanticColorActionSecondary = Color3.fromHex("#333B4C"), 
        RDLSemanticColorActionSecondaryTransparency = 0.92, 
        RDLSemanticColorContentMuted = Color3.fromHex("#696A6D"), 
        RDLSemanticColorContentDefault = Color3.fromHex("#111216"), 
        RDLSemanticColorContentEmphasis = Color3.fromHex("#000000"), 
        RDLSemanticColorSurface100 = Color3.fromHex("#FFFFFF"), 
        RDLSemanticColorStatesHover = Color3.fromHex("#333B4C")
    })
};