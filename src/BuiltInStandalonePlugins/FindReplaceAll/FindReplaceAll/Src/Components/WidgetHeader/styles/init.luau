local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants);
return l_createStyleRule_0(".Component-WidgetHeader", {
    BackgroundColor3 = "$ForegroundContrast", 
    BorderSizePixel = 0, 
    TextColor3 = "$TextPrimary", 
    Size = UDim2.new(1, 0, 0, v2.widgetHeaderHeight), 
    TextSize = v2.inputTextSize
}, {
    l_createStyleRule_0(":: UIListLayout", {
        Padding = UDim.new(0, 5), 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalFlex = Enum.UIFlexAlignment.None, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        ItemLineAlignment = Enum.ItemLineAlignment.Start
    }), 
    l_createStyleRule_0("> .FindLine", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v2.widgetHeaderLineHeight)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 7), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10)
        }), 
        l_createStyleRule_0("> .CheckButton ::UIPadding, > .ToggleButton ::UIPadding", {
            PaddingLeft = UDim.new(0, 5)
        }), 
        l_createStyleRule_0("> .ToggleButton >> ImageButton, > .PushButton >> ImageButton", {
            BackgroundColor3 = "$ForegroundContrast"
        }), 
        l_createStyleRule_0("> #ToggleShowReplaceButton >> ImageButton", {}, {
            l_createStyleRule_0(".Checked", {
                Image = "$CollapseReplaceInput"
            }), 
            l_createStyleRule_0(".Unchecked", {
                Image = "$ExpandReplaceInput"
            })
        }), 
        l_createStyleRule_0("> .SearchBar", {
            BackgroundColor3 = "$BackgroundDefault", 
            TextColor3 = "$TextPrimary", 
            Height = v2.widgetHeaderLineHeight
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingRight = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        l_createStyleRule_0("> .CheckButton >> ImageButton", {}, {
            l_createStyleRule_0(".Checked", {
                BackgroundColor3 = "$ForegroundMain"
            }), 
            l_createStyleRule_0(".Unchecked", {
                BackgroundColor3 = "$ForegroundContrast"
            })
        }), 
        l_createStyleRule_0("> #MatchCaseCheckButton >> ImageButton", {
            Image = "$MatchCase"
        }), 
        l_createStyleRule_0("> #MatchWholeWordCheckButton >> ImageButton", {
            Image = "$MatchWholeWord"
        }), 
        l_createStyleRule_0("> #MatchRegExCheckButton >> ImageButton", {
            Image = "$RegularExpression"
        }), 
        l_createStyleRule_0("> #FindPreviousButton >> ImageButton", {
            Image = "$FindPrevious"
        }), 
        l_createStyleRule_0("> #FindNextButton >> ImageButton", {
            Image = "$FindNext"
        }), 
        l_createStyleRule_0("> #ToggleFilterButton >> ImageButton", {
            Image = "$Filter"
        })
    }), 
    l_createStyleRule_0("> .ReplaceLine", {
        Size = UDim2.new(1, 0, 0, v2.widgetHeaderLineHeight)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 30), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 0)
        }), 
        l_createStyleRule_0("> .ReplaceInput", {
            BackgroundColor3 = "$BackgroundDefault", 
            TextColor3 = "$TextPrimary"
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingRight = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        l_createStyleRule_0("> .Compact", {
            BackgroundColor3 = "$ForegroundContrast"
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            })
        })
    }), 
    l_createStyleRule_0("> .FilterLine", {
        Size = UDim2.new(1, 0, 0, 2 * v2.widgetHeaderLineHeight)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0)
        }), 
        l_createStyleRule_0("> .FilterLabel", {
            Size = UDim2.new(1, 0, 0, v2.widgetHeaderLineHeight), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v2.labelTextSize, 
            TextColor3 = "$TextSecondary"
        }), 
        l_createStyleRule_0("> .FilterInput", {
            BackgroundColor3 = "$BackgroundDefault", 
            TextColor3 = "$TextPrimary", 
            Size = UDim2.new(1, 0, 0, v2.widgetHeaderLineHeight)
        }, {
            l_createStyleRule_0(">> TextBox", {}, {
                l_createStyleRule_0("::UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                })
            })
        })
    })
});