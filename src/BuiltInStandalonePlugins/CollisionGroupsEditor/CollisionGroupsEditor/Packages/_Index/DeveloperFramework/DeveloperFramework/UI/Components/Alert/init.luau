local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Util.React);
local v3 = require(l_Parent_0.UI.Components.Image);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = require(l_Parent_0.UI.Components.TextWithLinks);
local v6 = require(l_Parent_0.UI.Components.Pane);
local v7 = require(l_Parent_0.Style.Colors);
local v8 = require(l_Parent_0.UI.ContextServices.Stylizer);
local v9 = require(l_Parent_0.Util.LayoutOrderIterator);
local _ = require(script.style);
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAlertAddTextLinks);
local v12 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAlertWrapping);
local function v18(v13) --[[ Line: 63 ]] --[[ Name: useToggleState ]]
    -- upvalues: v2 (copy)
    local v14, v15 = v2.useState(v13);
    local v16 = v2.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v15 (copy)
        v15(true);
    end, {});
    local v17 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v15 (copy)
        v15(false);
    end, {});
    return {
        enabled = v14, 
        enable = v16, 
        disable = v17
    };
end;
return function(v19) --[[ Line: 81 ]] --[[ Name: Alert ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy), v18 (copy), l_TextService_0 (copy), v6 (copy), v7 (copy), v3 (copy), v12 (copy), v4 (copy), v11 (copy), v5 (copy)
    assert(v2 ~= "", "You must be using non-legacy React in order to use Alert");
    local v20 = v8:use("Alert", v19);
    local v21 = v9.new();
    local v22 = v18(false);
    local v23 = v18(false);
    local v24, v25 = v2.useState(0);
    local v26, v27 = v2.useState(0);
    local function _(v28, v29) --[[ Line: 94 ]] --[[ Name: textWidth ]]
        -- upvalues: l_TextService_0 (ref), v20 (copy)
        return l_TextService_0:GetTextSize(v28, v20.TextSize, v29, Vector2.new(1e999, v20.TextSize)).X;
    end;
    local l_Title_0 = v19.Title;
    local l_TitleFont_0 = v20.TitleFont;
    local l_X_0 = l_TextService_0:GetTextSize(l_Title_0, v20.TextSize, l_TitleFont_0, Vector2.new(1e999, v20.TextSize)).X;
    l_Title_0 = false;
    if v19.ShortTitle ~= nil then
        l_Title_0 = v26 < v24 + l_X_0;
    end;
    l_TitleFont_0 = if l_Title_0 then v19.ShortTitle else v19.Title;
    local v34;
    if l_Title_0 then
        local v35 = assert(v19.ShortTitle, "ShortTitle not specified, but useShortTitle is true");
        local l_TitleFont_1 = v20.TitleFont;
        v34 = l_TextService_0:GetTextSize(v35, v20.TextSize, l_TitleFont_1, Vector2.new(1e999, v20.TextSize)).X;
    else
        v34 = l_X_0;
    end;
    local v37;
    if v19.PrimaryAction then
        local l_Text_0 = v19.PrimaryAction.Text;
        local l_PrimaryActionFont_0 = v20.PrimaryActionFont;
        v37 = l_TextService_0:GetTextSize(l_Text_0, v20.TextSize, l_PrimaryActionFont_0, Vector2.new(1e999, v20.TextSize)).X;
    else
        v37 = 0;
    end;
    local v40 = v20.Icon ~= nil;
    return v2.createElement(v6, {
        AnchorPoint = Vector2.new(0.5, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = if not v22.enabled or v23.enabled then v20.BackgroundColor else v7.darker(v20.BackgroundColor, v20.BackgroundColorHoverDarkerMultiplier), 
        Position = UDim2.new(UDim.new(0.5, 0), v20.TopPadding), 
        Size = UDim2.new(UDim.new(1, 0) - v20.HorizontalPadding, UDim.new(0, 0)), 
        ZIndex = v19.ZIndex, 
        Padding = v20.InnerPadding, 
        [v2.Event.MouseEnter] = if v19.PrimaryAction then v22.enable else nil, 
        [v2.Event.MouseLeave] = if v19.PrimaryAction then v22.disable else nil, 
        OnClick = if v19.PrimaryAction then v19.PrimaryAction.OnClick else nil
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = v20.CornerRadius
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v20.MaxWidth, 1e999)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v20.StrokeColor, 
            Thickness = v20.StrokeThickness
        }), 
        Image = v40 and v2.createElement(v3, {
            Image = v20.Icon, 
            ImageColor3 = v20.TextColor, 
            LayoutOrder = v21:getNextOrder(), 
            Position = v20.IconPosition, 
            Size = v20.IconSize
        }), 
        Contents = v2.createElement(v6, {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v21:getNextOrder(), 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(UDim.new(1, 0) - if v40 then v20.IconSize.X + UDim.new(0, v20.ContentsSpacing) else UDim.new(), UDim.new(0, 0)), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = 2
        }, {
            Title = v2.createElement(v6, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v21:getNextOrder(), 
                Size = UDim2.fromScale(1, 0)
            }, {
                LeftSide = v2.createElement(v6, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = v20.ContentsSpacing
                }, {
                    TitleSpace = v2.createElement(v6, {
                        AutomaticSize = if v12() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
                        LayoutOrder = v21:getNextOrder(), 
                        Size = if v12() then UDim2.fromOffset(0, 0) else UDim2.fromOffset(l_X_0, 0), 
                        [v2.Change.AbsolutePosition] = function(v41) --[[ Line: 184 ]]
                            -- upvalues: v25 (copy)
                            v25(v41.AbsolutePosition.X);
                        end
                    }, {
                        MaxSizeContraint = if v12() then v2.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(l_X_0, 1e999), 
                            MinSize = Vector2.new(0, 0)
                        }) else nil, 
                        Title = v2.createElement(v4, {
                            Font = v20.TitleFont, 
                            Text = l_TitleFont_0, 
                            TextColor = v20.TextColor, 
                            TextSize = v20.TextSize, 
                            AutomaticSize = if v12() then Enum.AutomaticSize.XY else Enum.AutomaticSize.None, 
                            TextWrapped = v12(), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = if v11() then Enum.TextYAlignment.Top else nil
                        })
                    })
                }), 
                RightSide = v2.createElement(v6, {
                    AnchorPoint = Vector2.new(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Position = UDim2.fromScale(1, 0), 
                    Size = UDim2.fromOffset(0, 18), 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = v20.ContentsSpacing, 
                    [v2.Change.AbsolutePosition] = function(v42) --[[ Line: 220 ]]
                        -- upvalues: v27 (copy)
                        v27(v42.AbsolutePosition.X);
                    end
                }, {
                    PrimaryActionSpace = v2.createElement(v6, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v21:getNextOrder(), 
                        Size = UDim2.fromOffset(v37, 0)
                    }, {
                        PrimaryAction = if v19.PrimaryAction ~= nil and v24 + v34 < v26 then v2.createElement(v4, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = v20.PrimaryActionFont, 
                            LayoutOrder = v21:getNextOrder(), 
                            RichText = true, 
                            Text = ("<u>%*</u>"):format(v19.PrimaryAction.Text), 
                            TextColor = v20.TextColor
                        }) else nil
                    }), 
                    Close = v19.OnClose and v2.createElement("TextButton", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = v21:getNextOrder(), 
                        Size = UDim2.fromScale(1, 1), 
                        Text = "", 
                        [v2.Event.Activated] = v19.OnClose, 
                        [v2.Event.MouseEnter] = v23.enable, 
                        [v2.Event.MouseLeave] = v23.disable
                    }, {
                        UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint"), 
                        IconContents = v2.createElement(v6, {
                            Padding = {
                                Left = 4, 
                                Right = 4, 
                                Top = 2
                            }
                        }, {
                            Icon = v2.createElement(v3, {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Image = v20.CloseButtonImage, 
                                ImageColor3 = v20.TextColor, 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                Size = UDim2.fromScale(1, 1)
                            }, {
                                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint")
                            })
                        }), 
                        HoverBackground = v23.enabled and v2.createElement(v6, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = v20.HoverCircleColor, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = v20.IconSize + v20.HoverCircleAdditionalSize, 
                            Transparency = v20.HoverCircleTransparency, 
                            ZIndex = 0
                        }, {
                            UICorner = v2.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        })
                    })
                })
            }), 
            Description = v19.Description and (not v11() or v19.LinkMap == nil) and v2.createElement(v4, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v21:getNextOrder(), 
                Size = UDim2.fromScale(1, 0), 
                Text = v19.Description, 
                TextColor = v20.TextColor, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            DescriptionWithLink = v19.Description and v11() and v19.LinkMap ~= nil and v2.createElement(v5, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v21:getNextOrder(), 
                LinkMap = v19.LinkMap, 
                Size = UDim2.fromScale(1, 0), 
                Text = v19.Description, 
                TextColor = v20.TextColor, 
                TextProps = {
                    Font = Enum.Font.SourceSans, 
                    TextSize = 18, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;