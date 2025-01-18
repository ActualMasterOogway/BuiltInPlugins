local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-AnnotationContents", {
    Size = UDim2.fromScale(1, 0), 
    AutomaticSize = Enum.AutomaticSize.Y, 
    BackgroundTransparency = 1, 
    ClipsDescendants = true
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingBottom = UDim.new(0, 4)
    }), 
    l_createStyleRule_0(">> Frame", {
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> #TextColumn", {
        Size = UDim2.new(1, -40, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        l_createStyleRule_0(">> #UsernameRow", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            l_createStyleRule_0("> Frame", {
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                l_createStyleRule_0("> TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    TextScaled = false, 
                    LineHeight = 1.5
                }), 
                l_createStyleRule_0("> #Username", {
                    TextColor3 = "$TextPrimary", 
                    TextSize = "$FontSizeM", 
                    Font = "$FontBold"
                }), 
                l_createStyleRule_0("> #CreationTime", {
                    TextColor3 = "$TextSecondary", 
                    TextSize = "$FontSizeS"
                })
            }), 
            l_createStyleRule_0("> #MoreIcon", {
                Image = "$MoreIcon", 
                Size = UDim2.fromOffset(16, 16), 
                Position = UDim2.new(1, -16, 0, 0)
            }, {
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
        l_createStyleRule_0(">> #Contents", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            TextColor3 = "$TextPrimary", 
            TextSize = 16, 
            BackgroundTransparency = 1, 
            LineHeight = 1.5, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    })
});