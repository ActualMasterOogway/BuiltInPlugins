local _ = game:GetService("StarterPack");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_ToolboxEditDialogUseMPRS2_0 = game:GetFastFlag("ToolboxEditDialogUseMPRS2");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxFixMarketplacePublish_0 = game:GetFastFlag("ToolboxFixMarketplacePublish");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local l_ToolboxUGCAccessoryUploadRequest2_0 = game:GetFastFlag("ToolboxUGCAccessoryUploadRequest2");
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableGroupStateChangeCheck);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_ToolboxSendPackageVersionNoteTelemetry_0 = game:GetFastFlag("ToolboxSendPackageVersionNoteTelemetry");
local v16 = game:DefineFastFlag("ToolboxValidateAnimationId", false);
local l_StudioService_0 = game:GetService("StudioService");
local v18 = require(l_Parent_0.Core.Util.getUserId);
local l_Packages_0 = l_Parent_0.Packages;
local v20 = require(l_Packages_0.Roact);
local v21 = require(l_Packages_0.RoactRodux);
local v22 = require(l_Packages_0.Cryo);
local v23 = require(l_Util_0.Analytics.Analytics);
local l_Components_0 = l_Parent_0.Core.Components;
local l_AssetConfiguration_0 = l_Components_0.AssetConfiguration;
local v26 = require(l_AssetConfiguration_0.PreviewArea);
local v27 = require(l_AssetConfiguration_0.PublishAsset);
local v28 = require(l_AssetConfiguration_0.AssetConfigFooter);
local v29 = require(l_AssetConfiguration_0.Versions);
local v30 = require(l_AssetConfiguration_0.SalesPage);
local v31 = require(l_AssetConfiguration_0.Permissions.Permissions);
local v32 = require(l_AssetConfiguration_0.WarningDialog);
local v33 = require(l_AssetConfiguration_0.StyledConfirmDialog);
local v34 = require(l_AssetConfiguration_0.OverrideAsset);
local v35 = require(l_Components_0.MessageBox.MessageBox);
local v36 = require(l_Util_0.AssetPermissionUtil);
local v37 = require(l_Util_0.Images);
local v38 = require(l_Util_0.AssetConfigConstants);
local v39 = require(l_Util_0.Constants);
local v40 = require(l_Util_0.ScreenSetup);
local v41 = require(l_Util_0.AssetConfigUtil);
local v42 = require(l_Util_0.fixUpPreValidation);
local v43 = require(l_Util_0.PublishUtil);
local v44 = require(l_Util_0.TagsUtil);
local _ = require(l_Util_0.getAllowedAssetTypeEnums);
local v46 = require(l_Util_0.FiatUtil);
local v47 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v47 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v48 = require(l_Packages_0.Framework);
local l_deepCopy_0 = v48.Util.deepCopy;
local l_deepEqual_0 = v48.Util.deepEqual;
local l_slice_0 = v48.Dash.slice;
local v52 = require(l_Parent_0.Core.Networking.Requests.MakeChangeRequest);
local l_Types_0 = l_Parent_0.Core.Types;
local _ = require(l_Types_0.AssetMediaTypes);
local v55 = require(l_Types_0.AssetSubTypes);
local v56 = require(l_Types_0.ConfigTypes);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v58 = require(l_Requests_0.GetUploadPermissionStatusRequest);
local v59 = require(l_Requests_0.UploadCatalogItemRequest);
local v60 = require(l_Requests_0.ConfigureCatalogItemRequest);
local v61 = require(l_Requests_0.GetAssetDetailsRequest);
local v62 = require(l_Requests_0.GetAssetItemTagsRequest);
local v63 = require(l_Requests_0.PostRevertVersionRequest);
local v64 = require(l_Requests_0.PostVersionDescriptionRequest);
local v65 = require(l_Requests_0.PatchAssetRequest);
local v66 = require(l_Requests_0.PostUploadAssetRequest);
local v67 = require(l_Requests_0.PostOverrideAssetRequest);
local v68 = require(l_Requests_0.PostUploadAnimationRequest);
local v69 = require(l_Requests_0.PostOverrideAnimationRequest);
local v70 = require(l_Requests_0.GetIsVerifiedCreatorRequest);
local v71 = require(l_Requests_0.PostPackageMetadataRequest);
local v72 = require(l_Requests_0.GetPackageCollaboratorsRequest);
local v73 = require(l_Requests_0.PutPackagePermissionsRequest);
local v74 = require(l_Requests_0.PostAssetCheckPermissions);
local v75 = require(l_Requests_0.GetMarketplaceInfoRequest);
local v76 = require(l_Requests_0.AvatarAssetsGetUploadFeeRequest);
local v77 = require(l_Requests_0.UGCBundleTypeGetUploadFeeRequest);
local v78 = require(l_Requests_0.AvatarAssetsUploadRequest);
local v79 = require(l_Requests_0.UGCBundleUploadRequest);
local v80 = require(l_Requests_0.PatchMakeAssetPublicRequest);
local v81 = require(l_Requests_0.GetAssetPermissionsRequest);
local v82 = require(l_Requests_0.GetPublishingRequirementsRequest);
local v83 = require(l_Requests_0.GetAssetMediaMetadataArrayRequest);
local v84 = require(l_Requests_0.UGCAccessoryUploadRequest);
local v85 = require(l_Requests_0.GetVersionsHistoryRequest);
local v86 = require(l_Requests_0.GetFiatProductRequest);
local v87 = require(l_Requests_0.GetSellerStatusRequest);
local v88 = require(l_Requests_0.GetDefaultBundleDataSharingRequest);
local v89 = require(l_Parent_0.Core.Actions.ClearChange);
local v90 = require(l_Parent_0.Core.Actions.SetAssetConfigTab);
local v91 = require(l_Parent_0.Core.Actions.UpdateAssetConfigStore);
local v92 = require(l_Parent_0.Core.Actions.SetDescendantPermissions);
local v93 = require(l_Parent_0.Core.Actions.UploadResult);
local v94 = require(l_Parent_0.Core.Actions.ValidateAnimationResult);
local v95 = require(l_Parent_0.Core.Thunks.GetGroupMetadata);
local v96 = require(l_Parent_0.Core.Thunks.GetGroupRoleInfo);
local v97 = require(l_Parent_0.Core.Thunks.GetUsername);
local v98 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v99 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v100 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v100.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v100.UI.LoadingIndicator;
local l_Container_0 = v100.UI.Container;
local v105 = v20.PureComponent:extend("AssetConfig");
local v106 = utf8.char(57346);
local v107 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local v108 = require(l_Parent_0.Core.Flags.getFFlagFixCreatorGroupIdNotChanging);
local v109 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimImportConfirmation);
v105.init = function(v110, v111) --[[ Line: 152 ]] --[[ Name: init ]]
    -- upvalues: l_UnifyModelPackagePublish3_0 (copy), v107 (copy), v39 (copy), v41 (copy), v38 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v36 (copy), v108 (copy), v22 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v47 (ref), v16 (copy), l_StudioService_0 (copy), v56 (copy), v18 (copy), l_ToolboxUGCAccessoryUploadRequest2_0 (copy), v109 (copy), l_ToolboxSendPackageVersionNoteTelemetry_0 (copy), v23 (copy), v44 (copy), v9 (copy), v58 (copy), v12 (copy), l_ToolboxFixMarketplacePublish_0 (copy), l_deepCopy_0 (copy), l_deepEqual_0 (copy), v55 (copy), v37 (copy)
    v110.state = {
        assetId = nil, 
        name = nil, 
        description = nil, 
        tags = nil, 
        owner = nil, 
        genres = {
            "All"
        }, 
        categoryType = nil, 
        canUploadWithUgcRestrictions = nil, 
        canUploadWithUgcRestrictionsDenyReason = nil, 
        allowCopy = true, 
        copyOn = false, 
        copyChanged = false, 
        allowComment = true, 
        commentOn = nil, 
        allowPackage = l_UnifyModelPackagePublish3_0, 
        packageOn = nil, 
        canBePackage = nil, 
        packageWarningText = nil, 
        isPackageAsset = nil, 
        price = nil, 
        status = nil, 
        isAssetPublic = false, 
        assetMediaUpdateData = nil, 
        isShowChangeDiscardMessageBox = false, 
        isPublishAssetsDialogEnabled = false, 
        isAssetTypeSelectionAllowed = false, 
        isShowRobuxSpendMessageBox = false, 
        descendantIds = {}, 
        overrideAssetId = nil, 
        groupId = nil, 
        iconFile = nil, 
        dispatchGetFunction = false, 
        isConfirmationDialogEnabled = false, 
        confirmationDialogKey = false, 
        versionsCurrentItem = if v107() then {} else nil, 
        versionsRootItems = if v107() then {} else nil, 
        versionsOpenInputKey = v107() and -1 or nil, 
        versionsPreviousInput = v107() and "" or nil, 
        versionsPageIndex = v107() and 1 or nil, 
        versionsPageRootItems = if v107() then v110:versionsGetPageRootItems(1, v39.VERSIONS_ROWS_PER_PAGE) else nil, 
        versionDescriptionErrors = if v107() then {} else nil, 
        dataSharingEnabled = false, 
        dataSharingToggled = false
    };
    v110.state.isAssetTypeSelectionAllowed = v41.hasAllowedAssetTypesForRelease(v110.props.allowedAssetTypesForRelease) and not v41.isBuyableMarketplaceAsset(v110.props.assetTypeEnum);
    if v41.isMarketplaceAsset(v111.assetTypeEnum) then
        v110.state.status = v38.ASSET_STATUS.OffSale;
    end;
    if v41.isCatalogAsset(v111.assetTypeEnum) then
        v110.state.price = v41.getMinPrice(v111.allowedAssetTypesForRelease, v111.assetTypeEnum);
    end;
    v110.nameString = nil;
    v110.descriptionString = nil;
    v110.init = false;
    v110.onDialogAccepted = function() --[[ Line: 231 ]]
        -- upvalues: v110 (copy)
        local l_state_0 = v110.state;
        v110:setState(function() --[[ Line: 233 ]]
            -- upvalues: v110 (ref), l_state_0 (copy)
            v110.tryPublish(l_state_0.confirmationDialogKey);
            return {
                confirmationDialogKey = "", 
                isConfirmationDialogEnabled = false
            };
        end);
    end;
    v110.onDialogCanceled = function() --[[ Line: 242 ]]
        -- upvalues: v110 (copy)
        v110:setState(function() --[[ Line: 243 ]]
            return {
                confirmationDialogKey = "", 
                isConfirmationDialogEnabled = false
            };
        end);
    end;
    v110.onAssetPublishDialogAccepted = function() --[[ Line: 251 ]]
        -- upvalues: v110 (copy)
        v110:setState(function() --[[ Line: 252 ]]
            return {
                isPublishAssetsDialogEnabled = false
            };
        end);
        v110.tryMakeAssetsPublic();
    end;
    v110.onAssetPublishDialogCanceled = function() --[[ Line: 260 ]]
        -- upvalues: v110 (copy)
        v110:setState(function() --[[ Line: 261 ]]
            return {
                isPublishAssetsDialogEnabled = false
            };
        end);
    end;
    v110.onAssetPublishPayAndConfirmAccepted = function() --[[ Line: 268 ]]
        -- upvalues: v110 (copy)
        v110:setState(function() --[[ Line: 269 ]]
            return {
                isShowRobuxSpendMessageBox = false
            };
        end);
        v110.tryPublish(nil);
    end;
    v110.onAssetPublishPayAndConfirmCanceled = function() --[[ Line: 275 ]]
        -- upvalues: v110 (copy)
        v110:setState(function() --[[ Line: 276 ]]
            return {
                isShowRobuxSpendMessageBox = false
            };
        end);
    end;
    v110.tryMakeAssetsPublic = function() --[[ Line: 281 ]]
        -- upvalues: v110 (copy)
        local l_props_0 = v110.props;
        local l_state_1 = v110.state;
        for _, v116 in pairs(l_state_1.descendantIds) do
            l_props_0.dispatchPatchMakeAssetPublicRequest(l_props_0.Network.networkInterface, v116);
        end;
        v110.tryPublish(nil);
    end;
    v110.tryPublishWithConfirmDialog = function(v117) --[[ Line: 291 ]]
        -- upvalues: v110 (copy), v41 (ref), l_ToolboxVideoConfigSharing2_0 (ref), v38 (ref), v36 (ref)
        v110:setState(function(v118) --[[ Line: 292 ]]
            -- upvalues: v110 (ref), v41 (ref), l_ToolboxVideoConfigSharing2_0 (ref), v38 (ref), v117 (copy), v36 (ref)
            local l_props_1 = v110.props;
            local v120 = l_props_1.assetTypeEnum == Enum.AssetType.Audio;
            local v121 = l_props_1.assetTypeEnum == Enum.AssetType.Video;
            local v122 = l_props_1.assetTypeEnum == Enum.AssetType.Model;
            local v123 = v41.isCatalogAsset(l_props_1.assetTypeEnum);
            local v124 = v41.isUGCBundleType(l_props_1.assetTypeEnum);
            local v125 = l_props_1.uploadFee or 0;
            if (v120 or l_ToolboxVideoConfigSharing2_0 and v121) and v118.isAssetPublicOriginalValue ~= true and v118.isAssetPublic == v38.SHARING_KEYS.Public then
                return {
                    confirmationDialogKey = v117 or "", 
                    isConfirmationDialogEnabled = true
                };
            elseif v122 and v118.isAssetPublic == v38.SHARING_KEYS.Public and v38.FLOW_TYPE.UPLOAD_FLOW == l_props_1.screenFlowType then
                local v126 = false;
                for _, v128 in pairs(l_props_1.descendantPermissions) do
                    if not v36.isAssetPublic(v128) then
                        v126 = true;
                        break;
                    end;
                end;
                if v126 then
                    v110:setState(function() --[[ Line: 323 ]]
                        return {
                            isPublishAssetsDialogEnabled = true
                        };
                    end);
                    return;
                else
                    v110.tryPublish(nil);
                    return;
                end;
            elseif (v123 or v124) and v125 ~= nil and v125 > 0 then
                v110:setState(function() --[[ Line: 333 ]]
                    return {
                        isShowRobuxSpendMessageBox = true
                    };
                end);
                return;
            else
                v110.tryPublish(v117);
                return;
            end;
        end);
    end;
    v110.tryPublish = function(v129) --[[ Line: 343 ]]
        -- upvalues: v110 (copy), v108 (ref), v22 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v47 (ref), v38 (ref), v16 (ref), l_StudioService_0 (ref), v41 (ref), v56 (ref), v18 (ref), l_ToolboxUGCAccessoryUploadRequest2_0 (ref), v39 (ref), l_UnifyModelPackagePublish3_0 (ref), v107 (ref), v111 (copy)
        local function v160() --[[ Line: 344 ]] --[[ Name: tryPublishGeneral ]]
            -- upvalues: v110 (ref), v108 (ref), v22 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v47 (ref), v38 (ref), v16 (ref), l_StudioService_0 (ref), v129 (copy), v41 (ref), v56 (ref), v18 (ref), l_ToolboxUGCAccessoryUploadRequest2_0 (ref), v39 (ref), l_UnifyModelPackagePublish3_0 (ref)
            local function _(v130, v131) --[[ Line: 345 ]] --[[ Name: getExtension ]]
                local v132 = v130 and v131 and v130[v131.Name];
                local v133 = v132 and v132.allowedFileExtensions;
                local v134 = v133 and #v133 > 0 and v133[1];
                return v134 and string.gsub(v134, "^%.", "") or "rbxm";
            end;
            local l_props_2 = v110.props;
            local l_state_2 = v110.state;
            local l_groupId_0 = l_state_2.groupId;
            if v108 then
                l_groupId_0 = if l_state_2.groupId and l_state_2.groupId ~= v22.None then l_state_2.groupId else nil;
            end;
            local v139 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v47(l_props_2.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
            if v38.FLOW_TYPE.DOWNLOAD_FLOW == l_props_2.screenFlowType then
                if v16 then
                    if pcall(function() --[[ Line: 376 ]]
                        -- upvalues: l_StudioService_0 (ref), v129 (ref), l_state_2 (copy)
                        l_StudioService_0:AnimationIdSelected(v129 ~= "" and v129 or l_state_2.overrideAssetId);
                    end) then
                        l_props_2.onClose();
                        return;
                    else
                        l_props_2.dispatchValidateAnimationResult(false);
                        return;
                    end;
                else
                    l_StudioService_0:AnimationIdSelected(v129 ~= "" and v129 or l_state_2.overrideAssetId);
                    l_props_2.onClose();
                    return;
                end;
            else
                if v38.FLOW_TYPE.EDIT_FLOW == l_props_2.screenFlowType then
                    if v41.isCatalogAsset(l_props_2.assetTypeEnum) then
                        if l_props_2.assetConfigData and l_props_2.assetConfigData.Status then
                            l_props_2.configureCatalogItem(l_props_2.Network.networkInterface, l_props_2.assetId, l_state_2.name, l_state_2.description or "", l_props_2.assetConfigData.Status, l_state_2.status, l_props_2.assetConfigData.Price, l_state_2.price, l_props_2.assetConfigData.ItemTags or {}, l_state_2.tags);
                            return;
                        else
                            warn("Could not configure sales, missing Asset Status!");
                            return;
                        end;
                    elseif v41.isMarketplaceAsset(l_props_2.assetTypeEnum) then
                        local l_copyOn_0 = l_state_2.copyOn;
                        if not l_state_2.copyChanged then
                            l_copyOn_0 = nil;
                        end;
                        l_props_2.configureMarketplaceItem({
                            networkInterface = l_props_2.Network.networkInterface, 
                            assetId = l_state_2.assetId, 
                            assetMediaUpdateData = l_state_2.assetMediaUpdateData, 
                            assetTypeEnum = l_props_2.assetTypeEnum, 
                            name = l_state_2.name, 
                            description = l_state_2.description or "", 
                            genres = l_state_2.genres, 
                            commentOn = l_state_2.commentOn, 
                            copyOn = l_copyOn_0, 
                            saleStatus = l_state_2.status, 
                            fromPrice = l_props_2.assetConfigData.Price, 
                            price = l_state_2.price, 
                            iconFile = l_state_2.iconFile, 
                            isAssetPublic = l_state_2.isAssetPublic, 
                            isConvertMarketplaceModelsToPackageEnabled = v139, 
                            basePrice = if l_props_2.fiatProduct then l_props_2.fiatProduct.basePrice else nil
                        });
                        return;
                    end;
                elseif v38.FLOW_TYPE.UPLOAD_FLOW == l_props_2.screenFlowType then
                    if l_props_2.assetTypeEnum == Enum.AssetType.Animation then
                        if v56:isOverride(l_props_2.currentTab) then
                            l_props_2.overrideAnimationAsset(l_props_2.Network.networkInterface, l_state_2.overrideAssetId, l_props_2.instances);
                            return;
                        else
                            l_props_2.uploadAnimationAsset({
                                networkInterface = l_props_2.Network.networkInterface, 
                                assetId = 0, 
                                name = l_state_2.name, 
                                description = l_state_2.description or "", 
                                userId = v18(), 
                                groupId = l_groupId_0, 
                                instance = l_props_2.instances
                            });
                            return;
                        end;
                    elseif v41.isCatalogAsset(l_props_2.assetTypeEnum) then
                        if l_props_2.isUploadFeeEnabled then
                            local l_uploadCatalogItemWithFee_0 = l_props_2.uploadCatalogItemWithFee;
                            local l_networkInterface_0 = l_props_2.Network.networkInterface;
                            local l_name_0 = v110.state.name;
                            local l_allowedAssetTypesForUpload_0 = l_props_2.allowedAssetTypesForUpload;
                            local l_assetTypeEnum_0 = l_props_2.assetTypeEnum;
                            local v146 = l_allowedAssetTypesForUpload_0 and l_assetTypeEnum_0 and l_allowedAssetTypesForUpload_0[l_assetTypeEnum_0.Name];
                            local v147 = v146 and v146.allowedFileExtensions;
                            local v148 = v147 and #v147 > 0 and v147[1];
                            l_uploadCatalogItemWithFee_0(l_networkInterface_0, l_name_0, v148 and string.gsub(v148, "^%.", "") or "rbxm", v110.state.description or "", l_props_2.assetTypeEnum, l_props_2.instances, v110.state.tags, l_groupId_0, if l_ToolboxUGCAccessoryUploadRequest2_0 then l_props_2.uploadFee else nil);
                            return;
                        else
                            local l_uploadCatalogItem_0 = l_props_2.uploadCatalogItem;
                            local l_networkInterface_1 = l_props_2.Network.networkInterface;
                            local l_name_1 = v110.state.name;
                            local l_allowedAssetTypesForUpload_1 = l_props_2.allowedAssetTypesForUpload;
                            local l_assetTypeEnum_1 = l_props_2.assetTypeEnum;
                            local v154 = l_allowedAssetTypesForUpload_1 and l_assetTypeEnum_1 and l_allowedAssetTypesForUpload_1[l_assetTypeEnum_1.Name];
                            local v155 = v154 and v154.allowedFileExtensions;
                            local v156 = v155 and #v155 > 0 and v155[1];
                            l_uploadCatalogItem_0(l_networkInterface_1, l_name_1, v156 and string.gsub(v156, "^%.", "") or "rbxm", v110.state.description or "", l_props_2.assetTypeEnum, l_props_2.instances, v110.state.tags);
                            return;
                        end;
                    elseif v41.isUGCBundleType(l_props_2.assetTypeEnum) then
                        local v157 = nil;
                        if l_state_2.dataSharingEnabled then
                            v157 = if l_state_2.dataSharingToggled then {
                                v39.DataSharingLicenseTypes.RobloxGlobal
                            } else {};
                        end;
                        l_props_2.uploadUGCBundleWithFee(l_props_2.Network.networkInterface, l_props_2.instances[1], l_props_2.assetTypeEnum, l_state_2.name, l_state_2.description or "", l_props_2.allowedBundleTypeSettings, l_props_2.Localization, l_props_2.uploadFee, v157);
                        return;
                    elseif v41.isMarketplaceAsset(l_props_2.assetTypeEnum) and v56:isOverride(l_props_2.currentTab) then
                        l_props_2.overrideAsset(l_props_2.Network.networkInterface, l_state_2.overrideAssetId, l_props_2.assetTypeEnum.Name, l_props_2.instances);
                        return;
                    else
                        local v158 = (l_state_2.genres or {})[1];
                        local v159 = Enum.Genre[v158].Value + 1;
                        l_props_2.uploadMarketplaceItem({
                            networkInterface = l_props_2.Network.networkInterface, 
                            assetId = 0, 
                            assetTypeEnum = l_props_2.assetTypeEnum, 
                            name = l_state_2.name, 
                            description = l_state_2.description or "", 
                            genreTypeId = v159, 
                            copyOn = l_state_2.copyOn, 
                            commentOn = l_state_2.commentOn, 
                            packageOn = if l_UnifyModelPackagePublish3_0 then not l_state_2.isPackageAsset and l_state_2.packageOn else false, 
                            groupId = l_groupId_0, 
                            instances = l_props_2.instances, 
                            isMarketplaceModelsAsPackagesEnabled = v139 and true or nil, 
                            sourceInstances = if not not l_UnifyModelPackagePublish3_0 or v139 then l_props_2.sourceInstances else nil, 
                            saleStatus = l_state_2.status, 
                            price = l_state_2.price, 
                            iconFile = l_state_2.iconFile, 
                            assetMediaUpdateData = l_state_2.assetMediaUpdateData, 
                            basePrice = if l_props_2.fiatProduct then l_props_2.fiatProduct.basePrice else nil
                        });
                    end;
                end;
                return;
            end;
        end;
        local function v168(v161) --[[ Line: 548 ]] --[[ Name: tryPublishVersions ]]
            -- upvalues: v110 (ref), v107 (ref), v111 (ref)
            local l_Id_0 = v110.props.assetConfigData.Id;
            local v163 = nil;
            v163 = if v107() then v161.VersionItemSelect and v161.VersionItemSelect[1] else v161.VersionItemSelect;
            local v164 = if v161.VersionDescriptionSave then v161.VersionDescriptionSave else {};
            local l_networkInterface_2 = v110.props.Network.networkInterface;
            if l_Id_0 and v163 then
                v110.props.postRevertVersion(l_networkInterface_2, l_Id_0, v163);
                if v107() then
                    v164[v161.VersionItemSelect[2] + 1] = v111.Localization:getText("AssetConfig", "RestoredFromVersion", {
                        versionNumber = tostring(v163)
                    });
                end;
            end;
            if v107() then
                for v166, v167 in pairs(v164) do
                    if v167 then
                        v110.props.postVersionDescription(l_networkInterface_2, l_Id_0, v166, v167);
                    end;
                end;
            end;
        end;
        local function _(v169) --[[ Line: 582 ]] --[[ Name: tryPublishPermissions ]]
            -- upvalues: v110 (ref), v107 (ref)
            local l_Id_1 = v110.props.assetConfigData.Id;
            local v171 = nil;
            v171 = if v107() then v169.VersionItemSelect and v169.VersionItemSelect[1] else v169.VersionItemSelect;
            if l_Id_1 then
                v110.props.dispatchPutPackagePermissionsRequest(v110.props.Network.networkInterface, l_Id_1, v171);
            end;
        end;
        local l_changeTable_0 = v110.props.changeTable;
        local v174 = l_changeTable_0 and next(l_changeTable_0) ~= nil;
        v110.props.resetUploadResult();
        v160();
        if v174 then
            v168(l_changeTable_0);
            if v110.props.isPackageAsset then
                local l_Id_2 = v110.props.assetConfigData.Id;
                local v176 = nil;
                v176 = if v107() then l_changeTable_0.VersionItemSelect and l_changeTable_0.VersionItemSelect[1] else l_changeTable_0.VersionItemSelect;
                if l_Id_2 then
                    v110.props.dispatchPutPackagePermissionsRequest(v110.props.Network.networkInterface, l_Id_2, v176);
                end;
            end;
        end;
    end;
    v110.tryCancel = function(v177) --[[ Line: 624 ]]
        -- upvalues: v110 (copy), v111 (copy), v38 (ref), v109 (ref)
        local v178 = v110.props.changeTable or {};
        local v179 = next(v178) ~= nil;
        local v180 = false;
        if v111.assetTypeEnum == Enum.AssetType.Animation then
            v180 = v110.props.screenFlowType == v38.FLOW_TYPE.DOWNLOAD_FLOW;
        end;
        if if v109() then v179 and not v180 else v179 then
            local function v181() --[[ Line: 637 ]] --[[ Name: showDiscardMessageBox ]]
                -- upvalues: v110 (ref)
                v110:setState({
                    isShowChangeDiscardMessageBox = true
                });
            end;
            if v177 then
                v110:setState({
                    isShowChangeDiscardMessageBox = true
                });
                return;
            else
                spawn(v181);
                return;
            end;
        else
            v110.props.onClose();
            game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(false);
            return;
        end;
    end;
    v110.tryCancelNoYield = function() --[[ Line: 657 ]]
        -- upvalues: v110 (copy)
        v110.tryCancel(false);
    end;
    v110.tryCancelWithYield = function() --[[ Line: 661 ]]
        -- upvalues: v110 (copy)
        v110.tryCancel(true);
    end;
    v110.onMessageBoxClosed = function() --[[ Line: 665 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            isShowChangeDiscardMessageBox = false
        });
    end;
    v110.tryCloseAssetConfig = function(_, v183) --[[ Line: 671 ]]
        -- upvalues: l_ToolboxSendPackageVersionNoteTelemetry_0 (ref), v110 (copy), v23 (ref)
        if v183 == "yes" then
            if l_ToolboxSendPackageVersionNoteTelemetry_0 and v110.props.changeTable and v110.props.changeTable.VersionDescriptionSave then
                v23.onPackageNoteCanceled(v110.props.assetId);
            end;
            v110.props.Focus:get().Enabled = false;
            game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(true);
            return;
        else
            v110:setState({
                isShowChangeDiscardMessageBox = false
            });
            return;
        end;
    end;
    local function _(v184, v185) --[[ Line: 697 ]] --[[ Name: getCurrent ]]
        -- upvalues: v110 (copy)
        return v110.props.assetConfigData and v110.props.assetConfigData[v184] or v185;
    end;
    v110.onNameChange = function(v187) --[[ Line: 701 ]]
        -- upvalues: v110 (copy)
        v110.props.makeChangeRequest("AssetConfigName", v110.props.assetConfigData and v110.props.assetConfigData.Name or "", v187);
        v110:setState({
            name = v187
        });
    end;
    v110.onDescChange = function(v188) --[[ Line: 709 ]]
        -- upvalues: v110 (copy)
        v110.props.makeChangeRequest("AssetConfigDesc", v110.props.assetConfigData and v110.props.assetConfigData.Description or "", v188);
        v110:setState({
            description = v188
        });
    end;
    v110.onTagsChange = function(v189) --[[ Line: 716 ]]
        -- upvalues: v110 (copy), v44 (ref)
        local l_makeChangeRequest_0 = v110.props.makeChangeRequest;
        local v191 = "AssetItemTags";
        local v192 = {};
        l_makeChangeRequest_0(v191, v110.props.assetConfigData and v110.props.assetConfigData.ItemTags or v192, v189, v44.areSetsDifferent);
        v110:setState({
            tags = v189
        });
    end;
    v110.onStatusChange = function(v193) --[[ Line: 723 ]]
        -- upvalues: v110 (copy)
        v110.props.makeChangeRequest("AssetConfigStatus", v110.props.assetConfigData and v110.props.assetConfigData.Status or nil, v193);
        v110:setState({
            status = v193
        });
    end;
    v110.onPriceChange = function(v194) --[[ Line: 730 ]]
        -- upvalues: v110 (copy)
        v110.props.makeChangeRequest("AssetConfigPrice", v110.props.assetConfigData and v110.props.assetConfigData.Price or nil, v194);
        v110:setState({
            price = v194
        });
    end;
    if v9() then
        v110.onCategoryChange = function(v195) --[[ Line: 738 ]]
            -- upvalues: v110 (copy)
            v110.props.makeChangeRequest("AssetConfigCategoryType", v195);
            v110:setState({
                categoryType = v195
            });
        end;
        v110.getUploadPermissionStatus = function() --[[ Line: 745 ]]
            -- upvalues: v41 (ref), v110 (copy), v58 (ref)
            local v196 = v41.isUGCBundleType(v110.props.assetTypeEnum) and 1 or 0;
            v58(v110.props.Network.networkInterface, v110.state.groupId, v196):andThen(function(v197) --[[ Line: 748 ]]
                -- upvalues: v110 (ref)
                v110:setState(function() --[[ Line: 749 ]]
                    -- upvalues: v197 (copy)
                    return {
                        canUploadWithUgcRestrictions = v197.type == "allowed", 
                        canUploadWithUgcRestrictionsDenyReason = if v197.type == "error" then v197.message else tostring(v197.denyReason)
                    };
                end);
            end);
        end;
    end;
    v110.onAccessChange = function(v198, v199) --[[ Line: 762 ]]
        -- upvalues: v110 (copy), v108 (ref), v22 (ref), v9 (ref), v12 (ref)
        local v200 = v110.props.assetConfigData.Creator or {};
        v110.props.makeChangeRequest("AssetConfigOwner", v200.type or 1, v198);
        local v201 = if v108 then v22.None else nil;
        local v202 = false;
        if v199.creatorType == "Group" then
            v201 = v199.creatorId;
            v202 = true;
        end;
        if v9() then
            v110.getUploadPermissionStatus();
        end;
        v110:setState({
            owner = v22.Dictionary.join(v110.state.owner or {}, {
                typeId = v198
            }), 
            groupId = v201, 
            isGroup = if v12() then v202 else nil
        });
    end;
    v110.onGenreChange = function(v203, v204) --[[ Line: 786 ]]
        -- upvalues: v110 (copy), v41 (ref), v22 (ref)
        local v205 = v110.props.assetConfigData.Genres or {};
        v110.props.makeChangeRequest("AssetConfigGenre", v205[1] or "All", v204.name);
        local v206 = v41.getGenreName(v203);
        v110:setState({
            genres = v22.Dictionary.join(v110.state.genres or {}, {
                [1] = v206
            })
        });
    end;
    v110.onDataConsentToggleClick = function() --[[ Line: 798 ]]
        -- upvalues: v110 (copy)
        v110:setState(function(v207) --[[ Line: 799 ]]
            return {
                dataSharingToggled = not v207.dataSharingToggled
            };
        end);
    end;
    v110.toggleCopy = function(v208, v209) --[[ Line: 806 ]]
        -- upvalues: v110 (copy), l_ToolboxFixMarketplacePublish_0 (ref), v38 (ref), v41 (ref), l_UnifyModelPackagePublish3_0 (ref)
        if v209 == nil then
            v209 = true;
        end;
        local l_status_0 = v110.state.status;
        if l_ToolboxFixMarketplacePublish_0 then
            l_status_0 = if not v208 then v38.ASSET_STATUS.OffSale else if v41.isBuyableMarketplaceAsset(v110.props.assetTypeEnum) then v38.ASSET_STATUS.OnSale else v38.ASSET_STATUS.Free;
        end;
        v110:setState({
            copyChanged = v209, 
            copyOn = v208, 
            allowPackage = if not l_UnifyModelPackagePublish3_0 or v110.props.isPackageMarketplacePublishAllowed then v110.state.allowPackage else not v208, 
            status = l_status_0
        });
        local v211 = v110.props.assetConfigData.IsCopyingAllowed or false;
        if v110.props.fiatProduct then
            v211 = v110.props.fiatProduct.purchasable;
        end;
        v110.props.makeChangeRequest("AssetConfigCopy", v211, v208);
    end;
    v110.toggleComment = function(v212) --[[ Line: 843 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            commentOn = v212
        });
        v110.props.makeChangeRequest("AssetConfigComment", v110.props.assetConfigData.EnableComments or false, v212);
    end;
    v110.togglePackage = l_UnifyModelPackagePublish3_0 and function(v213) --[[ Line: 856 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            packageOn = v213
        });
    end or nil;
    v110.toggleDeleteLocal = function(v214) --[[ Line: 863 ]]
        -- upvalues: v110 (copy)
        v110.props.updateStore({
            deleteLocal = v214
        });
    end;
    v110.versionsOnDescClicked = v107() and function(v215, v216, v217) --[[ Line: 868 ]]
        -- upvalues: v110 (copy), l_ToolboxSendPackageVersionNoteTelemetry_0 (ref), v23 (ref)
        local l_versionsOpenInputKey_0 = v110.state.versionsOpenInputKey;
        local v219 = nil;
        if v215 ~= nil and l_versionsOpenInputKey_0 ~= v215 or l_versionsOpenInputKey_0 == nil then
            v219 = v215;
        end;
        if l_ToolboxSendPackageVersionNoteTelemetry_0 and v217 and v110.state.versionsRootItems and v110.state.versionsRootItems[l_versionsOpenInputKey_0] and v110.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn and v216 ~= v110.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn.versionDescription then
            v23.onPackageNoteDiscarded(v110.props.assetId, l_versionsOpenInputKey_0, v216);
        end;
        if not v217 and v110.state.versionsRootItems[l_versionsOpenInputKey_0] and v216 ~= v110.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn.versionDescription then
            v110.versionsSaveInput(v216, l_versionsOpenInputKey_0, v219);
            return;
        else
            if v219 then
                v110:setState({
                    versionsOpenInputKey = v219
                });
            end;
            return;
        end;
    end or nil;
    v110.versionsSaveInput = v107() and function(v220, v221, v222, v223, v224) --[[ Line: 900 ]]
        -- upvalues: v110 (copy), l_deepCopy_0 (ref), l_deepEqual_0 (ref)
        local l_versionsRootItems_0 = v110.state.versionsRootItems;
        if l_versionsRootItems_0[v221] then
            local v226 = if v110.props.changeTable.VersionDescriptionSave then v110.props.changeTable.VersionDescriptionSave else {};
            local v227 = l_deepCopy_0(v226);
            v227[v221] = v220;
            v110.props.makeChangeRequest("VersionDescriptionSave", v226, v227, l_deepEqual_0);
            l_versionsRootItems_0[v221].descriptionColumn.versionDescription = v220;
        end;
        v110.versionsSetStates(l_versionsRootItems_0, v222, v223, v224);
    end or nil;
    v110.versionsSetStates = v107() and function(v228, v229, v230, v231) --[[ Line: 917 ]]
        -- upvalues: v110 (copy), v39 (ref)
        local v232 = {
            versionsPageRootItems = v110:versionsGetPageRootItems(v230 or v110.state.versionsPageIndex, v231 or v39.VERSIONS_ROWS_PER_PAGE), 
            versionsRootItems = v228
        };
        if v229 then
            v232.versionsOpenInputKey = v229;
        end;
        if v230 then
            v232.versionsPageIndex = v230;
        end;
        v110:setState(v232);
    end or nil;
    v110.versionsCloseInput = v107() and function(v233) --[[ Line: 936 ]]
        -- upvalues: v110 (copy)
        if v110.state.versionsOpenInputKey ~= -1 then
            v110.versionsOnDescClicked(-1, v110.state.versionsPreviousInput, v233);
        end;
    end or nil;
    v110.setVersionError = v107() and function(v234, v235) --[[ Line: 944 ]]
        -- upvalues: v110 (copy)
        local l_versionDescriptionErrors_0 = v110.state.versionDescriptionErrors;
        l_versionDescriptionErrors_0[v234] = v235;
        v110:setState({
            versionDescriptionErrors = l_versionDescriptionErrors_0
        });
    end or nil;
    v110.versionsSetPreviousInput = v107() and function(v237) --[[ Line: 954 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            versionsPreviousInput = v237
        });
    end or nil;
    v110.versionsOnPageChange = v107() and function(v238, v239) --[[ Line: 962 ]]
        -- upvalues: v110 (copy)
        v110.versionsSaveInput(v110.state.versionsPreviousInput, v110.state.versionsOpenInputKey, -1, v238, v239);
    end or nil;
    v110.onTabSelect = function(_, v241) --[[ Line: 973 ]]
        -- upvalues: v107 (ref), v110 (copy), v111 (copy)
        if v107() and v110.state.versionsOpenInputKey ~= 1 then
            v110.versionsOnDescClicked(-1, v110.state.versionsPreviousInput, false);
        end;
        v111.setTab(v241);
    end;
    v110.onOverrideAssetSelected = function(v242) --[[ Line: 982 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            overrideAssetId = v242
        });
    end;
    v110.chooseThumbnail = function() --[[ Line: 988 ]]
        -- upvalues: v41 (ref), v110 (copy)
        local v243 = nil;
        local l_status_1, _ = pcall(function() --[[ Line: 990 ]]
            -- upvalues: v243 (ref), v41 (ref)
            v243 = v41.promptImagePicker();
        end);
        if l_status_1 and v243 then
            v110:setState({
                iconFile = v243
            });
            v110.props.makeChangeRequest("AssetConfigIconSelect", "", v243.Name);
            v110.props.updateStore({
                iconFile = v243
            });
        end;
    end;
    v110.onSharingChanged = function(v246) --[[ Line: 1005 ]]
        -- upvalues: v110 (copy)
        v110:setState({
            isAssetPublic = v246
        });
        v110.props.makeChangeRequest("SharingEnabled", v110.props.assetConfigData.SharingEnabled or false, v246);
        if not v246 then
            local l_state_3 = v110.state;
            local v248 = l_state_3.copyOnOriginalValue ~= l_state_3.copyOn;
            v110.toggleCopy(false, v248);
        end;
    end;
    v110.getPublishingRequirementsAndAssetMediaMetadataArray = function() --[[ Line: 1022 ]]
        -- upvalues: v110 (copy)
        v110.getPublishingRequirements():andThen(function(v249) --[[ Line: 1023 ]]
            -- upvalues: v110 (ref)
            local l_props_3 = v110.props;
            local v251 = v249 and v249.verification and v249.verification.isVerified;
            local v252 = l_props_3.assetTypeEnum == Enum.AssetType.Plugin;
            if v251 and v252 then
                l_props_3.dispatchGetAssetMediaMetadataArray(l_props_3.Network.networkInterface, l_props_3.assetId);
            end;
        end);
    end;
    v110.getPublishingRequirements = function() --[[ Line: 1038 ]]
        -- upvalues: v110 (copy), v55 (ref)
        local l_props_4 = v110.props;
        local l_networkInterface_3 = l_props_4.Network.networkInterface;
        local l_assetId_0 = l_props_4.assetId;
        local l_assetTypeEnum_2 = l_props_4.assetTypeEnum;
        local l_isPackageAsset_0 = l_props_4.isPackageAsset;
        local v258 = nil;
        if l_isPackageAsset_0 then
            v258 = {
                v55.Package
            };
        end;
        return l_props_4.dispatchGetPublishingRequirements(l_networkInterface_3, l_assetId_0, l_assetTypeEnum_2, v258);
    end;
    v110.onAdditionalImagesChanged = function(v259) --[[ Line: 1053 ]]
        -- upvalues: v110 (copy)
        v110.props.makeChangeRequest("assetMediaUpdateData", nil, v259);
        v110:setState({
            assetMediaUpdateData = v259
        });
    end;
    v110.isValidCatalogAsset = function() --[[ Line: 1062 ]]
        -- upvalues: v41 (ref), v110 (copy)
        return (not not v41.isCatalogAsset(v110.props.assetTypeEnum) or v41.isUGCBundleType(v110.props.assetTypeEnum)) and v110.props.assetTypeValidationSucceeded;
    end;
    if v107() then
        v110.validVersionDescriptions = function() --[[ Line: 1070 ]]
            -- upvalues: v110 (copy)
            for _, v261 in pairs(v110.state.versionDescriptionErrors) do
                if v261 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v110.getMessageBoxProps = function(v262) --[[ Line: 1082 ]]
        -- upvalues: v110 (copy), v39 (ref), v37 (ref)
        local l_props_5 = v110.props;
        local v264 = {
            TextSize = v39.FONT_SIZE_MEDIUM, 
            Font = v39.FONT, 
            Icon = v37.INFO_ICON, 
            onButtonClicked = v110.tryCloseAssetConfig, 
            onClose = v110.onMessageBoxClosed
        };
        if v262 then
            v264.Title = l_props_5.Localization:getText("AssetConfig", "Error");
            v264.Text = l_props_5.Localization:getText("AssetConfig", "GetAssetFailed");
            v264.buttons = {
                {
                    Text = l_props_5.Localization:getText("Common", "Close"), 
                    Font = v39.FONT, 
                    TextSize = v39.FONT_SIZE_MEDIUM, 
                    action = "yes"
                }
            };
            return v264;
        else
            v264.Title = l_props_5.Localization:getText("General", "Discard");
            v264.Text = l_props_5.Localization:getText("General", "DiscardMessage");
            v264.buttons = {
                {
                    Text = l_props_5.Localization:getText("General", "SearchOptionsCancel"), 
                    Font = v39.FONT, 
                    TextSize = v39.FONT_SIZE_MEDIUM, 
                    action = "no"
                }, 
                {
                    Text = l_props_5.Localization:getText("General", "Discard"), 
                    Font = v39.FONT, 
                    TextSize = v39.FONT_SIZE_MEDIUM, 
                    action = "yes"
                }
            };
            return v264;
        end;
    end;
end;
v105.attachXButtonCallback = function(v265) --[[ Line: 1128 ]] --[[ Name: attachXButtonCallback ]]
    if v265.props.pluginGui then
        v265.props.pluginGui:BindToClose(v265.tryCancelNoYield);
    end;
end;
v105.detachXButtonCallback = function(v266) --[[ Line: 1134 ]] --[[ Name: detachXButtonCallback ]]
    if v266.props.pluginGui then
        v266.props.pluginGui:BindToClose(nil);
    end;
end;
v105.isLoading = function(v267) --[[ Line: 1140 ]] --[[ Name: isLoading ]]
    -- upvalues: v38 (copy)
    local v268 = false;
    if v267.props.screenFlowType == v38.FLOW_TYPE.EDIT_FLOW then
        v268 = not v267.state.assetId;
    end;
    return v268;
end;
local function v271(v269) --[[ Line: 1144 ]] --[[ Name: extractFirstVersionItem ]]
    -- upvalues: v22 (copy)
    local v270 = v269[1] or {};
    return v22.Dictionary.join({}, v270);
end;
v105.didUpdate = function(v272, v273, v274) --[[ Line: 1150 ]] --[[ Name: didUpdate ]]
    -- upvalues: v38 (copy), v56 (copy), v36 (copy), v41 (copy), l_ToolboxEditDialogUseMPRS2_0 (copy), v13 (copy), v43 (copy), v44 (copy), l_UnifyModelPackagePublish3_0 (copy), v107 (copy), v271 (copy), v39 (copy)
    if v273.isPackageAsset ~= nil and v273.isPackageAsset ~= v272.props.isPackageAsset then
        v272.getPublishingRequirements();
    end;
    if v272.props.screenFlowType == v38.FLOW_TYPE.EDIT_FLOW then
        local l_assetConfigData_0 = v272.props.assetConfigData;
        if not next(l_assetConfigData_0) then
            return;
        else
            if not v272.state.dispatchGetFunction then
                local v276 = l_assetConfigData_0.Creator or {};
                local v277 = not v272.state.groupMetadata or next(v272.state.groupMetadata) == nil;
                if v276.typeId == v56.OWNER_TYPES.User and not v276.username then
                    v272.props.dispatchGetUsername(v276.targetId);
                    v272:setState({
                        dispatchGetFunction = true
                    });
                elseif v276.typeId == v56.OWNER_TYPES.Group and v277 then
                    v272.props.dispatchGetGroupMetadata(v276.targetId);
                    v272.props.dispatchGetGroupRoleInfo(v272.props.Network.networkInterface, v276.targetId);
                    v272:setState({
                        dispatchGetFunction = true
                    });
                end;
            end;
            if not v272.init then
                local v278 = nil;
                if l_assetConfigData_0.AssetPermissions then
                    v278 = v36.isAssetPublic(l_assetConfigData_0.AssetPermissions);
                end;
                local l_Status_0 = l_assetConfigData_0.Status;
                local v280 = l_assetConfigData_0.IsCopyingAllowed or v41.isOnSale(l_Status_0);
                if v272.props.fiatProduct then
                    v280 = v272.props.fiatProduct.purchasable;
                end;
                local v281 = nil;
                if l_ToolboxEditDialogUseMPRS2_0 then
                    v281 = v272.props.isPublishingAllowed;
                    if v272.props.isPackageAsset then
                        v281 = v272.props.isPackageMarketplacePublishAllowed or false;
                    end;
                end;
                local v282 = if v13() then v43.getRestrictionThatAppliesToAsset(v272.props.publishingRestrictions) else nil;
                v272:setState({
                    assetId = v41.isMarketplaceAsset(v272.props.assetTypeEnum) and l_assetConfigData_0.Id or l_assetConfigData_0.AssetId, 
                    name = l_assetConfigData_0.Name, 
                    description = l_assetConfigData_0.Description, 
                    owner = l_assetConfigData_0.Creator, 
                    genres = l_assetConfigData_0.Genres, 
                    allowCopy = if l_ToolboxEditDialogUseMPRS2_0 then v280 or v281 else l_assetConfigData_0.IsPublicDomainEnabled, 
                    copyOn = v280, 
                    copyOnOriginalValue = v280, 
                    commentOn = l_assetConfigData_0.EnableComments, 
                    price = l_assetConfigData_0.Price or v41.getMinPrice(v272.props.allowedAssetTypesForRelease, v272.props.assetTypeEnum), 
                    status = l_Status_0, 
                    isAssetPublic = v278, 
                    isAssetPublicOriginalValue = v278, 
                    publishingRestriction = v282
                });
                v272.init = true;
            end;
            if l_assetConfigData_0.ItemTags and v272.state.tags == nil then
                v272:setState({
                    tags = v44.getTagsFromItemTags(l_assetConfigData_0.ItemTags)
                });
            end;
        end;
    else
        if l_UnifyModelPackagePublish3_0 and v272.props.isPublishingAllowed ~= nil and v272.state.allowCopy ~= v272.props.isPublishingAllowed then
            v272:setState(function(_) --[[ Line: 1243 ]]
                -- upvalues: v272 (copy), v273 (copy)
                if v272.props.isPublishingAllowed ~= v273.isPublishingAllowed then
                    return {
                        allowCopy = v272.props.isPublishingAllowed
                    };
                else
                    return nil;
                end;
            end);
        elseif v272.props.isVerifiedCreator ~= nil and v272.state.allowCopy ~= v272.props.isVerifiedCreator then
            v272:setState({
                allowCopy = v272.props.isVerifiedCreator
            });
        end;
        if v272.props.screenFlowType == v38.FLOW_TYPE.UPLOAD_FLOW and v273.assetTypeEnum ~= v272.props.assetTypeEnum then
            v272:getAssetInformation();
        end;
    end;
    if v107() then
        local l_versionsCurrentItem_0 = v274.versionsCurrentItem;
        local l_versionHistory_0 = v272.props.versionHistory;
        if not next(l_versionsCurrentItem_0) and l_versionHistory_0 then
            local v286 = {};
            for _, v288 in ipairs(l_versionHistory_0) do
                v286[v288.assetVersionNumber] = {
                    versionColumn = v288.assetVersionNumber, 
                    descriptionColumn = {
                        versionDescription = v288.versionDescription, 
                        created = v288.created, 
                        assetVersionNumber = v288.assetVersionNumber, 
                        creatorId = v288.creatorTargetId, 
                        creatorType = v288.creatorType
                    }, 
                    restoreColumn = v288.assetVersionNumber
                };
            end;
            v272:setState({
                versionsCurrentItem = v271(l_versionHistory_0), 
                versionsRootItems = v286, 
                versionsPageRootItems = v272:versionsGetPageRootItems(1, v39.VERSIONS_ROWS_PER_PAGE)
            });
        end;
    end;
end;
if v107() then
    v105.versionsGetPageRootItems = function(v289, v290, v291) --[[ Line: 1295 ]] --[[ Name: versionsGetPageRootItems ]]
        -- upvalues: l_slice_0 (copy)
        local v292 = nil;
        local v293 = nil;
        local v294 = {};
        if v289.state.versionsRootItems then
            v292 = (v290 - 1) * v291 + 1;
            v293 = v292 + v291 - 1;
            for v295 = #v289.state.versionsRootItems, 1, -1 do
                table.insert(v294, v289.state.versionsRootItems[v295]);
            end;
        end;
        local v296 = v289.state.versionsRootItems and l_slice_0(v294, v292, v293);
        if v289.state.versionsRootItems then
            return v296;
        else
            return {};
        end;
    end;
end;
v105.getDefaultBundleDataSharing = function(v297) --[[ Line: 1311 ]] --[[ Name: getDefaultBundleDataSharing ]]
    -- upvalues: v88 (copy)
    v88(v297.props.Network.networkInterface):andThen(function(_, v299) --[[ Line: 1312 ]]
        -- upvalues: v297 (copy)
        v297:setState(function() --[[ Line: 1313 ]]
            -- upvalues: v299 (copy)
            return {
                dataSharingEnabled = v299.isEligible, 
                dataSharingToggled = v299.isEligible and not v299.configurations[1].isOptOut
            };
        end);
    end);
end;
v105.getAssetInformation = function(v300) --[[ Line: 1322 ]] --[[ Name: getAssetInformation ]]
    -- upvalues: v38 (copy), v41 (copy), v44 (copy), l_UnifyModelPackagePublish3_0 (copy)
    local l_assetId_1 = v300.props.assetId;
    local l_instances_0 = v300.props.instances;
    local l_state_4 = v300.state;
    local l_changeTable_1 = v300.props.changeTable;
    local v305 = l_changeTable_1 and next(l_changeTable_1) ~= nil;
    if v38.FLOW_TYPE.EDIT_FLOW == v300.props.screenFlowType then
        if l_assetId_1 then
            if v41.isCatalogAsset(v300.props.assetTypeEnum) then
                v300.props.getAssetDetails(v300.props.Network.networkInterface, l_assetId_1, false);
                if v44.areTagsEnabled(v300.props.isItemTagsFeatureEnabled, v300.props.enabledAssetTypesForItemTags, v300.props.assetTypeEnum) then
                    v300.props.getAssetTags(v300.props.Network.networkInterface, l_assetId_1);
                    return;
                end;
            else
                v300.getPublishingRequirementsAndAssetMediaMetadataArray();
                v300.props.dispatchGetMarketplaceInfo(v300.props.Network.networkInterface, l_assetId_1);
                if v300.props.isPackageAsset == nil then
                    v300.props.dispatchPostPackageMetadataRequest(v300.props.Network.networkInterface, l_assetId_1);
                end;
                v300.props.dispatchGetPackageCollaboratorsRequest(v300.props.Network.networkInterface, l_assetId_1);
                if not v300.props.hasPackagePermission then
                    v300.props.dispatchPostAssetCheckPermissions(v300.props.Network.networkInterface, {
                        l_assetId_1
                    });
                    return;
                end;
            end;
        end;
    else
        if v300.props.screenFlowType == v38.FLOW_TYPE.UPLOAD_FLOW then
            if v41.isMarketplaceAsset(v300.props.assetTypeEnum) then
                v300:setState(function() --[[ Line: 1363 ]]
                    -- upvalues: v38 (ref)
                    return {
                        status = v38.ASSET_STATUS.OffSale
                    };
                end);
            else
                v300:setState(function() --[[ Line: 1367 ]]
                    return {
                        status = nil
                    };
                end);
            end;
            if v41.isCatalogAsset(v300.props.assetTypeEnum) then
                v300:setState(function() --[[ Line: 1373 ]]
                    -- upvalues: v41 (ref), v300 (copy)
                    return {
                        price = v41.getMinPrice(v300.props.allowedAssetTypesForRelease, v300.props.assetTypeEnum)
                    };
                end);
            else
                v300:setState(function() --[[ Line: 1382 ]]
                    return {
                        price = nil
                    };
                end);
            end;
        end;
        if (l_state_4.name == nil or l_state_4.name == "") and l_instances_0 and #l_instances_0 > 0 then
            if v305 then
                if l_changeTable_1.AssetConfigName then
                    v300:setState(function() --[[ Line: 1391 ]]
                        -- upvalues: l_changeTable_1 (copy)
                        return {
                            name = l_changeTable_1.AssetConfigName
                        };
                    end);
                end;
            else
                v300:setState(function() --[[ Line: 1398 ]]
                    -- upvalues: l_instances_0 (copy)
                    return {
                        name = l_instances_0[1].Name
                    };
                end);
            end;
        end;
        if (l_state_4.description == nil or l_state_4.description == "") and v305 and l_changeTable_1.AssetConfigDesc then
            v300:setState(function() --[[ Line: 1409 ]]
                -- upvalues: l_changeTable_1 (copy)
                return {
                    description = l_changeTable_1.AssetConfigDesc
                };
            end);
        end;
        v300.props.getIsVerifiedCreator(v300.props.Network.networkInterface);
        if v41.isCatalogAsset(v300.props.assetTypeEnum) then
            v300.props.getCatalogItemUploadFee(v300.props.Network.networkInterface, v300.props.assetTypeEnum, v300.props.instances);
        elseif v41.isUGCBundleType(v300.props.assetTypeEnum) then
            local v306 = v41.getUGCBodyBundleAssetQuantities(v300.props.instances[1], v300.props.allowedBundleTypeSettings, v300.props.assetTypeEnum);
            if v306 ~= nil then
                v300.props.getUGCBundleUploadFee(v300.props.Network.networkInterface, v300.props.assetTypeEnum, v306);
            end;
        elseif v300.props.assetTypeEnum ~= nil or v300.props.assetId ~= nil then
            v300.getPublishingRequirements();
        end;
        v300.props.dispatchSetDescendantPermissions({});
        v300:setState({
            descendantIds = {}
        });
        local v307 = {};
        if l_instances_0 and v300.props.assetTypeEnum == Enum.AssetType.Model then
            for _, v309 in pairs(l_instances_0) do
                local l_v309_Descendants_0 = v309:GetDescendants();
                for _, v312 in pairs(l_v309_Descendants_0) do
                    if v312:IsA("Sound") then
                        local v313 = string.gsub(v312.SoundId, "rbxassetid://", "");
                        v300.props.dispatchGetAssetPermissionsRequest(v300.props.Network.networkInterface, v313);
                        table.insert(v307, v313);
                    end;
                end;
            end;
            if l_UnifyModelPackagePublish3_0 then
                local l_Localization_0 = v300.props.Localization;
                local v315, v316 = v41.isPackagePublishAllowed(l_instances_0, l_Localization_0);
                v300:setState({
                    descendantIds = v307, 
                    canBePackage = v315, 
                    packageWarningText = v316, 
                    isPackageAsset = if #l_instances_0 == 1 then v41.isPackage(l_instances_0[1]) else nil
                });
                return;
            else
                v300:setState({
                    descendantIds = v307
                });
            end;
        end;
    end;
end;
v105.didMount = function(v317) --[[ Line: 1491 ]] --[[ Name: didMount ]]
    -- upvalues: v41 (copy), v9 (copy), v107 (copy), v14 (copy), v46 (copy)
    v317:attachXButtonCallback();
    local v318 = v41.hasAllowedAssetTypesForRelease(v317.props.allowedAssetTypesForRelease) and not v41.isBuyableMarketplaceAsset(v317.props.assetTypeEnum);
    v317:setState(function() --[[ Line: 1496 ]]
        -- upvalues: v318 (copy)
        return {
            isAssetTypeSelectionAllowed = v318
        };
    end);
    v317:getAssetInformation();
    if v9() then
        v317.getUploadPermissionStatus();
    end;
    if v107() then
        local v319 = v317.state.assetId or v317.props.assetId;
        if v319 then
            v317.props.getVersionsHistory(v317.props.Network.networkInterface, v319);
        end;
    end;
    v317:getDefaultBundleDataSharing();
    local l_assetId_2 = v317.props.assetId;
    local l_assetTypeEnum_3 = v317.props.assetTypeEnum;
    if l_assetId_2 and l_assetTypeEnum_3 and v41.isMarketplaceAsset(l_assetTypeEnum_3) and l_assetTypeEnum_3 ~= Enum.AssetType.Animation then
        v317.props.dispatchGetFiatProduct(v317.props.Network.networkInterface, l_assetId_2, l_assetTypeEnum_3);
        if v14() and if l_assetTypeEnum_3 then v46.MONETIZABLE_ASSET_TYPES[l_assetTypeEnum_3.Name] else false then
            v317.props.dispatchGetSellerStatus(v317.props.Network.networkInterface);
        end;
    end;
end;
v105.willUnmount = function(v322) --[[ Line: 1534 ]] --[[ Name: willUnmount ]]
    v322:detachXButtonCallback();
end;
local function _(v323, v324, v325, v326) --[[ Line: 1538 ]] --[[ Name: validatePrice ]]
    -- upvalues: v38 (copy)
    local v327 = true;
    local v328 = false;
    if v38.ASSET_STATUS.OnSale == v326 then
        v328 = v323 ~= nil;
    end;
    if v328 then
        v327 = false;
        v323 = tostring(v323);
        if v323 and v323:match("%d+") == v323 then
            local v329 = tonumber(v323);
            if v329 then
                local v330 = true;
                if v329 ~= 0 then
                    v330 = false;
                    if v324 <= v329 then
                        v330 = v329 <= v325;
                    end;
                end;
                v327 = v330;
            end;
        end;
    end;
    return v327;
end;
v105.render = function(v332) --[[ Line: 1557 ]] --[[ Name: render ]]
    -- upvalues: v108 (copy), v22 (copy), l_UnifyModelPackagePublish3_0 (copy), v13 (copy), v56 (copy), v38 (copy), v41 (copy), v40 (copy), v44 (copy), v43 (copy), v107 (copy), v9 (copy), v39 (copy), v106 (copy), l_ToolboxVideoConfigSharing2_0 (copy), v20 (copy), v35 (copy), v33 (copy), v32 (copy), v26 (copy), l_EnableUGCBundleUnknownMeshPartFiltering_0 (copy), l_Container_0 (copy), l_LoadingIndicator_0 (copy), v27 (copy), v29 (copy), v30 (copy), v34 (copy), v31 (copy), v28 (copy)
    local l_props_6 = v332.props;
    local l_state_5 = v332.state;
    local l_Stylizer_0 = l_props_6.Stylizer;
    local l_Size_0 = l_props_6.Size;
    local l_isAssetPublicOriginalValue_0 = l_state_5.isAssetPublicOriginalValue;
    local l_currentTab_0 = l_props_6.currentTab;
    local v339 = l_state_5.assetId or l_props_6.assetId;
    local v340 = l_state_5.name or "";
    local v341 = l_state_5.description or "";
    local v342 = l_state_5.tags or {};
    local l_owner_0 = l_state_5.owner;
    local l_groupId_1 = l_state_5.groupId;
    if v108 then
        l_groupId_1 = if l_state_5.groupId and l_state_5.groupId ~= v22.None then l_state_5.groupId else nil;
    end;
    local l_genres_0 = l_state_5.genres;
    local l_allowCopy_0 = l_state_5.allowCopy;
    local l_copyOn_1 = l_state_5.copyOn;
    local l_allowComment_0 = l_state_5.allowComment;
    local l_commentOn_0 = l_state_5.commentOn;
    local l_deleteLocal_0 = l_props_6.deleteLocal;
    local v351 = if l_UnifyModelPackagePublish3_0 then l_state_5.canBePackage and l_state_5.allowPackage else nil;
    local v352 = if l_UnifyModelPackagePublish3_0 then l_state_5.packageOn or l_state_5.isPackageAsset else nil;
    local v353 = if l_UnifyModelPackagePublish3_0 then l_state_5.packageWarningText else nil;
    local l_status_2 = l_state_5.status;
    local l_isAssetPublic_0 = l_state_5.isAssetPublic;
    local v356 = if v13() then l_state_5.publishingRestriction else nil;
    local v357 = l_props_6.networkErrorAction == v56.GET_ASSET_DETAIL_FAILURE_ACTION;
    local v358 = l_state_5.isShowChangeDiscardMessageBox or v357;
    local l_isShowRobuxSpendMessageBox_0 = l_state_5.isShowRobuxSpendMessageBox;
    local l_iconFile_0 = l_state_5.iconFile;
    local l_assetMediaUpdateData_0 = l_state_5.assetMediaUpdateData;
    local l_assetTypeEnum_4 = l_props_6.assetTypeEnum;
    local l_screenFlowType_0 = l_props_6.screenFlowType;
    local v364 = l_props_6.changeTable or {};
    local l_allowedAssetTypesForRelease_0 = l_props_6.allowedAssetTypesForRelease;
    local l_allowedAssetTypesForFree_0 = l_props_6.allowedAssetTypesForFree;
    local l_allowedBundleTypeSettings_0 = l_props_6.allowedBundleTypeSettings;
    local v368 = if l_UnifyModelPackagePublish3_0 then l_props_6.isPackageMarketplacePublishAllowed else nil;
    local v369 = l_status_2 or v38.ASSET_STATUS.Unknown;
    local v370 = nil;
    local v371 = nil;
    local v372 = nil;
    if v41.isUGCBundleType(l_assetTypeEnum_4) then
        local v373, v374, v375 = v41.getPriceInfo(l_allowedBundleTypeSettings_0, l_assetTypeEnum_4);
        v370 = v373;
        v371 = v374;
        v372 = v375;
    else
        local v376, v377, v378 = v41.getPriceInfo(l_allowedAssetTypesForRelease_0, l_assetTypeEnum_4);
        v370 = v376;
        v371 = v377;
        v372 = v378;
    end;
    local l_price_0 = l_state_5.price;
    local v380 = v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_OWNERSHIP);
    local v381 = v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_GENRE);
    local v382 = v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_COPY);
    if not l_UnifyModelPackagePublish3_0 and l_props_6.isPackageAsset then
        v382 = false;
    end;
    local v383 = v332.state.isAssetTypeSelectionAllowed and v332.props.screenFlowType == v38.FLOW_TYPE.UPLOAD_FLOW;
    local v384 = if l_UnifyModelPackagePublish3_0 then v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_PACKAGE) else nil;
    local v385 = v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_COMMENT);
    local v386 = v40.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v40.keys.SHOW_ASSET_TYPE);
    local v387 = v41.getPreviewType(l_assetTypeEnum_4, l_props_6.instances);
    local v388 = nil;
    v388 = l_assetTypeEnum_4 ~= nil and if v41.isCatalogAsset(l_assetTypeEnum_4) then v44.areTagsEnabled(l_props_6.isItemTagsFeatureEnabled, l_props_6.enabledAssetTypesForItemTags, l_assetTypeEnum_4) else false;
    local l_l_price_0_0 = l_price_0;
    local l_v370_0 = v370;
    local l_v371_0 = v371;
    local v392 = true;
    local v393 = false;
    if v38.ASSET_STATUS.OnSale == l_status_2 then
        v393 = l_l_price_0_0 ~= nil;
    end;
    if v393 then
        v392 = false;
        l_l_price_0_0 = tostring(l_l_price_0_0);
        if l_l_price_0_0 and l_l_price_0_0:match("%d+") == l_l_price_0_0 then
            local v394 = tonumber(l_l_price_0_0);
            if v394 then
                local v395 = true;
                if v394 ~= 0 then
                    v395 = false;
                    if l_v370_0 <= v394 then
                        v395 = v394 <= l_v371_0;
                    end;
                end;
                v392 = v395;
            end;
        end;
    end;
    local l_v392_0 = v392;
    l_l_price_0_0 = v56:getAssetconfigContent(l_screenFlowType_0, l_assetTypeEnum_4, v332.props.isPackageAsset, l_owner_0);
    l_v370_0 = v332:isLoading();
    l_v371_0 = v43.checkCanSave(v364, v340, v341, l_v392_0, l_currentTab_0, l_screenFlowType_0, l_assetTypeEnum_4, l_assetMediaUpdateData_0, v332.isValidCatalogAsset(), not v107() or v332.validVersionDescriptions()) and not l_v370_0;
    v392 = if v9() then l_state_5.canUploadWithUgcRestrictions else nil;
    v393 = if v9() then l_state_5.canUploadWithUgcRestrictionsDenyReason else nil;
    if v9() and l_state_5.categoryType == "AvatarItem" and v392 ~= nil then
        l_v371_0 = l_v371_0 and v392;
    end;
    local v397 = -240 - v39.SCROLLBAR_PADDING;
    local v398 = l_props_6.assetTypeEnum == Enum.AssetType.Audio;
    local v399 = l_props_6.assetTypeEnum == Enum.AssetType.Video;
    local v400 = l_props_6.assetTypeEnum == Enum.AssetType.Model;
    local v401 = l_props_6.assetTypeEnum == Enum.AssetType.Plugin;
    local v402 = if l_UnifyModelPackagePublish3_0 then l_state_5.isPackageAsset else nil;
    local v403 = nil;
    local v404 = false;
    local l_Localization_1 = l_props_6.Localization;
    local v406 = l_Localization_1:getText("General", "Proceed");
    local v407 = l_Localization_1:getText("General", "GoBack");
    local v408 = l_Localization_1:getText("AssetConfigSharing", "PublicConfirmationHeading");
    local v409 = l_Localization_1:getText("AssetConfigSharing", "PublicConfirmationMessage");
    local v410 = l_Localization_1:getText("AssetConfigSharing", "PublicConfirmationTitle");
    local l_isConfirmationDialogEnabled_0 = l_state_5.isConfirmationDialogEnabled;
    local l_confirmationDialogKey_0 = l_state_5.confirmationDialogKey;
    local v413 = l_Localization_1:getText("AssetConfig", "PublishAssetDialogPublish");
    local v414 = l_Localization_1:getText("General", "Cancel");
    local v415 = l_Localization_1:getText("AssetConfig", "PublishAssetDialogDescription");
    local v416 = l_Localization_1:getText("AssetConfig", "PublishAssetDialogHeading");
    local v417 = l_Localization_1:getText("General", "RobloxStudio");
    local v418 = l_Localization_1:getText("General", "RobloxStudio");
    local v419 = l_Localization_1:getText("AssetConfig", "PayAndConfirmHeading", {
        name = v340
    });
    local v420 = if l_props_6.uploadFee then l_props_6.uploadFee else "";
    local v421 = l_Localization_1:getText("AssetConfig", "PayAndConfirmDescription", {
        amount = v106 .. v420
    });
    local v422 = l_Localization_1:getText("General", "PayAndSubmit");
    local l_isPublishAssetsDialogEnabled_0 = l_state_5.isPublishAssetsDialogEnabled;
    if v398 or l_ToolboxVideoConfigSharing2_0 and v399 then
        v403 = not l_isAssetPublicOriginalValue_0;
    elseif v400 then
        v403 = true;
    end;
    if v398 or l_ToolboxVideoConfigSharing2_0 and v399 then
        v404 = true;
    end;
    if v398 or l_ToolboxVideoConfigSharing2_0 and v399 then
        l_allowCopy_0 = l_isAssetPublic_0;
    elseif l_UnifyModelPackagePublish3_0 and v352 and not v402 then
        l_allowCopy_0 = v368;
    end;
    return v20.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.backgroundColor, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v20.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        AssetConfigMessageBox = v358 and v20.createElement(v35, v332.getMessageBoxProps(v357)), 
        RobuxSpendConfirmationMessageBox = l_isShowRobuxSpendMessageBox_0 and v20.createElement(v33, {
            AcceptText = v422, 
            CancelText = v414, 
            Description = v421, 
            Enabled = l_isShowRobuxSpendMessageBox_0, 
            Heading = v419, 
            OnAccepted = v332.onAssetPublishPayAndConfirmAccepted, 
            OnCanceled = v332.onAssetPublishPayAndConfirmCanceled, 
            Title = v418
        }), 
        AssetConfigMakeAssetPublicMessageBox = if l_isPublishAssetsDialogEnabled_0 then v20.createElement(v32, {
            AcceptText = v413, 
            CancelText = v414, 
            ConfirmationKey = nil, 
            Description = v415, 
            Enabled = l_isPublishAssetsDialogEnabled_0, 
            Heading = v416, 
            OnAccepted = v332.onAssetPublishDialogAccepted, 
            OnCanceled = v332.onAssetPublishDialogCanceled, 
            Title = v417
        }) else nil, 
        MainPage = v20.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -62), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v20.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            SharingConfirmationDialog = v20.createElement(v32, {
                AcceptText = v406, 
                CancelText = v407, 
                ConfirmationKey = l_confirmationDialogKey_0, 
                Description = v409, 
                Enabled = l_isConfirmationDialogEnabled_0, 
                Heading = v408, 
                OnAccepted = v332.onDialogAccepted, 
                OnCanceled = v332.onDialogCanceled, 
                Title = v410
            }), 
            Preview = v20.createElement(v26, {
                TotalWidth = 240, 
                TabItems = l_l_price_0_0, 
                CurrentTab = l_currentTab_0, 
                PreviewType = v387, 
                ScreenFlowType = l_screenFlowType_0, 
                AssetStatus = l_status_2, 
                AssetId = v339, 
                IconFile = l_iconFile_0, 
                AssetTypeEnum = l_assetTypeEnum_4, 
                AllowedBundleTypeSettings = if l_EnableUGCBundleUnknownMeshPartFiltering_0 then l_allowedBundleTypeSettings_0 else nil, 
                OnTabSelect = v332.onTabSelect, 
                ChooseThumbnail = v332.chooseThumbnail, 
                LayoutOrder = 1
            }), 
            VerticalLine = v20.createElement("Frame", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Stylizer_0.divider.verticalLineColor, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            LoadingIndicatorWrapper = l_v370_0 and v20.createElement(l_Container_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, -240, 1, 0)
            }, {
                LoadingIndicator = v20.createElement(l_LoadingIndicator_0, {
                    Size = UDim2.new(0, 100, 0, 100), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }), 
            PublishAsset = not l_v370_0 and v56:isGeneral(l_currentTab_0) and v20.createElement(v27, {
                Size = UDim2.new(1, -240, 1, 0), 
                allowSelectPrivate = v403, 
                assetId = v339, 
                name = v340, 
                description = v341, 
                tags = v342, 
                owner = l_owner_0, 
                canUploadWithUgcRestrictions = if v9() then v392 else nil, 
                canUploadWithUgcRestrictionsDenyReason = if v9() then v393 else nil, 
                genres = l_genres_0, 
                allowCopy = l_allowCopy_0, 
                copyOn = l_copyOn_1, 
                allowComment = l_allowComment_0, 
                commentOn = l_commentOn_0, 
                deleteLocal = l_deleteLocal_0, 
                packageWarningText = v353, 
                allowPackage = if l_UnifyModelPackagePublish3_0 then v351 else nil, 
                packageOn = if l_UnifyModelPackagePublish3_0 then v352 else nil, 
                isPackageAsset = v402, 
                isAssetPublic = l_isAssetPublic_0, 
                publishingRestriction = if v13() then v356 else nil, 
                assetTypeEnum = l_assetTypeEnum_4, 
                onNameChange = v332.onNameChange, 
                onDescChange = v332.onDescChange, 
                onTagsChange = v332.onTagsChange, 
                onCategoryChange = if v9() then v332.onCategoryChange else nil, 
                onOwnerSelected = v332.onAccessChange, 
                onGenreSelected = v332.onGenreChange, 
                onSharingChanged = v332.onSharingChanged, 
                onAdditionalImagesChanged = v332.onAdditionalImagesChanged, 
                toggleCopy = v332.toggleCopy, 
                toggleComment = v332.toggleComment, 
                togglePackage = if l_UnifyModelPackagePublish3_0 then v332.togglePackage else nil, 
                toggleDeleteLocal = v332.toggleDeleteLocal, 
                dataSharingEnabled = l_state_5.dataSharingEnabled, 
                dataSharingToggled = l_state_5.dataSharingToggled, 
                onDataConsentToggleClick = v332.onDataConsentToggleClick, 
                displayOwnership = v380, 
                displayGenre = v381, 
                displayCopy = v382, 
                displayPackage = if l_UnifyModelPackagePublish3_0 then v384 else nil, 
                displayComment = v385, 
                displayAssetType = v386, 
                displayTags = v388, 
                displaySharing = v404, 
                displayAssetTypeSelection = v383, 
                maximumItemTagsPerItem = l_props_6.maximumItemTagsPerItem, 
                allowedAssetTypesForRelease = if v401 then l_allowedAssetTypesForRelease_0 else nil, 
                allowedAssetTypesForFree = l_allowedAssetTypesForFree_0, 
                newAssetStatus = if v401 then l_status_2 else nil, 
                currentAssetStatus = if v401 then v369 else nil, 
                onStatusChange = if v401 then v332.onStatusChange else nil, 
                onPriceChange = if v401 then v332.onPriceChange else nil, 
                price = if v401 then l_price_0 else nil, 
                minPrice = if v401 then v370 else nil, 
                maxPrice = if v401 then v371 else nil, 
                feeRate = if v401 then v372 else nil, 
                isPriceValid = if v401 then l_v392_0 else nil, 
                LayoutOrder = 3
            }), 
            Versions = if v107() then v56:isVersions(l_currentTab_0) and v20.createElement(v29, {
                Size = UDim2.new(1, -240, 1, -20), 
                assetId = v339, 
                LayoutOrder = 3, 
                currentItem = l_state_5.versionsCurrentItem, 
                rootItems = l_state_5.versionsRootItems, 
                openInputKey = l_state_5.versionsOpenInputKey, 
                previousInput = l_state_5.versionsPreviousInput, 
                pageIndex = l_state_5.versionsPageIndex, 
                pageRootItems = l_state_5.versionsPageRootItems, 
                versionHistory = l_props_6.versionHistory, 
                onDescClicked = v332.versionsOnDescClicked, 
                closeInput = v332.versionsCloseInput, 
                setVersionError = v332.setVersionError, 
                setPreviousInput = v332.versionsSetPreviousInput, 
                onPageChange = v332.versionsOnPageChange, 
                setStates = v332.versionsSetStates
            }) else v56:isVersions(l_currentTab_0) and v20.createElement(v29, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetId = v339, 
                LayoutOrder = 3
            }), 
            Sales = v56:isSales(l_currentTab_0) and v20.createElement(v30, {
                size = UDim2.new(1, -240, 1, 0), 
                assetTypeEnum = l_props_6.assetTypeEnum, 
                allowedAssetTypesForRelease = l_allowedAssetTypesForRelease_0, 
                newAssetStatus = l_status_2, 
                currentAssetStatus = v369, 
                price = l_price_0, 
                minPrice = v370, 
                maxPrice = v371, 
                feeRate = v372, 
                isPriceValid = l_v392_0, 
                onStatusChange = v332.onStatusChange, 
                onPriceChange = v332.onPriceChange, 
                layoutOrder = 3
            }), 
            OverrideAsset = v56:isOverride(l_currentTab_0) and v20.createElement(v34, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetTypeEnum = l_assetTypeEnum_4, 
                instances = l_props_6.instances, 
                onOverrideAssetSelected = v332.onOverrideAssetSelected, 
                LayoutOrder = 3
            }), 
            PackagePermissions = v56:isPermissions(l_currentTab_0) and v20.createElement(v31, {
                Size = UDim2.new(1, v397, 1, 0), 
                Owner = l_owner_0, 
                AssetId = v339, 
                LayoutOrder = 3
            })
        }), 
        Footer = v20.createElement(v28, {
            AssetId = l_state_5.overrideAssetId, 
            CanSave = l_v371_0, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 62), 
            TryCancel = v332.tryCancelWithYield, 
            TryPublish = v332.tryPublishWithConfirmDialog
        })
    });
end;
v105 = l_withContext_0({
    Focus = l_ContextServices_0.Focus, 
    IXP = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v98 else nil, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v99
})(v105);
return v21.connect(function(v424, v425) --[[ Line: 2010 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy), l_UnifyModelPackagePublish3_0 (copy), v55 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), l_ToolboxEditDialogUseMPRS2_0 (copy), l_ToolboxUGCAccessoryUploadRequest2_0 (copy), v107 (copy), v46 (copy)
    v424 = v424 or {};
    local v426 = v424.idToFiatProductMap or {};
    local v427 = v424.assetConfigData or {};
    local l_changed_0 = v424.changed;
    local v429 = v424.publishingRequirements or {};
    if not v429.verification then
        local _ = {};
    end;
    local v431 = v429.publishing or {};
    local v432 = if v13() then v431.restrictions or {} else nil;
    local v433 = if l_UnifyModelPackagePublish3_0 then v431.allowedSubTypes or {} else {};
    local v434 = v55.contains(v433, v55.Package);
    local l_isVerifiedCreator_0 = v424.isVerifiedCreator;
    local l_versionHistory_1 = v424.versionHistory;
    local v437 = v424.collaborators or {};
    return {
        assetConfigData = v427, 
        assetTypeEnum = v424.assetTypeEnum, 
        assetTypeValidationSucceeded = v424.assetTypeValidationSucceeded, 
        categoryType = v424.categoryType, 
        currentScreen = v424.currentScreen, 
        changeTable = l_changed_0, 
        screenFlowType = v424.screenFlowType, 
        instances = v424.instances, 
        sourceInstances = if not not l_UnifyModelPackagePublish3_0 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v424.sourceInstances else nil, 
        allowedAssetTypesForRelease = v424.allowedAssetTypesForRelease, 
        allowedAssetTypesForUpload = v424.allowedAssetTypesForUpload, 
        allowedAssetTypesForFree = v424.allowedAssetTypesForFree, 
        allowedBundleTypeSettings = v424.allowedBundleTypeSettings, 
        currentTab = v424.currentTab, 
        isVerifiedCreator = l_isVerifiedCreator_0, 
        isPublishingAllowed = if not not l_UnifyModelPackagePublish3_0 or l_ToolboxEditDialogUseMPRS2_0 then v431.isAllowed or false else false, 
        isPackageMarketplacePublishAllowed = v434, 
        networkError = v424.networkError, 
        networkErrorAction = v424.networkErrorAction or {}, 
        isPackageAsset = v424.isPackageAsset, 
        hasPackagePermission = v425.assetId and v424.packagePermissions[v425.assetId] ~= nil, 
        isItemTagsFeatureEnabled = v424.isItemTagsFeatureEnabled, 
        enabledAssetTypesForItemTags = v424.enabledAssetTypesForItemTags, 
        maximumItemTagsPerItem = v424.maximumItemTagsPerItem, 
        isUploadFeeEnabled = v424.isUploadFeeEnabled, 
        descendantPermissions = v424.descendantPermissions, 
        uploadFee = if l_ToolboxUGCAccessoryUploadRequest2_0 then v424.uploadFee else nil, 
        deleteLocal = v424.deleteLocal, 
        versionHistory = if v107() then l_versionHistory_1 else nil, 
        permissions = if v107() then v437 else nil, 
        publishingRestrictions = if v13() then v432 else nil, 
        fiatProduct = if v426[v425.assetId] then v426[v425.assetId] else v46.getDefaultFiatProduct()
    };
end, function(v438) --[[ Line: 2070 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v61 (copy), v75 (copy), v62 (copy), v107 (copy), v85 (copy), v52 (copy), v93 (copy), v22 (copy), v59 (copy), v60 (copy), v65 (copy), v66 (copy), v63 (copy), v64 (copy), v90 (copy), v89 (copy), v38 (copy), v67 (copy), v70 (copy), v76 (copy), v77 (copy), v42 (copy), l_ToolboxUGCAccessoryUploadRequest2_0 (copy), v84 (copy), v78 (copy), v79 (copy), v71 (copy), v91 (copy), v72 (copy), v73 (copy), v74 (copy), v95 (copy), v96 (copy), v97 (copy), v80 (copy), v81 (copy), v92 (copy), v82 (copy), v83 (copy), v86 (copy), v14 (copy), v87 (copy), v16 (copy), v94 (copy), v68 (copy), v69 (copy)
    return {
        getAssetDetails = function(v439, v440, v441) --[[ Line: 2072 ]] --[[ Name: getAssetDetails ]]
            -- upvalues: v438 (copy), v61 (ref)
            v438(v61(v439, v440, v441));
        end, 
        dispatchGetMarketplaceInfo = function(v442, v443) --[[ Line: 2076 ]] --[[ Name: dispatchGetMarketplaceInfo ]]
            -- upvalues: v438 (copy), v75 (ref)
            v438(v75(v442, v443));
        end, 
        getAssetTags = function(v444, v445) --[[ Line: 2080 ]] --[[ Name: getAssetTags ]]
            -- upvalues: v438 (copy), v62 (ref)
            v438(v62(v444, v445));
        end, 
        getVersionsHistory = function(v446, v447) --[[ Line: 2084 ]] --[[ Name: getVersionsHistory ]]
            -- upvalues: v107 (ref), v438 (copy), v85 (ref)
            if v107() then
                v438(v85(v446, v447));
            end;
        end, 
        makeChangeRequest = function(v448, v449, v450, v451) --[[ Line: 2090 ]] --[[ Name: makeChangeRequest ]]
            -- upvalues: v438 (copy), v52 (ref)
            v438(v52(v448, v449, v450, v451));
        end, 
        resetUploadResult = function() --[[ Line: 2094 ]] --[[ Name: resetUploadResult ]]
            -- upvalues: v438 (copy), v93 (ref), v22 (ref)
            v438(v93(v22.None));
        end, 
        uploadCatalogItem = function(v452, v453, v454, v455, v456, v457, v458) --[[ Line: 2098 ]] --[[ Name: uploadCatalogItem ]]
            -- upvalues: v438 (copy), v59 (ref)
            v438(v59(v452, v453, v454, v455, v456, v457, v458));
        end, 
        configureCatalogItem = function(v459, v460, v461, v462, v463, v464, v465, v466, v467, v468) --[[ Line: 2120 ]] --[[ Name: configureCatalogItem ]]
            -- upvalues: v438 (copy), v60 (ref)
            v438(v60(v459, v460, v461, v462, v463, v464, v465, v466, v467, v468));
        end, 
        configureMarketplaceItem = function(v469) --[[ Line: 2149 ]] --[[ Name: configureMarketplaceItem ]]
            -- upvalues: v438 (copy), v65 (ref)
            v438(v65(v469));
        end, 
        uploadMarketplaceItem = function(v470) --[[ Line: 2153 ]] --[[ Name: uploadMarketplaceItem ]]
            -- upvalues: v438 (copy), v66 (ref)
            v438(v66(v470));
        end, 
        postRevertVersion = function(v471, v472, v473) --[[ Line: 2157 ]] --[[ Name: postRevertVersion ]]
            -- upvalues: v438 (copy), v63 (ref)
            v438(v63(v471, v472, v473));
        end, 
        postVersionDescription = function(v474, v475, v476, v477) --[[ Line: 2161 ]] --[[ Name: postVersionDescription ]]
            -- upvalues: v438 (copy), v64 (ref)
            v438(v64(v474, v475, v476, v477));
        end, 
        setTab = function(v478) --[[ Line: 2165 ]] --[[ Name: setTab ]]
            -- upvalues: v438 (copy), v90 (ref), v89 (ref), v38 (ref)
            v438(v90(v478));
            v438(v89(v38.OVERRIDE_ASSET_ID));
        end, 
        overrideAsset = function(v479, v480, v481, v482) --[[ Line: 2170 ]] --[[ Name: overrideAsset ]]
            -- upvalues: v438 (copy), v67 (ref)
            v438(v67(v479, v480, v481, v482));
        end, 
        getIsVerifiedCreator = function(v483) --[[ Line: 2174 ]] --[[ Name: getIsVerifiedCreator ]]
            -- upvalues: v438 (copy), v70 (ref)
            v438(v70(v483));
        end, 
        getCatalogItemUploadFee = function(v484, v485, v486) --[[ Line: 2178 ]] --[[ Name: getCatalogItemUploadFee ]]
            -- upvalues: v438 (copy), v76 (ref)
            v438(v76(v484, v485, v486));
        end, 
        getUGCBundleUploadFee = function(v487, v488, v489) --[[ Line: 2182 ]] --[[ Name: getUGCBundleUploadFee ]]
            -- upvalues: v438 (copy), v77 (ref)
            v438(v77(v487, v488, v489));
        end, 
        uploadCatalogItemWithFee = function(v490, v491, v492, v493, v494, v495, v496, v497, v498) --[[ Line: 2186 ]] --[[ Name: uploadCatalogItemWithFee ]]
            -- upvalues: v42 (ref), l_ToolboxUGCAccessoryUploadRequest2_0 (ref), v438 (copy), v84 (ref), v78 (ref)
            local v499 = {};
            local v500 = v495 or {};
            for v501, v502 in v500 do
                local v503 = v502:Clone();
                v42(v503);
                v499[v501] = v503;
            end;
            if l_ToolboxUGCAccessoryUploadRequest2_0 then
                v438(v84(v490, v491, v492, v493, v494, v499, v496, v497, v498));
                return;
            else
                v438(v78(v490, v491, v492, v493, v494, v499, v496, v497));
                return;
            end;
        end, 
        uploadUGCBundleWithFee = function(v504, v505, v506, v507, v508, v509, v510, v511, v512) --[[ Line: 2234 ]] --[[ Name: uploadUGCBundleWithFee ]]
            -- upvalues: v438 (copy), v79 (ref)
            v438(v79(v504, v505, v506, v507, v508, v509, v510, v511, v512));
        end, 
        dispatchPostPackageMetadataRequest = function(v513, v514) --[[ Line: 2260 ]] --[[ Name: dispatchPostPackageMetadataRequest ]]
            -- upvalues: v438 (copy), v71 (ref)
            v438(v71(v513, v514));
        end, 
        updateStore = function(v515) --[[ Line: 2264 ]] --[[ Name: updateStore ]]
            -- upvalues: v438 (copy), v91 (ref)
            v438(v91(v515));
        end, 
        dispatchGetPackageCollaboratorsRequest = function(v516, v517) --[[ Line: 2268 ]] --[[ Name: dispatchGetPackageCollaboratorsRequest ]]
            -- upvalues: v438 (copy), v72 (ref)
            v438(v72(v516, v517));
        end, 
        dispatchPutPackagePermissionsRequest = function(v518, v519) --[[ Line: 2272 ]] --[[ Name: dispatchPutPackagePermissionsRequest ]]
            -- upvalues: v438 (copy), v73 (ref)
            v438(v73(v518, v519));
        end, 
        dispatchPostAssetCheckPermissions = function(v520, v521) --[[ Line: 2276 ]] --[[ Name: dispatchPostAssetCheckPermissions ]]
            -- upvalues: v438 (copy), v74 (ref)
            v438(v74(v520, v521));
        end, 
        dispatchGetGroupMetadata = function(v522) --[[ Line: 2280 ]] --[[ Name: dispatchGetGroupMetadata ]]
            -- upvalues: v438 (copy), v95 (ref)
            v438(v95(v522));
        end, 
        dispatchGetGroupRoleInfo = function(v523, v524) --[[ Line: 2284 ]] --[[ Name: dispatchGetGroupRoleInfo ]]
            -- upvalues: v438 (copy), v96 (ref)
            v438(v96(v523, v524));
        end, 
        dispatchGetUsername = function(v525) --[[ Line: 2288 ]] --[[ Name: dispatchGetUsername ]]
            -- upvalues: v438 (copy), v97 (ref)
            v438(v97(v525));
        end, 
        dispatchPatchMakeAssetPublicRequest = function(v526, v527) --[[ Line: 2292 ]] --[[ Name: dispatchPatchMakeAssetPublicRequest ]]
            -- upvalues: v438 (copy), v80 (ref)
            v438(v80(v526, v527));
        end, 
        dispatchGetAssetPermissionsRequest = function(v528, v529) --[[ Line: 2296 ]] --[[ Name: dispatchGetAssetPermissionsRequest ]]
            -- upvalues: v438 (copy), v81 (ref)
            v438(v81(v528, v529));
        end, 
        dispatchSetDescendantPermissions = function(v530) --[[ Line: 2300 ]] --[[ Name: dispatchSetDescendantPermissions ]]
            -- upvalues: v438 (copy), v92 (ref)
            v438(v92(v530));
        end, 
        dispatchGetPublishingRequirements = function(v531, v532, v533, v534) --[[ Line: 2304 ]] --[[ Name: dispatchGetPublishingRequirements ]]
            -- upvalues: v438 (copy), v82 (ref)
            return v438(v82(v531, v532, v533, v534));
        end, 
        dispatchGetAssetMediaMetadataArray = function(v535, v536) --[[ Line: 2308 ]] --[[ Name: dispatchGetAssetMediaMetadataArray ]]
            -- upvalues: v438 (copy), v83 (ref)
            v438(v83(v535, v536));
        end, 
        dispatchGetFiatProduct = function(v537, v538, v539) --[[ Line: 2312 ]] --[[ Name: dispatchGetFiatProduct ]]
            -- upvalues: v438 (copy), v86 (ref)
            v438(v86(v537, v538, v539));
        end, 
        dispatchGetSellerStatus = v14() and function(v540) --[[ Line: 2317 ]]
            -- upvalues: v438 (copy), v87 (ref)
            v438(v87(v540));
        end or nil, 
        dispatchValidateAnimationResult = v16 and function(v541) --[[ Line: 2323 ]]
            -- upvalues: v438 (copy), v94 (ref)
            v438(v94(v541));
        end or nil, 
        uploadAnimationAsset = function(v542) --[[ Line: 2329 ]]
            -- upvalues: v438 (copy), v68 (ref)
            v438(v68(v542));
        end, 
        overrideAnimationAsset = function(v543, v544, v545) --[[ Line: 2333 ]]
            -- upvalues: v438 (copy), v69 (ref)
            v438(v69(v543, v544, v545));
        end
    };
end)(v105);