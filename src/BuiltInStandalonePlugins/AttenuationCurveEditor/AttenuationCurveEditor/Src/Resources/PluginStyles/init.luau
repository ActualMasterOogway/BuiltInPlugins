local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local _ = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v2.Styling.createStyleRule;
local l_createStyleSheet_0 = v2.Styling.createStyleSheet;
local l_ImprovedCursors_0 = game:GetFastFlag("ImprovedCursors");
local v6 = {
    ColorCurve = Color3.fromRGB(225, 100, 100), 
    ColorCurveEnd = Color3.fromRGB(150, 150, 150), 
    ColorKeypoint = Color3.fromRGB(225, 100, 100), 
    ColorKeypointSelected = Color3.fromRGB(255, 200, 150), 
    ColorKeypointHovered = Color3.fromRGB(255, 150, 150), 
    ColorKeypointPressed = Color3.fromRGB(150, 50, 50), 
    CursorOpenedHand = l_ImprovedCursors_0 and "rbxasset://textures/Cursors/DragDetector/HoverCursor.png" or "rbxasset://textures/advCursor-openedHand.png"
};
return l_createStyleSheet_0("AttenuationCurveEditor", {
    l_createStyleRule_0(".GridLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".GridLabel", {
        BackgroundTransparency = 1, 
        TextColor3 = "$ColorGridLine"
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
            ImageColor3 = "$ColorKeypointHighlight"
        })
    }), 
    l_createStyleRule_0(".CurvePoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorKeypoint", 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(10, 10), 
        ZIndex = 5
    }, {
        l_createStyleRule_0(".Pressed", {
            ImageColor3 = "$ColorKeypointPressed"
        }), 
        l_createStyleRule_0(".Hovered", {
            ImageColor3 = "$ColorKeypointHovered"
        })
    }), 
    l_createStyleRule_0(".GhostPoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/smallWhiteCircle.png", 
        ImageColor3 = "$ColorGridLine", 
        ImageTransparency = 0.5, 
        Size = UDim2.fromOffset(6, 6), 
        ZIndex = 4
    }), 
    l_createStyleRule_0(".CurveLinePath2D", {
        ZIndex = 4, 
        Thickness = 2, 
        Color3 = "$ColorCurve"
    }), 
    l_createStyleRule_0(".GhostLinePath2D", {
        ZIndex = 4, 
        Thickness = 1, 
        Color3 = "$ColorCurveEnd"
    }), 
    l_createStyleRule_0(".ScrollbarFrame", {
        BackgroundTransparency = 0.6, 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    }), 
    l_createStyleRule_0(".ScrollbarButton", {
        BackgroundColor3 = "$ColorScrollbarButton", 
        BorderColor3 = "$ColorScrollbarButtonBorder", 
        TextColor3 = "$ColorScrollbarButtonText"
    }, {
        l_createStyleRule_0(".Hovered", {
            BackgroundColor3 = "$ColorScrollbarButtonHovered"
        }), 
        l_createStyleRule_0(".Pressed", {
            BackgroundColor3 = "$ColorScrollbarButtonPressed"
        })
    }), 
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = Enum.Font.SourceSans, 
        TextSize = 15
    })
}, v6);