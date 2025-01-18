local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UpdateAssetUploadResultBundleConfigureLink2_0 = game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2");
local l_ChangeAvatarAssetCreatorDashboardLink_0 = game:GetFastFlag("ChangeAvatarAssetCreatorDashboardLink");
game:DefineFastFlag("ToolboxFixSubmitDevelopmentItemWidth", false);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Roact);
local v8 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetConfigConstants);
local l_PreviewTypes_0 = v11.PreviewTypes;
local v13 = require(l_Util_0.AssetConfigUtil);
local v14 = require(l_Util_0.ToolboxUtilities);
local v15 = require(l_Util_0.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v19 = require(l_Components_0.NavButton);
local l_AssetConfiguration_0 = l_Components_0.AssetConfiguration;
local v21 = require(l_AssetConfiguration_0.AssetThumbnailPreview);
local _ = require(l_AssetConfiguration_0.ReasonFrame);
local v23 = require(l_AssetConfiguration_0.CopyID);
local v24 = require(l_Packages_0.Framework);
local l_LinkText_0 = v24.UI.LinkText;
local l_Pane_0 = v24.UI.Pane;
local l_TextWithInlineLink_0 = v24.UI.TextWithInlineLink;
local l_LayoutOrderIterator_0 = v24.Util.LayoutOrderIterator;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v30 = require(l_Actions_0.ClearChange);
local l_Thunks_0 = l_Parent_0.Core.Thunks;
local v32 = require(l_Thunks_0.AssetConfiguration.GoToNextScreen);
local v33 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixAssetConfigResultTranslations);
local v34 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local v35 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxHideUrlForAnimations);
local v36 = game:GetFastFlag("ToolboxFixSubmitDevelopmentItemWidth") and 225 or 150;
local v37 = v7.PureComponent:extend("AssetUploadResult");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
v37.init = function(v39, _) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_ChangeAvatarAssetCreatorDashboardLink_0 (copy), v15 (copy), l_GuiService_0 (copy), v34 (copy), l_UpdateAssetUploadResultBundleConfigureLink2_0 (copy)
    v39.state = {
        isLoading = true
    };
    v39.goToNextScreen = function() --[[ Line: 96 ]]
        -- upvalues: v39 (copy), v11 (ref)
        local l_props_0 = v39.props;
        l_props_0.clearChange(v11.OVERRIDE_ASSET_ID);
        l_props_0.goToNextScreen();
    end;
    v39.onClose = function() --[[ Line: 102 ]]
        -- upvalues: v39 (copy)
        v39.props.onClose();
        game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(false);
    end;
    if l_ChangeAvatarAssetCreatorDashboardLink_0 then
        v39.openCreatorDashboard = function(v42) --[[ Line: 112 ]]
            -- upvalues: v15 (ref), l_GuiService_0 (ref)
            local v43 = if v15 then v15.constructCreatorDashboardConfigAvatarAssetUrl(v42) else nil;
            if v43 and v43 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v43);
            end;
        end;
    else
        v39.openCreatorDashboard = function() --[[ Line: 119 ]]
            -- upvalues: v15 (ref), l_GuiService_0 (ref)
            local v44 = if v15 then v15.constructCreatorDashboardAvatarAssetUrl() else nil;
            if v44 and v44 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v44);
            end;
        end;
    end;
    if v34() then
        v39.openCreatorDashboardCreationsPage = function() --[[ Line: 128 ]]
            -- upvalues: v15 (ref), l_GuiService_0 (ref)
            local v45 = v15.constructCreatorDashboardCreationsPageUrl();
            if v45 and v45 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v45);
            end;
        end;
    end;
    if l_UpdateAssetUploadResultBundleConfigureLink2_0 then
        v39.openCreatorDashboardBundle = function(v46) --[[ Line: 137 ]]
            -- upvalues: v15 (ref), l_GuiService_0 (ref)
            local v47 = if v15 then v15.constructCreatorDashboardBundleConfigureUrl(v46) else nil;
            if v47 and v47 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v47);
            end;
        end;
    end;
end;
local function v56(v48, v49, v50) --[[ Line: 146 ]] --[[ Name: getResultUrl ]]
    -- upvalues: v11 (copy), v13 (copy), l_ContentProvider_0 (copy), v14 (copy), l_HttpService_0 (copy)
    local _ = nil;
    if v48 == v11.FLOW_TYPE.UPLOAD_FLOW then
        if v13.isCatalogAsset(v50) then
            return l_ContentProvider_0.BaseUrl .. "catalog/" .. v49;
        else
            local v52 = v14.getCreatorMarketplaceWebBaseUrl();
            if v52 then
                return (string.format("%sasset/%s", v52, l_HttpService_0:urlEncode(v49)));
            else
                local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
                return (string.format("%slibrary/%s/", l_BaseUrl_0, l_HttpService_0:urlEncode(v49)));
            end;
        end;
    elseif v13.isCatalogAsset(v50) then
        return l_ContentProvider_0.BaseUrl .. "catalog/" .. v49;
    else
        local v54 = v14.getCreatorMarketplaceWebBaseUrl();
        if v54 then
            return (string.format("%sasset/%s", v54, l_HttpService_0:urlEncode(v49)));
        else
            local l_BaseUrl_1 = l_ContentProvider_0.BaseUrl;
            return (string.format("%slibrary/%s/", l_BaseUrl_1, l_HttpService_0:urlEncode(v49)));
        end;
    end;
end;
local _ = function(v57) --[[ Line: 178 ]] --[[ Name: getReasonArray ]]
    local v58 = {};
    for _, v60 in pairs(v57) do
        table.insert(v58, v60);
    end;
    return v58;
end;
v37.render = function(v62) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v13 (copy), l_PreviewTypes_0 (copy), l_UnifyModelPackagePublish3_0 (copy), v10 (copy), v56 (copy), v15 (copy), v35 (copy), l_LayoutOrderIterator_0 (copy), v33 (copy), v7 (copy), v21 (copy), v23 (copy), l_GuiService_0 (copy), l_TextWithInlineLink_0 (copy), l_ChangeAvatarAssetCreatorDashboardLink_0 (copy), v34 (copy), l_Pane_0 (copy), v19 (copy), v36 (copy), l_LinkText_0 (copy)
    local l_props_1 = v62.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_networkError_0 = l_props_1.networkError;
    local v66 = l_props_1.screenFlowType == v11.FLOW_TYPE.UPLOAD_FLOW and v13.isCatalogAsset(l_props_1.assetTypeEnum);
    local v67 = v13.getPreviewType(l_props_1.assetTypeEnum, l_props_1.instances);
    local v68 = v67 == l_PreviewTypes_0.ModelPreview;
    local v69 = true;
    if v67 ~= l_PreviewTypes_0.Thumbnail then
        v69 = v67 == l_PreviewTypes_0.ImagePicker;
    end;
    local l_networkTable_0 = l_props_1.networkTable;
    local v71 = {};
    for _, v73 in pairs(l_networkTable_0) do
        table.insert(v71, v73);
    end;
    local _ = v71;
    l_networkTable_0 = l_props_1.uploadSucceeded;
    v71 = not l_networkTable_0;
    local v75 = if l_UnifyModelPackagePublish3_0 then l_props_1.isPackageAsset else nil;
    local v76 = v13.isCatalogAsset(l_props_1.assetTypeEnum);
    local v77 = l_networkTable_0 and v76;
    local v78 = not l_networkTable_0 and v76 or not v76;
    local v79 = not l_networkTable_0 and v76 or not v75;
    local v80 = nil;
    if l_props_1.hasSubsequent then
        v77 = false;
        v79 = false;
        v78 = false;
        v80 = true;
    end;
    local v81 = 72 + v10.FONT_SIZE_MEDIUM;
    local v82 = v13.isCatalogAsset(l_props_1.assetTypeEnum) or v13.isUGCBundleType(l_props_1.assetTypeEnum);
    local v83 = nil;
    if not v82 and l_props_1.uploadSucceeded then
        v83 = v56(l_props_1.screenFlowType, l_props_1.assetId or 0, l_props_1.assetTypeEnum);
    end;
    local v84 = v15.constructCreatorStoreConfigurationUrl(l_props_1.assetId or 0);
    local v85 = if v35() then v13.isCreatorStoreAssetNotIncludingAnimation(l_props_1.assetTypeEnum) and not v82 else not v82;
    local v86 = l_LayoutOrderIterator_0.new();
    local v87 = nil;
    if v33() then
        v87 = if l_props_1.uploadSucceeded then l_props_1.Localization:getText("AssetUploadResult", "SubmissionSucceeded") else l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed");
    end;
    return v7.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Stylizer_0.uploadResult.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_1.Size
    }, {
        ModelPreview = v68 and v7.createElement(v21, {
            title = l_props_1.assetName or nil, 
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        ThumbnailPreview = v69 and v7.createElement("ImageLabel", {
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v13.getResultThumbnail(l_props_1.assetId, l_props_1.iconFile), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        CopyID = l_networkTable_0 and v7.createElement(v23, {
            YPos = 240, 
            AssetId = l_props_1.assetId
        }), 
        LoadingResultSuccess = l_networkTable_0 and v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = if v33() then v87 else l_props_1.uploadSucceeded and "Successfully submitted!" or "Submission failed", 
                Font = v10.FONT, 
                TextColor3 = l_Stylizer_0.uploadResult.greenText, 
                TextSize = v10.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 1
            }), 
            ReasonFrame = false, 
            Rows = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 400, 0, 72), 
                Position = UDim2.new(0.5, -200, 0, 49), 
                LayoutOrder = 3
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ModerationMessage = v66 and v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = if v33() then l_props_1.Localization:getText("AssetUploadResult", "AddedToModerationQueueMessage") else "Asset has been added to moderation queue.", 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 0
                }), 
                CreatorStoreConfigurationText = if v85 then v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = l_props_1.Localization:getText("AssetUploadResult", "CreatorStoreConfigurationMessage"), 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 1
                }) else nil, 
                CreatorStoreConfigurationLink = if v85 then v7.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = v84, 
                    TextColor3 = l_Stylizer_0.uploadResult.link, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 2, 
                    [v7.Event.Activated] = function() --[[ Line: 352 ]]
                        -- upvalues: l_GuiService_0 (ref), v84 (copy)
                        l_GuiService_0:OpenBrowserWindow(v84);
                    end
                }) else nil, 
                ToolboxText = if not v82 then v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = if v33() then l_props_1.Localization:getText("AssetUploadResult", "WebsiteUrlNoticeMessage") else "You may find your asset in Toolbox or on web:", 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 3
                }) else nil, 
                ToolboxLink = if not v82 then v7.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = v83, 
                    TextColor3 = l_Stylizer_0.uploadResult.link, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 4, 
                    [v7.Event.Activated] = function() --[[ Line: 381 ]]
                        -- upvalues: l_GuiService_0 (ref), v83 (ref)
                        l_GuiService_0:OpenBrowserWindow(v83);
                    end
                }) else nil, 
                CreatorDashboardMsg = if v82 then v7.createElement(l_TextWithInlineLink_0, {
                    OnLinkClicked = game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2") and v13.isUGCBundleType(l_props_1.assetTypeEnum) and function() --[[ Line: 390 ]]
                        -- upvalues: v62 (copy), l_props_1 (copy)
                        v62.openCreatorDashboardBundle(l_props_1.assetId);
                    end or l_ChangeAvatarAssetCreatorDashboardLink_0 and function() --[[ Line: 394 ]]
                        -- upvalues: v62 (copy), l_props_1 (copy)
                        v62.openCreatorDashboard(l_props_1.assetId);
                    end or v62.openCreatorDashboard, 
                    Text = l_props_1.Localization:getText("AssetUploadResult", "CreatorDashboardMessage", {
                        creatorDashboardLink = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER
                    }), 
                    LinkText = l_props_1.Localization:getText("General", "CreatorDashboard"), 
                    LinkPlaceholder = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    MaxWidth = 400, 
                    TextProps = {
                        Font = v10.FONT, 
                        TextColor3 = l_Stylizer_0.uploadResult.text, 
                        TextSize = v10.FONT_SIZE_TITLE, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    }, 
                    LayoutOrder = 5
                }) else nil
            })
        }), 
        LoadingResultFailure = v71 and v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = if not v34() then v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = if v33() then l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed") else "Submission failed", 
                TextColor3 = l_Stylizer_0.uploadResult.redText, 
                TextSize = v10.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }) else nil, 
            Reason = if not v34() then v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Position = UDim2.new(0.5, -200, 0, 49), 
                Size = UDim2.new(0, 400, 0, 72), 
                Text = l_networkError_0 and l_networkError_0.responseBody, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v10.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top
            }) else nil, 
            ReasonTextFrame = if v34() then v7.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1, 
                Padding = 8, 
                Size = UDim2.new(1, 0, 0, 0), 
                Spacing = 12
            }, {
                Title = v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0.5, -200, 0, 0), 
                    Size = UDim2.new(0, 400, 0, 36), 
                    Text = if v33() then l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed") else "Submission failed", 
                    TextColor3 = l_Stylizer_0.uploadResult.redText, 
                    TextSize = v10.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                ReasonWithDashboardLink = v7.createElement(l_TextWithInlineLink_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    LayoutOrder = 3, 
                    LinkPlaceholder = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER, 
                    LinkText = v62.props.Localization:getText("General", "CreatorDashboard"), 
                    MaxWidth = 400, 
                    OnLinkClicked = v62.openCreatorDashboardCreationsPage, 
                    Text = l_networkError_0 and l_networkError_0.responseBody, 
                    TextProps = {
                        Font = v10.FONT, 
                        TextColor3 = l_Stylizer_0.uploadResult.text, 
                        TextSize = v10.FONT_SIZE_MEDIUM, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    }
                })
            }) else nil
        }), 
        Footer = v7.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -v81), 
            Size = UDim2.new(1, 0, 0, v81)
        }, {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SubmitButton = if v77 then v7.createElement(v19, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v86:getNextOrder(), 
                onClick = v62.goToNextScreen, 
                Size = UDim2.new(0, v36, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "SubmitAsDevelopmentItem")
            }) else nil, 
            NextButton = if v80 then v7.createElement(v19, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v86:getNextOrder(), 
                onClick = v62.onClose, 
                Size = UDim2.new(0, 200, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "NextSubmit")
            }) else nil, 
            CloseLink = if v77 then v7.createElement(l_LinkText_0, {
                LayoutOrder = v86:getNextOrder(), 
                OnClick = v62.onClose, 
                Text = l_props_1.Localization:getText("AssetUploadResult", "Close")
            }) else nil, 
            CloseButton = if v78 then v7.createElement(v19, {
                LayoutOrder = v86:getNextOrder(), 
                onClick = v62.onClose, 
                Size = UDim2.new(0, 120, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "Close")
            }) else nil, 
            LinkText = if v79 then v7.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                OnClick = v62.goToNextScreen, 
                Text = l_props_1.Localization:getText("AssetUploadResult", "Back")
            }) else nil
        })
    });
end;
local function v90(v88, _) --[[ Line: 560 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_UnifyModelPackagePublish3_0 (copy)
    v88 = v88 or {};
    return {
        assetId = v88.assetId, 
        assetName = v88.changed and v88.changed.AssetConfigName or v88.assetName, 
        uploadSucceeded = v88.uploadSucceeded, 
        instances = v88.instances, 
        networkError = v88.networkError, 
        screenFlowType = v88.screenFlowType, 
        assetConfigData = v88.assetConfigData, 
        assetTypeEnum = v88.assetTypeEnum, 
        thumbnailStatus = v88.thumbnailStatus, 
        networkTable = v88.networkTable or {}, 
        iconFile = v88.iconFile, 
        isPackageAsset = if l_UnifyModelPackagePublish3_0 then v88.isPackageAsset else nil, 
        hasSubsequent = v88.hasSubsequent
    };
end;
local function v93(v91) --[[ Line: 582 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v30 (copy), v32 (copy)
    return {
        clearChange = function(v92) --[[ Line: 584 ]] --[[ Name: clearChange ]]
            -- upvalues: v91 (copy), v30 (ref)
            v91(v30(v92));
        end, 
        goToNextScreen = function() --[[ Line: 587 ]] --[[ Name: goToNextScreen ]]
            -- upvalues: v91 (copy), v32 (ref)
            v91(v32());
        end
    };
end;
v37 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v37);
return v8.connect(v90, v93)(v37);