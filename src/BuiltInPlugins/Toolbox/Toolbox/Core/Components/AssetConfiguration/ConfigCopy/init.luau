local _ = game:GetFastString("ToolboxAssetConfigDisabledAudioSharingLearnMoreLink");
local _ = game:GetFastString("ToolboxAssetConfigEnabledAudioSharingLearnMoreLink");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local l_Packages_0 = l_Parent_0.Packages;
local v9 = require(l_Packages_0.Cryo);
local v10 = require(l_Packages_0.Framework);
local v11 = require(l_Packages_0.Roact);
local v12 = require(l_Packages_0.RoactRodux);
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local v14 = require(l_Parent_0.Core.Types.AssetSubTypes);
local l_formatLocalDateTime_0 = v10.Util.formatLocalDateTime;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v17 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v18 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local v21 = require(l_Util_0.DebugFlags);
local v22 = require(l_Util_0.Constants);
local v23 = require(l_Util_0.AssetConfigConstants);
local v24 = require(l_Util_0.AssetConfigUtil);
local v25 = require(l_Parent_0.Core.Util.ToolboxUtilities);
local v26 = require(l_Util_0.LayoutOrderIterator);
local v27 = if v7() then require(l_Util_0.PublishUtil) else nil;
local _ = require(l_Util_0.Urls);
local v29 = require(l_Util_0.sanitizeRichText);
local v30 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v30 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v31 = require(l_Packages_0.Dash);
local l_UI_0 = v10.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local _ = l_UI_0.List;
local l_Pane_0 = l_UI_0.Pane;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_StyleModifier_0 = v10.Util.StyleModifier;
local l_GuiService_0 = game:GetService("GuiService");
local v40 = v11.PureComponent:extend("ConfigCopy");
v40.init = function(v41, v42) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_GuiService_0 (copy), v25 (copy), v7 (copy), v27 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v24 (copy), v23 (copy), v11 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v22 (copy)
    v41.warningCountdown = 0;
    v41.state = {
        copyWarning = v9.None
    };
    v41.onLearnMoreActivated = function(_, _) --[[ Line: 89 ]]
        -- upvalues: v42 (copy), v41 (copy), l_GuiService_0 (ref), v25 (ref), v7 (ref), v27 (ref), l_ToolboxVideoConfigSharing2_0 (ref)
        local l_AssetType_0 = v42.AssetType;
        if v41.props.CopyEnabled then
            l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
            return;
        elseif v7() and v27.isRestrictionAppealable(v41.props.publishingRestriction) then
            l_GuiService_0:OpenBrowserWindow(v25.getAppealsPortalUrl());
            return;
        elseif l_ToolboxVideoConfigSharing2_0 then
            if l_AssetType_0 == Enum.AssetType.Video then
                l_GuiService_0:OpenBrowserWindow(v25.getVideoPrivacyLearnMoreUrl());
                return;
            elseif v7() and l_AssetType_0 == Enum.AssetType.Audio then
                l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                return;
            elseif v7() then
                l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
                return;
            else
                l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                return;
            end;
        elseif v7() then
            if l_AssetType_0 == Enum.AssetType.Audio then
                l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                return;
            else
                l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
                return;
            end;
        else
            l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
            return;
        end;
    end;
    v41.toggleCallback = function() --[[ Line: 125 ]]
        -- upvalues: v42 (copy), v41 (copy), l_ToolboxVideoConfigSharing2_0 (ref), v24 (ref), v23 (ref)
        local l_AssetType_1 = v42.AssetType;
        local l_props_0 = v41.props;
        local l_CopyOn_0 = l_props_0.CopyOn;
        local l_Localization_0 = l_props_0.Localization;
        local l_IsAssetPublic_0 = l_props_0.IsAssetPublic;
        if (l_AssetType_1 == Enum.AssetType.Audio or l_ToolboxVideoConfigSharing2_0 and l_AssetType_1 == Enum.AssetType.Video) and not l_IsAssetPublic_0 then
            v41.warningCountdown = 5;
            v41:setState({
                copyWarning = l_Localization_0:getText("AssetConfigCopy", "MustShare")
            });
        else
            l_props_0.ToggleCallback(not l_CopyOn_0);
        end;
        if l_AssetType_1 == Enum.AssetType.Plugin then
            local l_canChangeSalesStatus_0 = l_props_0.canChangeSalesStatus;
            local l_currentAssetStatus_0 = l_props_0.currentAssetStatus;
            local l_onStatusChange_0 = l_props_0.onStatusChange;
            if l_canChangeSalesStatus_0 then
                l_onStatusChange_0(if v24.isOnSale(l_currentAssetStatus_0) then v23.ASSET_STATUS.OffSale else v23.ASSET_STATUS.OnSale);
            end;
        end;
    end;
    v41.distributionQuotaPolicy = v25.getAssetConfigDistributionQuotas();
    v41.onQuotaLinkActivated = function() --[[ Line: 163 ]]
        -- upvalues: v41 (copy), l_GuiService_0 (ref)
        local l_AssetType_2 = v41.props.AssetType;
        if not l_AssetType_2 then
            return;
        else
            local v55 = v41.distributionQuotaPolicy[l_AssetType_2.Name];
            if not v55 or not v55.link then
                return;
            else
                l_GuiService_0:OpenBrowserWindow(v55.link);
                return;
            end;
        end;
    end;
    v41.onClickVerifyLink = function() --[[ Line: 177 ]]
        -- upvalues: l_GuiService_0 (ref), v25 (ref)
        l_GuiService_0:OpenBrowserWindow(v25.getVerificationDocumentationUrl());
    end;
    v41.getListBullets = function(v56) --[[ Line: 182 ]]
        -- upvalues: v41 (copy), v11 (ref), l_Pane_0 (ref), l_TextLabel_0 (ref), v22 (ref)
        local l_publishAsset_0 = v41.props.Stylizer.publishAsset;
        local v58 = {};
        for v59, v60 in ipairs(v56) do
            v58[v60] = v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v59, 
                Spacing = 10
            }, {
                Bullet = v11.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = "\226\128\162", 
                    TextColor = l_publishAsset_0.verifyTextColor, 
                    TextSize = v22.FONT_SIZE_LARGE
                }), 
                Text = v11.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v60, 
                    TextColor = l_publishAsset_0.verifyTextColor, 
                    TextSize = v22.FONT_SIZE_LARGE
                })
            });
        end;
        return v58;
    end;
end;
v40.didMount = function(v61, _, _) --[[ Line: 215 ]] --[[ Name: didMount ]]
    -- upvalues: l_UnifyModelPackagePublish3_0 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v9 (copy)
    if l_UnifyModelPackagePublish3_0 and (v61.props.AssetType == Enum.AssetType.Audio or l_ToolboxVideoConfigSharing2_0 and v61.props.AssetType == Enum.AssetType.Video) or not l_UnifyModelPackagePublish3_0 then
        v61.connection = game:GetService("RunService").Heartbeat:connect(function(v64) --[[ Line: 226 ]]
            -- upvalues: v61 (copy), v9 (ref)
            v61:setState(function(v65) --[[ Line: 227 ]]
                -- upvalues: v9 (ref), v61 (ref), v64 (copy)
                if v65.copyWarning ~= v9.None then
                    local l_v61_0 = v61;
                    l_v61_0.warningCountdown = l_v61_0.warningCountdown - v64;
                    if v61.warningCountdown <= 0 then
                        return {
                            copyWarning = v9.None
                        };
                    end;
                end;
            end);
        end);
    end;
    v61:updateDistributionQuotas();
end;
v40.willUnmount = function(v67) --[[ Line: 244 ]] --[[ Name: willUnmount ]]
    if v67.connection then
        v67.connection:disconnect();
    end;
end;
v40.didUpdate = function(v68, v69, v70) --[[ Line: 250 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ToolboxVideoConfigSharing2_0 (copy), v9 (copy), l_UnifyModelPackagePublish3_0 (copy)
    local l_props_1 = v68.props;
    local l_AssetType_3 = l_props_1.AssetType;
    local l_Localization_1 = l_props_1.Localization;
    local v74 = l_Localization_1:getText("AssetConfigCopy", "MustShare");
    local v75 = l_Localization_1:getText("AssetConfigCopy", "PackageCantShareOnCreatorStore");
    if l_AssetType_3 == Enum.AssetType.Audio or l_ToolboxVideoConfigSharing2_0 and l_AssetType_3 == Enum.AssetType.Video then
        v68:setState(function(v76) --[[ Line: 259 ]]
            -- upvalues: l_props_1 (copy), v69 (copy), l_ToolboxVideoConfigSharing2_0 (ref), v74 (copy), v68 (copy), v70 (copy), v9 (ref)
            local v77 = not l_props_1.IsAssetPublic and v69.IsAssetPublic;
            if (l_props_1.IsAudio or l_ToolboxVideoConfigSharing2_0 and l_props_1.IsVideo) and v76.copyWarning ~= v74 and v77 and v69.CopyOn then
                v68.warningCountdown = 5;
                return {
                    copyWarning = v74
                };
            elseif v70.copyWarning ~= v9.None and l_props_1.IsAssetPublic then
                return {
                    copyWarning = v9.None
                };
            else
                return nil;
            end;
        end);
    elseif l_props_1.AssetType == Enum.AssetType.Model and l_UnifyModelPackagePublish3_0 and not l_props_1.isPackageAsset and not l_props_1.isPackageMarketplacePublishAllowed then
        v68:setState(function(v78) --[[ Line: 285 ]]
            -- upvalues: v75 (copy), l_props_1 (copy), v69 (copy), v9 (ref)
            if v78.copyWarning ~= v75 and l_props_1.PackageOn and not v69.PackageOn then
                return {
                    copyWarning = v75
                };
            elseif v78.copyWarning ~= v9.None and not l_props_1.PackageOn and v69.PackageOn then
                return {
                    copyWarning = v9.None
                };
            else
                return nil;
            end;
        end);
    end;
    if l_AssetType_3 ~= v69.AssetType then
        v68:updateDistributionQuotas();
    end;
end;
v40.updateDistributionQuotas = function(v79) --[[ Line: 305 ]] --[[ Name: updateDistributionQuotas ]]
    -- upvalues: v11 (copy), v31 (copy), v21 (copy)
    local l_networkInterface_0 = v79.props.Network.networkInterface;
    local l_AssetType_4 = v79.props.AssetType;
    if not (l_AssetType_4 and v79.distributionQuotaPolicy[l_AssetType_4.Name]) then
        v79:setState({
            distributionQuota = v11.None
        });
        return;
    else
        l_networkInterface_0:getCreatorMarketplaceQuotas(l_AssetType_4, "RateLimitCreatorMarketplaceDistribute"):andThen(function(v82) --[[ Line: 320 ]]
            -- upvalues: v31 (ref), v79 (copy), v11 (ref)
            local l_responseBody_0 = v82.responseBody;
            local v85 = if l_responseBody_0 and l_responseBody_0.quotas and #l_responseBody_0.quotas > 0 then v31.find(l_responseBody_0.quotas, function(v84) --[[ Line: 325 ]]
                return v84.duration == "Month";
            end) else nil;
            if v85 then
                v79:setState({
                    distributionQuota = v85
                });
                return;
            else
                v79:setState({
                    distributionQuota = v11.None
                });
                return;
            end;
        end, function(v86) --[[ Line: 338 ]]
            -- upvalues: v79 (copy), v21 (ref)
            v79:setState({
                distributionQuota = {
                    capacity = 0, 
                    usage = 0
                }
            });
            if v21.shouldDebugWarnings() then
                warn("Error fetching asset quotas " .. tostring(v86));
            end;
        end);
        return;
    end;
end;
v40.getDistributionQuotaStatus = function(v87, v88) --[[ Line: 352 ]] --[[ Name: getDistributionQuotaStatus ]]
    -- upvalues: l_formatLocalDateTime_0 (copy)
    local l_props_2 = v87.props;
    local l_state_0 = v87.state;
    local v91 = true;
    local v92 = nil;
    local l_AssetType_5 = l_props_2.AssetType;
    local v94 = l_AssetType_5 and v87.distributionQuotaPolicy[l_AssetType_5.Name];
    local l_distributionQuota_0 = l_state_0.distributionQuota;
    if v94 and l_distributionQuota_0 then
        local l_usage_0 = l_distributionQuota_0.usage;
        local l_capacity_0 = l_distributionQuota_0.capacity;
        local v98 = l_distributionQuota_0.expirationTime or "";
        local v99 = v87.props.Localization:getLocale();
        if l_capacity_0 < 1 then
            v91 = false;
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeCreatorStoreQuotaUnavailable");
            v88 = false;
        elseif l_usage_0 == 0 then
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaUnused2", {
                capacity = string.format("%d", l_capacity_0), 
                days = string.format("%d", 30)
            });
        elseif l_capacity_0 <= l_usage_0 then
            v91 = false;
            local v100 = l_formatLocalDateTime_0(v98, "MMM D, h:mmA", v99);
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaExhausted1", {
                dateTime = v100
            });
        elseif l_usage_0 > 0 then
            local v101 = l_formatLocalDateTime_0(v98, "MMM D", v99);
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaRemaining2", {
                remaining = string.format("%d", l_capacity_0 - l_usage_0), 
                date = v101
            });
        end;
    end;
    return v91, v92, v88;
end;
v40.render = function(v102) --[[ Line: 397 ]] --[[ Name: render ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v30 (ref), v29 (copy), v7 (copy), v27 (copy), v9 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v26 (copy), v11 (copy), v23 (copy), v22 (copy), l_Pane_0 (copy), l_ToggleButton_0 (copy), l_LinkText_0 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), v25 (copy)
    local l_Stylizer_0 = v102.props.Stylizer;
    local l_props_3 = v102.props;
    local l_state_1 = v102.state;
    local l_Title_0 = l_props_3.Title;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_AssetType_6 = l_props_3.AssetType;
    local l_CopyOn_1 = l_props_3.CopyOn;
    local l_CopyEnabled_0 = l_props_3.CopyEnabled;
    local l_IsAssetPublic_1 = l_props_3.IsAssetPublic;
    local l_isVerified_0 = l_props_3.isVerified;
    local l_verificationSupportedTypes_0 = l_props_3.verificationSupportedTypes;
    local l_copyWarning_0 = l_state_1.copyWarning;
    local l_publishAsset_1 = l_Stylizer_0.publishAsset;
    local v116 = not l_isVerified_0 and #l_verificationSupportedTypes_0 > 0;
    local v117 = nil;
    if l_AssetType_6 and l_CopyEnabled_0 then
        local v118 = nil;
        local v119, v120, v121 = v102:getDistributionQuotaStatus(v116);
        v118 = v119;
        v117 = v120;
        v116 = v121;
        if not v118 then
            l_CopyEnabled_0 = l_CopyOn_1;
        end;
    end;
    local v122 = if (l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v30(l_props_3.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled")) and l_AssetType_6 == Enum.AssetType.Model then l_props_3.Localization:getText("AssetConfigCopy", "DistributeToCreatorStoreAsPackageWarning") else nil;
    local v123 = v117 and v117 ~= "";
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    if not l_isVerified_0 then
        v123 = false;
    end;
    v124 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyYourAccount");
    local v127 = nil;
    if v117 then
        v127 = "<font color=\"#" .. v29(l_publishAsset_1.quotaTextColor:ToHex()) .. "\">" .. v29(v117) .. "</font>";
        v126 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyCurrentLimit", {
            quotaText = v127 or ""
        });
    end;
    local v128 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyReason1");
    local v129 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyReason2CreatorStore");
    v125 = v102.getListBullets({
        v128, 
        v129
    });
    local l_Localization_2 = l_props_3.Localization;
    local v131 = l_Localization_2:getText("AssetConfigCopy", "DistributeAgreement");
    local v132 = l_Localization_2:getText("General", "LearnMore");
    local v133 = if v7() then v27.getDisplayTextForRestriction(l_props_3.publishingRestriction, l_Localization_2) else nil;
    if v7() and v133 ~= nil then
        v131 = v133 or "";
        if v27.isRestrictionAppealable(v102.props.publishingRestriction) then
            v132 = l_Localization_2:getText("AssetConfigCopy", "SubmitAppeal");
        end;
    end;
    local v134 = l_copyWarning_0 ~= v9.None;
    if l_AssetType_6 == Enum.AssetType.Audio or l_ToolboxVideoConfigSharing2_0 and l_AssetType_6 == Enum.AssetType.Video then
        l_Localization_2 = l_props_3.Localization;
        if l_IsAssetPublic_1 then
            v131 = l_Localization_2:getText("AssetConfigCopy", "DistributeAgreement");
        else
            v131 = l_Localization_2:getText("AssetConfigCopy", "TemporarilyDisabledMessageOnCreatorStore");
            v116 = false;
        end;
    end;
    local v135 = v26.new();
    return v11.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 54), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v11.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v23.TITLE_GUTTER_WIDTH, 0, 40), 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v22.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_1.titleTextColor, 
            TextWrapped = true, 
            Font = v22.FONT, 
            LayoutOrder = 1
        }), 
        RightFrame = v11.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -v23.TITLE_GUTTER_WIDTH, 0, 0), 
            LayoutOrder = 2
        }, {
            UIPadding = v11.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25), 
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 0), 
                PaddingTop = UDim.new(0, 0)
            }), 
            UIListLayout = v11.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 0)
            }), 
            ToggleButtonContainer = v11.createElement(l_Pane_0, {
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v135:getNextOrder(), 
                Padding = {
                    Bottom = 10
                }, 
                Size = UDim2.new(1, 0, 0, 34), 
                Spacing = 10, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                ToggleButton = v11.createElement(l_ToggleButton_0, {
                    Disabled = not l_CopyEnabled_0, 
                    LayoutOrder = 1, 
                    OnClick = v102.toggleCallback, 
                    Selected = l_CopyOn_1, 
                    Size = UDim2.new(0, 40, 0, 24)
                }), 
                ErrorText = if v134 then v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_copyWarning_0, 
                    TextWrapped = true, 
                    TextColor3 = l_Stylizer_0.assetConfig.errorColor, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextSize = v22.FONT_SIZE_LARGE
                }) else nil
            }), 
            VerifyNotice = if v116 then v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v135:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                VerifyNoticeHeader = v11.createElement(l_LinkText_0, {
                    Text = v124, 
                    OnClick = v102.onClickVerifyLink, 
                    LayoutOrder = v135:getNextOrder()
                }), 
                VerifyReasonList = v11.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v135:getNextOrder(), 
                    Padding = {
                        Left = 10
                    }
                }, v125), 
                CurrentLimitText = if v117 then v11.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v135:getNextOrder(), 
                    Padding = {
                        Left = 15
                    }
                }, {
                    Text = v11.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        RichText = true, 
                        Text = v126, 
                        TextColor = l_publishAsset_1.verifyTextColor, 
                        TextSize = v22.FONT_SIZE_LARGE
                    })
                }) else nil
            }) else nil, 
            DistributeToMarketplace = if v122 then v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v135:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                DistributeToMarketplaceMessage = v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Text = v122, 
                    TextWrapped = true, 
                    TextSize = v22.FONT_SIZE_LARGE, 
                    TextColor3 = l_publishAsset_1.distributionQuotaTextColor, 
                    LayoutOrder = 1
                })
            }) else nil, 
            QuotaInfo = if v117 then v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v135:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                QuotaMessage = if v123 then v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Text = v117, 
                    TextWrapped = true, 
                    TextSize = v22.FONT_SIZE_LARGE, 
                    TextColor3 = l_publishAsset_1.distributionQuotaTextColor, 
                    LayoutOrder = 1
                }) else nil
            }) else nil, 
            TipsLabel = v11.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v131, 
                StyleModifier = l_StyleModifier_0.Disabled, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v22.FONT_SIZE_LARGE, 
                LayoutOrder = v135:getNextOrder()
            }), 
            LinkButton = if not v25.hideAssetConfigDistributeLearnMoreLink() then v11.createElement(l_LinkText_0, {
                LayoutOrder = v135:getNextOrder(), 
                OnClick = v102.onLearnMoreActivated, 
                Text = v132
            }) else nil
        })
    });
end;
v40 = l_withContext_0({
    IXP = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v17 else nil, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v18
})(v40);
return v12.connect(function(v136, _) --[[ Line: 708 ]]
    -- upvalues: l_UnifyModelPackagePublish3_0 (copy), v14 (copy)
    local v138 = (v136 or {}).publishingRequirements or {};
    local v139 = v138.verification or {};
    local v140 = v138.publishing or {};
    local v141 = if l_UnifyModelPackagePublish3_0 then v140.allowedSubTypes or {} else {};
    local v142 = v14.contains(v141, v14.Package);
    return {
        isVerified = if v139 then v139.isVerified else false, 
        verificationSupportedTypes = if v139 then v139.supportedTypes or {} else {}, 
        isPackageMarketplacePublishAllowed = v142
    };
end, nil)(v40);