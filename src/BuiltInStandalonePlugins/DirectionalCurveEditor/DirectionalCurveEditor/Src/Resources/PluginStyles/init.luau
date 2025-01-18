local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local l_ImprovedCursors_0 = game:GetFastFlag("ImprovedCursors");
local v5 = {
    ColorCurve = Color3.fromRGB(255, 100, 100), 
    ColorCurveEnd = Color3.fromRGB(150, 150, 150), 
    ColorKeypoint = Color3.fromRGB(252, 116, 116), 
    ColorKeypointSelected = Color3.fromRGB(255, 0, 0), 
    ColorControlPoint = Color3.fromRGB(225, 100, 100), 
    ColorControlPointSelected = Color3.fromRGB(255, 200, 150), 
    ColorControlPointHovered = Color3.fromRGB(255, 150, 150), 
    ColorControlPointPressed = Color3.fromRGB(150, 50, 50), 
    CursorOpenedHand = l_ImprovedCursors_0 and "rbxasset://textures/Cursors/DragDetector/HoverCursor.png" or "rbxasset://textures/advCursor-openedHand.png"
};
return l_createStyleSheet_0("DirectionalCurveEditor", {
    l_createStyleRule_0(".GridLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".GridLinePath2D", {
        ZIndex = -1, 
        Thickness = 1, 
        Color3 = "$ColorGridLinePath"
    }), 
    l_createStyleRule_0(".GridLabel", {
        BackgroundTransparency = 1, 
        TextColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".CurveLinePath2D", {
        ZIndex = 4, 
        Thickness = 2, 
        Color3 = "$ColorCurve"
    }), 
    l_createStyleRule_0(".EndLinePath2D", {
        ZIndex = 4, 
        Thickness = 1, 
        Color3 = "$ColorCurveEnd"
    }), 
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = Enum.Font.SourceSans, 
        TextSize = 15
    }), 
    l_createStyleRule_0(".CurvePointOuter", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageColor3 = Color3.new(0, 0, 0), 
        Size = UDim2.fromOffset(14, 14), 
        ZIndex = 4
    }, {
        l_createStyleRule_0(".Selected, .Hovered, .Pressed", {
            Image = "rbxasset://textures/smallWhiteCircle.png", 
            ImageColor3 = "$ColorControlPointHighlight"
        })
    }), 
    l_createStyleRule_0(".CurvePoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorControlPoint", 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(10, 10), 
        ZIndex = 5
    }, {
        l_createStyleRule_0(".Pressed", {
            ImageColor3 = "$ColorControlPointPressed"
        }), 
        l_createStyleRule_0(".Hovered", {
            ImageColor3 = "$ColorControlPointHovered"
        })
    })
}, v5);