local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local v4 = require(l_Parent_0.Src.SharedFlags.getFFlagAddTestModeDropDown)();
local v5 = require(l_Parent_0.Src.SharedFlags.getFFlagRibbonDynamicBackground)();
local v6 = require(l_Parent_0.Src.SharedFlags.getFFlagRibbonSpinboxStyleUpdate)();
local v7 = require(l_Parent_0.Src.SharedFlags.getFFlagRibbonEnableSliderLua)();
return l_createStyleSheet_0("Ribbon", {
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = Enum.Font.SourceSans
    }), 
    l_createStyleRule_0(".Role-Surface", {
        BackgroundTransparency = "$BackgroundTransparent", 
        BorderSizePixel = "$BorderNone"
    }), 
    l_createStyleRule_0(".Role-Surface100", {
        BackgroundColor3 = v5 and "$SemanticColorSurface100" or "$DEPRECATED_MainBackground", 
        BorderSizePixel = "$BorderNone"
    }), 
    l_createStyleRule_0(".Text-Label", {
        Font = "$FontWeight400", 
        TextColor3 = "$SemanticColorContentMuted", 
        TextSize = "$FontSize100", 
        BorderSizePixel = "$BorderNone", 
        BackgroundTransparency = "$BackgroundTransparent"
    }), 
    l_createStyleRule_0(".Text-Title", {
        Font = "$FontWeight700", 
        TextColor3 = "$SemanticColorContentMuted", 
        TextSize = "$FontSize100", 
        BorderSizePixel = "$BorderNone", 
        BackgroundTransparency = "$BackgroundTransparent"
    }), 
    l_createStyleRule_0(".TooltipBackground", {
        BackgroundColor3 = "$SemanticColorSurface300Inverse", 
        BorderSizePixel = "$BorderNone"
    }, {
        l_createStyleRule_0(">> TextLabel", {
            TextColor3 = "$SemanticColorContentStandardInverse"
        })
    }), 
    l_createStyleRule_0(".TooltipTextBounds", {
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        l_createStyleRule_0("::UISizeConstraint", {
            MaxSize = Vector2.new(200, 1e999)
        })
    }), 
    l_createStyleRule_0(".Role-DividerH", {
        Size = UDim2.new(1, 0, 0, 1)
    }, {
        l_createStyleRule_0("> Frame", {
            BackgroundColor3 = "$SemanticColorDivider", 
            BackgroundTransparency = "$SemanticColorDividerTransparency", 
            BorderSizePixel = "$BorderNone", 
            Size = UDim2.new(1, 0, 0, 1)
        })
    }), 
    l_createStyleRule_0(".Role-DividerV", {}, {
        l_createStyleRule_0("> Frame", {
            BackgroundColor3 = "$SemanticColorDivider", 
            BackgroundTransparency = "$SemanticColorDividerTransparency", 
            BorderSizePixel = "$BorderNone"
        }), 
        l_createStyleRule_0(".Small", {}, {
            l_createStyleRule_0("> Frame", {
                Size = UDim2.new(0, 1, 0, 28)
            })
        }), 
        l_createStyleRule_0(".Medium", {}, {
            l_createStyleRule_0("> Frame", {
                Size = UDim2.new(0, 1, 0, 48)
            })
        }), 
        l_createStyleRule_0(".Large", {}, {
            l_createStyleRule_0("> Frame", {
                Size = UDim2.new(0, 1, 0, 64)
            })
        }), 
        l_createStyleRule_0(".RibbonButton-Divider", {}, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = "$GlobalSpace150", 
                PaddingRight = "$GlobalSpace150"
            })
        })
    }), 
    l_createStyleRule_0(".X-RowSpaceBetween", {
        Size = UDim2.fromScale(1, 0)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace200", 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            ItemLineAlignment = Enum.ItemLineAlignment.Center
        })
    }), 
    l_createStyleRule_0(".X-RowSpace50", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace50", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-RowSpace100", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace100", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-RowSpace150", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace150", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-RowSpace200", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace200", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-ColumnSpace25", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = "$GlobalSpace25", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-ColumnSpace50", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = "$GlobalSpace50", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-ColumnSpace100", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = "$GlobalSpace100", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-PadSpace150 ::UIPadding", {
        PaddingLeft = "$GlobalSpace150", 
        PaddingRight = "$GlobalSpace150", 
        PaddingTop = "$GlobalSpace150", 
        PaddingBottom = "$GlobalSpace150"
    }), 
    l_createStyleRule_0(".X-MezzPaddingLeft ::UIPadding", {
        PaddingLeft = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".X-MezzPaddingRight ::UIPadding", {
        PaddingRight = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".X-RowXS", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace25", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".Component-RibbonTab", {
        BackgroundTransparency = "$BackgroundTransparent", 
        Font = "$FontWeight400", 
        Size = UDim2.new(0, 80, 0, 28), 
        TextColor3 = "$SemanticColorContentMuted", 
        TextSize = "$FontSize150"
    }, {
        l_createStyleRule_0(".State-Selected", {
            BackgroundColor3 = "$SemanticColorStatesSelected", 
            BackgroundTransparency = "$SemanticColorStatesSelectedTransparency", 
            Font = "$FontWeight700", 
            TextColor3 = "$SemanticColorContentStandard"
        }), 
        l_createStyleRule_0(".State-Disabled", {
            TextColor3 = "$SemanticColorContentDisabled"
        }), 
        l_createStyleRule_0(".State-Default :hover, .State-Disabled :hover", {
            BackgroundColor3 = "$SemanticColorStateLayerHover", 
            BackgroundTransparency = "$SemanticColorStateLayerHoverTransparency"
        })
    }), 
    l_createStyleRule_0(".Component-RibbonTabs", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.fromScale(0.5, 0.5), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollBarThickness = 0, 
        HorizontalScrollBarInset = Enum.ScrollBarInset.None
    }, {
        l_createStyleRule_0(".Medium", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -390, 0.5, 0)
        }), 
        l_createStyleRule_0(".Small", {
            AnchorPoint = Vector2.new(0, 0.5), 
            AutomaticSize = Enum.AutomaticSize.None, 
            Position = UDim2.new(0, 160, 0.5, 0), 
            Size = UDim2.new(1, -550, 0, 28)
        })
    }), 
    l_createStyleRule_0(".X-CornerXS ::UICorner", {
        CornerRadius = "$GlobalRadiusXSmall"
    }), 
    l_createStyleRule_0(".X-CornerS ::UICorner", {
        CornerRadius = "$GlobalRadiusSmall"
    }), 
    l_createStyleRule_0(".X-CornerM ::UICorner", {
        CornerRadius = "$GlobalRadiusMedium"
    }), 
    l_createStyleRule_0(".X-PadMezz :: UIPadding", {
        PaddingLeft = UDim.new(0, 1)
    }), 
    l_createStyleRule_0(".X-PadRibbonTool ::UIPadding", {
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = "$GlobalSpace100", 
        PaddingBottom = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".X-PadSplitButtonTool ::UIPadding", {
        PaddingLeft = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".X-PadSplitButtonDropdown :: UIPadding", {
        PaddingLeft = "$GlobalSpace25", 
        PaddingRight = "$GlobalSpace75", 
        PaddingTop = "$GlobalSpace350", 
        PaddingBottom = "$GlobalSpace75"
    }), 
    l_createStyleRule_0(".X-PadSplitButtonDropdownSmall :: UIPadding", {
        PaddingRight = "$GlobalSpace25", 
        PaddingTop = "$GlobalSpace250", 
        PaddingBottom = "$GlobalSpace50"
    }), 
    l_createStyleRule_0(".X-PadSplitButtonToolSmall ::UIPadding", {
        PaddingLeft = "$GlobalSpace75"
    }), 
    l_createStyleRule_0(".X-PadButtonLabel ::UIPadding", {
        PaddingTop = "$GlobalSpace50", 
        PaddingBottom = "$GlobalSpace50"
    }), 
    l_createStyleRule_0(".X-PadRibbon ::UIPadding", {
        PaddingLeft = "$GlobalSpace150", 
        PaddingRight = "$GlobalSpace100", 
        PaddingTop = "$GlobalSpace150", 
        PaddingBottom = "$GlobalSpace150"
    }), 
    l_createStyleRule_0(".X-PadTabMenu ::UIPadding", {
        PaddingLeft = "$GlobalSpace100", 
        PaddingRight = "$GlobalSpace100", 
        PaddingTop = "$GlobalSpace100", 
        PaddingBottom = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".X-PadMezzanine ::UIPadding", {
        PaddingLeft = "$GlobalSpace75", 
        PaddingRight = "$GlobalSpace75", 
        PaddingTop = "$GlobalSpace75", 
        PaddingBottom = "$GlobalSpace75"
    }), 
    l_createStyleRule_0(".X-PadMenuOption ::UIPadding", {
        PaddingLeft = "$GlobalSpace100", 
        PaddingRight = "$GlobalSpace100", 
        PaddingTop = "$GlobalSpace50", 
        PaddingBottom = "$GlobalSpace50"
    }), 
    l_createStyleRule_0(".X-PadTooltip ::UIPadding", {
        PaddingLeft = "$GlobalSpace75", 
        PaddingRight = "$GlobalSpace75", 
        PaddingTop = "$GlobalSpace50", 
        PaddingBottom = "$GlobalSpace50"
    }), 
    l_createStyleRule_0(".X-RowSplitButton", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace25", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-RowSplitButtonSmall", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-RowSpinbox", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = "$GlobalSpace50", 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }), 
    l_createStyleRule_0(".X-PadSpinBox ::UIPadding", {
        PaddingLeft = "$GlobalSpace100"
    }), 
    l_createStyleRule_0(".Component-RibbonButton", {
        AutoButtonColor = false, 
        BackgroundTransparency = "$BackgroundTransparent", 
        BorderSizePixel = "$BorderNone", 
        Text = ""
    }, {
        l_createStyleRule_0("> TextLabel", {
            BackgroundTransparency = "$BackgroundTransparent", 
            Font = "$FontWeight400", 
            LayoutOrder = 2, 
            TextColor3 = "$SemanticColorContentMuted", 
            TextSize = "$FontSize100"
        }), 
        l_createStyleRule_0(">> #RibbonToolButtonIcon, >> #ButtonIcon", {
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone", 
            LayoutOrder = 0
        }, {
            l_createStyleRule_0(".Icon-Large", {
                Size = "$IconLarge"
            }), 
            l_createStyleRule_0(".Icon-Small", {
                Size = "$IconSmall"
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0(">> #RibbonTool", {}, {
                l_createStyleRule_0("> #RibbonToolButtonIcon", {
                    ImageTransparency = "$IconDisabled"
                })
            }), 
            l_createStyleRule_0("> TextLabel", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        }), 
        l_createStyleRule_0(".State-Default", {}, {
            l_createStyleRule_0(">> #RibbonTool, >> #StateLayer", {}, {
                l_createStyleRule_0(":hover", {
                    BackgroundTransparency = "$SemanticColorStateLayerHoverTransparency", 
                    BackgroundColor3 = "$SemanticColorStateLayerHover"
                }), 
                l_createStyleRule_0(":pressed", {
                    BackgroundTransparency = "$SemanticColorStateLayerPressTransparency", 
                    BackgroundColor3 = "$SemanticColorStateLayerPress"
                })
            })
        }), 
        l_createStyleRule_0(".State-Selected", {}, {
            l_createStyleRule_0(">> #RibbonTool", {
                BackgroundTransparency = "$SemanticColorStatesSelectedTransparency", 
                BackgroundColor3 = "$SemanticColorStatesSelected"
            })
        }), 
        l_createStyleRule_0(">> Frame .Component-SplitButtonDropdown", {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 12, 0, 40)
        }, {
            l_createStyleRule_0(".Small", {
                Size = UDim2.new(0, 6, 0, 28)
            }), 
            l_createStyleRule_0("> TextButton", {
                AnchorPoint = UDim.new(1, 1), 
                AutoButtonColor = false, 
                Position = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                TextSize = 1
            }, {
                l_createStyleRule_0("> ImageLabel", {
                    Image = "$ArrowDownAngleSmall", 
                    Size = UDim2.fromOffset(6, 6)
                }, {
                    l_createStyleRule_0(".Small", {
                        Size = UDim2.fromOffset(4, 4)
                    })
                })
            })
        }), 
        l_createStyleRule_0("> Frame #StateLayer", {}, {
            l_createStyleRule_0(".State-Gradient-Hover", {
                BackgroundTransparency = "$BackgroundNonTransparent"
            }, {
                l_createStyleRule_0("::UIGradient", {
                    Color = "$SemanticColorStateLayerHoverGradient", 
                    Rotation = "$SemanticColorStateLayerHoverGradientRotation", 
                    Transparency = "$SemanticColorStateLayerHoverGradientTransparency"
                })
            }), 
            l_createStyleRule_0(".State-Gradient-Pressed", {
                BackgroundTransparency = "$BackgroundNonTransparent"
            }, {
                l_createStyleRule_0("::UIGradient", {
                    Color = "$SemanticColorStateLayerPressGradient", 
                    Rotation = "$SemanticColorStateLayerPressGradientRotation", 
                    Transparency = "$SemanticColorStateLayerPressGradientTransparency"
                })
            })
        })
    }), 
    l_createStyleRule_0(".Ribbon-More", {
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = UDim2.new(1, -8, 0.5, 0), 
        ZIndex = 3
    }), 
    l_createStyleRule_0(".Component-Button", {
        AutoButtonColor = false, 
        Text = "", 
        Size = UDim2.new(0, 0, 0, 28)
    }, {
        l_createStyleRule_0("> #StateLayer", {
            Size = UDim2.new(0, 0, 0, 28)
        }, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = "$GlobalSpace50"
            }), 
            l_createStyleRule_0(".X-PadButtonSmall ::UIPadding", {
                PaddingLeft = "$GlobalSpace150", 
                PaddingRight = "$GlobalSpace150", 
                PaddingTop = "$GlobalSpace50", 
                PaddingBottom = "$GlobalSpace50"
            }), 
            l_createStyleRule_0(".X-PadButtonLarge ::UIPadding", {
                PaddingLeft = "$GlobalSpace250", 
                PaddingRight = "$GlobalSpace250", 
                PaddingTop = "$GlobalSpace150", 
                PaddingBottom = "$GlobalSpace150"
            }), 
            l_createStyleRule_0(".X-PadButtonMedium ::UIPadding", {
                PaddingLeft = "$GlobalSpace200", 
                PaddingRight = "$GlobalSpace200", 
                PaddingTop = "$GlobalSpace100", 
                PaddingBottom = "$GlobalSpace100"
            }), 
            l_createStyleRule_0("> #ButtonIcon", {
                LayoutOrder = 0
            }, {
                l_createStyleRule_0(".Icon-Large", {
                    Size = "$IconLarge"
                }), 
                l_createStyleRule_0(".Icon-Small", {
                    Size = "$IconSmall"
                }), 
                l_createStyleRule_0(".Right", {
                    LayoutOrder = 3
                })
            }), 
            l_createStyleRule_0("> #ButtonText", {
                Font = "$FontWeight700", 
                TextSize = "$FontSize200", 
                LayoutOrder = 2, 
                TextColor3 = "$SemanticColorContentStandard"
            }, {
                l_createStyleRule_0(".Small", {
                    TextSize = "$FontSize150"
                }), 
                l_createStyleRule_0(".Large", {
                    TextSize = "$FontSize300"
                })
            })
        }), 
        l_createStyleRule_0(".Outline", {
            Size = UDim2.new(0, 0, 0, 26)
        }, {
            l_createStyleRule_0("::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = "$SemanticColorDivider", 
                Thickness = "$BorderMedium", 
                Transparency = "$SemanticColorDividerTransparency"
            }), 
            l_createStyleRule_0("> #StateLayer", {
                Size = UDim2.new(0, 0, 0, 26)
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0(">> #ButtonIcon", {
                ImageTransparency = "$IconDisabled"
            }), 
            l_createStyleRule_0(">> #ButtonText", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        }), 
        l_createStyleRule_0(".State-Default", {}, {
            l_createStyleRule_0(":hover > #StateLayer", {
                BackgroundTransparency = "$SemanticColorStateLayerHoverTransparency", 
                BackgroundColor3 = "$SemanticColorStateLayerHover"
            }), 
            l_createStyleRule_0(":pressed > #StateLayer", {
                BackgroundTransparency = "$SemanticColorStateLayerPressTransparency", 
                BackgroundColor3 = "$SemanticColorStateLayerPress"
            })
        }), 
        l_createStyleRule_0(".Primary", {
            BackgroundColor3 = "$SemanticColorActionPrimaryFill", 
            BackgroundTransparency = "$BackgroundNonTransparent"
        }, {
            l_createStyleRule_0(".State-Default", {}, {
                l_createStyleRule_0(":hover > #StateLayer", {
                    BackgroundTransparency = "$SemanticColorStateLayerHoverTransparencyInverse", 
                    BackgroundColor3 = "$SemanticColorStateLayerHoverInverse"
                }), 
                l_createStyleRule_0(":pressed > #StateLayer", {
                    BackgroundTransparency = "$SemanticColorStateLayerPressTransparencyInverse", 
                    BackgroundColor3 = "$SemanticColorStateLayerPressInverse"
                })
            }), 
            l_createStyleRule_0(">> #ButtonText", {
                TextColor3 = "$SemanticColorContentStandardInverse"
            })
        })
    }), 
    l_createStyleRule_0(".Component-RibbonCheckbox", {
        BackgroundTransparency = "$BackgroundTransparent", 
        BorderSizePixel = "$BorderNone"
    }, {
        l_createStyleRule_0(">> #CheckboxButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone", 
            LayoutOrder = 1, 
            Text = ""
        }), 
        l_createStyleRule_0(">> #CheckboxLabel", {
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone", 
            Font = "$FontWeight400", 
            LayoutOrder = 2
        }), 
        l_createStyleRule_0(">> #CheckboxIcon", {
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone"
        }), 
        l_createStyleRule_0(".Small, .Medium", {}, {
            l_createStyleRule_0(">> #CheckboxButton", {}, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = "$GlobalSpace100", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }), 
            l_createStyleRule_0(">> #CheckboxIcon", {
                Size = "$IconSmall"
            })
        }), 
        l_createStyleRule_0(".Small", {}, {
            l_createStyleRule_0(">> #CheckboxLabel", {
                TextSize = "$FontSize150"
            })
        }), 
        l_createStyleRule_0(".Medium", {}, {
            l_createStyleRule_0(">> #CheckboxLabel", {
                TextSize = "$FontSize200"
            })
        }), 
        l_createStyleRule_0(".Large", {}, {
            l_createStyleRule_0(">> #CheckboxButton", {}, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = "$GlobalSpace150", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }), 
            l_createStyleRule_0(">> #CheckboxIcon", {
                Size = "$IconLarge"
            }), 
            l_createStyleRule_0(">> #CheckboxLabel", {
                TextSize = "$FontSize300"
            })
        }), 
        l_createStyleRule_0(".State-Default", {}, {
            l_createStyleRule_0(">> #CheckboxIcon", {
                Image = "$CheckboxOffDefault"
            }), 
            l_createStyleRule_0(":hover >> #CheckboxIcon", {
                Image = "$CheckboxOffHover"
            }), 
            l_createStyleRule_0(".Checked >> #CheckboxIcon", {
                Image = "$CheckboxCheckedDefault"
            }), 
            l_createStyleRule_0(".Indeterminate >> #CheckboxIcon", {
                Image = "$CheckboxMixDefault"
            }), 
            l_createStyleRule_0(">> #CheckboxLabel", {
                TextColor3 = "$SemanticColorContentStandard"
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0(">> #CheckboxIcon", {
                Image = "$CheckboxOffDisabled"
            }), 
            l_createStyleRule_0(".Checked >> #CheckboxIcon", {
                Image = "$CheckboxCheckedDisabled"
            }), 
            l_createStyleRule_0(".Indeterminate >> #CheckboxIcon", {
                Image = "$CheckboxMixDisabled"
            }), 
            l_createStyleRule_0(">> #CheckboxLabel", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        })
    }), 
    l_createStyleRule_0(".Component-RibbonRadioButton", {
        BackgroundTransparency = "$BackgroundTransparent", 
        BorderSizePixel = "$BorderNone"
    }, {
        l_createStyleRule_0(">> #RadioButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone", 
            LayoutOrder = 1, 
            Text = ""
        }), 
        l_createStyleRule_0(">> #RadioButtonLabel", {
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone", 
            Font = "$FontWeight400", 
            LayoutOrder = 2
        }), 
        l_createStyleRule_0(">> #RadioButtonIcon", {
            BackgroundTransparency = "$BackgroundTransparent", 
            BorderSizePixel = "$BorderNone"
        }), 
        l_createStyleRule_0(".Small, .Medium", {}, {
            l_createStyleRule_0(">> #RadioButton", {}, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = "$GlobalSpace100", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }), 
            l_createStyleRule_0(">> #RadioButtonIcon", {
                Size = "$IconSmall"
            })
        }), 
        l_createStyleRule_0(".Small", {}, {
            l_createStyleRule_0(">> #RadioButtonLabel", {
                TextSize = "$FontSize150"
            })
        }), 
        l_createStyleRule_0(".Medium", {}, {
            l_createStyleRule_0(">> #RadioButtonLabel", {
                TextSize = "$FontSize200"
            })
        }), 
        l_createStyleRule_0(".Large", {}, {
            l_createStyleRule_0(">> #RadioButton", {}, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = "$GlobalSpace150", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }), 
            l_createStyleRule_0(">> #RadioButtonIcon", {
                Size = "$IconLarge"
            }), 
            l_createStyleRule_0(">> #RadioButtonLabel", {
                TextSize = "$FontSize300"
            })
        }), 
        l_createStyleRule_0(".State-Default", {}, {
            l_createStyleRule_0(">> #RadioButtonIcon", {
                Image = "$RadioButtonUncheckedDefault"
            }), 
            l_createStyleRule_0(":hover >> #RadioButtonIcon", {
                Image = "$RadioButtonUncheckedHover"
            }), 
            l_createStyleRule_0(".Checked >> #RadioButtonIcon", {
                Image = "$RadioButtonCheckedDefault"
            }), 
            l_createStyleRule_0(">> #RadioButtonLabel", {
                TextColor3 = "$SemanticColorContentStandard"
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0(">> #RadioButtonIcon", {
                Image = "$RadioButtonUncheckedDisabled"
            }), 
            l_createStyleRule_0(".Checked >> #RadioButtonIcon", {
                Image = "$RadioButtonCheckedDisabled"
            }), 
            l_createStyleRule_0(">> #RadioButtonLabel", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        })
    }), 
    l_createStyleRule_0(".Component-MenuItem", {
        AutoButtonColor = false, 
        BorderSizePixel = "$BorderNone", 
        BackgroundTransparency = "$BackgroundTransparent", 
        Text = ""
    }, {
        l_createStyleRule_0(">> .Icon", {
            BorderSizePixel = "$BorderNone", 
            BackgroundTransparency = "$BackgroundTransparent", 
            LayoutOrder = 1, 
            Size = "$IconLarge"
        }), 
        l_createStyleRule_0("> .Arrow", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            BorderSizePixel = "$BorderNone", 
            BackgroundTransparency = 1, 
            Image = "$ArrowRightSmall", 
            LayoutOrder = 3, 
            Size = "$IconSmall"
        }), 
        l_createStyleRule_0(">> .X-ArrowSpace", {
            LayoutOrder = 3, 
            Size = "$IconSmall"
        }), 
        l_createStyleRule_0(">> TextLabel", {
            BackgroundTransparency = 1, 
            Font = "$FontWeight400", 
            TextSize = "$FontSize150", 
            LayoutOrder = 2, 
            TextColor3 = "$SemanticColorContentStandard"
        }), 
        l_createStyleRule_0(".Small", {}, {
            l_createStyleRule_0(">> .Icon", {
                Size = "$IconSmall"
            }), 
            l_createStyleRule_0(">> TextLabel", {
                TextSize = "$FontSize100"
            })
        }), 
        l_createStyleRule_0(".State-Default:hover, .State-ActionDisabled:hover", {
            BackgroundColor3 = "$SemanticColorStatesHover", 
            BackgroundTransparency = "$SemanticColorStatesHoverTransparency"
        }), 
        l_createStyleRule_0(".State-Selected", {
            BackgroundColor3 = "$SemanticColorStatesSelected", 
            BackgroundTransparency = "$SemanticColorStatesSelectedTransparency"
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0(">> .Icon", {
                ImageTransparency = "$IconDisabled"
            }), 
            l_createStyleRule_0(">> TextLabel", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        })
    }), 
    l_createStyleRule_0(".Component-TextInput", if v6 then nil else {
        Size = UDim2.new(0, 90, 0, 20)
    }), 
    l_createStyleRule_0(".Component-RibbonSpinboxWrapper", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = "$GlobalSpace50", 
            PaddingRight = "$GlobalSpace50", 
            PaddingTop = "$GlobalSpace25", 
            PaddingBottom = "$GlobalSpace25"
        })
    }), 
    l_createStyleRule_0(".Component-RibbonSpinbox", {}, {
        l_createStyleRule_0("::UIStroke", {
            Thickness = "$BorderNone"
        }), 
        l_createStyleRule_0(">> TextBox", {
            TextSize = "$FontSize150", 
            TextXAlignment = if v6 then Enum.TextXAlignment.Left else nil
        }, if v6 then {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = "$GlobalSpace50", 
                PaddingRight = "$GlobalSpace25"
            })
        } else nil), 
        l_createStyleRule_0(".State-Default", {
            BackgroundColor3 = "$SemanticColorComponentInputFill", 
            BackgroundTransparency = "$SemanticColorComponentInputFillTransparency"
        }, {
            l_createStyleRule_0(">> TextBox", {
                TextColor3 = "$SemanticColorContentMuted"
            })
        }), 
        l_createStyleRule_0(".State-Focus", {}, {
            l_createStyleRule_0("::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = "$SemanticColorFocusBorderPrimaryBrand", 
                Thickness = "$BorderMedium"
            }), 
            l_createStyleRule_0(">> TextBox", {
                TextColor3 = "$SemanticColorContentStandard"
            })
        }), 
        l_createStyleRule_0(".State-Default :hover", {
            BackgroundColor3 = "$SemanticColorComponentInputHover", 
            BackgroundTransparency = "$SemanticColorComponentInputHoverTransparency"
        }, {
            l_createStyleRule_0(">> TextBox", {
                TextColor3 = "$SemanticColorContentStandard"
            }), 
            if v6 then nil else l_createStyleRule_0(".NotDense", {}, {
                l_createStyleRule_0("::UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                    Color = "$SemanticColorStateLayerHover", 
                    Transparency = "$SemanticColorStateLayerHoverTransparency", 
                    Thickness = "$BorderMedium"
                })
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {
            BackgroundColor3 = "$SemanticColorComponentInputFill", 
            BackgroundTransparency = "$SemanticColorComponentInputFillTransparency"
        }, {
            l_createStyleRule_0(">> TextBox", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        })
    }), 
    l_createStyleRule_0(".Component-RibbonSpinboxController", {}, {
        l_createStyleRule_0("> TextButton", {
            Size = UDim2.new(0, 16, 0, 8)
        }, {
            l_createStyleRule_0(">> #LeftIcon", {
                Size = UDim2.new(0, 16, 0, 8)
            })
        }), 
        l_createStyleRule_0(".State-Default", {}, {
            l_createStyleRule_0("> .ControlUp", {}, {
                l_createStyleRule_0(".State-Default >> ImageLabel", {
                    Image = "$SpinboxControllerUpDefault"
                }), 
                l_createStyleRule_0(".State-Default :hover >> ImageLabel", {
                    Image = "$SpinboxControllerUpHover"
                }), 
                l_createStyleRule_0(".State-Disabled >> ImageLabel", {
                    Image = "$SpinboxControllerUpDisabled"
                })
            }), 
            l_createStyleRule_0("> .ControlDown", {}, {
                l_createStyleRule_0(".State-Default >> ImageLabel", {
                    Image = "$SpinboxControllerDownDefault"
                }), 
                l_createStyleRule_0(".State-Default :hover >> ImageLabel", {
                    Image = "$SpinboxControllerDownHover"
                }), 
                l_createStyleRule_0(".State-Disabled >> ImageLabel", {
                    Image = "$SpinboxControllerDownDisabled"
                })
            })
        })
    }), 
    l_createStyleRule_0(".Component-RibbonSegmentedButton", {
        BackgroundTransparency = "$BackgroundTransparent"
    }, {
        l_createStyleRule_0(":: UICorner", {
            CornerRadius = "$GlobalRadiusMedium"
        }), 
        l_createStyleRule_0(":: UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$SemanticColorDivider", 
            Thickness = "$BorderMedium", 
            Transparency = "$SemanticColorDividerTransparency"
        }), 
        l_createStyleRule_0("> CanvasGroup", {
            BackgroundTransparency = "$BackgroundTransparent"
        }, {
            l_createStyleRule_0(":: UICorner", {
                CornerRadius = "$GlobalRadiusMedium"
            }), 
            l_createStyleRule_0(">> Frame .StateLayer", {
                BackgroundTransparency = "$BackgroundTransparent", 
                BorderSizePixel = "$BorderNone"
            }, {
                l_createStyleRule_0(":hover", {
                    BackgroundColor3 = "$SemanticColorStateLayerHover", 
                    BackgroundTransparency = "$SemanticColorStateLayerHoverTransparency"
                }), 
                l_createStyleRule_0(".State-Pressed", {
                    BackgroundColor3 = "$SemanticColorStateLayerPress", 
                    BackgroundTransparency = "$SemanticColorStateLayerPressTransparency"
                })
            }), 
            l_createStyleRule_0(">> TextButton", {
                TextSize = "$FontSize150", 
                AutoButtonColor = false, 
                BorderSizePixel = "$BorderNone"
            }, {
                l_createStyleRule_0("::UIPadding", {
                    PaddingLeft = "$GlobalSpace150", 
                    PaddingRight = "$GlobalSpace150"
                }), 
                l_createStyleRule_0(".State-Default", {
                    BackgroundTransparency = "$BackgroundTransparent", 
                    Font = "$FontWeight700", 
                    TextColor3 = "$SemanticColorContentMuted"
                }), 
                l_createStyleRule_0(".State-Selected", {
                    BackgroundColor3 = "$SemanticColorStatesSelected", 
                    BackgroundTransparency = "$SemanticColorStatesSelectedTransparency", 
                    Font = "$FontWeight700", 
                    TextColor3 = "$SemanticColorContentStandard"
                })
            })
        })
    }), 
    l_createStyleRule_0(".Component-Toggle", {
        BackgroundColor3 = Color3.fromHex("#3F4046"), 
        BackgroundTransparency = "$BackgroundNonTransparent", 
        Size = UDim2.new(0, 40, 0, 24)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = "$GlobalRadiusCircle"
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingBottom = "$GlobalSpace25", 
            PaddingLeft = "$GlobalSpace25", 
            PaddingRight = "$GlobalSpace25", 
            PaddingTop = "$GlobalSpace25"
        }), 
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0("> Frame", {
            BackgroundColor3 = "$White", 
            Size = UDim2.new(0, 20, 0, 20)
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = "$GlobalRadiusCircle"
            })
        }), 
        l_createStyleRule_0(".State-Selected", {
            BackgroundColor3 = Color3.fromHex("#48D149")
        }, {
            l_createStyleRule_0("::UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {
            BackgroundTransparency = "$HalfTransparent"
        }, {
            l_createStyleRule_0("> Frame", {
                BackgroundTransparency = "$HalfTransparent"
            })
        })
    }), 
    l_createStyleRule_0(".Ribbon-OverflowHider", {
        Active = true, 
        AutoButtonColor = false, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Text = "", 
        ZIndex = 2
    }), 
    l_createStyleRule_0(".Ribbon-Fade", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, 0, 0, 1), 
        Size = UDim2.new(0, 22, 1, 0)
    }, {
        l_createStyleRule_0("::UIGradient", {
            Color = ColorSequence.new(Color3.fromHex("#1F2024")), 
            Rotation = 180, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0), 
                NumberSequenceKeypoint.new(0.5, 0), 
                NumberSequenceKeypoint.new(1, 1)
            })
        })
    }), 
    l_createStyleRule_0(".Ribbon-Buttons", {
        Size = UDim2.new(1, 0, 0, 84)
    }), 
    l_createStyleRule_0(".Ribbon-Buttons-Small", {
        Size = UDim2.new(1, 0, 0, 70)
    }), 
    l_createStyleRule_0(".Ribbon-Row", {
        Size = UDim2.new(1, -32, 1, 0)
    }), 
    l_createStyleRule_0(".RibbonTabs-Left", {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 165, 0.5, 0)
    }), 
    l_createStyleRule_0(".Component-RibbonToggle", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = "$GlobalSpace100"
        }), 
        l_createStyleRule_0("> TextLabel", {
            BackgroundTransparency = "$BackgroundTransparent", 
            Font = "$FontWeight400", 
            TextSize = "$FontSize150", 
            LayoutOrder = 0, 
            TextColor3 = "$SemanticColorContentStandard"
        }), 
        l_createStyleRule_0(".State-Disabled", {}, {
            l_createStyleRule_0("> TextLabel", {
                TextColor3 = "$SemanticColorContentDisabled"
            })
        })
    }), 
    l_createStyleRule_0(".Component-RibbonSelectInput", {
        AutoButtonColor = false, 
        Text = "", 
        Size = UDim2.new(0, 85, 0, 28)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.Fill
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = "$GlobalSpace100", 
            PaddingRight = "$GlobalSpace50", 
            PaddingTop = "$GlobalSpace50", 
            PaddingBottom = "$GlobalSpace50"
        }), 
        l_createStyleRule_0("> #Value", {}, {
            l_createStyleRule_0("::UIListLayout", {
                HorizontalFlex = Enum.UIFlexAlignment.Fill
            })
        }), 
        l_createStyleRule_0(">> ImageLabel", {
            Size = "$IconSmall"
        }, {
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Custom, 
                ShrinkRation = 0
            })
        }), 
        l_createStyleRule_0(">> #Icon", {
            LayoutOrder = 0
        }, {
            l_createStyleRule_0(".Right", {
                LayoutOrder = 3
            })
        }), 
        l_createStyleRule_0("> #DropdownIcon", {
            BorderSizePixel = "$BorderNone", 
            BackgroundTransparency = 1, 
            Image = v4 and "$DropDownArrowDown" or "$ArrowDown", 
            LayoutOrder = 4
        }, {
            l_createStyleRule_0(".Icon-Up", {
                Image = v4 and "$DropDownArrowUp" or "$ArrowUp"
            })
        }), 
        l_createStyleRule_0(">> #Text", {
            Font = "$FontWeight400", 
            TextSize = "$FontSize150", 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2
        }), 
        l_createStyleRule_0(".State-Default", {
            BackgroundColor3 = "$SemanticColorComponentInputFill", 
            BackgroundTransparency = "$SemanticColorComponentInputFillTransparency"
        }, {
            l_createStyleRule_0(">> #Text", {
                TextColor3 = "$SemanticColorContentMuted"
            }), 
            l_createStyleRule_0(">> #Icon", {
                ImageTransparency = "$IconMuted"
            })
        }), 
        l_createStyleRule_0(".State-Default:hover", {
            BackgroundColor3 = "$SemanticColorComponentInputHover", 
            BackgroundTransparency = "$SemanticColorComponentInputHoverTransparency"
        }, {
            l_createStyleRule_0(">> #Text", {
                TextColor3 = "$SemanticColorContentStandard"
            }), 
            l_createStyleRule_0(">> #Icon", {
                ImageTransparency = 0
            })
        }), 
        l_createStyleRule_0(".State-Focus", {}, {
            l_createStyleRule_0("::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = "$SemanticColorFocusBorderPrimaryBrand", 
                Thickness = "$BorderMedium"
            }), 
            l_createStyleRule_0(">> #Text", {
                TextColor3 = "$SemanticColorContentStandard"
            }), 
            l_createStyleRule_0(">> #Icon", {
                ImageTransparency = 0
            })
        }), 
        l_createStyleRule_0(".State-Disabled", {
            BackgroundColor3 = "$SemanticColorComponentInputFill", 
            BackgroundTransparency = "$SemanticColorComponentInputFillTransparency"
        }, {
            l_createStyleRule_0(">> #Text", {
                TextColor3 = "$SemanticColorContentDisabled"
            }), 
            l_createStyleRule_0(">> #Icon", {
                ImageTransparency = "$IconDisabled"
            })
        })
    })
}, {
    SpinboxSize = UDim2.new(0, 90, 0, 28), 
    SpinboxShortSize = UDim2.new(0, 61, 0, 28), 
    Size = UDim2.new(0, 90, 0, 24), 
    SizeDense = UDim2.new(0, 90, 0, 20), 
    SliderSize = if v7 then UDim2.new(0, 180, 0, 24) else nil
});