local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Actions_0.SetAssetId);
local v4 = require(l_Actions_0.SetProgressBarInfo);
local v5 = require(l_Actions_0.UploadResult);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v7 = require(l_Requests_0.PollForBundleCreationStatus);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Analytics.Analytics);
local v10 = require(l_Util_0.AssetConfigUtil);
local v11 = require(l_Util_0.DebugFlags);
local v12 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v13 = game:DefineFastFlag("EnableAddedCreateUGCBundleErrorCodes", false);
local v14 = require(l_Requests_0.UGCBundleUploadDataSharingRequest);
local v15 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local v16 = require(l_Util_0.getRobuxMessageToAppend);
local function v21(v17) --[[ Line: 26 ]] --[[ Name: getRawErrorsFromResponse ]]
    if not v17 or not v17.Body or not v17.Body.errors then
        return nil;
    else
        local v18 = nil;
        for _, v20 in v17.Body.errors do
            if v18 ~= nil then
                v18 = v18 .. "\n" .. v20.code .. ": " .. v20.message;
            else
                v18 = v20.code .. ": " .. v20.message;
            end;
        end;
        return v18;
    end;
end;
local _ = function(v22) --[[ Line: 43 ]] --[[ Name: getAssetIdsTableAsString ]]
    if not v22 then
        return nil;
    else
        local _ = nil;
        if type(v22) == "table" then
            return (table.concat(v22, ", "));
        else
            return (tostring(v22));
        end;
    end;
end;
local function v44(v25, v26, v27, v28, v29, v30, v31) --[[ Line: 58 ]] --[[ Name: ProcessCreateBundleErrorResponse ]]
    -- upvalues: v13 (copy), v16 (copy), v12 (copy), v9 (copy), v21 (copy), v11 (copy), v2 (copy), v5 (copy)
    local v32 = {
        [2] = "CreateBundleInvalidBundleName", 
        [3] = "CreateBundleInvalidAssetIds", 
        [4] = "CreateBundleInvalidOperationId", 
        [5] = "CreateBundleInvalidBundleType", 
        [6] = "CreateBundleInvalidCreateBundleRequest", 
        [7] = v13 and "CreateBundleInvalidBundleDescription" or nil, 
        [11] = v13 and "CreateBundleGroupCreatorNotSupported" or nil, 
        [13] = "CreateBundleInvalidCreationFee"
    };
    local v33 = {
        [0] = "CreateBundleAuthorizationDenied"
    };
    local v34 = {
        [0] = "CreateBundleTokenValidationFailed", 
        [9] = v13 and "CreateBundleItemNotAllowedInBundle" or nil, 
        [12] = v13 and "CreateBundleCreatorMismatch" or nil
    };
    local v35 = if v13 then {
        [10] = "CreateBundleInvalidState"
    } else nil;
    local v36 = if v13 then {
        [8] = "CreateBundleUnsupportedBundleType"
    } else nil;
    local v37 = {
        [1] = "CreateBundleServiceUnavailable"
    };
    local v38 = {
        [400] = v32, 
        [401] = v33, 
        [403] = v34, 
        [412] = if v13 then v35 else nil, 
        [501] = if v13 then v36 else nil, 
        [503] = v37
    };
    local v39 = nil;
    local v40 = v38[v27.StatusCode];
    if v40 ~= nil and v27.Body ~= nil and v27.Body.errors ~= nil then
        for _, v42 in v27.Body.errors do
            local v43 = v40[v42.code];
            if v43 ~= nil then
                if v39 == nil then
                    v39 = v26:getText("AssetConfig", v43);
                else
                    v39 = v39 .. "\n" .. v26:getText("AssetConfig", v43);
                end;
            end;
        end;
        if v39 ~= nil then
            v39 = v39 .. v16(v31, v26);
        end;
    end;
    if v12() then
        v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Failure, v28, v29, v30, nil, (v21(v27)));
    end;
    if v11.shouldDebugWarnings() then
        warn("Could not create UGC Bundle and received response:", v27);
    end;
    if v39 ~= nil then
        v25:dispatch(v2(v39));
    else
        v25:dispatch(v2(v26:getText("AssetConfig", "CreateBundleGenericError") .. v16(v31, v26)));
    end;
    v25:dispatch(v5(false));
end;
return function(v45, v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 162 ]]
    -- upvalues: v12 (copy), v10 (copy), v9 (copy), v11 (copy), v4 (copy), v7 (copy), v14 (copy), v3 (copy), v5 (copy), v21 (copy), v13 (copy), v2 (copy), v16 (copy), v15 (copy), v44 (copy)
    return function(v54) --[[ Line: 173 ]]
        -- upvalues: v12 (ref), v10 (ref), v46 (copy), v49 (copy), v9 (ref), v50 (copy), v11 (ref), v4 (ref), v51 (copy), v7 (ref), v45 (copy), v53 (copy), v14 (ref), v3 (ref), v5 (ref), v21 (ref), v13 (ref), v2 (ref), v16 (ref), v52 (copy), v15 (ref), v44 (ref), v47 (copy), v48 (copy)
        local v55 = {
            [3] = "BundleCreationValidationFailed", 
            [4] = "BundleCreationInsufficientFunds", 
            [6] = "BundleCreationFeeMismatch"
        };
        local v56 = nil;
        if v12() then
            v56 = v10.getAvatarAssetTypeAsString(v46);
        end;
        local v57;
        if v12() then
            local l_v49_0 = v49;
            if not l_v49_0 then
                v57 = nil;
            else
                local _ = nil;
                v57 = if type(l_v49_0) == "table" then table.concat(l_v49_0, ", ") else tostring(l_v49_0);
            end;
        else
            v57 = nil;
        end;
        local function v64(v60) --[[ Line: 189 ]]
            -- upvalues: v12 (ref), v9 (ref), v56 (ref), v50 (ref), v57 (copy), v11 (ref), v54 (copy), v4 (ref), v51 (ref), v7 (ref), v45 (ref), v53 (ref), v14 (ref), v3 (ref), v5 (ref), v21 (ref), v13 (ref), v2 (ref), v55 (copy), v16 (ref), v52 (ref), v15 (ref)
            local l_creationStatusId_0 = v60.creationStatusId;
            if l_creationStatusId_0 then
                if v12() then
                    v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Success, v56, v50, v57, l_creationStatusId_0);
                end;
                if v11.shouldDebugWarnings() then
                    warn("Received a creationStatusId to create a bundle:", l_creationStatusId_0);
                end;
                v54:dispatch(v4(0.9, v51:getText("AssetConfig", "BundleUploadStepNumber", {
                    currentStep = 4, 
                    totalSteps = 4
                }), v51:getText("AssetConfig", "BundleUploadGenerateBundleIdStep")));
                if v12() then
                    v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Start, v56, v50, v57, l_creationStatusId_0);
                end;
                v54:dispatch(v7(v45, l_creationStatusId_0, function(v62, v63) --[[ Line: 227 ]]
                    -- upvalues: v54 (ref), v4 (ref), v51 (ref), v12 (ref), v9 (ref), v56 (ref), v50 (ref), v57 (ref), l_creationStatusId_0 (copy), v11 (ref), v53 (ref), v14 (ref), v45 (ref), v3 (ref), v5 (ref), v21 (ref), v13 (ref), v2 (ref), v55 (ref), v16 (ref), v52 (ref), v15 (ref)
                    v54:dispatch(v4(1, v51:getText("AssetConfig", "BundleUploadStepNumber", {
                        currentStep = 4, 
                        totalSteps = 4
                    }), v51:getText("AssetConfig", "BundleUploadCompleteStep")));
                    if v62 then
                        if v12() then
                            v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Success, v56, v50, v57, l_creationStatusId_0, v62);
                        end;
                        if v11.shouldDebugWarnings() then
                            warn("UGC bundled creation succeeded with returned bundleId:", v62);
                        end;
                        if v53 ~= nil then
                            v54:dispatch(v14(v45, v62, v53, v51));
                        end;
                        v54:dispatch(v3(v62));
                        v54:dispatch(v5(true));
                        return;
                    else
                        if v12() then
                            v9.UGCUploadGetBundleCreationStatusEvent(v9.Status.Failure, v56, v50, v57, l_creationStatusId_0, nil, (v21(v63)));
                        end;
                        if v13 then
                            if v11.shouldDebugWarnings() then
                                warn("UGC bundled creation failed and returned the response body:", v63);
                            end;
                            v54:dispatch(v2(if v55 ~= nil and v55[v63.status] ~= nil then v51:getText("AssetConfig", v55[v63.status]) .. v16(v52, v51) else v51:getText("AssetConfig", "ValidationErrorUnknown") .. v16(v52, v51, v15() and true or nil)));
                        else
                            v54:dispatch(v2(v63 or v51:getText("AssetConfig", "ValidationErrorUnknown") .. v16(v52, v51, v15() and true or nil)));
                        end;
                        v54:dispatch(v5(false));
                        return;
                    end;
                end));
                return;
            else
                if v12() then
                    v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Failure, v56, v50, v57, nil, (v21(v60)));
                end;
                if v11.shouldDebugWarnings() then
                    warn("Unexpected UGCCreateBundleRequest respoonse:", v60);
                end;
                v54:dispatch(v2(v51:getText("AssetConfig", "CreateBundleGenericError")));
                v54:dispatch(v5(false));
                return;
            end;
        end;
        local function v66(v65) --[[ Line: 338 ]]
            -- upvalues: v12 (ref), v44 (ref), v54 (copy), v51 (ref), v56 (ref), v50 (ref), v57 (copy), v52 (ref)
            if v12() then
                v44(v54, v51, v65, v56, v50, v57, v52);
                return;
            else
                v44(v54, v51, v65);
                return;
            end;
        end;
        v54:dispatch(v4(0.85, v51:getText("AssetConfig", "BundleUploadStepNumber", {
            currentStep = 3, 
            totalSteps = 4
        }), v51:getText("AssetConfig", "BundleUploadCreateBundleStep")));
        if v12() then
            v9.UGCUploadRequestBundleCreationStatusEvent(v9.Status.Start, v56, v50, v57);
        end;
        return v45:postCreateBundle(v46, v47, v48, v49, v50, v52):andThen(v64, v66);
    end;
end;