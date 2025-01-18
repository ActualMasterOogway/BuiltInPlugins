local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".LayerTreeRow", {
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 0, 24), 
    Padding = {
        Top = 1, 
        Bottom = 1, 
        Left = 0, 
        Right = 0
    }, 
    Spacing = 5
}, {
    l_createStyleRule_0("> .Client", {
        TextColor3 = "$Client", 
        ImageColor3 = "$Client"
    }), 
    l_createStyleRule_0("> .Server", {
        TextColor3 = "$Server", 
        ImageColor3 = "$Server"
    }), 
    l_createStyleRule_0("> #Toggle", {
        Size = "$IconSize"
    }, {
        l_createStyleRule_0("> #ToggleButton", {
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            Size = "$IconSize", 
            ImageRectSize = Vector2.new(12, 12), 
            ImageColor3 = "$TextPrimary", 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    }), 
    l_createStyleRule_0("> .LayerIcon", {
        Image = "rbxasset://textures/CompositorDebugger/default.png", 
        Size = "$IconSize"
    }), 
    l_createStyleRule_0("> .Blend1D", {
        Image = "rbxasset://textures/CompositorDebugger/blend1d.png"
    }), 
    l_createStyleRule_0("> .Blend2D", {
        Image = "rbxasset://textures/CompositorDebugger/blend2d.png"
    }), 
    l_createStyleRule_0("> .BlendSpace", {
        Image = "rbxasset://textures/CompositorDebugger/blend2d.png"
    }), 
    l_createStyleRule_0("> .ClipLayer", {
        Image = "rbxasset://textures/CompositorDebugger/clip.png"
    }), 
    l_createStyleRule_0("> .SelectLayer", {
        Image = "rbxasset://textures/CompositorDebugger/select.png"
    }), 
    l_createStyleRule_0("> .SequenceLayer", {
        Image = "rbxasset://textures/CompositorDebugger/sequence.png"
    }), 
    l_createStyleRule_0("> .Name", {
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    l_createStyleRule_0("> .RigName", {
        Font = Enum.Font.SourceSansBold
    }), 
    l_createStyleRule_0("> #Timestamp", {}, {
        l_createStyleRule_0("> #ProgressBar", {
            BackgroundColor3 = "$BackgroundPaper", 
            BackgroundTransparency = 0, 
            BorderColor3 = "$TextSecondary", 
            BorderSizePixel = 1, 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 0, 2), 
            Position = UDim2.new(0.5, 0, 1, -1)
        })
    }), 
    l_createStyleRule_0("> #Adornment", {
        Size = UDim2.new(0, 12, 1, 0), 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("> #EyeIcon", {
            Size = "$IconSize", 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageTransparency = 0, 
            Image = "rbxasset://textures/CompositorDebugger/eye.png"
        }, {
            l_createStyleRule_0(".AdornmentOff", {
                ImageColor3 = "$BackgroundPaper"
            }), 
            l_createStyleRule_0(".AdornmentOn", {
                ImageColor3 = "$TextPrimary"
            })
        }), 
        l_createStyleRule_0("> #Dot", {
            Size = UDim2.fromOffset(10, 10), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageTransparency = 0, 
            Image = "rbxasset://textures/CompositorDebugger/adornmentDot.png"
        }, {
            l_createStyleRule_0(".AdornmentDotOff", {
                ImageTransparency = 1
            }), 
            l_createStyleRule_0(".AdornmentDot1", {
                ImageColor3 = "$AdornmentDot1"
            }), 
            l_createStyleRule_0(".AdornmentDot2", {
                ImageColor3 = "$AdornmentDot2"
            }), 
            l_createStyleRule_0(".AdornmentDot3", {
                ImageColor3 = "$AdornmentDot3"
            }), 
            l_createStyleRule_0(".AdornmentDot4", {
                ImageColor3 = "$AdornmentDot4"
            }), 
            l_createStyleRule_0(".AdornmentDot5", {
                ImageColor3 = "$AdornmentDot5"
            }), 
            l_createStyleRule_0(".AdornmentDot6", {
                ImageColor3 = "$AdornmentDot6"
            }), 
            l_createStyleRule_0(".AdornmentDot7", {
                ImageColor3 = "$AdornmentDot7"
            }), 
            l_createStyleRule_0(".AdornmentDot8", {
                ImageColor3 = "$AdornmentDot8"
            }), 
            l_createStyleRule_0(".AdornmentDot9", {
                ImageColor3 = "$AdornmentDot9"
            }), 
            l_createStyleRule_0(".AdornmentDot10", {
                ImageColor3 = "$AdornmentDot10"
            }), 
            l_createStyleRule_0(".AdornmentDot11", {
                ImageColor3 = "$AdornmentDot11"
            })
        })
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$LayerHover", 
        BackgroundTransparency = 0
    })
}, {
    Indent = 17, 
    Client = Color3.fromHex("349AD5"), 
    Server = Color3.fromHex("00CC67"), 
    IconSize = UDim2.new(0, 12, 0, 12), 
    ExpandedOffset = Vector2.new(24, 0), 
    CollapsedOffset = Vector2.new(12, 0)
});