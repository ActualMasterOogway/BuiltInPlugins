local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
local v2 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkTextLabelTruncateTag();
return v1(".Component-TextLabel", {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    Font = "$TextLabelFont", 
    Size = UDim2.fromScale(1, 1), 
    TextSize = "$TextLabelTextSize", 
    TextColor3 = "$TextPrimary"
}, {
    v1(".Disabled", {
        TextTransparency = 0.5
    }), 
    v1(".Body", {
        TextSize = 14, 
        TextColor3 = "$TextSecondary"
    }), 
    v1(".Bold", {
        Font = Enum.Font.SourceSansBold
    }), 
    v1(".Semibold", {
        Font = Enum.Font.SourceSansSemibold, 
        TextSize = 22
    }), 
    v1(".SubText", {
        TextColor3 = "$TextSecondary"
    }), 
    v1(".Label", {
        TextColor3 = "$TextSecondary"
    }), 
    v1(".Selected", {
        TextColor3 = "$TextLink"
    }), 
    v1(".Subtitle", {
        TextColor3 = "$TextSecondary", 
        TextSize = 22
    }), 
    v1(".Title", {
        TextSize = "$TextLabelTitleSize"
    }), 
    v1(".Contrast", {
        TextColor3 = "$TextContrast"
    }), 
    v1(".Success", {
        TextColor3 = "$TextSuccess"
    }), 
    v1(".Error", {
        TextColor3 = "$TextError"
    }), 
    v1(".Warning", {
        TextColor3 = "$TextWarning"
    }), 
    v1(".Monospace", {
        Font = Enum.Font.RobotoMono, 
        TextSize = 14
    }), 
    v1(".Wrap", {
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    }), 
    if v2 then v1(".Truncate", {
        TextTruncate = Enum.TextTruncate.AtEnd
    }) else nil, 
    v1(".Left", {
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    v1(".Right", {
        TextXAlignment = Enum.TextXAlignment.Right
    }), 
    v1(".Top", {
        TextYAlignment = Enum.TextYAlignment.Top
    }), 
    v1(".Bottom", {
        TextYAlignment = Enum.TextYAlignment.Bottom
    }), 
    v1(".BuilderSans", {
        Font = Enum.Font.BuilderSans
    }, {
        v1(".Bold", {
            Font = Enum.Font.BuilderSansBold
        }), 
        v1(".Semibold", {
            Font = Enum.Font.BuilderSansMedium, 
            TextSize = 22
        })
    }), 
    v1(".Muted", {
        TextColor3 = "$ContentMuted"
    })
}, {
    TextLabelFont = Enum.Font.SourceSans, 
    TextLabelTextSize = 16, 
    TextLabelTitleSize = 24
});