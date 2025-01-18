local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-AnnotationPopover", {}, {
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
    l_createStyleRule_0("> #ReplyError", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 42)
        })
    })
});