local _ = game:GetService("LocalizationService");
local l_PublishService_0 = game:GetService("PublishService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetCurrentScreen);
local v6 = require(l_Actions_0.UploadResult);
local v7 = require(l_Actions_0.SetProgressBarInfo);
local v8 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v10 = require(l_Requests_0.UGCCreateBundleRequest);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v12 = require(l_Util_0.Analytics.Analytics);
local v13 = require(l_Util_0.AssetConfigConstants);
local v14 = require(l_Util_0.AssetConfigUtil);
local v15 = require(l_Util_0.DebugFlags);
local v16 = require(l_Util_0.getUserId);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v19 = require(l_Packages_0.UGCValidation);
local v20 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v21 = require(l_Util_0.SharedFlags.getFFlagAddPublishServiceErrorToUploadFailureMsg);
local v22 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagEnableUGCIndividualAssetUploadAnalytics);
local v23 = require(l_Util_0.SharedFlags.getFFlagEnableNewToolboxCreationContextErrors);
local v24 = require(l_Util_0.SharedFlags.getFFlagEnableBodyScaleValidationSupport);
local v25 = require(l_Util_0.SharedFlags.getFFlagEnableUGCBundleUploadBodyScale);
local v26 = require(l_Util_0.SharedFlags.getFFlagEnableBodyColorSetUploadSupport);
local v27 = require(l_Util_0.getRobuxMessageToAppend);
local function v32(v28) --[[ Line: 43 ]] --[[ Name: getRawErrorsFromResponse ]]
    if not v28 or not v28.Body or not v28.Body.errors then
        return nil;
    else
        local v29 = nil;
        for _, v31 in v28.Body.errors do
            if v29 ~= nil then
                v29 = v29 .. "\n" .. v31.code .. ": " .. v31.message;
            else
                v29 = v31.code .. ": " .. v31.message;
            end;
        end;
        return v29;
    end;
end;
local _ = function(v33) --[[ Line: 60 ]] --[[ Name: getAssetIdsTableAsString ]]
    if not v33 then
        return nil;
    else
        local _ = nil;
        if type(v33) == "table" then
            return (table.concat(v33, ", "));
        else
            return (tostring(v33));
        end;
    end;
end;
local function _(v36) --[[ Line: 76 ]] --[[ Name: assetUriToId ]]
    return (tonumber(string.match(v36, "(%d+)$")));
end;
local function _(v38, v39) --[[ Line: 80 ]] --[[ Name: tryAddToSet ]]
    if v39 ~= nil then
        v38[v39] = true;
    end;
end;
local function v54(v41) --[[ Line: 86 ]] --[[ Name: findUnderlyingMeshAssetIds ]]
    local v42 = {};
    for _, v44 in v41 do
        local l_v44_Descendants_0 = v44:GetDescendants();
        table.insert(l_v44_Descendants_0, v44);
        for _, v47 in l_v44_Descendants_0 do
            if v47:IsA("MeshPart") then
                local l_MeshId_0 = v47.MeshId;
                local v49 = tonumber(string.match(l_MeshId_0, "(%d+)$"));
                if v49 ~= nil then
                    v42[v49] = true;
                end;
            elseif v47:IsA("WrapTarget") then
                local l_CageMeshId_0 = v47.CageMeshId;
                local v51 = tonumber(string.match(l_CageMeshId_0, "(%d+)$"));
                if v51 ~= nil then
                    v42[v51] = true;
                end;
            end;
        end;
    end;
    local v52 = {};
    for v53 in v42 do
        table.insert(v52, v53);
    end;
    return v52;
end;
local function v71(v55, v56, v57, v58, v59) --[[ Line: 109 ]] --[[ Name: ProcessCreationContextErrorResponse ]]
    -- upvalues: v24 (copy), v26 (copy), v23 (copy), v27 (copy), v20 (copy), v12 (copy), v32 (copy), v15 (copy), v4 (copy), v6 (copy)
    local v60 = {
        [2] = "CreationContextInvalidAssetQuantities", 
        [3] = "CreationContextInvalidBundleType", 
        [4] = "CreationContextInvalidCreateBundleRequest", 
        [5] = "CreationContextInvalidBundleDescription", 
        [6] = "CreationContextInvalidBundleName", 
        [7] = "CreationContextInappropriateBundleDescription", 
        [8] = "CreationContextInappropriateBundleName"
    };
    if v24() then
        v60[12] = "CreationContextInvalidBodyScale";
    end;
    if v26() then
        v60[13] = "CreationContextInvalidBodyColorSet";
    end;
    local v61 = {
        [0] = "CreationContextAuthorizationDenied", 
        [10] = "CreationContextUserNotFound"
    };
    local v62 = {
        [0] = "CreationContextTokenValidationFailed", 
        [9] = "CreationContextDoesNotHavePermission"
    };
    if v23() then
        v62[106] = "CreationContextMissingIDVerification";
        v62[107] = "CreationContextAccessBlocked";
    end;
    local v63 = {
        [11] = "CreationContextDailyLimitReached"
    };
    local v64 = {
        [1] = "CreationContextServiceUnavailable"
    };
    local v65 = {
        [400] = v60, 
        [401] = v61, 
        [403] = v62, 
        [412] = v63, 
        [503] = v64
    };
    local v66 = nil;
    local v67 = v65[v57.StatusCode];
    if v67 ~= nil and v57.Body ~= nil and v57.Body.errors ~= nil then
        for _, v69 in v57.Body.errors do
            local v70 = v67[v69.code];
            if v70 ~= nil then
                if v66 == nil then
                    v66 = v56:getText("AssetConfig", v70);
                else
                    v66 = v66 .. "\n" .. v56:getText("AssetConfig", v70);
                end;
            end;
        end;
        if v66 ~= nil then
            v66 = v66 .. v27(v59, v56);
        end;
    end;
    if v20() then
        v12.UGCUploadRequestOperationIdEvent(v12.Status.Failure, v58, nil, (v32(v57)));
    end;
    if v15.shouldDebugWarnings() then
        warn("Could not create UGC Bundle context and received response:", v57);
    end;
    if v66 ~= nil then
        v55:dispatch(v4(v66));
    else
        v55:dispatch(v4(v56:getText("AssetConfig", "BundleContextCreationError") .. v27(v59, v56)));
    end;
    v55:dispatch(v6(false));
end;
return function(v72, v73, v74, v75, v76, v77, v78, v79, v80) --[[ Line: 206 ]]
    -- upvalues: v14 (copy), v25 (copy), v26 (copy), v13 (copy), v16 (copy), v15 (copy), v20 (copy), v12 (copy), v19 (copy), v7 (copy), v8 (copy), l_Promise_0 (copy), l_PublishService_0 (copy), v22 (copy), v54 (copy), v10 (copy), v4 (copy), v27 (copy), v6 (copy), v21 (copy), v32 (copy), v71 (copy), v5 (copy)
    return function(v81) --[[ Line: 217 ]]
        -- upvalues: v14 (ref), v74 (copy), v73 (copy), v25 (ref), v26 (ref), v75 (ref), v13 (ref), v76 (ref), v16 (ref), v15 (ref), v20 (ref), v12 (ref), v19 (ref), v77 (copy), v7 (ref), v78 (copy), v8 (ref), l_Promise_0 (ref), l_PublishService_0 (ref), v22 (ref), v54 (ref), v10 (ref), v72 (copy), v79 (copy), v80 (copy), v4 (ref), v27 (ref), v6 (ref), v21 (ref), v32 (ref), v71 (ref), v5 (ref)
        local v82 = v14.getAvatarAssetTypeAsString(v74);
        local v83 = v73:Clone();
        local v84 = if v25() then v14.getBodyScaleValues(v83) else nil;
        local v85 = if v26() then v14.getBodyColorSet(v83) else nil;
        v75 = if v75 then v75:sub(1, v13.NAME_CHARACTER_LIMIT) else "";
        v76 = if v76 then v76:sub(1, v13.DESCRIPTION_CHARACTER_LIMIT) else "";
        local function v115(v86) --[[ Line: 237 ]]
            -- upvalues: v16 (ref), v15 (ref), v20 (ref), v12 (ref), v82 (copy), v14 (ref), v83 (copy), v19 (ref), v77 (ref), v81 (copy), v7 (ref), v78 (ref), v8 (ref), v75 (ref), l_Promise_0 (ref), l_PublishService_0 (ref), v76 (ref), v22 (ref), v54 (ref), v10 (ref), v72 (ref), v74 (ref), v79 (ref), v80 (ref), v4 (ref), v27 (ref), v6 (ref), v21 (ref), v32 (ref)
            if v86 and v86.operationId then
                local l_operationId_0 = v86.operationId;
                local v88 = v16();
                if v15.shouldDebugWarnings() then
                    warn("operationId received for UGC bundle upload:", l_operationId_0);
                end;
                if v20() then
                    v12.UGCUploadRequestOperationIdEvent(v12.Status.Success, v82, l_operationId_0);
                end;
                v14.sanitizeForValidation(v83);
                local v89 = v19.util.createUGCBodyPartFolders(v83, v77, v82, true);
                v81:dispatch(v7(0.05, v78:getText("AssetConfig", "BundleUploadStepNumber", {
                    currentStep = 2, 
                    totalSteps = 4
                }), v78:getText("AssetConfig", "BundleUploadAssetsStep")));
                if v20() then
                    v12.UGCUploadAssetsEvent(v12.Status.Start, v82, l_operationId_0);
                end;
                local v90 = {};
                local v91 = 0;
                local v92 = {};
                for v93, v94 in pairs(v89) do
                    local v95 = v8(v78)[v93] or v93.Name;
                    v91 = v91 + 1;
                    local v96 = ("%* - %*"):format(v75, v95);
                    table.insert(v92, l_Promise_0.new(function(v97, v98) --[[ Line: 304 ]]
                        -- upvalues: l_PublishService_0 (ref), v94 (copy), l_operationId_0 (copy), v88 (copy), v93 (copy), v96 (copy), v76 (ref), v15 (ref), v22 (ref), v54 (ref), v12 (ref), v90 (copy), v81 (ref), v7 (ref), v91 (ref), v78 (ref)
                        task.spawn(function() --[[ Line: 305 ]]
                            -- upvalues: l_PublishService_0 (ref), v94 (ref), l_operationId_0 (ref), v88 (ref), v93 (ref), v96 (ref), v76 (ref), v15 (ref), v22 (ref), v54 (ref), v12 (ref), v90 (ref), v81 (ref), v7 (ref), v91 (ref), v78 (ref), v97 (copy), v98 (copy)
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 306 ]]
                                -- upvalues: l_PublishService_0 (ref), v94 (ref), l_operationId_0 (ref), v88 (ref), v93 (ref), v96 (ref), v76 (ref)
                                return l_PublishService_0:createAssetAndWaitForAssetId(v94, l_operationId_0, Enum.AssetCreatorType.User, v88, v93.Name, v96, v76);
                            end);
                            if l_status_0 and l_result_0 ~= nil and l_result_0 ~= 0 then
                                if v15.shouldDebugWarnings() then
                                    warn("Received an assetId for an uploaded UGC bundle body part:", l_result_0);
                                end;
                                if v22() then
                                    local v101 = v54(v94);
                                    local l_UGCIndividualAssetUploadEvent_0 = v12.UGCIndividualAssetUploadEvent;
                                    local l_l_result_0_0 = l_result_0;
                                    local v104;
                                    if not v101 then
                                        v104 = nil;
                                    else
                                        local _ = nil;
                                        v104 = if type(v101) == "table" then table.concat(v101, ", ") else tostring(v101);
                                    end;
                                    l_UGCIndividualAssetUploadEvent_0(l_l_result_0_0, v104);
                                end;
                                table.insert(v90, l_result_0);
                                v81:dispatch(v7(0.05 + 0.8 * #v90 / v91, v78:getText("AssetConfig", "BundleUploadStepNumber", {
                                    currentStep = 2, 
                                    totalSteps = 4
                                }), v78:getText("AssetConfig", "BundleUploadAssetsStep")));
                                v97(l_result_0);
                                return;
                            else
                                v98(l_result_0);
                                return;
                            end;
                        end);
                    end));
                end;
                l_Promise_0.all(v92):andThen(function(_) --[[ Line: 352 ]]
                    -- upvalues: v91 (ref), v90 (copy), v20 (ref), v12 (ref), v82 (ref), l_operationId_0 (copy), v81 (ref), v10 (ref), v72 (ref), v74 (ref), v75 (ref), v76 (ref), v78 (ref), v79 (ref), v80 (ref), v15 (ref), v4 (ref), v27 (ref), v6 (ref)
                    if v91 > 0 and v91 == #v90 then
                        if v20() then
                            local l_UGCUploadAssetsEvent_0 = v12.UGCUploadAssetsEvent;
                            local l_Success_0 = v12.Status.Success;
                            local l_v82_0 = v82;
                            local l_l_operationId_0_0 = l_operationId_0;
                            local l_v90_0 = v90;
                            local v112;
                            if not l_v90_0 then
                                v112 = nil;
                            else
                                local _ = nil;
                                v112 = if type(l_v90_0) == "table" then table.concat(l_v90_0, ", ") else tostring(l_v90_0);
                            end;
                            l_UGCUploadAssetsEvent_0(l_Success_0, l_v82_0, l_l_operationId_0_0, v112);
                        end;
                        v81:dispatch(v10(v72, v74, v75, v76, v90, l_operationId_0, v78, v79, v80));
                        return;
                    else
                        if v20() then
                            v12.UGCUploadAssetsEvent(v12.Status.Failure, v82, l_operationId_0, nil, "Bundle Upload Assets Error");
                        end;
                        if v15.shouldDebugWarnings() then
                            warn("Unexpected UGCBundleUploadRequest: Incorrect number of asset ids ");
                        end;
                        v81:dispatch(v4(v78:getText("AssetConfig", "BundlePartsUploadError") .. v27(v79, v78)));
                        v81:dispatch(v6(false));
                        return;
                    end;
                end, function(v114) --[[ Line: 399 ]]
                    -- upvalues: v20 (ref), v12 (ref), v82 (ref), l_operationId_0 (copy), v15 (ref), v21 (ref), v81 (ref), v4 (ref), v78 (ref), v27 (ref), v79 (ref), v6 (ref)
                    if v20() then
                        v12.UGCUploadAssetsEvent(v12.Status.Failure, v82, l_operationId_0, nil, v114);
                    end;
                    if v15.shouldDebugWarnings() then
                        warn("Unexpected UGCBundleUploadRequest error:", v114);
                    end;
                    if v21() then
                        v81:dispatch(v4(v78:getText("AssetConfig", "BundlePartsUploadError") .. v27(v79, v78) .. "\n\n" .. v114));
                    else
                        v81:dispatch(v4(v78:getText("AssetConfig", "BundlePartsUploadError") .. v27(v79, v78)));
                    end;
                    v81:dispatch(v6(false));
                end);
                return;
            else
                if v15.shouldDebugWarnings() then
                    warn("Unexpected UGCBundleUploadRequest response:", v86);
                end;
                if v20() then
                    v12.UGCUploadRequestOperationIdEvent(v12.Status.Failure, v82, nil, (v32(v86)));
                end;
                v81:dispatch(v4(v78:getText("AssetConfig", "ValidationErrorUnknown") .. v27(v79, v78)));
                v81:dispatch(v6(false));
                return;
            end;
        end;
        local function v117(v116) --[[ Line: 461 ]]
            -- upvalues: v20 (ref), v71 (ref), v81 (copy), v78 (ref), v82 (copy), v79 (ref)
            if v20() then
                v71(v81, v78, v116, v82, v79);
                return;
            else
                v71(v81, v78, v116);
                return;
            end;
        end;
        v81:dispatch(v7(0, v78:getText("AssetConfig", "BundleUploadStepNumber", {
            currentStep = 1, 
            totalSteps = 4
        }), v78:getText("AssetConfig", "BundleUploadPrepareStep")));
        v81:dispatch(v5(v13.SCREENS.UPLOADING_ASSET));
        local v118 = v14.getUGCBodyBundleAssetQuantities(v83, v77, v74);
        if v118 == nil then
            v81:dispatch(v4(v78:getText("AssetConfig", "ValidationErrorUnknown") .. v27(v79, v78)));
            v81:dispatch(v6(false));
            return;
        else
            if v20() then
                v12.UGCUploadRequestOperationIdEvent(v12.Status.Start, v82);
            end;
            return v72:postBundleCreationContext(v74, v118, v75, v76, v84, v85):andThen(v115, v117);
        end;
    end;
end;