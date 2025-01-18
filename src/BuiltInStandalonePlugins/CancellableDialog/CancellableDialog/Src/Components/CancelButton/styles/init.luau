local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CancelButton", {}, {
    l_createStyleRule_0(">> .Cancel-Button", {
        Font = Enum.Font.SourceSans, 
        TextSize = "$NormalTextSize", 
        TextColor3 = "$TextContrast", 
        TextXAlignment = Enum.TextXAlignment.Center, 
        BackgroundTransparency = "$NotTransparent", 
        BackgroundColor3 = "$Gray70", 
        TextTransparency = "$NotTransparent"
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 16)
        }), 
        l_createStyleRule_0(".Enabled :hover", {
            BackgroundColor3 = "$Gray60"
        }), 
        l_createStyleRule_0(".Disabled", {
            TextTransparency = "$TextDisabledTransparency"
        }), 
        l_createStyleRule_0("::UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Thickness = "$CancelButtonBorderSizePixel", 
            Transparency = "$CancelButtonBorderTransparency", 
            Color = "$CancelButtonBorderColor3"
        })
    })
});