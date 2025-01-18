local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".BlendBase", {}, {
    l_createStyleRule_0("> .Blend1D", {
        BackgroundColor3 = "$BackgroundPaper", 
        BackgroundTransparency = 0, 
        BorderColor3 = "$TextPrimary", 
        BorderSizePixel = 1, 
        Size = UDim2.new(1, -30, 0, 9), 
        Position = UDim2.new(0, 15, 0.5, 0)
    }), 
    l_createStyleRule_0("> .Blend2D", {
        BackgroundColor3 = "$BackgroundPaper", 
        BackgroundTransparency = 0, 
        BorderColor3 = "$TextPrimary", 
        BorderSizePixel = 1, 
        Size = UDim2.new(1, -30, 1, -48), 
        Position = UDim2.fromOffset(15, 33)
    }), 
    l_createStyleRule_0("> #Canvas", {}, {
        l_createStyleRule_0("> #Grid", {
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1)
        }), 
        l_createStyleRule_0("> #Reset", {
            Image = "rbxasset://textures/CompositorDebugger/clear.png", 
            Size = UDim2.fromOffset(12, 12), 
            Position = UDim2.new(1, 0, 0, -6), 
            ImageColor3 = "$TextPrimary", 
            AnchorPoint = Vector2.new(1, 1), 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("> .Dot", {
            Image = "rbxasset://textures/CompositorDebugger/dot.png", 
            Size = UDim2.fromOffset(9, 9), 
            ImageColor3 = "$TextPrimary", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("> .Cursor", {
            Image = "rbxasset://textures/CompositorDebugger/cursor.png", 
            ImageColor3 = "$Blue60"
        }), 
        l_createStyleRule_0(">> .Trail", {
            BackgroundColor3 = "$Blue60", 
            Width = 2
        }), 
        l_createStyleRule_0("> .Override", {
            ImageColor3 = "$TextError"
        }), 
        l_createStyleRule_0(">> .Axis", {
            BackgroundColor3 = "$TextPrimary", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(">> .Grid", {
            BackgroundColor3 = "$TextDisabled", 
            BackgroundTransparency = 0
        })
    })
}, {
    DotSize = 9
});