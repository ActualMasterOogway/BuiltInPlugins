local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local l_ImprovedCursors_0 = game:GetFastFlag("ImprovedCursors");
local v5 = {
    ColorControlPoint = Color3.fromRGB(255, 100, 100), 
    ColorControlPointHovered = Color3.fromRGB(175, 70, 75), 
    ColorControlPointPressed = Color3.fromRGB(100, 30, 50), 
    ColorControlLine = Color3.fromRGB(100, 200, 100), 
    ColorAnalyzerCurveIn = Color3.fromRGB(150, 100, 50), 
    ColorAnalyzerCurveOut = Color3.fromRGB(200, 150, 75), 
    ColorAnalyzerCurveGain = Color3.fromRGB(150, 200, 75), 
    ColorAnalyzerCurveSidechain = Color3.fromRGB(150, 75, 225), 
    ColorCurve = Color3.fromRGB(255, 100, 100), 
    ColorCurveDisabled = Color3.fromRGB(155, 100, 100), 
    ColorGridLine = Color3.fromRGB(155, 155, 155), 
    ColorKnobArc = Color3.fromRGB(0, 155, 255), 
    ColorKnobTick = Color3.fromRGB(0, 155, 255), 
    CursorOpenedHand = l_ImprovedCursors_0 and "rbxasset://textures/Cursors/DragDetector/HoverCursor.png" or "rbxasset://textures/advCursor-openedHand.png", 
    CursorHorizontal = "SizeEW", 
    CursorVertical = "SizeNS"
};
return l_createStyleSheet_0("AudioCompressorEditor", {
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        FontFace = Enum.Font.SourceSans
    }), 
    l_createStyleRule_0(".Input", {
        BackgroundColor3 = "$ColorInputBox"
    }), 
    l_createStyleRule_0(".GridLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".GridLabel", {
        BackgroundTransparency = 1, 
        TextColor3 = "$ColorGridLine", 
        TextSize = 10
    }, {
        l_createStyleRule_0(".ControlLabel", {
            TextColor3 = "$ColorControlLine"
        })
    }), 
    l_createStyleRule_0(".AnalyzerCurveSidechain", {
        ZIndex = 4, 
        Color3 = "$ColorAnalyzerCurveSidechain", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".AnalyzerCurveIn", {
        ZIndex = 5, 
        Color3 = "$ColorAnalyzerCurveIn", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".AnalyzerCurveOut", {
        ZIndex = 6, 
        Color3 = "$ColorAnalyzerCurveOut", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".AnalyzerCurveGain", {
        ZIndex = 7, 
        Color3 = "$ColorAnalyzerCurveGain", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".Curve", {
        ZIndex = 10, 
        Color3 = "$ColorCurve", 
        Thickness = 2
    }), 
    l_createStyleRule_0(".CurveDisabled", {
        ZIndex = 10, 
        Color3 = "$ColorCurveDisabled", 
        Thickness = 2
    }), 
    l_createStyleRule_0(".ControlPoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorControlPoint", 
        Size = UDim2.fromOffset(12, 12), 
        ZIndex = 20
    }), 
    l_createStyleRule_0(".ControlLine", {
        BorderSizePixel = 0, 
        ZIndex = 20, 
        BackgroundColor3 = "$ColorControlLine"
    }), 
    l_createStyleRule_0(".GridCurve", {
        Color3 = "$ColorGridLine", 
        Thickness = 2
    }), 
    l_createStyleRule_0(".GuideCurve", {
        Color3 = "$ColorControlLine", 
        Thickness = 1
    }), 
    l_createStyleRule_0(".Knob", {
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorKnob"
    }), 
    l_createStyleRule_0(".KnobBackArc", {
        Color3 = "$ColorKnobBackArc", 
        Thickness = 3
    }), 
    l_createStyleRule_0(".KnobArc", {
        Color3 = "$ColorKnobArc", 
        Thickness = 3
    }), 
    l_createStyleRule_0(".KnobTick", {
        Color3 = "$ColorKnobTick", 
        Thickness = 3
    }), 
    l_createStyleRule_0(".TopButton", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$ColorTopButton"
    }), 
    l_createStyleRule_0(".DoubleArrowButton", {})
}, v5);