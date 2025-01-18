local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local _ = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v2.Styling.createStyleRule;
local l_createStyleSheet_0 = v2.Styling.createStyleSheet;
local l_ImprovedCursors_0 = game:GetFastFlag("ImprovedCursors");
local v6 = {
    ColorControlPoint = Color3.fromRGB(255, 100, 100), 
    ColorControlPointHovered = Color3.fromRGB(175, 70, 75), 
    ColorControlPointPressed = Color3.fromRGB(100, 30, 50), 
    ColorAnalyzerCurve = Color3.fromRGB(200, 150, 75), 
    ColorFullCurve = Color3.fromRGB(255, 100, 100), 
    ColorFullCurveDisabled = Color3.fromRGB(155, 100, 100), 
    ColorCurve = Color3.fromRGB(155, 155, 155), 
    ColorGridLine = Color3.fromRGB(155, 155, 155), 
    CursorOpenedHand = l_ImprovedCursors_0 and "rbxasset://textures/Cursors/DragDetector/HoverCursor.png" or "rbxasset://textures/advCursor-openedHand.png"
};
return l_createStyleSheet_0("AudioEqualizerEditor", {
    l_createStyleRule_0(".GridLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".GridLabel", {
        BackgroundTransparency = 1, 
        TextColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".AnalyzerCurve", {
        ZIndex = 10, 
        Color3 = "$ColorAnalyzerCurve", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".FullCurve", {
        ZIndex = 10, 
        Color3 = "$ColorFullCurve", 
        Thickness = 2
    }), 
    l_createStyleRule_0(".FullCurveDisabled", {
        ZIndex = 10, 
        Color3 = "$ColorFullCurveDisabled", 
        Thickness = 2
    }), 
    l_createStyleRule_0(".Curve", {
        ZIndex = 9, 
        Color3 = "$ColorCurve", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".ControlPoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorControlPoint", 
        Size = UDim2.fromOffset(24, 24), 
        ZIndex = 20
    }, {
        l_createStyleRule_0("> ImageLabel", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/smallWhiteCircle.png", 
            ImageTransparency = 0.6, 
            Position = UDim2.fromScale(0.1, 0.1), 
            Size = UDim2.fromScale(0.8, 0.8), 
            ZIndex = 21
        }), 
        l_createStyleRule_0("> TextLabel", {
            BackgroundTransparency = 1, 
            FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold), 
            Position = UDim2.fromScale(0.1, 0.1), 
            Size = UDim2.fromScale(0.8, 0.8), 
            TextSize = 18, 
            ZIndex = 22
        }), 
        l_createStyleRule_0(".Hovered", {
            ImageColor3 = "$ColorControlPointHovered"
        }), 
        l_createStyleRule_0(".Pressed", {
            ImageColor3 = "$ColorControlPointPressed"
        })
    }), 
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = Enum.Font.SourceSans, 
        TextSize = 15
    })
}, v6);