local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-Pane", {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    Size = UDim2.fromScale(1, 1)
}, {
    v1(".Default", {
        BackgroundColor3 = "$BackgroundDefault", 
        BackgroundTransparency = 0
    }), 
    v1(".Paper", {
        BackgroundColor3 = "$BackgroundPaper", 
        BackgroundTransparency = 0
    }), 
    v1(".Main", {
        BackgroundColor3 = "$ForegroundMain", 
        BackgroundTransparency = 0
    }), 
    v1(".Muted", {
        BackgroundColor3 = "$ForegroundMuted", 
        BackgroundTransparency = 0
    }), 
    v1(".Contrast", {
        BackgroundColor3 = "$ForegroundContrast", 
        BackgroundTransparency = 0
    }), 
    v1(".PrimaryBrand", {
        BackgroundColor3 = "$PrimaryMain", 
        BackgroundTransparency = 0, 
        TextColor3 = "$TextPrimary"
    }, {
        v1(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        })
    }), 
    v1(".Primary", {
        BackgroundColor3 = "$TextPrimary", 
        BackgroundTransparency = 0
    }, {
        v1(":hover", {
            BackgroundColor3 = "$TextSecondary"
        })
    }), 
    v1(".Secondary", {
        BackgroundColor3 = "$SecondaryMain", 
        BackgroundTransparency = 0
    }, {
        v1(":hover", {
            BackgroundColor3 = "$SecondaryHoverBackground"
        })
    }), 
    v1(".Row", {
        BackgroundColor3 = "$FilledInputBackground", 
        BackgroundTransparency = 0
    }, {
        v1(":hover", {
            BackgroundColor3 = "$ForegroundContrast"
        })
    }), 
    v1(".Selected", {
        BackgroundColor3 = "$ActionSelected", 
        BackgroundTransparency = 0
    }), 
    v1(".Input", {
        BackgroundColor3 = "$FilledInputBackground", 
        BackgroundTransparency = 0
    })
});