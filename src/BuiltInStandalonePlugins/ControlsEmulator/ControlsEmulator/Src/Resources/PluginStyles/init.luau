local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local v4 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants);
return l_createStyleSheet_0("ControlsEmulator", {
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = v4.defaultFont, 
        TextSize = v4.normalFontSize
    }), 
    l_createStyleRule_0("ScrollingFrame", {
        ScrollBarThickness = 8, 
        ScrollBarImageColor3 = "$SecondaryButtonBackgroundColor"
    }), 
    l_createStyleRule_0("Frame", {
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0(".HeaderButton", {
        Size = UDim2.new(0, 0, 0, v4.headerFontSize + 8), 
        TextSize = v4.headerFontSize, 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 0, 
        Wraps = true, 
        AutoButtonColor = false
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, v4.buttonPaddingHorizontal), 
            PaddingRight = UDim.new(0, v4.buttonPaddingHorizontal), 
            PaddingTop = UDim.new(0, v4.buttonPaddingVertical), 
            PaddingBottom = UDim.new(0, v4.buttonPaddingVertical)
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, v4.buttonCornerRadius)
        }), 
        l_createStyleRule_0(".Primary", {
            TextColor3 = "$ButtonTextColor", 
            BackgroundColor3 = "$PrimaryButtonBackgroundColor"
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryButtonHoverBackgroundColor"
            })
        }), 
        l_createStyleRule_0(".Secondary", {
            TextColor3 = "$ButtonTextColor", 
            BackgroundColor3 = "$SecondaryButtonBackgroundColor"
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$SecondaryButtonHoverBackgroundColor"
            })
        }), 
        l_createStyleRule_0(".Inactive", {
            TextColor3 = "$ButtonTextColor", 
            BackgroundTransparency = 0.4, 
            TextTransparency = 0.4, 
            BackgroundColor3 = "$PrimaryButtonBackgroundColor"
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryButtonBackgroundColor"
            })
        })
    }), 
    l_createStyleRule_0(".CX-Invisible", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0(".CX-Divider", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = "$DividerColor", 
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0(".Width-Scaling", {
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        SizeConstraint = Enum.SizeConstraint.RelativeXX
    }), 
    l_createStyleRule_0(">> .Widget-Button", {
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0(".Active", {
        BackgroundColor3 = "$ControlActiveColor", 
        BackgroundTransparency = 0.3
    }), 
    l_createStyleRule_0(".Hovered", {
        BackgroundColor3 = "$ControlActiveColor", 
        BackgroundTransparency = 0.6
    }), 
    l_createStyleRule_0(".Hovered.Active", {
        BackgroundColor3 = "$ControlActiveColor", 
        BackgroundTransparency = 0.3
    }), 
    l_createStyleRule_0("#ScrollableBlueprintContainer", {
        Size = UDim2.new(1, 0, 1, -v4.deviceHeaderHeight), 
        BackgroundColor3 = "$BlueprintBackgroundColor", 
        ScrollBarThickness = 8, 
        ScrollingDirection = Enum.ScrollingDirection.XY, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasSize = UDim2.new(0, 0, 0, 0), 
        BorderSizePixel = 0, 
        ScrollBarImageColor3 = "$SecondaryButtonBackgroundColor"
    }, {
        l_createStyleRule_0(">> #GamepadAndVRLayoutContainer", {}, {
            l_createStyleRule_0("::UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical
            })
        })
    }), 
    l_createStyleRule_0(">> .Mapping-Widget", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        l_createStyleRule_0(">> .Mapping-Label", {
            Size = UDim2.new(0.04, 0, 0.04, 0), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0(">> TextLabel", {
                Font = v4.defaultFontBold, 
                BackgroundTransparency = 1, 
                TextColor3 = "$BlueprintLabelsColor", 
                TextSize = v4.blueprintLabelFontSize, 
                TextScaled = true, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        }), 
        l_createStyleRule_0(">> .Component-Arrow", {
            Color3 = "$BlueprintArrowColor"
        }), 
        l_createStyleRule_0(">> .Component-Arrow-Circle", {
            Size = UDim2.new(0.02, 0, 0.02, 0), 
            Color3 = "$BlueprintArrowColor", 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    }), 
    l_createStyleRule_0(">> .X-Circle", {}, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })
}, {
    BlueprintWithMappingsPadding = UDim.new(0.2, 0), 
    TooltipPadding = UDim.new(0, 10)
});