local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Bin.Common.defineLuaFlags);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-AnnotationListCard", {
    Size = UDim2.fromScale(1, 0), 
    AutomaticSize = Enum.AutomaticSize.Y, 
    BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface200" or "$ForegroundContrast"
}, {
    l_createStyleRule_0(".Selected", {
        BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorActionPrimaryFill" or "$TextPrimary"
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, 1), 
        PaddingLeft = UDim.new(0, 1), 
        PaddingBottom = UDim.new(0, 1), 
        PaddingRight = UDim.new(0, 1)
    }), 
    l_createStyleRule_0("::UICorner", {
        CornerRadius = 18
    }), 
    l_createStyleRule_0("> Frame", {
        BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface200" or "$ForegroundContrast", 
        ZIndex = -1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = 18
        }), 
        l_createStyleRule_0("> TextButton", {
            BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface200" or "$ForegroundContrast", 
            BackgroundTransparency = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = 18
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = UDim.new(0, 11), 
                PaddingLeft = UDim.new(0, 15), 
                PaddingBottom = UDim.new(0, 15), 
                PaddingRight = UDim.new(0, 15)
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorStateLayerHover" or "$ActionHover", 
                BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorStateLayerHoverTransparency" or 0
            }), 
            l_createStyleRule_0(".Hovered", {
                BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorStateLayerHover" or "$ActionHover", 
                BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorStateLayerHoverTransparency" or 0.7
            }), 
            l_createStyleRule_0(".Selected", {
                BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorStatesSelected" or "$ActionHover", 
                BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorStatesSelectedTransparency" or 0.4
            }), 
            l_createStyleRule_0("> #Header", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                l_createStyleRule_0("> #Navigation", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 0)
                }, {
                    l_createStyleRule_0("> TextLabel", {
                        TextColor3 = "$TextPrimary", 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, -56, 0, 0), 
                        Font = "$FontBold", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.fromScale(0, 0.5), 
                        BackgroundTransparency = 1, 
                        TextSize = "$FontSizeM", 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = false
                    }), 
                    l_createStyleRule_0(">> ImageButton", {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }), 
                    l_createStyleRule_0("> #MoreIcon", {
                        Image = "$MoreIcon", 
                        Size = UDim2.fromOffset(16, 16), 
                        Position = UDim2.new(1, -52, 0.5, 0)
                    }, {
                        l_createStyleRule_0(":hover", {
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = "$ResolveIconBase"
                        }), 
                        l_createStyleRule_0(":pressed", {
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = "$ResolveIconSelected"
                        })
                    }), 
                    l_createStyleRule_0("> #ResolveButton", {
                        Position = UDim2.new(1, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(1, 0.5)
                    })
                })
            }), 
            l_createStyleRule_0("> TextLabel", {
                TextColor3 = "$TextSecondary", 
                TextSize = "$FontSizeS", 
                Font = "$Font", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingLeft = UDim.new(0, 42)
                })
            })
        })
    })
});