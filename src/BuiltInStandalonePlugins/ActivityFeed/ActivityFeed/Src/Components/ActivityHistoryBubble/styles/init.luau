local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_bubbleTopHeight_0 = v2.bubbleTopHeight;
local l_bubbleMiddleHeight_0 = v2.bubbleMiddleHeight;
local l_bubbleBottomHeight_0 = v2.bubbleBottomHeight;
local l_bubbleHeight_0 = v2.bubbleHeight;
local l_bubblePaddingHalf_0 = v2.bubblePaddingHalf;
local l_defaultPadding_0 = v2.defaultPadding;
local l_smallPadding_0 = v2.smallPadding;
return l_createStyleRule_0(".Component-ActivityHistoryBubble", {
    Size = UDim2.new(1, 0, 0, l_bubbleHeight_0), 
    AutomaticSize = Enum.AutomaticSize.Y, 
    BackgroundColor3 = "$ForegroundMain"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
    }), 
    l_createStyleRule_0("::UIStroke", {
        Color = "$Divider", 
        Thickness = 1
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, l_bubblePaddingHalf_0), 
        PaddingBottom = UDim.new(0, l_bubblePaddingHalf_0), 
        PaddingLeft = UDim.new(0, l_bubblePaddingHalf_0), 
        PaddingRight = UDim.new(0, l_bubblePaddingHalf_0)
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ForegroundContrast"
    }), 
    l_createStyleRule_0(">> TextLabel", {
        TextColor3 = "$TextPrimary", 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> #Left", {
        Size = UDim2.new(0, 36, 1, 0)
    }, {
        l_createStyleRule_0("> #Icon", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(0, 36, 0, 36)
        }), 
        l_createStyleRule_0("> .RoundIcon", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 18)
            })
        }), 
        l_createStyleRule_0("> .SquareIcon", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 5)
            })
        })
    }), 
    l_createStyleRule_0("> #Right", {
        Size = UDim2.new(1, -36, 1, 0)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, l_defaultPadding_0)
        }), 
        l_createStyleRule_0(">> TextLabel", {
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        l_createStyleRule_0("> #Top", {
            Size = UDim2.new(1, 0, 0, l_bubbleTopHeight_0)
        }, {
            l_createStyleRule_0("> #DotDotDot", {
                Size = UDim2.new(0, l_bubbleTopHeight_0, 0, l_bubbleTopHeight_0)
            }, {
                l_createStyleRule_0("> ImageButton", {
                    BorderSizePixel = 0, 
                    Image = "$threedotsicon", 
                    ScaleType = Enum.ScaleType.Fit, 
                    BackgroundColor3 = "$ForegroundContrast"
                }, {
                    l_createStyleRule_0(":hover", {
                        BackgroundColor3 = "$ActionHover"
                    }), 
                    l_createStyleRule_0("::UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    })
                })
            }), 
            l_createStyleRule_0("> #Date", {
                Size = UDim2.new(1, -l_bubbleTopHeight_0, 1, 0), 
                TextSize = v2.detailFontSize, 
                TextColor3 = "$TextPrimary"
            })
        }), 
        l_createStyleRule_0("> #Middle", {
            Size = UDim2.new(1, 0, 0, l_bubbleMiddleHeight_0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingBottom = UDim.new(0, l_defaultPadding_0)
            }), 
            l_createStyleRule_0(">> TextLabel", {
                TextColor3 = "$TextPrimary", 
                TextSize = v2.normalFontSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        l_createStyleRule_0("> #Bottom", {
            Size = UDim2.new(0, 0, 0, l_bubbleBottomHeight_0), 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 2)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$ActionHover"
            }), 
            l_createStyleRule_0("> #IconFrame", {
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingRight = UDim.new(0, l_smallPadding_0)
                }), 
                l_createStyleRule_0("> #Icon", {
                    Size = UDim2.new(0, 16, 0, 16)
                }, {
                    l_createStyleRule_0("::UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            }), 
            l_createStyleRule_0("> #TargetName", {
                Size = UDim2.new(0, 0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.X, 
                TextSize = v2.detailFontSize, 
                TextColor3 = "$TextPrimary", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1
            }, {
                l_createStyleRule_0(":hover", {
                    Font = v2.boldedFont
                })
            })
        })
    }), 
    l_createStyleRule_0(".TargetIcon ::UICorner", {
        CornerRadius = UDim.new(0, 8)
    })
});