local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-TextInput", {
    AutomaticSize = Enum.AutomaticSize.Y, 
    BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorComponentInputFill" or "$ForegroundMain", 
    BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorComponentInputFillTransparency" or 0.4
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = 18
    }), 
    l_createStyleRule_0(".Error", {}, {
        l_createStyleRule_0("::UIStroke", {
            Thickness = 1, 
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$ErrorMain", 
            Transparency = 0.4
        })
    }), 
    l_createStyleRule_0("> ScrollingFrame", {
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 4, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("> TextBox", {
            TextColor3 = "$TextPrimary", 
            TextSize = "$FontSizeM", 
            LineHeight = 1.5, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextScaled = false, 
            ClearTextOnFocus = false, 
            Font = "$Font", 
            RichText = true
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 12)
            }), 
            l_createStyleRule_0(".Disabled", {
                BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorComponentInputDisabledTransparency" or 0.94, 
                TextTransparency = 0.4
            })
        })
    })
});