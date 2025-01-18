local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigUtil);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Util_0.AssetConfigConstants);
local v5 = require(l_Util_0.Analytics.Analytics);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local v7 = require(l_Util_0.SerializeInstances);
local v8 = require(l_Util_0.getUserId);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v10 = require(l_Actions_0.NetworkError);
local v11 = require(l_Actions_0.SetCurrentScreen);
local v12 = require(l_Actions_0.UploadResult);
local v13 = require(l_Actions_0.SetAssetId);
local v14 = require(l_Actions_0.SetIsPackage);
local v15 = require(l_Parent_0.Core.Networking.Requests.TrySaveSalesThumbnailAssetMediaRequest);
local _ = require(l_Parent_0.Core.Types.PublishInfoType);
local _ = require(l_Parent_0.Core.Types.AssetUploadAPIPublishInfo);
local l_DebugAssetConfigNetworkError_0 = game:GetFastFlag("DebugAssetConfigNetworkError");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local v22 = require(l_Util_0.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
local _ = function(v23) --[[ Line: 35 ]] --[[ Name: combineMultiInstances ]]
    local _ = nil;
    if #v23 > 1 then
        local l_Folder_0 = Instance.new("Folder");
        for _, v27 in v23 do
            v27.Parent = l_Folder_0;
        end;
        return l_Folder_0;
    else
        return v23[1];
    end;
end;
return function(v29) --[[ Line: 65 ]]
    -- upvalues: v11 (copy), v4 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v2 (copy), v22 (copy), v3 (copy), v12 (copy), v10 (copy), v5 (copy), l_UnifyModelPackagePublish3_0 (copy), l_sendResultToKibana_0 (copy), v13 (copy), v14 (copy), l_DebugAssetConfigNetworkError_0 (copy), v15 (copy), v7 (copy), v8 (copy)
    return function(v30, v31) --[[ Line: 66 ]]
        -- upvalues: v11 (ref), v4 (ref), v29 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v2 (ref), v22 (ref), v3 (ref), v12 (ref), v10 (ref), v5 (ref), l_UnifyModelPackagePublish3_0 (ref), l_sendResultToKibana_0 (ref), v13 (ref), v14 (ref), l_DebugAssetConfigNetworkError_0 (ref), v15 (ref), v7 (ref), v8 (ref)
        v30:dispatch(v11(v4.SCREENS.UPLOADING_ASSET));
        local l_Name_0 = v29.assetTypeEnum.Name;
        local v33 = nil;
        local v34 = if not not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v29.isMarketplaceModelsAsPackagesEnabled else nil;
        local v35 = nil;
        if v34 and v29.sourceInstances ~= nil then
            v35 = v2.isPackagePublishAllowed(v29.sourceInstances);
        end;
        local v36 = if v35 then v29.copyOn else v29.packageOn or false;
        local v37 = {
            Name = v29.name, 
            AssetType = l_Name_0, 
            Description = v29.description, 
            IsPackage = v36, 
            PublishToMarketplace = v29.copyOn, 
            AllowComments = v29.allowComments or false, 
            GroupId = v29.groupId, 
            OrigInstance = if v29.sourceInstances ~= nil then v29.sourceInstances[1] else nil
        };
        local v40 = v22() and function(v38) --[[ Line: 95 ]]
            -- upvalues: v3 (ref), v30 (copy), v12 (ref), v10 (ref), v5 (ref), l_Name_0 (copy)
            if v3.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v30:dispatch(v12(false));
            local l_v38_0 = v38;
            if v38 == nil or v38 == "" then
                l_v38_0 = "Upload failed with unknown error";
            end;
            v30:dispatch(v10(l_v38_0));
            v5.incrementUploadAssetFailure(l_Name_0);
        end or nil;
        local function v47(v41, v42) --[[ Line: 112 ]] --[[ Name: onPublishResult ]]
            -- upvalues: l_UnifyModelPackagePublish3_0 (ref), v29 (ref), v34 (copy), v35 (ref), l_sendResultToKibana_0 (ref), v22 (ref), v3 (ref), v30 (copy), v12 (ref), v10 (ref), v5 (ref), l_Name_0 (copy), v33 (ref), v13 (ref), v14 (ref), l_DebugAssetConfigNetworkError_0 (ref), v15 (ref), v11 (ref), v4 (ref)
            if l_UnifyModelPackagePublish3_0 and v29.packageOn or v34 and v35 and v29.copyOn then
                local v43 = {
                    url = v41.url, 
                    responseCode = v41.statusCode, 
                    responseBody = v42
                };
                l_sendResultToKibana_0(v43);
            end;
            local _ = nil;
            if if v22() then not v41 or next(v41) == nil or v42 ~= "" else not v41 or next(v41) == nil or v41.responseBody:find("Error") or v42 ~= "" then
                if v3.shouldDebugWarnings() then
                    warn("Got false response from PostInsertAsset");
                end;
                v30:dispatch(v12(false));
                local v45 = nil;
                v45 = if v41 and v41.responseBody and v41.responseBody:find("statusMessage") then v41.responseBody:find("statusMessage") else if v42 ~= "" then v42 else "Upload failed with unknown error";
                v30:dispatch(v10(v45));
                v5.incrementUploadAssetFailure(l_Name_0);
                return;
            else
                v33 = if v22() then v41.AssetId else v41.responseBody;
                v30:dispatch(v13(v33));
                if l_UnifyModelPackagePublish3_0 and v29.packageOn then
                    v30:dispatch(v14(true));
                end;
                v5.incrementUploadAssetSuccess(l_Name_0);
                local l_saleStatus_0 = v29.saleStatus;
                if l_DebugAssetConfigNetworkError_0 then
                    v29.assetId = v33;
                    v30:dispatch(v15(v29));
                    return;
                elseif l_saleStatus_0 or v29.iconFile or v29.assetMediaUpdateData then
                    v29.assetId = v33;
                    v30:dispatch(v15(v29));
                    return;
                else
                    v30:dispatch(v11(v4.SCREENS.UPLOADING_ASSET));
                    v30:dispatch(v12(true));
                    return;
                end;
            end;
        end;
        if v22() then
            local function v49(v48) --[[ Line: 187 ]]
                -- upvalues: v3 (ref), v30 (copy), v11 (ref), v4 (ref), v10 (ref), v12 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Lua toolbox: SerializeInstances failed");
                end;
                v30:dispatch(v11(v4.SCREENS.UPLOAD_ASSET_RESULT));
                v30:dispatch(v10((tostring(v48))));
                v30:dispatch(v12(false));
            end;
            v7(v29.instances, v31.StudioAssetService):andThen(function(v50) --[[ Line: 197 ]]
                -- upvalues: v8 (ref), v29 (ref), l_Name_0 (copy), v47 (copy), v22 (ref), v40 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 198 ]]
                    -- upvalues: v8 (ref), v29 (ref), l_Name_0 (ref), v50 (copy)
                    local v51 = v8();
                    local l_User_0 = Enum.AssetCreatorType.User;
                    local v53 = if v29 then v29.groupId else nil;
                    local v54 = if v29 then v29.description else nil;
                    local v55 = if v29 then v29.name else nil;
                    if v53 ~= nil and v53 > 0 then
                        v51 = v53;
                        l_User_0 = Enum.AssetCreatorType.Group;
                    end;
                    if v54 == nil or v54 == "" then
                        v54 = v55;
                    end;
                    local l_PublishService_0 = game:GetService("PublishService");
                    if v29.assetTypeEnum == Enum.AssetType.Model then
                        local v57 = {
                            AdditionalParameters = {
                                PublishAsPackage = false
                            }, 
                            AssetType = l_Name_0, 
                            AssetName = v55, 
                            AssetId = 0, 
                            ContentType = "model/x-rbxm", 
                            CreatorId = v51, 
                            CreatorType = l_User_0, 
                            Description = v54, 
                            Token = ""
                        };
                        return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsyncWithAddParam(v50, v57);
                    else
                        return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(v50, l_User_0, v51, l_Name_0, 0, v55, v54, "", "model/x-rbxm", 0);
                    end;
                end);
                if l_status_0 then
                    v47(l_result_0, "");
                    return;
                elseif v22() then
                    v40(l_result_0);
                    return;
                else
                    v47(l_result_0, "Publish failed during convert to package");
                    return;
                end;
            end, v49);
        else
            local l_instances_0 = v29.instances;
            local v61 = nil;
            if #l_instances_0 > 1 then
                local l_Folder_1 = Instance.new("Folder");
                for _, v64 in l_instances_0 do
                    v64.Parent = l_Folder_1;
                end;
                v61 = l_Folder_1;
            else
                v61 = l_instances_0[1];
            end;
            local l_v61_0 = v61;
            v31.StudioAssetService.OnPublishPackageResult:Once(v47);
            v31.StudioAssetService:PublishPackage(l_v61_0, v37);
        end;
    end;
end;