local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleConstants);
return l_createStyleRule_0(".Component-VRControls", {
    Size = UDim2.new(1, 0, 0, v2.vrControlsHeight)
}, {
    l_createStyleRule_0("::UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical
    }), 
    l_createStyleRule_0(">> TextLabel, >> TextButton", {
        TextColor3 = "$TextPrimary"
    }), 
    l_createStyleRule_0(">> #InnerContainer", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0("::UISizeConstraint", {
            MaxSize = Vector2.new(600, 1)
        }), 
        l_createStyleRule_0(">> #Separator", {
            Size = UDim2.new(1, 0, 0, 0), 
            BorderSizePixel = 1, 
            BorderColor3 = "$SeparatorColor"
        }), 
        l_createStyleRule_0(">> #Controls", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0
        }, {
            l_createStyleRule_0(">> #Label", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 3), 
                    PaddingLeft = UDim.new(0, 5)
                })
            }), 
            l_createStyleRule_0(">> .Component-Checkbox", {
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingLeft = UDim.new(0, 3), 
                    PaddingBottom = UDim.new(0, 4)
                }), 
                l_createStyleRule_0(">> ImageLabel", {
                    Size = UDim2.new(0, 12, 0, 12), 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            })
        }), 
        l_createStyleRule_0(">> #TooltipButton", {
            Size = UDim2.new(0, 20, 0, 20), 
            Position = UDim2.new(1, -25, 0, 10), 
            BorderSizePixel = 5, 
            TextSize = 20, 
            BorderMode = Enum.BorderMode.Inset, 
            TextXAlignment = Enum.TextXAlignment.Center
        }, {
            l_createStyleRule_0("::UIStroke", {
                Color = "$TextPrimary", 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Thickness = 1
            })
        }), 
        l_createStyleRule_0(">> #Tooltip", {
            Size = UDim2.new(0, 340, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(1, -5, 0, 1), 
            AnchorPoint = Vector2.new(1, 1), 
            BackgroundColor3 = "$InfoTooltipBackgroundColor", 
            BorderSizePixel = 1, 
            BorderColor3 = "$TextPrimary", 
            TextColor3 = "$TextPrimary", 
            TextSize = 14, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ZIndex = v2.ZIndexData.VRCONTROLS_TOOLTIP
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIStroke", {
                Color = "$TextPrimary", 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Thickness = 1
            }), 
            l_createStyleRule_0("::UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = "$TooltipPadding", 
                PaddingBottom = "$TooltipPadding", 
                PaddingLeft = "$TooltipPadding", 
                PaddingRight = UDim.new(0, 5)
            }), 
            l_createStyleRule_0(">> TextLabel", {
                TextColor3 = "$TextPrimary", 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0.5, 0, 0, 0)
            }), 
            l_createStyleRule_0(">> #MouseMapping1", {
                Size = UDim2.new(1, 0, 0, 0), 
                TextWrapped = false
            }), 
            l_createStyleRule_0(">> #MouseMapping2", {
                Size = UDim2.new(1, 0, 0, 0), 
                TextWrapped = false
            }), 
            l_createStyleRule_0(">> .Component-VRMappingLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                l_createStyleRule_0("::UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 5), 
                    TextWrapped = true
                }), 
                l_createStyleRule_0(">> #LeftText", {
                    Size = UDim2.new(0.4, 0, 0, 0)
                }), 
                l_createStyleRule_0(">> #RightText", {
                    TextColor3 = "$TextSecondary"
                })
            })
        })
    })
});