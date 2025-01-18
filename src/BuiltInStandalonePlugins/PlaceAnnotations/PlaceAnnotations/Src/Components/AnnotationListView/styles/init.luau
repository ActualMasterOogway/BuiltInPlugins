local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Bin.Common.defineLuaFlags);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-AnnotationListView", {
    BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface100" or "$ForegroundMain"
}, {
    l_createStyleRule_0("::UISizeConstraint", {
        MinSize = Vector2.new(200, 0)
    }), 
    l_createStyleRule_0("> #Header", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 8)
        }), 
        l_createStyleRule_0("> #AddButton", {
            TextColor3 = "$TextPrimary", 
            TextSize = "$FontSizeM", 
            Font = "$FontBold", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = "$PrimaryMain"
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0.3, 0)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryHoverBackground"
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundColor3 = "$ActionSelected"
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 4)
            })
        }), 
        l_createStyleRule_0("> #SettingsWrapper", {
            Size = UDim2.fromOffset(18, 18), 
            Position = UDim2.fromScale(1, 0.5), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            l_createStyleRule_0("> .Dropdown", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, -0.5, 0.5, 0)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundTransparency = 0, 
                BackgroundColor3 = "$ResolveIconBase"
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundTransparency = 0, 
                BackgroundColor3 = "$ResolveIconSelected"
            })
        })
    }), 
    l_createStyleRule_0("> #AnnotationList", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, -40)
    }, {
        l_createStyleRule_0(">> #AnnotationScrollingFrame", {
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("> #BottomPadding", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 10)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 16), 
                PaddingRight = UDim.new(0, 16)
            })
        })
    }), 
    l_createStyleRule_0(">> #EmptyState", {
        Size = UDim2.new(1, 0, 1, -50)
    }, {
        l_createStyleRule_0(".HeaderOffset", {
            Size = UDim2.new(1, 0, 1, -150)
        }), 
        l_createStyleRule_0("> #AnnotationIcon", {
            Image = "$AnnotationLarge", 
            ImageTransparency = 0.4, 
            Size = UDim2.fromOffset(40, 40)
        }), 
        l_createStyleRule_0("> #NoCommentsYet", {
            Font = "$FontBold"
        }), 
        l_createStyleRule_0("> #ToBegin", {
            TextTransparency = 0.4, 
            TextSize = "$FontSizeS", 
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -40, 0, 0)
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingBottom = UDim.new(0, 10)
            })
        }), 
        l_createStyleRule_0("> #AddButton", {
            TextColor3 = "$TextPrimary", 
            TextSize = "$FontSizeM", 
            Font = "$FontBold", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = "$PrimaryMain"
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0.3, 0)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryHoverBackground"
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundColor3 = "$ActionSelected"
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 4)
            })
        })
    })
});