local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return v1.Styling.createStyleSheet("PlaceAnnotations", {
    l_createStyleRule_0("Frame", {
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0("GuiButton", {
        AutoButtonColor = false
    }), 
    l_createStyleRule_0("TextLabel", {
        TextColor3 = "$TextPrimary", 
        Font = "$Font", 
        TextSize = "$FontSizeM", 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        l_createStyleRule_0(".Disabled", {
            TextTransparency = 0.4
        })
    }), 
    l_createStyleRule_0("TextButton", {
        TextColor3 = "$TextPrimary", 
        Font = "$Font", 
        TextSize = "$FontSizeM"
    }), 
    l_createStyleRule_0(".Component-Avatar", {
        Size = UDim2.fromOffset(32, 32)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    }), 
    l_createStyleRule_0(".Component-Dropdown", {
        BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface200" or "$ForegroundContrast"
    }, {
        l_createStyleRule_0("::UIStroke", {
            Thickness = 1, 
            Color = v2.fflagAnnotationsModernColors and "$SemanticColorDivider" or "$ForegroundMain", 
            Transparency = v2.fflagAnnotationsModernColors and "$SemanticColorDividerTransparency" or nil
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 8)
        })
    }), 
    l_createStyleRule_0(".Component-DropdownItem", {
        BorderSizePixel = 0, 
        BackgroundColor3 = if v2.fflagAnnotationsModernColors then nil else "$SecondaryMain", 
        BackgroundTransparency = v2.fflagAnnotationsModernColors and 1 or nil, 
        TextColor3 = "$TextPrimary", 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingRight = UDim.new(0, 10), 
            PaddingLeft = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5)
        }), 
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFill" or "$SecondaryHoverBackground", 
            BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFillHoverTransparency" or nil
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFill" or "$ActionActivated", 
            BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFillPressTransparency" or nil
        }), 
        l_createStyleRule_0(".Delete", {
            TextColor3 = "$ErrorMain"
        })
    }), 
    l_createStyleRule_0(".Component-Divider", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorDivider" or "$TextDisabled", 
        BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorDividerTransparency" or nil
    }), 
    l_createStyleRule_0(".MoreIcon", {
        Image = "$MoreIcon"
    }), 
    l_createStyleRule_0(".CheckboxOnIcon", {
        Image = "$CheckboxOn", 
        Size = UDim2.fromOffset(16, 16)
    }), 
    l_createStyleRule_0(".CheckboxOffIcon", {
        Image = "$CheckboxOff", 
        Size = UDim2.fromOffset(16, 16)
    }), 
    l_createStyleRule_0(".ErrorIcon", {
        Image = "$Error", 
        Size = UDim2.fromOffset(16, 16)
    }), 
    l_createStyleRule_0(".CloseIcon", {
        Image = "$Close", 
        Size = UDim2.fromOffset(16, 16)
    }), 
    l_createStyleRule_0(".SettingsIcon", {
        Image = "$Settings", 
        Size = UDim2.fromOffset(16, 16)
    })
}, {
    Font = Enum.Font.SourceSans, 
    FontBold = Enum.Font.SourceSansBold, 
    FontSizeS = 15, 
    FontSizeM = 18, 
    FontSizeL = 20
});