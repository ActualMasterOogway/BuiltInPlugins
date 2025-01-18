local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = UDim2.new(0, 200, 0, 50);
local v3 = UDim2.new(0, 50, 0, 50);
return l_createStyleRule_0(".Component-TokenExamples", {
    Size = UDim2.new(1, 0, 1, 0)
}, {
    l_createStyleRule_0(">> TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        BackgroundTransparency = 1, 
        TextSize = 14
    }), 
    l_createStyleRule_0("> #BackgroundDefault", {
        Size = v2, 
        BackgroundColor3 = "$BackgroundDefault"
    }), 
    l_createStyleRule_0("> #BackgroundPaper", {
        Size = v2, 
        BackgroundColor3 = "$BackgroundPaper"
    }), 
    l_createStyleRule_0("> #ForegroundMain", {
        Size = v2, 
        BackgroundColor3 = "$ForegroundMain"
    }), 
    l_createStyleRule_0("> #ForegroundMuted", {
        Size = v2, 
        BackgroundColor3 = "$ForegroundMuted"
    }), 
    l_createStyleRule_0("> #ForegroundContrast", {
        Size = v2, 
        BackgroundColor3 = "$ForegroundContrast"
    }), 
    l_createStyleRule_0("> #TextPrimary", {
        Size = v2, 
        TextColor3 = "$TextPrimary"
    }), 
    l_createStyleRule_0("> #TextSecondary", {
        Size = v2, 
        TextColor3 = "$TextSecondary"
    }), 
    l_createStyleRule_0("> #TextContrast", {
        Size = v2, 
        TextColor3 = "$TextContrast"
    }), 
    l_createStyleRule_0("> #TextLink", {
        Size = v2, 
        TextColor3 = "$TextLink"
    }, {
        l_createStyleRule_0(":hover", {
            TextColor3 = "$TextLink"
        })
    }), 
    l_createStyleRule_0("> #TextDisabled", {
        Size = v2, 
        TextColor3 = "$TextDisabled"
    }), 
    l_createStyleRule_0("> #TextError", {
        Size = v2, 
        TextColor3 = "$TextError"
    }), 
    l_createStyleRule_0("> #TextSuccess", {
        Size = v2, 
        TextColor3 = "$TextSuccess"
    }), 
    l_createStyleRule_0("> #TextWarning", {
        Size = v2, 
        TextColor3 = "$TextWarning"
    }), 
    l_createStyleRule_0("> #ErrorMain", {
        Size = v2, 
        BackgroundColor3 = "$ErrorMain"
    }), 
    l_createStyleRule_0("> #SuccessMain", {
        Size = v2, 
        BackgroundColor3 = "$SuccessMain"
    }), 
    l_createStyleRule_0("> #WarningMain", {
        Size = v2, 
        BackgroundColor3 = "$WarningMain"
    }), 
    l_createStyleRule_0("> #ActionHover", {
        Size = v2, 
        BackgroundColor3 = "$ActionEnabled"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        })
    }), 
    l_createStyleRule_0("> #ActionEnabled", {
        Size = v2, 
        BackgroundColor3 = "$ActionEnabled"
    }), 
    l_createStyleRule_0("> #ActionSelected", {
        Size = v2, 
        BackgroundColor3 = "$ActionSelected"
    }), 
    l_createStyleRule_0("> #ActionActivated", {
        Size = v2, 
        BackgroundColor3 = "$ActionActivated"
    }), 
    l_createStyleRule_0("> #ActionFocusBorder", {
        Size = v2, 
        BackgroundColor3 = "$ActionEnabled", 
        BorderColor3 = "$ActionFocusBorder"
    }), 
    l_createStyleRule_0("> #PrimaryMain", {
        Size = v2, 
        BackgroundColor3 = "$PrimaryMain"
    }), 
    l_createStyleRule_0("> #PrimaryHoverBackground", {
        Size = v2, 
        BackgroundColor3 = "$PrimaryMain"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        })
    }), 
    l_createStyleRule_0("> #SecondaryMain", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryMain"
    }), 
    l_createStyleRule_0("> #SecondaryMuted", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryMuted"
    }), 
    l_createStyleRule_0("> #SecondaryContrast", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryContrast"
    }), 
    l_createStyleRule_0("> #SecondaryHoverBackground", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryMain"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$SecondaryHoverBackground"
        })
    }), 
    l_createStyleRule_0("> #SecondaryHoverOutlineBorder", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryMain", 
        BorderColor3 = "$SecondaryHoverOutlineBorder"
    }), 
    l_createStyleRule_0("> #SecondaryRestingOutlineBorder", {
        Size = v2, 
        BackgroundColor3 = "$SecondaryMain", 
        BorderColor3 = "$SecondaryRestingOutlineBorder"
    }), 
    l_createStyleRule_0("> #FilledInputBackground", {
        Size = v2, 
        BackgroundColor3 = "$FilledInputBackground"
    }), 
    l_createStyleRule_0("> #Divider", {
        Size = v2, 
        BackgroundColor3 = "$Divider"
    }), 
    l_createStyleRule_0("> #CheckboxUncheckedImage", {
        Size = v3, 
        Image = "$CheckboxUncheckedImage"
    }), 
    l_createStyleRule_0("> #CheckboxCheckedImage", {
        Size = v3, 
        Image = "$CheckboxCheckedImage"
    }), 
    l_createStyleRule_0("> #CheckboxIndeterminateImage", {
        Size = v3, 
        Image = "$CheckboxIndeterminateImage"
    }), 
    l_createStyleRule_0("> #CheckboxDisabledImage", {
        Size = v3, 
        Image = "$CheckboxDisabledImage"
    })
});