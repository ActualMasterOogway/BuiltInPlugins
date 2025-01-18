local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleConstants);
local l_minimumMappingsDialogSize_0 = v2.minimumMappingsDialogSize;
return l_createStyleRule_0(".Component-MappingsDialog", {
    Position = UDim2.new(0.5, 0, 0, 0), 
    AnchorPoint = Vector2.new(0.5, 0), 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 1, -v2.deviceHeaderHeight)
}, {
    l_createStyleRule_0("> Frame", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }), 
    l_createStyleRule_0(">> #HorizontalScrollingFrame", {
        CanvasSize = UDim2.new(1, 0, 1, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollBarThickness = 8
    }), 
    l_createStyleRule_0(">> #BlueprintAndListContainer", {}, {
        l_createStyleRule_0("::UISizeConstraint", {
            MinSize = l_minimumMappingsDialogSize_0
        }), 
        l_createStyleRule_0(">> #BlueprintContainer", {
            Size = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            l_createStyleRule_0("::UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = "$BlueprintWithMappingsPadding"
            }), 
            l_createStyleRule_0(">> #DeviceBlueprint", {}, {
                l_createStyleRule_0("::UISizeConstraint", {
                    MaxSize = Vector2.new(400, 10000)
                })
            })
        }), 
        l_createStyleRule_0(">> #ListScrollingContainer", {
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(0.5, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0)
        })
    }), 
    l_createStyleRule_0(">> .Component-ResetMappingsConfirmationDialog", {}, {
        l_createStyleRule_0(">> #DialogContents", {
            Size = UDim2.new(0, 194, 0, 100), 
            Position = UDim2.new(0.5, -97, 0, 100), 
            BackgroundColor3 = "$FilledInputBackground"
        }, {
            l_createStyleRule_0("::UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 8)
            }), 
            l_createStyleRule_0(">> #ConfirmationText", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0.5, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                TextWrapped = true, 
                TextColor3 = "$TextPrimary", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            l_createStyleRule_0(">> #ButtonsContainer", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                l_createStyleRule_0(">> .Button", {
                    Size = UDim2.new(0, 78, 0, 32), 
                    BackgroundColor3 = "$PrimaryMain", 
                    TextColor3 = "$TextPrimary"
                }, {
                    l_createStyleRule_0("::UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            })
        })
    }), 
    l_createStyleRule_0(">> .Component-MappingsCollisionsBanner", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 37)
        }), 
        l_createStyleRule_0(">> #BannerContents", {
            Size = UDim2.new(0, 291, 0, 0), 
            BackgroundColor3 = "$WarningMain", 
            BackgroundTransparency = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 5), 
                PaddingRight = UDim.new(0, 5), 
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            l_createStyleRule_0(">> #WarningText", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y
            })
        })
    })
});