local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Toolbar", {}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = "$Padding", 
        PaddingRight = "$Padding"
    }), 
    l_createStyleRule_0("> .MediaButton", {
        BackgroundColor3 = "$PrimaryMain", 
        BackgroundTransparency = 0, 
        Size = UDim2.fromOffset(20, 20), 
        TextColor3 = "$TextPrimary"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        })
    }), 
    l_createStyleRule_0(">> #Icon", {
        Size = UDim2.fromOffset(20, 20), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ImageColor3 = "$TextPrimary"
    }), 
    l_createStyleRule_0("> .Timeline", {
        BackgroundColor3 = "$BackgroundPaper", 
        BackgroundTransparency = 0
    }, {
        l_createStyleRule_0("> .LBorder", {}, {
            l_createStyleRule_0("> .Tick", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0
            }), 
            l_createStyleRule_0("> .Label", {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 3, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = "$TextPrimary", 
                TextSize = 14
            })
        }), 
        l_createStyleRule_0("> .RBorder", {}, {
            l_createStyleRule_0("> .Tick", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0
            }), 
            l_createStyleRule_0("> .Label", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(0, -3, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = "$TextPrimary", 
                TextSize = 14
            })
        }), 
        l_createStyleRule_0("> .Major", {}, {
            l_createStyleRule_0("> .Tick", {
                Size = UDim2.new(0, 1, 0.6, 0), 
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0
            }), 
            l_createStyleRule_0("> .Label", {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 3, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = "$TextPrimary", 
                TextSize = 14
            })
        }), 
        l_createStyleRule_0("> .Medium", {}, {
            l_createStyleRule_0("> .Tick", {
                Size = UDim2.new(0, 1, 0.4, 0), 
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0
            }), 
            l_createStyleRule_0("> .Label", {
                Visible = false
            })
        }), 
        l_createStyleRule_0("> .Minor", {}, {
            l_createStyleRule_0("> .Tick", {
                Size = UDim2.new(0, 1, 0.2, 0), 
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0
            }), 
            l_createStyleRule_0("> .Label", {
                Visible = false
            })
        }), 
        l_createStyleRule_0("> #BufferBar", {
            BackgroundColor3 = "$Blue60", 
            BackgroundTransparency = 0.5, 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.fromScale(1, 1)
        }), 
        l_createStyleRule_0(">> .Scrubber", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundColor3 = "$Blue60", 
            BackgroundTransparency = 0
        })
    })
}, {
    ScrubberLineSize = UDim2.new(0, 1, 1, 0), 
    ScrubberHeadSize = UDim2.fromOffset(5, 5), 
    BufferBarHeight = 3, 
    Padding = UDim.new(0, 10)
});