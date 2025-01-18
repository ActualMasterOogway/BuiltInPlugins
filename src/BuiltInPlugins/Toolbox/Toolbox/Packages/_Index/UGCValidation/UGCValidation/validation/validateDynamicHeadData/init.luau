local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.flags.getFFlagValidateFacialBounds);
local v5 = require(l_Parent_0.flags.getFFlagValidateFacialExpressiveness);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateGetInactiveControls);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidateTestInactiveControls);
local v9 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local l_game_EngineFeature_0 = game:GetEngineFeature("UGCValidateCompareTextureOverlap");
local v11 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v12 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100;
local v13 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100;
local v14 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100;
local v15 = game:DefineFastInt("UGCValidateFacsDataOperationalThreshold", 200) * 0.001;
local v16 = require(l_Parent_0.util.setupDynamicHead);
local v17 = require(l_Parent_0.util.getExpectedPartSize);
local v18 = require(l_Parent_0.util.Thumbnailer);
local _ = require(l_Parent_0.util.Types);
local v20 = require(l_Parent_0.util.pcallDeferred);
local v21 = require(l_Parent_0.util.getMeshIdForSkinningValidation);
local v22 = {
    "LipsTogether", 
    "Pucker", 
    "LeftLipStretcher", 
    "RightLipStretcher", 
    "LeftLipCornerPuller", 
    "RightLipCornerPuller", 
    "LeftUpperLipRaiser", 
    "RightUpperLipRaiser", 
    "LeftLowerLipDepressor", 
    "RightLowerLipDepressor", 
    "JawDrop", 
    "LeftEyeClosed", 
    "RightEyeClosed", 
    "EyesLookRight", 
    "EyesLookLeft", 
    "EyesLookUp", 
    "EyesLookDown"
};
local function v27(v23, v24, v25) --[[ Line: 61 ]] --[[ Name: downloadFailure ]]
    -- upvalues: v2 (copy)
    local v26 = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", v24);
    if v23 then
        error(v26);
    end;
    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, v25);
    return false, {
        v26
    };
end;
local function v48(v28, v29) --[[ Line: 97 ]] --[[ Name: checkFACSDataOperational ]]
    -- upvalues: v11 (copy), v16 (copy), v18 (copy), v22 (copy), l_UGCValidationService_0 (copy), v15 (copy)
    if not v29 and not v11() then
        return true;
    else
        local v30 = v28:Clone();
        if not v16(v30) then
            return false, {
                string.format("Unable to setup body for DynamicHead (%s)", v28.MeshId)
            };
        else
            local v31 = v18.new(v29, 1, Vector2.new(100, 100));
            v31:init(v30);
            v31:setCamera(1, math.max(v30.Size.X, v30.Size.Y), (Vector3.new(0, 0, -1, 0)));
            local v32, v33 = v31:takeSnapshot();
            local l_FaceControls_0 = v30:FindFirstChild("FaceControls");
            if not l_FaceControls_0 then
                v31:cleanup();
                return false, {
                    "No FaceControls founds"
                };
            else
                for _, v36 in v22 do
                    l_FaceControls_0[v36] = 1;
                end;
                local v37, v38 = v31:takeSnapshot();
                if not v32 or not v37 then
                    local v39 = string.format("Unable to capture snapshot of DynamicHead (%s)", v28.MeshId);
                    if v29 then
                        error(v39);
                    end;
                    return false, {
                        v39
                    };
                else
                    local v40 = nil;
                    local v41 = nil;
                    if v29 then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 137 ]]
                            -- upvalues: l_UGCValidationService_0 (ref), v33 (copy), v38 (copy)
                            return l_UGCValidationService_0:CompareTextureOverlapByteString(v33, v38);
                        end);
                        v40 = l_status_0;
                        v41 = l_result_0;
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 141 ]]
                            -- upvalues: l_UGCValidationService_0 (ref), v33 (copy), v38 (copy)
                            return l_UGCValidationService_0:CompareTextureOverlapTextureId(v33, v38);
                        end);
                        v40 = l_status_1;
                        v41 = l_result_1;
                    end;
                    v31:cleanup();
                    if not v40 or #v41 < 2 then
                        local v46 = string.format("Failed to read data from snapshot of DynamicHead (%s)", v28.MeshId);
                        if v29 then
                            error(v46);
                        else
                            return false, {
                                v46
                            };
                        end;
                    end;
                    local v47 = v41[1] / v41[2];
                    if v47 < v15 then
                        return false, {
                            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v28.MeshId, v47, v15)
                        };
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
end;
local function v58(v49, v50) --[[ Line: 163 ]] --[[ Name: validateFacialBounds ]]
    -- upvalues: v20 (copy), v21 (copy), v17 (copy), l_UGCValidationService_0 (copy), v12 (copy)
    local l_isServer_0 = v50.isServer;
    local l_allowEditableInstances_0 = v50.allowEditableInstances;
    local v55, v56 = v20(function() --[[ Line: 170 ]]
        -- upvalues: v21 (ref), v49 (copy), l_allowEditableInstances_0 (copy), v17 (ref), v50 (copy), l_UGCValidationService_0 (ref), v12 (ref)
        local v53 = v21(v49, l_allowEditableInstances_0);
        local v54 = v17(v49, v50);
        return l_UGCValidationService_0:ValidateFacialBounds(v53, v12, v54);
    end, v50);
    if not v55 then
        local v57 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v49.fullName);
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v57);
        end;
        return false, {
            v57
        };
    elseif not v56 then
        return false, {
            string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v49:GetFullName())
        };
    else
        return true;
    end;
end;
local function v68(v59, v60) --[[ Line: 195 ]] --[[ Name: validateFacialExpressiveness ]]
    -- upvalues: v20 (copy), v21 (copy), v17 (copy), l_UGCValidationService_0 (copy), v14 (copy), v13 (copy)
    local l_isServer_1 = v60.isServer;
    local l_allowEditableInstances_1 = v60.allowEditableInstances;
    local v65, v66 = v20(function() --[[ Line: 202 ]]
        -- upvalues: v21 (ref), v59 (copy), l_allowEditableInstances_1 (copy), v17 (ref), v60 (copy), l_UGCValidationService_0 (ref), v14 (ref)
        local v63 = v21(v59, l_allowEditableInstances_1);
        local v64 = v17(v59, v60);
        return l_UGCValidationService_0:ValidateFacialExpressiveness(v63, v14, v64);
    end, v60);
    if not v65 then
        local v67 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v59.fullName);
        if l_isServer_1 ~= nil and l_isServer_1 then
            error(v67);
        end;
        return false, {
            v67
        };
    elseif v66 < v13 then
        return false, {
            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v59:GetFullName(), v66, v13)
        };
    else
        return true;
    end;
end;
return function(v69, v70) --[[ Line: 233 ]] --[[ Name: validateDynamicHeadData ]]
    -- upvalues: v6 (copy), v9 (copy), l_UGCValidationService_0 (copy), v21 (copy), v27 (copy), v2 (copy), v3 (copy), v7 (copy), v8 (copy), v22 (copy), v5 (copy), v68 (copy), l_game_EngineFeature_0 (copy), v48 (copy), v4 (copy), v58 (copy)
    local v71 = tick();
    if not v6() then
        return true;
    else
        local l_isServer_2 = v70.isServer;
        local v73 = if v70.bypassFlags then v70.bypassFlags.skipSnapshot else false;
        local l_allowEditableInstances_2 = v70.allowEditableInstances;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 247 ]]
            -- upvalues: v9 (ref), l_UGCValidationService_0 (ref), v21 (ref), v69 (copy), l_allowEditableInstances_2 (copy)
            if v9() then
                return l_UGCValidationService_0:ValidateDynamicHeadMesh(v21(v69, l_allowEditableInstances_2));
            else
                return l_UGCValidationService_0:ValidateDynamicHeadMesh(v69.MeshId);
            end;
        end);
        if not l_status_2 then
            return v27(l_isServer_2, v69.Name, v70);
        elseif not l_result_2 then
            v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, v70);
            return false, {
                string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", v69.Name)
            };
        else
            l_status_2 = v3.new();
            if v7() and v8() then
                local v77, v78;
                l_result_2, v77, v78 = pcall(function() --[[ Line: 280 ]]
                    -- upvalues: v9 (ref), l_UGCValidationService_0 (ref), v21 (ref), v69 (copy), l_allowEditableInstances_2 (copy), v22 (ref)
                    if v9() then
                        return l_UGCValidationService_0:GetDynamicHeadMeshInactiveControls(v21(v69, l_allowEditableInstances_2), v22);
                    else
                        return l_UGCValidationService_0:GetDynamicHeadMeshInactiveControls(v69.MeshId, v22);
                    end;
                end);
                if not l_result_2 then
                    if string.find(v77, "Download Error") == 1 then
                        return v27(l_isServer_2, v69.Name, v70);
                    else
                        assert(false, v77);
                    end;
                end;
                local v79 = #v77 == 0;
                local v80 = #v78 == 0;
                if not v79 or not v80 then
                    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, v70);
                    l_status_2:updateReasons(v79, {
                        (("%*.MeshId (%*) is missing FACS controls: %*"):format(v69.Name, v69.MeshId, (table.concat(v77, ", "))))
                    });
                    l_status_2:updateReasons(v80, {
                        (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v69.Name, v69.MeshId, (table.concat(v78, ", "))))
                    });
                end;
            end;
            if v5() then
                l_status_2:updateReasons(v68(v69, v70));
            elseif l_game_EngineFeature_0 and not v73 then
                local v81;
                l_result_2, v81 = v48(v69, l_isServer_2);
                l_status_2:updateReasons(l_result_2, v81);
            end;
            if v4() then
                l_status_2:updateReasons(v58(v69, v70));
            end;
            v2.recordScriptTime(script.Name, v71, v70);
            return l_status_2:getFinalResults();
        end;
    end;
end;