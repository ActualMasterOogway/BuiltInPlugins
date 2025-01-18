local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-UseDialogLayout", {
    BackgroundColor3 = "$ForegroundMain", 
    BorderSizePixel = 0
}, {
    v1("> UIListLayout", {
        Padding = "$IconToContentPadding"
    }), 
    v1("::UIPadding", {
        PaddingBottom = "$DialogPadding", 
        PaddingLeft = "$DialogPadding", 
        PaddingRight = "$DialogPadding", 
        PaddingTop = "$DialogPadding"
    }), 
    v1("> #Icon", {
        BackgroundTransparency = 1, 
        Size = "$IconSize"
    }), 
    v1(".Confirmation > #Icon", {
        Image = "$SuccessLargeImage"
    }), 
    v1(".Destructive > #Icon, .Warning > #Icon", {
        Image = "$WarningLargeImage"
    }), 
    v1(".Error > #Icon", {
        Image = "$ErrorLargeImage"
    }), 
    v1(".Information > #Icon", {
        Image = "$InformationLargeImage"
    }), 
    v1(".Question > #Icon", {
        Image = "$QuestionLargeImage"
    }), 
    v1("> #Content", {
        BackgroundTransparency = 1
    }, {
        v1("> UIListLayout, > #Children > UIListLayout", {
            Padding = "$TextToButtonsPadding"
        }), 
        v1("> #Text > UIListLayout", {
            Padding = "$HeadingToBodyPadding"
        }), 
        v1("> #Text, > #Children", {
            BackgroundTransparency = 1
        }, {
            v1(">> TextLabel", {
                BackgroundTransparency = 1, 
                Font = "$BodyFont", 
                LineHeight = "$TextLineHeight", 
                TextColor3 = "$TextPrimary", 
                TextSize = "$TextSize", 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                v1("::UIPadding", {
                    PaddingBottom = "$TextVerticalPadding", 
                    PaddingTop = "$TextVerticalPadding"
                }), 
                v1("#Heading", {
                    Font = "$HeadingFont"
                })
            })
        }), 
        v1("> #Buttons", {
            BackgroundTransparency = 1
        }, {
            v1("> #RightAnchoredButtons", {
                BackgroundTransparency = 1
            }, {
                v1("> UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Padding = "$ButtonSpacing"
                })
            }), 
            v1("> TextButton, > #RightAnchoredButtons > TextButton", {
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Font = "$ButtonFont", 
                TextSize = "$TextSize"
            }, {
                v1("::UIPadding", {
                    PaddingBottom = "$ButtonVerticalPadding", 
                    PaddingLeft = "$ButtonHorizontalPadding", 
                    PaddingRight = "$ButtonHorizontalPadding", 
                    PaddingTop = "$ButtonVerticalPadding"
                }), 
                v1(".Primary", {
                    BackgroundColor3 = "$PrimaryMain", 
                    TextColor3 = "$TextContrast"
                }, {
                    v1(".Enabled :hover", {
                        BackgroundColor3 = "$PrimaryHoverBackground"
                    })
                }), 
                v1(".Secondary, .Tertiary", {
                    BackgroundColor3 = "$SecondaryMain", 
                    TextColor3 = "$TextPrimary"
                }, {
                    v1("::UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                        Color = "$SecondaryRestingOutlineBorder"
                    }), 
                    v1(".Enabled :hover", {
                        BackgroundColor3 = "$SecondaryHoverBackground"
                    }, {
                        v1("> UIStroke", {
                            Color = "$SecondaryHoverOutlineBorder"
                        })
                    })
                }), 
                v1(".Disabled", {
                    BackgroundTransparency = 0.5, 
                    TextTransparency = 0.5
                })
            })
        })
    }), 
    v1(".Destructive > #Content > #Buttons > #RightAnchoredButtons > .Primary", {
        BackgroundColor3 = "$ErrorMain"
    })
}, {
    BodyFont = Enum.Font.SourceSans, 
    ButtonFont = Enum.Font.SourceSans, 
    ButtonHorizontalPadding = UDim.new(0, 16), 
    ButtonSpacing = UDim.new(0, 8), 
    ButtonVerticalPadding = UDim.new(0, 6), 
    DialogPadding = UDim.new(0, 16), 
    HeadingFont = Enum.Font.SourceSansSemibold, 
    HeadingToBodyPadding = UDim.new(0, 8), 
    IconSize = UDim2.fromOffset(32, 32), 
    IconToContentPadding = UDim.new(0, 16), 
    MinimumDialogSize = Vector2.new(400, 144), 
    TextLineHeight = 1.25, 
    TextSize = 16, 
    TextToButtonsPadding = UDim.new(0, 16), 
    TextVerticalPadding = UDim.new(0, 2)
});