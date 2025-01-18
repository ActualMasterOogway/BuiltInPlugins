local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Framework);
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local _ = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableFiatFully);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v11 = require(l_Packages_0.Roact);
local v12 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local _ = l_UI_0.MultiImagePickerWrapper;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local _ = l_UI_0.BulletList;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local v23 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local l_map_0 = require(l_Packages_0.Dash).map;
local v25 = require(l_Util_0.createAssetMediaMetadata);
local v26 = require(l_Util_0.LayoutOrderIterator);
local v27 = require(l_Util_0.AssetConfigConstants);
local v28 = require(l_Util_0.AssetConfigUtil);
local v29 = require(l_Util_0.Constants);
local v30 = require(l_Parent_0.Core.Util.Images);
local v31 = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local v32 = require(l_Util_0.ToolboxUtilities);
local _ = require(l_Util_0.FiatTempConstants);
local v34 = require(l_Util_0.Urls);
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v36 = require(l_AssetConfiguration_0.ConfigTextField);
local v37 = require(l_AssetConfiguration_0.ConfigAccess);
local v38 = require(l_AssetConfiguration_0.ConfigDeleteLocal);
local v39 = require(l_AssetConfiguration_0.ConfigGenre);
local _ = require(l_AssetConfiguration_0.ConfigCopy);
local v41 = require(l_AssetConfiguration_0.ConfigPackage);
local v42 = require(l_AssetConfiguration_0.ConfigAssetType);
local v43 = require(l_AssetConfiguration_0.ConfigComment);
local v44 = require(l_AssetConfiguration_0.ConfigSharing);
local _ = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v46 = require(l_AssetConfiguration_0.CatalogTags.TagsComponent);
local v47 = require(l_AssetConfiguration_0.Header);
local _ = require(l_AssetConfiguration_0.PriceComponent);
local _ = require(l_AssetConfiguration_0.FiatPriceComponent);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v51 = require(l_Parent_0.Core.Actions.SetFieldError);
local _ = require(l_Parent_0.Core.Util.PageInfoHelper);
local v53 = v11.PureComponent:extend("PublishAsset");
v53.init = function(v54, v55) --[[ Line: 139 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_GuiService_0 (copy), v32 (copy), v10 (copy)
    v54.state = {
        maxDropdownPosition = 0
    };
    v54.baseFrameRef = v11.createRef();
    v54.listLayoutRef = v11.createRef();
    v54.tagsRef = v11.createRef();
    v54.genreRef = v11.createRef();
    v54.onClickConfigurePriceUrl = function() --[[ Line: 149 ]]
        -- upvalues: l_GuiService_0 (ref), v32 (ref), v54 (copy)
        l_GuiService_0:OpenBrowserWindow(v32.getMarketplaceAssetConfigUrl(v54.props.assetId));
    end;
    if v10() then
        v54.onClickOnboardLink = function() --[[ Line: 154 ]]
            -- upvalues: l_GuiService_0 (ref), v32 (ref)
            l_GuiService_0:OpenBrowserWindow(v32.getMarketplaceOnboardingUrl());
        end;
    end;
    v54.refreshCanvas = function() --[[ Line: 159 ]]
        -- upvalues: v54 (copy), v55 (copy)
        if v54.baseFrameRef.current and v54.listLayoutRef.current then
            local l_current_0 = v54.baseFrameRef.current;
            local v57 = math.max(v54.listLayoutRef.current.AbsoluteContentSize.y + 48, v54.state.maxDropdownPosition);
            l_current_0.CanvasSize = UDim2.new(v55.Size.X.Scale, v55.Size.X.Offset, 0, v57);
        end;
    end;
    v54.updateMaxDropdownPosition = function(v58, v59) --[[ Line: 169 ]]
        -- upvalues: v54 (copy)
        if v58.current and v59 > 0 then
            local v60 = v58.current.AbsolutePosition.Y + v54.baseFrameRef.current.CanvasPosition.Y + -v54.baseFrameRef.current.AbsolutePosition.Y - 24;
            local v61 = v60 + 24 + v58.current.AbsoluteSize.Y + v59 + 24;
            spawn(function() --[[ Line: 183 ]]
                -- upvalues: v61 (copy), v54 (ref), v60 (copy)
                if v61 > v54.state.maxDropdownPosition then
                    v54:setState({
                        maxDropdownPosition = v61
                    });
                    v54.refreshCanvas();
                end;
                v54:bumpCanvas(v60, v61);
            end);
        end;
    end;
end;
v53.bumpCanvas = function(v62, v63, v64) --[[ Line: 194 ]] --[[ Name: bumpCanvas ]]
    if v62.baseFrameRef.current then
        local l_current_1 = v62.baseFrameRef.current;
        local l_Y_0 = l_current_1.CanvasPosition.Y;
        local l_Y_1 = l_current_1.AbsoluteSize.Y;
        if v63 < l_Y_0 then
            l_current_1.CanvasPosition = Vector2.new(0, (math.max(0, v63)));
            return;
        elseif l_Y_0 + l_Y_1 < v64 then
            l_current_1.CanvasPosition = Vector2.new(0, (math.max(0, v64 - l_Y_1)));
        end;
    end;
end;
v53.render = function(v68) --[[ Line: 207 ]] --[[ Name: render ]]
    -- upvalues: l_UnifyModelPackagePublish3_0 (copy), v27 (copy), v28 (copy), v34 (copy), v32 (copy), v6 (copy), v9 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v26 (copy), v11 (copy), l_map_0 (copy), v25 (copy), v23 (copy), l_Pane_0 (copy), v29 (copy), v30 (copy), v47 (copy), v36 (copy), v42 (copy), v37 (copy), l_TitledFrame_0 (copy), v31 (copy), v46 (copy), v39 (copy), l_Separator_0 (copy), v44 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_GuiService_0 (copy), v41 (copy), v43 (copy), v38 (copy)
    local l_Stylizer_0 = v68.props.Stylizer;
    local l_props_0 = v68.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_allowCopy_0 = l_props_0.allowCopy;
    local l_allowSelectPrivate_0 = l_props_0.allowSelectPrivate;
    local l_name_0 = l_props_0.name;
    local l_description_0 = l_props_0.description;
    local l_tags_0 = l_props_0.tags;
    local l_owner_0 = l_props_0.owner;
    local l_genres_0 = l_props_0.genres;
    local l_copyOn_0 = l_props_0.copyOn;
    local l_allowComment_0 = l_props_0.allowComment;
    local l_commentOn_0 = l_props_0.commentOn;
    local l_deleteLocal_0 = l_props_0.deleteLocal;
    local v84 = if l_UnifyModelPackagePublish3_0 then l_props_0.allowPackage else nil;
    local v85 = if l_UnifyModelPackagePublish3_0 then l_props_0.packageOn else nil;
    local v86 = if l_UnifyModelPackagePublish3_0 then l_props_0.packageWarningText else nil;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_isAssetPublic_0 = l_props_0.isAssetPublic;
    local _ = v27.additionalImages.MaxThumbnails;
    local v90 = l_assetTypeEnum_0 == Enum.AssetType.Audio;
    local v91 = l_assetTypeEnum_0 == Enum.AssetType.Video;
    local v92 = l_assetTypeEnum_0 == Enum.AssetType.Model;
    local v93 = l_assetTypeEnum_0 == Enum.AssetType.Plugin;
    local v94 = l_assetTypeEnum_0 == Enum.AssetType.Animation;
    local _ = if l_UnifyModelPackagePublish3_0 then l_props_0.isPackageAsset else nil;
    local v96 = v28.isCreatorStoreAssetNotIncludingAnimation(l_assetTypeEnum_0);
    local v97 = if typeof(l_props_0.assetId) == "number" then v34.constructCreatorStoreConfigurationUrl(l_props_0.assetId) else v32.getCreatorDashboardBaseUrl();
    local l_onNameChange_0 = l_props_0.onNameChange;
    local l_onDescChange_0 = l_props_0.onDescChange;
    local l_onTagsChange_0 = l_props_0.onTagsChange;
    local l_onOwnerSelected_0 = l_props_0.onOwnerSelected;
    local l_onCategoryChange_0 = l_props_0.onCategoryChange;
    local l_onGenreSelected_0 = l_props_0.onGenreSelected;
    local l_onSharingChanged_0 = l_props_0.onSharingChanged;
    local _ = l_props_0.toggleCopy;
    local l_toggleComment_0 = l_props_0.toggleComment;
    local v107 = if l_UnifyModelPackagePublish3_0 then l_props_0.togglePackage else nil;
    local l_toggleDeleteLocal_0 = l_props_0.toggleDeleteLocal;
    local v109 = if v6() then l_props_0.canUploadWithUgcRestrictions else nil;
    local v110 = if v6() then l_props_0.canUploadWithUgcRestrictionsDenyReason else nil;
    local l_publishingRequirements_0 = l_props_0.publishingRequirements;
    local v112 = if v9() then l_props_0.publishingRestriction else nil;
    local v113 = if l_publishingRequirements_0 then l_publishingRequirements_0.verification else nil;
    local _ = if v113 and v113.supportedTypes then #v113.supportedTypes ~= 0 else false;
    local _ = v113 and v113.isVerified and v93;
    local l_displayOwnership_0 = l_props_0.displayOwnership;
    local l_displayGenre_0 = l_props_0.displayGenre;
    local _ = l_props_0.displayCopy;
    local v119 = if l_UnifyModelPackagePublish3_0 then l_props_0.displayPackage else nil;
    local l_displayComment_0 = l_props_0.displayComment;
    local v121 = not v93 and l_props_0.displayAssetType;
    local l_displayTags_0 = l_props_0.displayTags;
    local l_displaySharing_0 = l_props_0.displaySharing;
    local l_displayAssetTypeSelection_0 = l_props_0.displayAssetTypeSelection;
    local _ = if v93 then l_props_0.allowedAssetTypesForRelease else nil;
    local _ = l_props_0.allowedAssetTypesForFree;
    local v127 = if v93 then l_props_0.newAssetStatus else nil;
    local _ = if v93 then l_props_0.currentAssetStatus else nil;
    local _ = if v93 then l_props_0.onStatusChange else nil;
    local _ = if v93 then l_props_0.price else nil;
    local _ = if v93 then l_props_0.minPrice else nil;
    local _ = if v93 then l_props_0.maxPrice else nil;
    local _ = if v93 then l_props_0.feeRate else nil;
    local _ = if v93 then l_props_0.isPriceValid else nil;
    local _ = if v93 then l_props_0.onPriceChange else nil;
    local v136 = if v93 then v28.isReadyForSale(v127) or v28.isBuyableMarketplaceAsset(l_assetTypeEnum_0) else nil;
    local l_maximumItemTagsPerItem_0 = l_props_0.maximumItemTagsPerItem;
    local v138 = nil;
    local v139 = nil;
    local l_Localization_0 = l_props_0.Localization;
    if (v90 or l_ToolboxVideoConfigSharing2_0 and v91) and not l_isAssetPublic_0 and l_copyOn_0 and not l_UnifyModelPackagePublish3_0 then
        v138 = l_Localization_0:getText("AssetConfigCopy", "MustShare");
    end;
    if v92 then
        v139 = l_Localization_0:getText("AssetConfig", "ModelPublishWarning");
    end;
    local v141 = v26.new();
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v143 = 80;
    if not l_allowCopy_0 then
        v143 = v143 + 60;
    end;
    local v144 = {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        [v11.Ref] = v68.baseFrameRef
    };
    local v145 = nil;
    if l_props_0.assetMediaMetadataArray then
        v145 = l_props_0.assetMediaMetadataArray;
    elseif l_props_0.assetMediaIds ~= nil then
        v145 = l_map_0(l_props_0.assetMediaIds, function(v146) --[[ Line: 336 ]]
            -- upvalues: v25 (ref)
            return v25.from(v146, true, true);
        end);
    end;
    local v147 = nil;
    v147 = if v9() then if v93 then v136 and v112 == nil else l_allowCopy_0 else if v93 then v136 else l_allowCopy_0;
    return v11.createElement(v23, v144, {
        Padding = v11.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0), 
            [v11.Change.AbsoluteContentSize] = v68.refreshCanvas or function(v148) --[[ Line: 365 ]]
                -- upvalues: v68 (copy), l_Size_0 (copy)
                if v68.baseFrameRef.current then
                    v68.baseFrameRef.current.CanvasSize = UDim2.new(l_Size_0.X.Scale, l_Size_0.X.Offset, 0, v148.AbsoluteContentSize.y + 48);
                end;
            end, 
            [v11.Ref] = v68.listLayoutRef
        }), 
        ModelWarningFrame = if not l_displayAssetTypeSelection_0 and v92 then v11.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v29.FONT_SIZE_TITLE), 
            Padding = {
                Bottom = 30
            }, 
            Spacing = 5, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Icon = v11.createElement("ImageLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Image = v30.WARNING_ICON, 
                ImageColor3 = l_publishAsset_0.warningIconColor, 
                Size = UDim2.fromOffset(24, 24)
            }), 
            WarningText = v11.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Font = v29.FONT, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v139, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v29.FONT_SIZE_TITLE
            })
        }) else nil, 
        Header = if v93 then v11.createElement(v47, {
            LayoutOrder = v141:getNextOrder(), 
            Title = l_Localization_0:getText("AssetConfig", "PublishPluginHeader")
        }) else nil, 
        Title = v11.createElement(v36, {
            Title = l_Localization_0:getText("General", "Title"), 
            TotalHeight = 100, 
            MaxCount = v27.NAME_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onNameChange_0, 
            TextContent = l_name_0, 
            ErrorCallback = function(v149) --[[ Line: 425 ]] --[[ Name: ErrorCallback ]]
                -- upvalues: v68 (copy), v27 (ref)
                v68.props.setFieldError(v27.FIELD_NAMES.Title, v149);
            end, 
            LayoutOrder = v141:getNextOrder()
        }), 
        Description = v11.createElement(v36, {
            BottomRightText = l_Localization_0:getText("AssetConfigDescription", "AddRobloxLinks"), 
            Title = l_Localization_0:getText("General", "Description"), 
            TotalHeight = 180, 
            MaxCount = v27.DESCRIPTION_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onDescChange_0, 
            TextContent = l_description_0, 
            ErrorCallback = function(v150) --[[ Line: 439 ]] --[[ Name: ErrorCallback ]]
                -- upvalues: v68 (copy), v27 (ref)
                v68.props.setFieldError(v27.FIELD_NAMES.Description, v150);
            end, 
            LayoutOrder = v141:getNextOrder()
        }), 
        AssetTypeSelection = if l_displayAssetTypeSelection_0 then v11.createElement(v42, {
            LayoutOrder = v141:getNextOrder(), 
            onCategoryChange = l_onCategoryChange_0, 
            canUploadWithUgcRestrictions = if v6() then v109 else nil, 
            canUploadWithUgcRestrictionsDenyReason = if v6() then v110 else nil, 
            dataSharingEnabled = l_props_0.dataSharingEnabled, 
            dataSharingToggled = l_props_0.dataSharingToggled, 
            onDataConsentToggleClick = l_props_0.onDataConsentToggleClick
        }) else nil, 
        Creator = if l_displayAssetTypeSelection_0 and l_displayOwnership_0 then v11.createElement(v37, {
            LayoutOrder = v141:getNextOrder(), 
            onDropDownSelect = l_onOwnerSelected_0, 
            owner = l_owner_0, 
            Title = l_Localization_0:getText("General", "Ownership"), 
            TotalHeight = 70
        }) else nil, 
        AssetType = v121 and v11.createElement(l_TitledFrame_0, {
            Title = l_Localization_0:getText("General", "AssetType"), 
            LayoutOrder = v141:getNextOrder()
        }, {
            Label = v11.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextColor3 = l_publishAsset_0.textColor, 
                Font = v29.FONT, 
                TextSize = v29.FONT_SIZE_TITLE, 
                Text = v31(l_Localization_0)[l_assetTypeEnum_0], 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        Tags = l_displayTags_0 and v11.createElement(v46, {
            tags = l_tags_0, 
            onTagsChange = l_onTagsChange_0, 
            maximumItemTagsPerItem = l_maximumItemTagsPerItem_0, 
            Title = l_Localization_0:getText("General", "Tags"), 
            AssetTypeEnum = l_assetTypeEnum_0, 
            LayoutOrder = v141:getNextOrder(), 
            setDropdownHeight = function(v151) --[[ Line: 498 ]] --[[ Name: setDropdownHeight ]]
                -- upvalues: v68 (copy)
                v68.updateMaxDropdownPosition(v68.tagsRef, v151);
            end, 
            [v11.Ref] = v68.tagsRef
        }), 
        Ownership = if not l_displayAssetTypeSelection_0 and l_displayOwnership_0 then v11.createElement(v37, {
            Title = l_Localization_0:getText("General", "Ownership"), 
            owner = l_owner_0, 
            TotalHeight = 70, 
            onDropDownSelect = l_onOwnerSelected_0, 
            LayoutOrder = v141:getNextOrder()
        }) else nil, 
        Genre = l_displayGenre_0 and v11.createElement(v39, {
            Title = l_Localization_0:getText("General", "Genre"), 
            genres = l_genres_0, 
            TotalHeight = 70, 
            onDropDownSelect = l_onGenreSelected_0, 
            LayoutOrder = v141:getNextOrder(), 
            setDropdownHeight = function(v152) --[[ Line: 528 ]] --[[ Name: setDropdownHeight ]]
                -- upvalues: v68 (copy)
                v68.updateMaxDropdownPosition(v68.genreRef, v152);
            end, 
            [v11.Ref] = v68.genreRef
        }), 
        DividerBase = (not not l_displayGenre_0 or v96) and v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20)
        }, {
            Separator = v11.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        }), 
        Sharing = if l_displaySharing_0 then v11.createElement(v44, {
            AssetId = l_props_0.assetId, 
            AssetType = l_assetTypeEnum_0, 
            AllowSelectPrivate = l_allowSelectPrivate_0, 
            LayoutOrder = v141:getNextOrder(), 
            IsAssetPublic = l_isAssetPublic_0, 
            OnSelected = l_onSharingChanged_0
        }) else nil, 
        SharingDivider = if l_displaySharing_0 then v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20)
        }, {
            Separator = v11.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        }) else nil, 
        CreatorStoreConfigurationFrame = if v96 then v11.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v141:getNextOrder(), 
            Padding = {
                Top = 20
            }
        }, {
            CreatorStoreConfigurationText = v11.createElement(l_TextLabel_0, {
                Text = l_props_0.Localization:getText("AssetUploadResult", "CreatorStoreConfigurationMessage"), 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v29.FONT_SIZE_LARGE, 
                Size = UDim2.new(1, 0, 0, 24), 
                LayoutOrder = v141:getNextOrder()
            }), 
            CreatorStoreConfigurationLink = v11.createElement(l_LinkText_0, {
                Text = v97, 
                TextColor3 = l_Stylizer_0.uploadResult.link, 
                TextSize = v29.FONT_SIZE_LARGE, 
                Size = UDim2.new(1, 0, 0, 24), 
                LayoutOrder = v141:getNextOrder(), 
                OnClick = function() --[[ Line: 590 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_GuiService_0 (ref), v97 (copy)
                    l_GuiService_0:OpenBrowserWindow(v97);
                end
            })
        }) else nil, 
        Package = if l_UnifyModelPackagePublish3_0 and v119 then v11.createElement(v41, {
            Title = l_Localization_0:getText("General", "Package"), 
            TotalHeight = 80, 
            PackageEnabled = v84, 
            PackageOn = v85, 
            PackageWarningText = v86, 
            ToggleCallback = v107, 
            LayoutOrder = v141:getNextOrder()
        }) else nil, 
        Comment = l_displayComment_0 and v11.createElement(v43, {
            Title = l_Localization_0:getText("General", "Comments"), 
            TotalHeight = 80, 
            CommentEnabled = l_allowComment_0, 
            CommentOn = l_commentOn_0, 
            ToggleCallback = l_toggleComment_0, 
            LayoutOrder = v141:getNextOrder()
        }), 
        DeleteLocal = v94 and v11.createElement(v38, {
            Title = l_Localization_0:getText("General", "DeleteLocal"), 
            TotalHeight = 80, 
            DeleteLocal = l_deleteLocal_0, 
            ToggleCallback = l_toggleDeleteLocal_0, 
            LayoutOrder = v141:getNextOrder()
        })
    });
end;
local function v154(v153) --[[ Line: 637 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v10 (copy)
    v153 = v153 or {};
    return {
        publishingRequirements = v153.publishingRequirements, 
        assetMediaIds = v153.assetMediaIds, 
        assetMediaMetadataArray = v153.assetMediaMetadataArray, 
        sellerStatusData = if v10() then v153.sellerStatusData else nil
    };
end;
local function v158(v155) --[[ Line: 650 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v51 (copy), v27 (copy)
    return {
        setFieldError = function(v156, v157) --[[ Line: 652 ]] --[[ Name: setFieldError ]]
            -- upvalues: v155 (copy), v51 (ref), v27 (ref)
            v155(v51(v27.SIDE_TABS.General, v156, v157));
        end
    };
end;
v53 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v53);
return v12.connect(v154, v158)(v53);