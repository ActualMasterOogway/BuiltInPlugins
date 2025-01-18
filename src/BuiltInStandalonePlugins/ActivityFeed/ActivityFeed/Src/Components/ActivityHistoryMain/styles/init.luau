local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_defaultPadding_0 = v2.defaultPadding;
local v4 = v2.normalFontSize + l_defaultPadding_0 * 2;
local l_smallPadding_0 = v2.smallPadding;
local l_defaultIconSize_0 = v2.defaultIconSize;
return l_createStyleRule_0(".Component-ActivityHistoryMain", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("> #EventList", {
        Size = UDim2.new(1, 0, 1, -0)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, l_smallPadding_0), 
            PaddingBottom = UDim.new(0, l_smallPadding_0), 
            PaddingLeft = UDim.new(0, l_smallPadding_0), 
            PaddingRight = UDim.new(0, l_smallPadding_0)
        }), 
        l_createStyleRule_0("> #Header", {
            Size = UDim2.new(1, 0, 0, v4), 
            BackgroundColor3 = "$BackgroundPaper"
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
            }), 
            l_createStyleRule_0("::UIStroke", {
                Color = "$Divider", 
                Thickness = 1
            }), 
            l_createStyleRule_0("> #FilterHeader", {
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                l_createStyleRule_0("::UIListLayout", {
                    HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
                }), 
                l_createStyleRule_0("> #FilterHeaderText", {
                    TextColor3 = "$TextPrimary", 
                    TextSize = v2.normalFontSize, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = true, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    l_createStyleRule_0("::UIPadding", {
                        PaddingLeft = UDim.new(0, l_defaultPadding_0), 
                        PaddingTop = UDim.new(0, l_defaultPadding_0), 
                        PaddingBottom = UDim.new(0, l_defaultPadding_0), 
                        PaddingRight = UDim.new(0, 0)
                    }), 
                    l_createStyleRule_0("::UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Shrink
                    })
                }), 
                l_createStyleRule_0("> #HeaderIcons", {
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    l_createStyleRule_0("::UIListLayout", {
                        HorizontalFlex = Enum.UIFlexAlignment.Fill
                    }), 
                    l_createStyleRule_0("> .HeaderIcon", {
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X
                    }, {
                        l_createStyleRule_0("::UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        l_createStyleRule_0("::UIPadding", {
                            PaddingLeft = UDim.new(0, l_smallPadding_0), 
                            PaddingRight = UDim.new(0, l_smallPadding_0)
                        }), 
                        l_createStyleRule_0("> ImageLabel, > ImageButton", {
                            Size = UDim2.new(0, l_defaultIconSize_0, 0, l_defaultIconSize_0), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    l_createStyleRule_0(">> #ClearFiltersIcon", {
                        Image = "$close"
                    }), 
                    l_createStyleRule_0(">> #FilterHeaderIcon", {
                        Image = "$filter"
                    })
                })
            })
        }), 
        l_createStyleRule_0("> .HeaderHovered #Header", {}, {
            l_createStyleRule_0("::UIStroke", {
                Color = "$ActionHover"
            }), 
            l_createStyleRule_0(">> #FilterHeaderIconContainer", {
                BackgroundTransparency = 0, 
                BackgroundColor3 = "$ActionHover"
            })
        }), 
        l_createStyleRule_0("> .HeaderDisabled #Header", {
            Interactable = false
        }, {
            l_createStyleRule_0(">> #FilterHeaderText", {
                TextColor3 = "$TextSecondary"
            }), 
            l_createStyleRule_0(">> #FilterHeaderIconContainer", {}, {
                l_createStyleRule_0("> #FilterHeaderIcon", {
                    Image = "$filterdisabled"
                })
            })
        }), 
        l_createStyleRule_0("> #ActivityHistoryBubbleListContainer", {
            Size = UDim2.new(1, 0, 1, -v4), 
            ZIndex = 0
        })
    }), 
    l_createStyleRule_0("> #FilterMenu", {
        Size = UDim2.new(1, 0, 1, 0)
    })
});