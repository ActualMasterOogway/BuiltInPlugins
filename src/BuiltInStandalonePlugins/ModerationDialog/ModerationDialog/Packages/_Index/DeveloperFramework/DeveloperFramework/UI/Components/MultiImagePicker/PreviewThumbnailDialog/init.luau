local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Components_0 = l_Parent_0.UI.Components;
local v5 = require(l_Components_0.HoverArea);
local v6 = require(l_Components_0.Pane);
local v7 = require(l_Components_0.TextInput);
local v8 = require(l_Components_0.TextLabel);
local v9 = require(l_Components_0.StyledDialog);
local v10 = require(l_Components_0.Tooltip);
local v11 = require(l_Components_0.Image);
local l_Util_0 = l_Parent_0.Util;
local v13 = require(l_Parent_0.Parent.Cryo);
local v14 = require(l_Util_0.StyleModifier);
local v15 = require(l_Util_0.openVideoFromUrl);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v17 = require(l_Parent_0.Resources);
local v18 = require(script.Parent.RoundArrowButton);
local _ = require(script.Parent.types);
local l_LOCALIZATION_PROJECT_NAME_0 = v17.LOCALIZATION_PROJECT_NAME;
local v21 = v1.Component:extend("PreviewThumbnailDialog");
v21.init = function(v22) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), l_join_0 (copy), v14 (copy), v1 (copy)
    v22.state = {
        StyleModifier = nil, 
        IndexOffset = 0, 
        Hovering = false, 
        AltTexts = {}
    };
    v22.getCurrentIndex = function() --[[ Line: 80 ]]
        -- upvalues: v22 (copy), v13 (ref)
        local l_props_0 = v22.props;
        local l_Order_0 = l_props_0.Order;
        local v25 = l_props_0.StartThumbnailInfo or {};
        local v26 = v13.List.find(l_Order_0, v25.thumbnailId);
        if v26 == nil then
            return nil;
        else
            return (v26 + v22.state.IndexOffset - 1) % #l_Order_0 + 1;
        end;
    end;
    v22.moveLeft = function() --[[ Line: 95 ]]
        -- upvalues: v22 (copy)
        local l_IndexOffset_0 = v22.state.IndexOffset;
        v22:setState({
            IndexOffset = l_IndexOffset_0 - 1
        });
    end;
    v22.moveRight = function() --[[ Line: 102 ]]
        -- upvalues: v22 (copy)
        local l_IndexOffset_1 = v22.state.IndexOffset;
        v22:setState({
            IndexOffset = l_IndexOffset_1 + 1
        });
    end;
    v22.altTextChanged = function(v29, v30) --[[ Line: 109 ]]
        -- upvalues: v22 (copy), l_join_0 (ref), v13 (ref)
        local l_props_1 = v22.props;
        local l_Thumbnails_0 = l_props_1.Thumbnails;
        local l_MaxAltTextLength_0 = l_props_1.Theme.PreviewThumbnailDialog.MaxAltTextLength;
        local v34 = l_Thumbnails_0[v29];
        v22:setState({
            AltTexts = l_join_0(v22.state.AltTexts, {
                [v29] = if v34.altText ~= v30 then v30 else v13.None
            }), 
            Disabled = l_MaxAltTextLength_0 < #v30
        });
    end;
    v22.onMouseEnter = function() --[[ Line: 124 ]]
        -- upvalues: v22 (copy), v14 (ref)
        if v22.state.StyleModifier == nil then
            v22:setState({
                StyleModifier = v14.Hover
            });
        end;
    end;
    v22.onMouseLeave = function() --[[ Line: 132 ]]
        -- upvalues: v22 (copy), v14 (ref), v1 (ref)
        if v22.state.StyleModifier == v14.Hover then
            v22:setState({
                StyleModifier = v1.None
            });
        end;
    end;
end;
v21.mouseHoverChanged = function(v35, v36) --[[ Line: 141 ]] --[[ Name: mouseHoverChanged ]]
    v35:setState({
        Hovering = v36
    });
end;
v21.didUpdate = function(v37, v38) --[[ Line: 147 ]] --[[ Name: didUpdate ]]
    local l_props_2 = v37.props;
    if v38.StartThumbnailInfo ~= nil and l_props_2.StartThumbnailInfo == nil then
        v37:setState({
            IndexOffset = 0, 
            AltTexts = {}
        });
    end;
end;
v21.render = function(v40) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v18 (copy), l_join_0 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v15 (copy), v5 (copy), v9 (copy), v14 (copy), v6 (copy), v8 (copy), v11 (copy), v10 (copy), v7 (copy)
    local l_props_3 = v40.props;
    local l_Thumbnails_1 = l_props_3.Thumbnails;
    local l_Order_1 = l_props_3.Order;
    local l_IsVideoAllowed_0 = l_props_3.IsVideoAllowed;
    local v45 = l_props_3.AltTextError or {};
    local l_AltTexts_0 = v40.state.AltTexts;
    local l_Hovering_0 = v40.state.Hovering;
    local l_Disabled_0 = v40.state.Disabled;
    local v49 = v40.getCurrentIndex();
    if v49 == nil then
        return nil;
    else
        local v50 = l_Order_1[v49];
        local v51 = l_Thumbnails_1[v50];
        local l_videoHash_0 = v51.videoHash;
        local l_videoTitle_0 = v51.videoTitle;
        local l_imageId_0 = v51.imageId;
        local l_tempId_0 = v51.tempId;
        local v56 = l_AltTexts_0[v50];
        local v57 = if v56 ~= nil then v56 else v51.altText or "";
        local v58 = if v45.ThumbnailId == v50 then v45.ErrorMessage else nil;
        local v59 = l_Hovering_0 and #l_Order_1 > 1;
        local v60 = nil;
        if l_tempId_0 then
            v60 = l_tempId_0;
        elseif l_imageId_0 then
            v60 = "rbxassetid://" .. l_imageId_0;
        end;
        local l_Theme_0 = l_props_3.Theme;
        local v62 = if v51.isModerated then l_Theme_0.ModeratedImage else if l_videoHash_0 ~= nil then l_Theme_0.VideoPlaceholder else v60;
        local l_PreviewThumbnailDialog_0 = l_Theme_0.PreviewThumbnailDialog;
        local l_TooltipIcon_0 = l_PreviewThumbnailDialog_0.TooltipIcon;
        local l_Localization_0 = l_props_3.Localization;
        local v66 = l_PreviewThumbnailDialog_0.Height - l_PreviewThumbnailDialog_0.Size.Y.Offset - l_Theme_0.FontStyle.Normal.TextSize - l_PreviewThumbnailDialog_0.AltTextInputHeight;
        local l_ButtonPadding_0 = l_PreviewThumbnailDialog_0.ButtonPadding;
        local l_ImagePadding_0 = l_PreviewThumbnailDialog_0.ImagePadding;
        local v70 = v1.createElement("ImageLabel", {
            Size = l_PreviewThumbnailDialog_0.Size, 
            BackgroundTransparency = 1, 
            Image = v62, 
            ImageColor3 = l_videoHash_0 ~= nil and l_Theme_0.Thumbnail.Background or nil, 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1, 
            [v1.Event.MouseEnter] = function() --[[ Line: 222 ]]
                -- upvalues: v40 (copy)
                v40:mouseHoverChanged(true);
            end, 
            [v1.Event.MouseLeave] = function() --[[ Line: 226 ]]
                -- upvalues: v40 (copy)
                v40:mouseHoverChanged(false);
            end
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = l_ButtonPadding_0, 
                PaddingBottom = l_ButtonPadding_0, 
                PaddingLeft = l_ButtonPadding_0, 
                PaddingRight = l_ButtonPadding_0
            }), 
            LeftButton = v59 and v1.createElement(v18, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Disabled = l_Disabled_0, 
                Flipped = true, 
                OnClick = v40.moveLeft, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Theme = l_Theme_0
            }), 
            RightButton = v59 and v1.createElement(v18, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Disabled = l_Disabled_0, 
                OnClick = v40.moveRight, 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Theme = l_Theme_0
            }), 
            TitleFrame = v1.createElement("Frame", {
                Visible = l_videoTitle_0 ~= nil, 
                BackgroundTransparency = 0.3, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Colors.Black, 
                Size = UDim2.new(1, 0, 0, 30)
            }, {
                TitleText = v1.createElement("TextLabel", l_join_0(l_Theme_0.FontStyle.Normal, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -20, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Text = l_videoTitle_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }))
            }), 
            VideoWarning = v1.createElement("Frame", {
                Visible = l_videoHash_0 ~= nil, 
                BackgroundTransparency = 0.3, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, 400, 0, 120), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = l_Theme_0.Colors.Black
            }, {
                Message = v1.createElement("TextLabel", l_join_0(l_Theme_0.FontStyle.Normal, {
                    Size = UDim2.new(1, 0, l_IsVideoAllowed_0 and 0.5 or 1, 0), 
                    BackgroundTransparency = 1, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "PreviewDialogBody")
                })), 
                Link = if l_IsVideoAllowed_0 then v1.createElement("TextButton", l_join_0(l_Theme_0.FontStyle.Normal, {
                    Size = UDim2.new(1, 0, 0.5, 0), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "PreviewDialogLink"), 
                    TextColor3 = l_Theme_0.Hyperlink, 
                    [v1.Event.Activated] = function() --[[ Line: 308 ]]
                        -- upvalues: v15 (ref), l_videoHash_0 (copy)
                        local v69 = v15.getYoutubeWatchUrl(l_videoHash_0);
                        v15.open(v69);
                    end
                }), {
                    v1.createElement(v5, {
                        Cursor = "PointingHand"
                    })
                }) else nil
            })
        });
        return v1.createElement(v9, {
            Style = "Alert", 
            Enabled = l_props_3.Enabled, 
            Title = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "PreviewDialogHeader"), 
            MinContentSize = Vector2.new(660, l_PreviewThumbnailDialog_0.Height), 
            ButtonHorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Buttons = {
                {
                    Key = true, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ButtonSave"), 
                    Style = "RoundLargeTextPrimary", 
                    StyleModifier = if l_Disabled_0 then v14.Disabled else nil
                }
            }, 
            OnButtonPressed = function(v71) --[[ Line: 335 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: l_props_3 (copy), l_AltTexts_0 (copy)
                if v71 then
                    l_props_3.UpdateAltTexts(l_AltTexts_0);
                end;
                l_props_3.OnClose();
            end, 
            OnClose = function() --[[ Line: 341 ]] --[[ Name: OnClose ]]
                -- upvalues: l_props_3 (copy)
                l_props_3.OnClose();
            end
        }, {
            v1.createElement(v6, {
                Padding = l_ImagePadding_0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Layout = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                v70; 
                AltText = if l_props_3.ShowAltText then v1.createElement(v6, {
                    Size = UDim2.new(1, 0, 0, v66), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Layout = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    LayoutOrder = 2
                }, {
                    Title = v1.createElement(v8, {
                        Style = "SubText", 
                        Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "TitleAltText"), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Size = UDim2.new(0, 0, 0, l_Theme_0.FontStyle.Normal.TextSize), 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Tooltip = v1.createElement(v11, {
                            Size = UDim2.fromOffset(l_TooltipIcon_0.Size, l_TooltipIcon_0.Size), 
                            Position = UDim2.new(1, l_TooltipIcon_0.PaddingX, 0, 0), 
                            StyleModifier = v40.state.StyleModifier, 
                            Image = l_TooltipIcon_0.Image, 
                            Color = l_TooltipIcon_0.Color, 
                            Style = {
                                [v14.Hover] = {
                                    Color = l_TooltipIcon_0.HoverColor
                                }
                            }
                        }, {
                            v1.createElement(v10, {
                                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "DescriptionAltText")
                            }), 
                            v1.createElement(v5, {
                                Cursor = "PointingHand", 
                                MouseEnter = v40.onMouseEnter, 
                                MouseLeave = v40.onMouseLeave
                            })
                        })
                    }), 
                    TextBox = v1.createElement(v7, {
                        Height = l_PreviewThumbnailDialog_0.AltTextInputHeight, 
                        MultiLine = true, 
                        MaxLength = l_PreviewThumbnailDialog_0.MaxAltTextLength, 
                        Text = v57, 
                        TextSize = l_Theme_0.FontStyle.Normal.TextSize, 
                        LayoutOrder = 2, 
                        ErrorText = v58, 
                        OnTextChanged = function(v72) --[[ Line: 405 ]] --[[ Name: OnTextChanged ]]
                            -- upvalues: v40 (copy), v50 (copy)
                            v40.altTextChanged(v50, v72);
                        end
                    })
                }) else nil
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = v2.Localization
})(v21));