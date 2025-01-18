local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
local v3 = game:DefineFastFlag("ViewportToolingFrameworkTextLabelColor", false);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return function() --[[ Line: 20 ]] --[[ Name: createStyle ]]
    -- upvalues: l_createStyleRule_0 (copy), v3 (copy), v2 (copy)
    return {
        l_createStyleRule_0("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        l_createStyleRule_0("ImageLabel", {
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        l_createStyleRule_0("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Font = Enum.Font.SourceSans, 
            Text = ""
        }), 
        l_createStyleRule_0("TextLabel", {
            BackgroundTransparency = 1, 
            Font = Enum.Font.SourceSans, 
            TextColor3 = v3 and "$TextPrimary" or nil, 
            TextSize = v2() and 16 or nil, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        if v2() then nil else l_createStyleRule_0(".VPF-AvoidFOUC", {
            BackgroundColor3 = Color3.new(1, 0, 0)
        }), 
        l_createStyleRule_0(".VPF-Button", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(32, 32)
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            l_createStyleRule_0(".VPF-Button--Selected", {
                BackgroundTransparency = 0, 
                BackgroundColor3 = "$ActionActivated"
            }), 
            l_createStyleRule_0(".VPF-Button--Unselected", {}, {
                l_createStyleRule_0(":hover", {
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = "$ActionHover"
                }), 
                l_createStyleRule_0(":pressed", {
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = "$ActionActivated"
                })
            })
        }), 
        l_createStyleRule_0(".VPF-Icon", {
            ImageColor3 = "$TextPrimary", 
            Size = UDim2.fromScale(1, 1)
        }, {
            l_createStyleRule_0("::UIAspectRatioConstraint")
        }), 
        l_createStyleRule_0(".VPF-Label", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.fromScale(0, 1), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextSize = 18, 
            TextColor3 = "$TextPrimary"
        }), 
        l_createStyleRule_0(".VPF-SeparatorBar", {
            BackgroundColor3 = "$Divider", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".VPF-Slider", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.fromOffset(0, 24)
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingRight = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 12)
            }), 
            l_createStyleRule_0(">> .VPF-Slider__BarSegment", {
                BackgroundColor3 = "$TextPrimary", 
                BackgroundTransparency = 0, 
                Size = UDim2.fromOffset(8, 2)
            }, {
                l_createStyleRule_0("::UICorner", {
                    CornerRadius = UDim.new(0, 4)
                })
            }), 
            l_createStyleRule_0(">> .VPF-Slider__Input", {
                BackgroundColor3 = "$ActionActivated", 
                BorderSizePixel = 0, 
                ClearTextOnFocus = false, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = "$TextPrimary", 
                TextSize = 18
            }, {
                l_createStyleRule_0("::UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                    Color = "$ActionActivated", 
                    Thickness = 1
                })
            }), 
            l_createStyleRule_0(">> .VPF-Slider__StepButton", {
                BackgroundColor3 = "$SecondaryMain", 
                Size = UDim2.new(0, 20, 1, 0)
            }, {
                l_createStyleRule_0("::UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), 
                l_createStyleRule_0("::UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                    Color = "$ActionActivated", 
                    Thickness = 1
                })
            }), 
            l_createStyleRule_0(".VPF-Slider--Disabled >> .VPF-Slider__StepButton", {
                BackgroundColor3 = "$SecondaryMuted"
            }), 
            l_createStyleRule_0(".VPF-Slider--Enabled >> .VPF-Slider__StepButton", {}, {
                l_createStyleRule_0(":hover", {
                    BackgroundColor3 = "$SecondaryContrast"
                })
            })
        }), 
        l_createStyleRule_0(".VPF-TextButton", {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundColor3 = "$PrimaryMain", 
            Font = Enum.Font.SourceSans, 
            Size = UDim2.fromScale(0, 1), 
            TextColor3 = "$TextContrast", 
            TextSize = 20
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 14), 
                PaddingRight = UDim.new(0, 14), 
                PaddingTop = UDim.new(0, 5), 
                PaddingBottom = UDim.new(0, 5)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryHoverBackground"
            }), 
            l_createStyleRule_0(".VPF-TextButton--Disabled", {
                BackgroundColor3 = "$SecondaryContrast", 
                TextColor3 = "$SecondaryMuted"
            }, {
                l_createStyleRule_0(":hover", {
                    BackgroundColor3 = "$SecondaryContrast"
                })
            })
        }), 
        l_createStyleRule_0(".VPF-Toolbar", {
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            l_createStyleRule_0(".VPF-Toolbar--Horizontal", {}, {
                l_createStyleRule_0(".VPF-Toolbar--Center", {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0, 16)
                })
            }), 
            l_createStyleRule_0(".VPF-Toolbar--Vertical", {}, {
                l_createStyleRule_0(".VPF-Toolbar--Center", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 16, 0.5, 0)
                }), 
                l_createStyleRule_0(".VPF-Toolbar--Top", {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.new(0, 16, 0, 56)
                }), 
                l_createStyleRule_0(".VPF-Toolbar--Bottom", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 16, 1, -40)
                })
            })
        }), 
        l_createStyleRule_0(".VPF-ToolbarBase", {
            BackgroundColor3 = "$ForegroundMain", 
            BackgroundTransparency = 0
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            l_createStyleRule_0("::UIStroke", {
                Color = "$BackgroundDefault", 
                Thickness = 2
            }), 
            l_createStyleRule_0(".VPF-ToolbarBase--Horizontal", {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.fromOffset(0, 40)
            }, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = "$ButtonSpacing"
                }), 
                l_createStyleRule_0("> .VPF-Separator", {
                    Size = UDim2.new(0, 8, 1, 0)
                }, {
                    l_createStyleRule_0("> .VPF-SeparatorBar", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.new(0, 2, 1, 0)
                    })
                })
            }), 
            l_createStyleRule_0(".VPF-ToolbarBase--Vertical", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(40, 0)
            }, {
                l_createStyleRule_0("::UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = "$ButtonSpacing"
                }), 
                l_createStyleRule_0("> .VPF-Separator", {
                    Size = UDim2.new(1, 0, 0, 8)
                }, {
                    l_createStyleRule_0("> .VPF-SeparatorBar", {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.fromScale(0, 0.5), 
                        Size = UDim2.new(1, 0, 0, 2)
                    })
                })
            })
        }, {
            ButtonSpacing = UDim.new(0, 4)
        }), 
        l_createStyleRule_0(".VPF-Tooltip", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = "$White", 
            BackgroundTransparency = 0
        }, {
            l_createStyleRule_0(">> .VPF-Tooltip__Title", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = Enum.Font.SourceSansBold, 
                TextColor3 = "$Gray120", 
                TextSize = 14
            }), 
            l_createStyleRule_0(">> .VPF-Tooltip__Description", {
                TextColor3 = "$Gray120", 
                TextWrapped = true
            }), 
            l_createStyleRule_0(".VPF-Tooltip--Horizontal", {
                Position = UDim2.new(0, 0, 1, 12)
            }), 
            l_createStyleRule_0(".VPF-Tooltip--Vertical", {
                Position = UDim2.new(1, 8, 0, 0)
            })
        }), 
        l_createStyleRule_0(".VPF-X-ContrastBg", {
            BackgroundColor3 = "$ForegroundContrast", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".VPF-X-DebugPink", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(1, 0, 1)
        }), 
        l_createStyleRule_0(".VPF-X-MainBg", {
            BackgroundColor3 = "$ForegroundMain", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".VPF-X-Primary", {
            ImageColor3 = "$TextPrimary"
        }), 
        l_createStyleRule_0(".VPF-X-Square", {}, {
            l_createStyleRule_0("::UIAspectRatioConstraint")
        })
    };
end;