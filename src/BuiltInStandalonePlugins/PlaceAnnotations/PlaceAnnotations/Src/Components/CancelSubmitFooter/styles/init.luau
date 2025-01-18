local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CancelSubmitFooter", {
    BackgroundTransparency = 1
}, {
    l_createStyleRule_0(">> TextButton", {
        Size = UDim2.fromOffset(72, 36), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BorderSizePixel = 0, 
        TextColor3 = "$TextPrimary", 
        TextSize = "$FontSizeM", 
        Font = "$FontBold"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = 10
        })
    }), 
    l_createStyleRule_0("> #SubmitButton", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$PrimaryMain"
    }, {
        l_createStyleRule_0(".Disabled", {
            BackgroundColor3 = "$SecondaryMain", 
            TextColor3 = "$TextSecondary"
        }), 
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = "$ActionSelected"
        })
    }), 
    l_createStyleRule_0("> #CancelButton", {
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = "$SecondaryHoverBackground"
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = "$SecondaryMain"
        })
    })
});