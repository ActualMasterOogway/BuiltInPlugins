local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v3 = require(l_Parent_0.Parent.Roact);
local v4 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v4.withContext;
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v7 = require(l_Parent_0.Parent.Cryo);
local v8 = require(l_Parent_0.Util.GetTextSize);
local v9 = require(l_Parent_0.Util.LayoutOrderIterator);
local v10 = require(l_Parent_0.Util.StyleModifier);
local v11 = require(l_Parent_0.Util.formatLocalDateTime);
local v12 = require(l_Parent_0.RobloxAPI.Url);
local v13 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v15 = require(script.Parent.AssetRender);
local v16 = require(script.Parent.AssetPreviewDetails);
local v17 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v18 = require(l_Parent_0.UI.Components.Container);
local v19 = require(l_Parent_0.UI.Components.HoverArea);
local v20 = require(l_Parent_0.UI.Components.Image);
local v21 = require(l_Parent_0.UI.Components.LinkText);
local v22 = require(l_Parent_0.UI.Components.Pane);
local v23 = require(l_Parent_0.UI.Components.TextLabelWithRobloxLinks);
local v24 = require(l_Parent_0.UI.Components.ScrollingFrame);
local v25 = require(l_Parent_0.UI.Components.Separator);
local v26 = require(l_Parent_0.UI.Components.TextLabel);
local v27 = require(l_Parent_0.UI.Components.Tooltip);
local v28 = require(l_Parent_0.UI.Components.TextWithLinks);
local v29 = require(l_Parent_0.SharedFlags.getFFlagAssetPreviewAllowForwardRef);
local v30 = require(l_Parent_0.SharedFlags.getFFlagDFVideoStudioPreviewPermissionFix);
local v31 = require(l_Parent_0.SharedFlags.getFFlagAssetPreviewFixGroupLinks);
local v32 = v3.PureComponent:extend("AssetPreview");
v32.init = function(v33) --[[ Line: 151 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v29 (copy)
    v33.containerRef = v3.createRef();
    v33.scrollingRef = if v29() then v33.props.ScrollingRef or v3.createRef() else v3.createRef();
    v33.state = {
        scrollingEnabled = true, 
        absoluteContentSize = Vector2.new(0, 0)
    };
    v33.onClickCreatorLink = function() --[[ Line: 162 ]]
        -- upvalues: v33 (copy)
        return v33.props.OnClickCreator(v33.props.AssetData.Creator.Name);
    end;
    v33.onContentResize = function(v34) --[[ Line: 166 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            absoluteContentSize = v34
        });
    end;
    v33.onMouseEnterAssetRender = function() --[[ Line: 172 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            scrollingEnabled = false
        });
    end;
    v33.onMouseLeaveAssetRender = function() --[[ Line: 178 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            scrollingEnabled = true
        });
    end;
    v33.onClickActionButton = function(...) --[[ Line: 184 ]]
        -- upvalues: v33 (copy)
        if v33.props.ActionEnabled ~= false then
            return v33.props.OnClickAction(...);
        else
            return;
        end;
    end;
    v33.onPlaySound = function() --[[ Line: 192 ]]
        -- upvalues: v33 (copy)
        v33.props.Analytics:report("AssetPreviewPlaySound", {
            assetId = v33.props.AssetData.Asset.Id
        });
    end;
    v33.onPauseSound = function() --[[ Line: 198 ]]
        -- upvalues: v33 (copy)
        v33.props.Analytics:report("AssetPreviewPauseSound", {
            assetId = v33.props.AssetData.Asset.Id
        });
    end;
    v33.onPlayVideo = function() --[[ Line: 204 ]]
        -- upvalues: v33 (copy)
        v33.props.Analytics:report("AssetPreviewPlayVideo", {
            assetId = v33.props.AssetData.Asset.Id
        });
    end;
    v33.onPauseVideo = function() --[[ Line: 210 ]]
        -- upvalues: v33 (copy)
        v33.props.Analytics:report("AssetPreviewPauseVideo", {
            assetId = v33.props.AssetData.Asset.Id
        });
    end;
    v33.onVoteUp = function() --[[ Line: 216 ]]
        -- upvalues: v33 (copy)
        local l_props_0 = v33.props;
        local l_Id_0 = l_props_0.AssetData.Asset.Id;
        l_props_0.OnVoteUp(l_Id_0, l_props_0.Voting);
    end;
    v33.onVoteDown = function() --[[ Line: 222 ]]
        -- upvalues: v33 (copy)
        local l_props_1 = v33.props;
        local l_Id_1 = l_props_1.AssetData.Asset.Id;
        l_props_1.OnVoteDown(l_Id_1, l_props_1.Voting);
    end;
    v33.resetCanvasPosition = function() --[[ Line: 228 ]]
        -- upvalues: v33 (copy)
        if v33.scrollingRef.current then
            v33.scrollingRef.current.CanvasPosition = Vector2.new(0, 0);
        end;
    end;
end;
v32.formatLocalDateTimeForAsset = function(v39, v40, v41) --[[ Line: 242 ]] --[[ Name: formatLocalDateTimeForAsset ]]
    -- upvalues: v11 (copy)
    assert(typeof(v41) == "string", "Key must be a string");
    local v42 = v39.props.Localization:getLocale();
    local v43 = v40[v41 .. "Raw"];
    local v44 = v40[v41];
    if typeof(v43) == "string" then
        local v45 = string.match(v43, "^/Date%((%d+)%)/$");
        if v45 ~= nil then
            local v46 = tonumber(v45);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 260 ]]
                -- upvalues: v46 (copy), v42 (copy)
                return DateTime.fromUnixTimestampMillis(v46):FormatLocalTime("L LTS", v42);
            end);
            if l_status_0 then
                return l_result_0;
            else
                warn(l_result_0);
            end;
        end;
    end;
    if v44 == nil then
        return "";
    else
        return v11(v44, "L LTS", v42);
    end;
end;
v32.updateAssetInfoRows = function(v49) --[[ Line: 282 ]] --[[ Name: updateAssetInfoRows ]]
    -- upvalues: v30 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local l_Asset_0 = v49.props.AssetData.Asset;
    if l_Asset_0.TypeId == Enum.AssetType.Video.Value then
        spawn(function() --[[ Line: 286 ]]
            -- upvalues: v30 (ref), v49 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref), l_Asset_0 (copy)
            local l_VideoFrame_0 = Instance.new("VideoFrame");
            l_VideoFrame_0.Visible = false;
            if v30() then
                l_VideoFrame_0:SetStudioPreview(true);
            end;
            l_VideoFrame_0.Parent = v49.containerRef:getValue();
            l_VideoFrame_0.Loaded:Connect(function() --[[ Line: 296 ]]
                -- upvalues: v49 (ref), l_VideoFrame_0 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref)
                if not v49._isMounted then
                    l_VideoFrame_0:Destroy();
                    return;
                else
                    local l_X_0 = l_VideoFrame_0.Resolution.X;
                    local l_Y_0 = l_VideoFrame_0.Resolution.Y;
                    if l_X_0 ~= 0 or l_Y_0 ~= 0 then
                        local l_Localization_0 = v49.props.Localization;
                        v49:setState({
                            assetInfoRows = {
                                {
                                    Label = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Resolution"), 
                                    Content = string.format("%dx%d", l_X_0, l_Y_0)
                                }
                            }
                        });
                    end;
                    l_VideoFrame_0:Destroy();
                    return;
                end;
            end);
            if v30() then
                l_VideoFrame_0:SetStudioPreview(true);
            end;
            l_VideoFrame_0.Video = string.format("rbxassetid://%d", l_Asset_0.Id);
        end);
    end;
end;
v32.didMount = function(v55) --[[ Line: 333 ]] --[[ Name: didMount ]]
    v55._isMounted = true;
    v55:updateAssetInfoRows();
end;
v32.willUnmount = function(v56) --[[ Line: 338 ]] --[[ Name: willUnmount ]]
    v56._isMounted = false;
end;
v32.didUpdate = function(v57, v58) --[[ Line: 342 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy)
    if v58.AssetData.Asset.Id ~= v57.props.AssetData.Asset.Id then
        v57:setState({
            assetInfoRows = v3.None
        });
        v57:updateAssetInfoRows();
    end;
end;
v32.render = function(v59) --[[ Line: 352 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v9 (copy), v3 (copy), v22 (copy), l_join_0 (copy), v20 (copy), v18 (copy), v24 (copy), v26 (copy), v28 (copy), l_GuiService_0 (copy), v12 (copy), v31 (copy), v27 (copy), v19 (copy), v15 (copy), v16 (copy), v23 (copy), l_TextService_0 (copy), v21 (copy), v25 (copy), v17 (copy), v10 (copy)
    local l_props_2 = v59.props;
    local l_state_0 = v59.state;
    local l_Stylizer_0 = v59.props.Stylizer;
    local l_AnchorPoint_0 = l_props_2.AnchorPoint;
    local l_Position_0 = l_props_2.Position;
    local l_ZIndex_0 = l_props_2.ZIndex;
    local v66 = l_props_2.Size or UDim2.new(1, 0, 1, 0);
    local l_absoluteContentSize_0 = l_state_0.absoluteContentSize;
    local v68 = nil;
    if l_props_2.ActionSubText then
        v68 = v8(l_props_2.ActionSubText, l_Stylizer_0.ButtonArea.ActionSubText.TextSize, nil, l_props_2.AbsoluteSize - Vector2.new(l_Stylizer_0.ScrollingFrame.ElementPadding * 2, 0));
        v68 = Vector2.new(v68.X, v68.Y + l_Stylizer_0.ScrollingFrame.ElementPadding);
    else
        v68 = Vector2.new(0, 0);
    end;
    if v66.Y.Offset > 0 and l_absoluteContentSize_0.Y > 0 then
        local v69 = l_absoluteContentSize_0.Y + l_Stylizer_0.ButtonArea.Size.Y.Offset + v68.Y;
        if v69 < v66.Y.Offset then
            v66 = UDim2.new(v66.X, UDim.new(0, v69));
        end;
    end;
    local l_AssetData_0 = l_props_2.AssetData;
    local l_AssetGenres_0 = l_AssetData_0.Asset.AssetGenres;
    local v72 = l_AssetData_0.Asset.Description or "";
    local l_Localization_1 = l_props_2.Localization;
    local l_InfoRow_0 = l_Stylizer_0.ScrollingFrame.InfoRow;
    local l_onClickCreatorLink_0 = v59.onClickCreatorLink;
    if l_props_2.HideCreatorSearch then
        l_onClickCreatorLink_0 = nil;
    end;
    local v76 = v7.List.join({
        {
            Label = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Creator"), 
            Content = l_AssetData_0.Creator.Name, 
            LinkAction = l_onClickCreatorLink_0
        }, 
        {
            Label = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Genre"), 
            Content = #l_AssetGenres_0 == 0 and l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "AllGenre") or tostring(l_AssetGenres_0[1])
        }
    }, l_state_0.assetInfoRows or {}, {
        {
            Label = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Created"), 
            Content = v59:formatLocalDateTimeForAsset(l_AssetData_0.Asset, "Created")
        }, 
        {
            Label = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "LastUpdated"), 
            Content = v59:formatLocalDateTimeForAsset(l_AssetData_0.Asset, "Updated")
        }
    });
    local v77 = v9.new();
    local l_Padding_0 = l_Stylizer_0.ScrollingFrame.Padding;
    local v79 = v66.X.Offset - l_Padding_0.PaddingLeft.Offset - l_Padding_0.PaddingRight.Offset;
    local l_CanFlagAsset_0 = l_props_2.CanFlagAsset;
    local v81 = if l_CanFlagAsset_0 then l_Stylizer_0.ScrollingFrame.FlagAsset.Size.X.Offset else 0;
    local l_Spacing_0 = l_Stylizer_0.ScrollingFrame.AssetHeader.Spacing;
    local v83 = if l_props_2.CreatingUniverseName and l_props_2.CreatingUniverseRootPlaceId then l_props_2.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "ByUsernameWithContentAttribution", {
        username = "{username}", 
        universeName = "{universeName}"
    }) else l_props_2.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "ByUsernameWithoutContentAttribution", {
        username = "{username}"
    });
    return v3.createElement(v22, l_join_0({
        Active = true, 
        AnchorPoint = l_AnchorPoint_0, 
        OnClick = function() --[[ Line: 464 ]] --[[ Name: OnClick ]]

        end, 
        Position = l_Position_0, 
        Size = v66, 
        Style = "Box", 
        ZIndex = l_ZIndex_0, 
        [v3.Ref] = v59.containerRef
    }, l_props_2.WrapperProps), {
        CloseButton = v3.createElement(v20, {
            Style = l_Stylizer_0.CloseButton
        }), 
        PurchaseFlow = l_props_2.PurchaseFlow, 
        SuccessDialog = l_props_2.SuccessDialog, 
        Contents = v3.createElement(v18, {}, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ScrollingFrame = v3.createElement(v24, {
                LayoutOrder = 1, 
                AutoSizeCanvas = true, 
                AutoSizeLayoutOptions = {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Stylizer_0.ScrollingFrame.ElementPadding)
                }, 
                OnCanvasResize = v59.onContentResize, 
                Size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0) - l_Stylizer_0.ButtonArea.Size.Height - UDim.new(0, v68.Y)), 
                ScrollingEnabled = l_state_0.scrollingEnabled, 
                [v3.Ref] = v59.scrollingRef
            }, {
                Padding = v3.createElement("UIPadding", l_Padding_0), 
                AssetNameHeader = v3.createElement(v22, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Padding = {
                        Bottom = 5, 
                        Left = 5, 
                        Right = 0, 
                        Top = 5
                    }, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Spacing = l_Spacing_0, 
                    Layout = Enum.FillDirection.Horizontal, 
                    LayoutOrder = v77:getNextOrder(), 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    AssetNameContainer = v3.createElement(v22, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, -v81 - l_Spacing_0, 0, 0), 
                        LayoutOrder = 1, 
                        Layout = Enum.FillDirection.Vertical
                    }, {
                        AssetName = v3.createElement(v26, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Style = l_Stylizer_0.ScrollingFrame.AssetName, 
                            Text = l_AssetData_0.Asset.Name, 
                            TextWrapped = true
                        }), 
                        CreatorName = v3.createElement(v28, {
                            TextProps = {
                                Font = Enum.Font.SourceSans, 
                                TextSize = 18, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Text = v83, 
                            LinkMap = {
                                ["{username}"] = {
                                    LinkText = "@" .. l_AssetData_0.Creator.Name, 
                                    LinkCallback = function() --[[ Line: 545 ]] --[[ Name: LinkCallback ]]
                                        -- upvalues: l_GuiService_0 (ref), v12 (ref), l_AssetData_0 (copy), v31 (ref)
                                        l_GuiService_0:OpenBrowserWindow(v12.composeUrlToUserProfile(l_AssetData_0.Creator.Id, if v31() then l_AssetData_0.Creator.Type else nil));
                                    end
                                }, 
                                ["{universeName}"] = {
                                    LinkText = l_props_2.CreatingUniverseName, 
                                    LinkCallback = function() --[[ Line: 558 ]] --[[ Name: LinkCallback ]]
                                        -- upvalues: l_GuiService_0 (ref), v12 (ref), l_props_2 (copy)
                                        l_GuiService_0:OpenBrowserWindow(v12.composeUrlToUniverse(l_props_2.CreatingUniverseRootPlaceId));
                                    end
                                }
                            }, 
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0)
                        })
                    }), 
                    FlagAsset = l_CanFlagAsset_0 and v3.createElement("ImageButton", {
                        BackgroundTransparency = 1, 
                        Image = l_Stylizer_0.ScrollingFrame.FlagAsset.Image, 
                        ImageColor3 = l_Stylizer_0.ScrollingFrame.FlagAsset.ImageColor3, 
                        LayoutOrder = v77:getNextOrder(), 
                        Size = l_Stylizer_0.ScrollingFrame.FlagAsset.Size, 
                        [v3.Event.Activated] = v59.props.OnClickReport
                    }, {
                        Tooltip = v3.createElement(v27, {
                            Text = v59.props.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Report")
                        }), 
                        HoverArea = v3.createElement(v19, {
                            Cursor = "PointingHand"
                        })
                    })
                }), 
                AssetRender = v3.createElement(v15, {
                    LayoutOrder = v77:getNextOrder(), 
                    Width = v66.X.Offset - l_Padding_0.PaddingLeft.Offset - l_Padding_0.PaddingRight.Offset, 
                    Padding = {
                        Right = 7, 
                        Top = 0, 
                        Bottom = 0, 
                        Left = 0
                    }, 
                    Margin = l_Stylizer_0.AssetRenderMargin, 
                    AssetData = l_AssetData_0, 
                    AssetInstance = l_props_2.AssetInstance, 
                    ImageCarouselAutoAdvanceTimer = l_props_2.ImageCarouselAutoAdvanceTimer, 
                    OnImageCarouselImageChanged = l_props_2.OnImageCarouselImageChanged, 
                    ImageCarouselTransparencyThreshold = l_props_2.ImageCarouselTransparencyThreshold, 
                    OnSetImageCarouselImages = l_props_2.OnSetImageCarouselImages, 
                    OnMouseEnter = v59.onMouseEnterAssetRender, 
                    OnMouseLeave = v59.onMouseLeaveAssetRender, 
                    OnPlaySound = v59.onPlaySound, 
                    OnPauseSound = v59.onPauseSound, 
                    OnPlayVideo = v59.onPlayVideo, 
                    OnPauseVideo = v59.onPauseVideo, 
                    UsageContext = l_props_2.UsageContext, 
                    UseImageCarousel = l_props_2.UseImageCarousel, 
                    ShouldMuteModelSounds = l_props_2.ShouldMuteModelSounds
                }), 
                AssetPreviewDetails = if not not l_props_2.Favorites or l_props_2.IsPackage or l_AssetData_0.Asset.HasScripts or l_props_2.Voting then v3.createElement(v16, {
                    Favorites = l_props_2.Favorites, 
                    HasScripts = l_AssetData_0.Asset.HasScripts, 
                    IsPackage = l_props_2.IsPackage, 
                    LastUpdatedDate = l_AssetData_0.Asset.Updated, 
                    LayoutOrder = v77:getNextOrder(), 
                    Voting = l_props_2.Voting, 
                    OnVoteUp = v59.onVoteUp, 
                    OnVoteDown = v59.onVoteDown, 
                    IsUninstalledPlugin = l_props_2.IsUninstalledPlugin
                }) else nil, 
                AssetDescription = v3.createElement(v23, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v77:getNextOrder(), 
                    OnClickLink = l_props_2.OnClickDescriptionLink, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Style = l_Stylizer_0.ScrollingFrame.AssetDescription, 
                    Text = v72, 
                    TextWrapped = true
                }), 
                CodeSummaryContainer = if l_props_2.CodeSummary then v3.createElement(v22, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    BackgroundColor = l_InfoRow_0.CodeSummary.BackgroundColor, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v77:getNextOrder(), 
                    Padding = l_InfoRow_0.CodeSummary.Padding, 
                    Size = UDim2.fromScale(1, 0), 
                    Style = "CornerBox", 
                    Spacing = l_Stylizer_0.ScrollingFrame.ElementPadding
                }, {
                    ScriptText = v3.createElement(v26, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = v77:getNextOrder(), 
                        RichText = true, 
                        Size = UDim2.fromScale(1, 0), 
                        Style = l_InfoRow_0.Text, 
                        Text = l_props_2.CodeSummary, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true
                    }), 
                    DisclaimerText = v3.createElement(v26, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = v77:getNextOrder(), 
                        Style = l_InfoRow_0.CodeSummary.DisclaimerText, 
                        Text = l_Localization_1:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "CodeSummaryDisclaimer"), 
                        Size = UDim2.fromScale(1, 0), 
                        TextWrapped = true
                    })
                }) else nil, 
                v3.createFragment(v7.List.map(v76, function(v84, v85) --[[ Line: 692 ]]
                    -- upvalues: l_TextService_0 (ref), l_InfoRow_0 (copy), v3 (ref), v21 (ref), v26 (ref), v18 (ref), v77 (copy), v76 (copy), v25 (ref)
                    local l_Label_0 = v84.Label;
                    local v87 = nil;
                    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Label_0, l_InfoRow_0.Text.TextSize, l_InfoRow_0.Text.Font, Vector2.new(1e999, 1e999));
                    v87 = if v84.LinkAction then v3.createElement(v21, {
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.fromScale(1, 0), 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Text = v84.Content, 
                        OnClick = v84.LinkAction
                    }) else v3.createElement(v26, {
                        Size = UDim2.fromScale(1, 1), 
                        Style = l_InfoRow_0.RightText, 
                        Text = v84.Content, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                    return v3.createFragment({
                        ["InfoRow_" .. tostring(v85)] = v3.createElement(v18, {
                            LayoutOrder = v77:getNextOrder(), 
                            Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y)
                        }, {
                            Label = v3.createElement(v26, {
                                Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 1, 0), 
                                Style = l_InfoRow_0.LeftText, 
                                Text = l_Label_0
                            }), 
                            ContentWrapper = v3.createElement(v18, {
                                Position = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, 0), 
                                Size = UDim2.new(1, -l_l_TextService_0_TextSize_0.X, 1, 0)
                            }, {
                                Content = v87
                            })
                        }), 
                        ["InfoRow_Separator_" .. tostring(v85)] = v85 < #v76 and v3.createElement(v25, {
                            LayoutOrder = v77:getNextOrder()
                        }) or nil
                    });
                end)), 
                Suggestions = if l_props_2.RenderSuggestions then v3.createElement(v22, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v77:getNextOrder(), 
                    Padding = l_Stylizer_0.ScrollingFrame.SuggestionsSection.Padding, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    SuggestionsWrapper = l_props_2.RenderSuggestions(v59.resetCanvasPosition)
                }) else nil, 
                FooterSeparator = l_props_2.RenderFooter and v3.createElement(v25, {
                    LayoutOrder = v77:getNextOrder()
                }), 
                Footer = l_props_2.RenderFooter and v3.createElement(l_props_2.RenderFooter, {
                    Size = UDim2.fromOffset(v79, 0), 
                    LayoutOrder = v77:getNextOrder()
                }), 
                BottomSpacer = v3.createElement(v18, {
                    LayoutOrder = v77:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.ScrollingFrame.Padding.PaddingTop + l_Stylizer_0.ScrollingFrame.Padding.PaddingBottom)
                })
            }), 
            ButtonArea = v3.createElement(v18, {
                LayoutOrder = 2, 
                Size = l_Stylizer_0.ButtonArea.Size
            }, {
                Padding = v3.createElement("UIPadding", if l_props_2.ActionSubText then l_join_0(l_Stylizer_0.ButtonArea.Padding, {
                    PaddingBottom = UDim.new(0, l_Stylizer_0.ButtonArea.ActionSubText.SpacingTop)
                }) else l_Stylizer_0.ButtonArea.Padding), 
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = l_Stylizer_0.ButtonArea.ElementPadding
                }), 
                ContextButton = v3.createElement(v17, {
                    LayoutOrder = 1, 
                    OnClick = l_props_2.OnClickContext, 
                    Size = l_Stylizer_0.ButtonArea.Context.Size, 
                    Style = l_Stylizer_0.ButtonArea.Context
                }, {
                    v3.createElement(v19, {
                        Cursor = "PointingHand"
                    })
                }), 
                ActionButton = v3.createElement(v17, {
                    LayoutOrder = 2, 
                    OnClick = v59.onClickActionButton, 
                    Text = l_props_2.ActionText, 
                    StyleModifier = l_props_2.ActionEnabled == false and v10.Disabled or nil, 
                    Style = l_props_2.ShowRobuxIcon and l_Stylizer_0.ButtonArea.ActionBuy or l_Stylizer_0.ButtonArea.Action, 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(1, -l_Stylizer_0.ButtonArea.Context.Size.X.Offset - l_Stylizer_0.ButtonArea.ElementPadding.Offset, 0, l_Stylizer_0.ButtonArea.ActionButtonHeight)
                }, {
                    v3.createElement(v19, {
                        Cursor = "PointingHand"
                    })
                })
            }), 
            ActionSubTextArea = if l_props_2.ActionSubText then v3.createElement(v22, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3, 
                Padding = {
                    Left = l_Stylizer_0.ScrollingFrame.ElementPadding, 
                    Right = l_Stylizer_0.ScrollingFrame.ElementPadding, 
                    Bottom = l_Stylizer_0.ScrollingFrame.ElementPadding
                }, 
                Size = UDim2.new(1, 0, 0, v68.Y)
            }, {
                ActionSubText = v3.createElement(v26, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_props_2.ActionSubText, 
                    TextColor = l_Stylizer_0.ButtonArea.ActionSubText.TextColor, 
                    TextSize = l_Stylizer_0.ButtonArea.ActionSubText.TextSize, 
                    TextWrapped = true
                })
            }) else nil
        })
    });
end;
return v13((l_withContext_0({
    Analytics = v4.Analytics, 
    Localization = v4.Localization, 
    Stylizer = v4.Stylizer
})(v32)));