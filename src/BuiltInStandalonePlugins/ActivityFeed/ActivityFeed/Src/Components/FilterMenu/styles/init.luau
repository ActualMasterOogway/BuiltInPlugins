local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_buttonPaddingHorizontal_0 = v2.buttonPaddingHorizontal;
local l_buttonPaddingVertical_0 = v2.buttonPaddingVertical;
local l_defaultPadding_0 = v2.defaultPadding;
local l_filterHeaderHeight_0 = v2.filterHeaderHeight;
local l_checkBoxRowHeight_0 = v2.checkBoxRowHeight;
local l_normalFontSize_0 = v2.normalFontSize;
local l_headerFontSize_0 = v2.headerFontSize;
return l_createStyleRule_0(".Component-FilterMenu", {
    BackgroundColor3 = "$ForegroundMain"
}, {
    l_createStyleRule_0(">> .Component-OptionButton", {
        AutoButtonColor = false, 
        TextColor3 = "$TextPrimary"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, l_buttonPaddingHorizontal_0), 
            PaddingRight = UDim.new(0, l_buttonPaddingHorizontal_0), 
            PaddingTop = UDim.new(0, l_buttonPaddingVertical_0), 
            PaddingBottom = UDim.new(0, l_buttonPaddingVertical_0)
        })
    }), 
    l_createStyleRule_0(">> #Header", {
        Size = UDim2.new(1, 0, 0, l_filterHeaderHeight_0)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        l_createStyleRule_0("::UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
        }), 
        l_createStyleRule_0("> #Text", {
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            TextSize = l_headerFontSize_0, 
            TextColor3 = "$TextPrimary", 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        l_createStyleRule_0("> #Buttons", {}, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = UDim.new(0, l_defaultPadding_0)
            }), 
            l_createStyleRule_0("> #Clear", {
                BackgroundColor3 = "$SecondaryMain"
            }, {
                l_createStyleRule_0(":hover", {
                    BackgroundColor3 = "$SecondaryHoverBackground"
                })
            }), 
            l_createStyleRule_0("> #Apply", {
                BackgroundColor3 = "$PrimaryMain"
            }, {
                l_createStyleRule_0(":hover", {
                    BackgroundColor3 = "$PrimaryHoverBackground"
                })
            })
        })
    }), 
    l_createStyleRule_0("> #Contents", {
        Size = UDim2.new(1, 0, 1, -l_filterHeaderHeight_0), 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 16), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        l_createStyleRule_0("::UIListLayout", {
            Padding = UDim.new(0, 24)
        }), 
        l_createStyleRule_0(">> #ByDateRange", {}, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = UDim.new(0, l_defaultPadding_0)
            }), 
            l_createStyleRule_0("> #Label", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextSize = l_normalFontSize_0, 
                TextColor3 = "$TextPrimary", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1
            }), 
            l_createStyleRule_0("> #ByDateRangeFilter", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            })
        }), 
        l_createStyleRule_0(">> .Component-FilterMenu-By", {
            Size = UDim2.new(1, 0, 0, v2.byHeight), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("> #Label", {
                Position = UDim2.new(0, 2, 0, 0), 
                Size = UDim2.new(0.5, 0, 1, 0), 
                TextSize = l_normalFontSize_0, 
                TextColor3 = "$TextPrimary", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1
            }), 
            l_createStyleRule_0("> #SelectAll", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                TextSize = l_normalFontSize_0, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1, 
                TextColor3 = "$TextPrimary"
            }, {
                l_createStyleRule_0(":hover", {
                    TextColor3 = "$TextSecondary"
                })
            })
        }), 
        l_createStyleRule_0(">> .Component-FilterMenu-CheckBoxes", {
            Size = UDim2.new(1, 0, 0, l_checkBoxRowHeight_0)
        }, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = UDim.new(0, l_defaultPadding_0)
            }), 
            l_createStyleRule_0(">> #CheckboxContainer", {
                Size = UDim2.new(0, 24, 0, l_checkBoxRowHeight_0)
            }), 
            l_createStyleRule_0(">> .Component-Checkbox", {
                Position = UDim2.new(0, 0, 0, l_checkBoxRowHeight_0 / 2 - 12)
            }), 
            l_createStyleRule_0(">> .Component-CheckboxButton", {
                TextColor3 = "$TextPrimary", 
                Size = UDim2.new(1, -100, 0, l_checkBoxRowHeight_0), 
                BackgroundTransparency = 1, 
                TextSize = l_normalFontSize_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    })
});