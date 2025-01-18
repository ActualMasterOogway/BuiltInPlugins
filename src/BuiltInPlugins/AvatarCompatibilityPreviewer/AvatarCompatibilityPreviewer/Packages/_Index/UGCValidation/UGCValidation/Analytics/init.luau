local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.util.Types);
local l_RunService_0 = game:GetService("RunService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v4 = if l_RunService_0:IsStudio() then game:GetService("StudioService") else nil;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestBody);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestAccessory);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidateTestInactiveControls);
local v10 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationReportScriptTime);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidateCageOrigin);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestBody);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestAccessory);
local v14 = require(l_Parent_0.flags.getEngineFeatureUGCValidateMeshInsideMesh);
local v15 = require(l_Parent_0.flags.getEngineFeatureUGCValidateCageMeshDistance);
local v16 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationIECTelemetry);
local v17 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationCageUVDuplicates);
local v18 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateLCCagesVerticesSimilarity);
local v19 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateLCCagingRelevancy);
local v20 = require(l_Parent_0.flags.getFFlagUGCValidatePartSizeWithinRenderSizeLimits);
local function v25(...) --[[ Line: 39 ]] --[[ Name: joinTables ]]
    local v21 = {};
    for v22 = 1, select("#", ...) do
        for v23, v24 in select(v22, ...) do
            v21[v23] = v24;
        end;
    end;
    return v21;
end;
local v26 = {
    ErrorType = {
        resetPhysicsData_FailedToLoadMesh = "resetPhysicsData_FailedToLoadMesh", 
        validateAccessoryName = "validateAccessoryName", 
        validateAssetBounds_AssetSizeTooBig = "validateAssetBounds_AssetSizeTooBig", 
        validateAssetBounds_AssetSizeTooSmall = "validateAssetBounds_AssetSizeTooSmall", 
        validateAssetBounds_InconsistentAvatarPartScaleType = "validateAssetBounds_InconsistentAvatarPartScaleType", 
        validateScaleType_InvalidAvatarPartScaleType = "validateScaleType_InvalidAvatarPartScaleType", 
        validateAssetCreator_DependencyNotOwnedByCreator = "validateAssetCreator_DependencyNotOwnedByCreator", 
        validateAssetCreator_FailedToLoad = "validateAssetCreator_FailedToLoad", 
        validateAssetCreator_TooManyDependencies = "validateAssetCreator_TooManyDependencies", 
        validateAttributes = "validateAttributes", 
        validateBodyPartChildAttachmentBounds_AttachmentRotated = "validateBodyPartChildAttachmentBounds_AttachmentRotated", 
        validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition = "validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition", 
        validateBodyPartCollisionFidelity = "validateBodyPartCollisionFidelity", 
        validateBodyPartMeshBounds_FailedToLoadMesh = "validateBodyPartMeshBounds_FailedToLoadMesh", 
        validateCageMeshIntersection_AverageOuterCageToMeshVertDistances = "validateCageMeshIntersection_AverageOuterCageToMeshVertDistances", 
        validateCageMeshIntersection_FailedToExecute = "validateCageMeshIntersection_FailedToExecute", 
        validateCageMeshIntersection_Intersection = "validateCageMeshIntersection_Intersection", 
        validateCageMeshIntersection_InvalidRefMeshId = "validateCageMeshIntersection_InvalidRefMeshId", 
        validateCageMeshIntersection_IrrelevantCageModified = "validateCageMeshIntersection_IrrelevantCageModified", 
        validateCageMeshIntersection_OuterCageFarExtendedFromMesh = "validateCageMeshIntersection_OuterCageFarExtendedFromMesh", 
        validateCageNonManifoldAndHoles_CageHoles = "validateCageNonManifoldAndHoles_CageHoles", 
        validateCageNonManifoldAndHoles_FailedToExecute = "validateCageNonManifoldAndHoles_FailedToExecute", 
        validateCageNonManifoldAndHoles_NonManifold = "validateCageNonManifoldAndHoles_NonManifold", 
        validateCageUVs_TestExecutedSuccessfully = "validateCageUVs_TestExecutedSuccessfully", 
        validateCageUVs_TestPassed = "validateCageUVs_TestPassed", 
        validateCageUVTriangleArea_FailedToLoadMesh = "validateCageUVTriangleArea_FailedToLoadMesh", 
        validateCageUVTriangleArea_ZeroAreaTriangle = "validateCageUVTriangleArea_ZeroAreaTriangle", 
        validateCageUVValues_FailedToLoadMesh = "validateCageUVValues_FailedToLoadMesh", 
        validateCageUVValues_UnexpectedUVValue = "validateCageUVValues_UnexpectedUVValue", 
        validateCanLoad = "validateCanLoad", 
        validateDependencies_IsNotApproved = "validateDependencies_IsNotApproved", 
        validateDependencies_IsRestrictedUserId = "validateDependencies_IsRestrictedUserId", 
        validateDependencies_IsReviewing = "validateDependencies_IsReviewing", 
        validateDependencies_ParseFailure = "validateDependencies_ParseFailure", 
        validateDescendantMeshMetrics_FailedToCalculateTriangles = "validateDescendantMeshMetrics_FailedToCalculateTriangles", 
        validateDescendantMeshMetrics_FailedToLoadMesh = "validateDescendantMeshMetrics_FailedToLoadMesh", 
        validateDescendantMeshMetrics_HasSkinnedMeshMismatch = "validateDescendantMeshMetrics_HasSkinnedMeshMismatch", 
        validateDescendantMeshMetrics_NoSkinningInfo = "validateDescendantMeshMetrics_NoSkinningInfo", 
        validateDescendantMeshMetrics_TooFarFromOrigin = "validateDescendantMeshMetrics_TooFarFromOrigin", 
        validateDescendantMeshMetrics_TooManyTriangles = "validateDescendantMeshMetrics_TooManyTriangles", 
        validateDynamicHeadMeshPartFormat_FailedToLoadMesh = "validateDynamicHeadMeshPartFormat_FailedToLoadMesh", 
        validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh", 
        validateFullBody_IncorrectAssetTypeSet = "validateFullBody_IncorrectAssetTypeSet", 
        validateFullBody_InstancesMissing = "validateFullBody_InstancesMissing", 
        validateFullBodyCageDeletion_FailedToExecute = "validateFullBodyCageDeletion_FailedToExecute", 
        validateFullBodyCageDeletion_GeometryRemoved = "validateFullBodyCageDeletion_GeometryRemoved", 
        validateFullBody_MeshIdsMissing = "validateFullBody_MeshIdsMissing", 
        validateHSR_HSRDataNotReady = "validateHSR_HSRDataNotReady", 
        validateHSR_NoWrapLayer = "validateHSR_NoWrapLayer", 
        validateInstanceTree = "validateInstanceTree", 
        validateInstanceTree_InvalidDescendants = "validateInstanceTree_InvalidDescendants", 
        validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing = "validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing", 
        validateLayeredClothingAccessory_FailedToLoadMesh = "validateLayeredClothingAccessory_FailedToLoadMesh", 
        validateLayeredClothingAccessory_NoInnerCageId = "validateLayeredClothingAccessory_NoInnerCageId", 
        validateLayeredClothingAccessory_NoMeshId = "validateLayeredClothingAccessory_NoMeshId", 
        validateLayeredClothingAccessory_NoOuterCageId = "validateLayeredClothingAccessory_NoOuterCageId", 
        validateLayeredClothingAccessory_NoWrapLayer = "validateLayeredClothingAccessory_NoWrapLayer", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory = "validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLimbsAndTorso_FolderInfoMismatch = "validateLimbsAndTorso_FolderInfoMismatch", 
        validateLimbsAndTorso_R6FolderHasChildren = "validateLimbsAndTorso_R6FolderHasChildren", 
        validateLimbsAndTorso_TopLevelFolders = "validateLimbsAndTorso_TopLevelFolders", 
        validateMaterials = "validateMaterials", 
        validateMeshBounds_FailedToExecute = "validateMeshBounds_FailedToExecute", 
        validateMeshBounds_FailedToLoadMesh = "validateMeshBounds_FailedToLoadMesh", 
        validateMeshBounds_TooLarge = "validateMeshBounds_TooLarge", 
        validateMeshComparison = "validateMeshComparison", 
        validateMeshPartAccessory_FailedToLoadMesh = "validateMeshPartAccessory_FailedToLoadMesh", 
        validateMeshPartAccessory_NoMeshId = "validateMeshPartAccessory_NoMeshId", 
        validateMeshPartBodyPart_ValidateWithSchema = "validateMeshPartBodyPart_ValidateWithSchema", 
        validateMeshTriangleArea_FailedToLoadMesh = "validateMeshTriangleArea_FailedToLoadMesh", 
        validateMeshTriangleArea_NoArea = "validateMeshTriangleArea_NoArea", 
        validateMeshTriangles_FailedToExecute = "validateMeshTriangles_FailedToExecute", 
        validateMeshTriangles_FailedToLoadMesh = "validateMeshTriangles_FailedToLoadMesh", 
        validateMeshTriangles_TooManyTriangles = "validateMeshTriangles_TooManyTriangles", 
        validateMeshVertexColors_FailedToLoadMesh = "validateMeshVertexColors_FailedToLoadMesh", 
        validateMeshVertexColors_NonNeutralVertexColors = "validateMeshVertexColors_NonNeutralVertexColors", 
        validateMisMatchUV_FailedToExecute = "validateMisMatchUV_FailedToExecute", 
        validateMisMatchUV_UVMismatch = "validateMisMatchUV_UVMismatch", 
        validateModeration_AssetsHaveNotPassedModeration = "validateModeration_AssetsHaveNotPassedModeration", 
        validateModeration_CouldNotFetchModerationDetails = "validateModeration_CouldNotFetchModerationDetails", 
        validateModeration_FailedToParse = "validateModeration_FailedToParse", 
        validateModeration_ValidateUser = "validateModeration_ValidateUser", 
        validateOverlappingVertices_FailedToExecute = "validateOverlappingVertices_FailedToExecute", 
        validateOverlappingVertices_OverlappingVertices = "validateOverlappingVertices_OverlappingVertices", 
        validatePackage_FailedToParse = "validatePackage_FailedToParse", 
        validateProperties_PropertyDoesNotExist = "validateProperties_PropertyDoesNotExist", 
        validateProperties_PropertyMismatch = "validateProperties_PropertyMismatch", 
        validateSingleInstance_MultipleInstances = "validateSingleInstance_MultipleInstances", 
        validateSingleInstance_ZeroInstances = "validateSingleInstance_ZeroInstances", 
        validateSurfaceAppearances_MeshPartHasTexture = "validateSurfaceAppearances_MeshPartHasTexture", 
        validateSurfaceAppearances_MissingSurfaceAppearance = "validateSurfaceAppearances_MissingSurfaceAppearance", 
        validateTags = "validateTags", 
        validateTextureSize_FailedToExecute = "validateTextureSize_FailedToExecute", 
        validateTextureSize_FailedToLoadTexture = "validateTextureSize_FailedToLoadTexture", 
        validateTextureSize_InvalidTextureId = "validateTextureSize_InvalidTextureId", 
        validateTextureSize_TextureTooBig = "validateTextureSize_TextureTooBig", 
        validateThumbnailConfiguration_InvalidTarget = "validateThumbnailConfiguration_InvalidTarget", 
        validateThumbnailConfiguration_OutsideView = "validateThumbnailConfiguration_OutsideView", 
        validateUVSpace_FailedToExecute = "validateUVSpace_FailedToExecute", 
        validateUVSpace_InvalidUVSpace = "validateUVSpace_InvalidUVSpace", 
        validateVertexDensity_FailedToExecute = "validateVertexDensity_FailedToExecute", 
        validateVertexDensity_MaxDensityExceeded = "validateVertexDensity_MaxDensityExceeded"
    }
};
if v18() then
    v26.ErrorType.validateVerticesSimilarity_FailedToExecute = "validateVerticesSimilarity_FailedToExecute";
    v26.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded = "validateVerticesSimilarity_MaxSimilarityExceeded";
end;
if v19() then
    v26.ErrorType.validateCagingRelevancy_FailedToExecute = "validateCagingRelevancy_FailedToExecute";
    v26.ErrorType.validateCagingRelevancy_IrrelevantCaging = "validateCagingRelevancy_IrrelevantCaging";
end;
if v6() or v7() then
    v26.ErrorType.validateCoplanarIntersection_FailedToExecute = "validateCoplanarIntersection_FailedToExecute";
    v26.ErrorType.validateCoplanarIntersection_CoplanarIntersection = "validateCoplanarIntersection_CoplanarIntersection";
end;
if v9() then
    v26.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls";
end;
if v11() then
    v26.ErrorType.validateLayeredClothingAccessory_CageOriginOutOfBounds = "validateLayeredClothingAccessory_CageOriginOutOfBounds";
    v26.ErrorType.validateBodyPart_CageOriginOutOfBounds = "validateBodyPart_CageOriginOutOfBounds";
end;
if v12() or v13() then
    v26.ErrorType.validateTotalSurfaceArea_FailedToExecute = "validateTotalSurfaceArea_FailedToExecute";
    v26.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded = "validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded";
end;
if v14() then
    v26.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute = "validateRenderMeshInsideOuterCageMesh_FailedToExecute";
    v26.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded = "validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded";
end;
if v15() then
    v26.ErrorType.validateCageMeshDistance_FailedToExecute = "validateCageMeshDistance_FailedToExecute";
    v26.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance = "validateCageMeshDistance_OuterCageToMeshDistance";
end;
if v17() then
    v26.ErrorType.validateCageUVDuplicate_FailedToExecute = "validateCageUVDuplicate_FailedToExecute";
    v26.ErrorType.validateCageUVDuplicate_UnexpectedUVValue = "validateCageUVDuplicate_UnexpectedUVValue";
end;
if v20() then
    v26.ErrorType.validatePartSizeWithinRenderSizeLimits_SizeExceeded = "validatePartSizeWithinRenderSizeLimits_SizeExceeded";
end;
setmetatable(v26.ErrorType, {
    __index = function(_, v28) --[[ Line: 218 ]] --[[ Name: __index ]]
        return (("UNREGISTERED_%*"):format(v28));
    end
});
v26.metadata = {};
v26.setMetadata = function(v29) --[[ Line: 225 ]] --[[ Name: setMetadata ]]
    -- upvalues: v8 (copy), v26 (copy)
    if not v8() then
        return;
    else
        local v30 = {};
        for v31, v32 in v29 do
            v30[v31] = tostring(v32);
        end;
        v26.metadata = v30;
        return;
    end;
end;
v26.shouldReportIECTelemetry = function(v33) --[[ Line: 236 ]] --[[ Name: shouldReportIECTelemetry ]]
    -- upvalues: v16 (copy), l_RunService_0 (copy)
    if not v16() then
        return false;
    elseif not v33 then
        return false;
    elseif l_RunService_0:IsStudio() or not v33.allowEditableInstances or not v33.isServer then
        return false;
    else
        return true;
    end;
end;
v26.reportCounter = function(v34, v35, v36) --[[ Line: 252 ]] --[[ Name: reportCounter ]]
    -- upvalues: v26 (copy), l_UGCValidationService_0 (copy)
    if v26.shouldReportIECTelemetry(v36) then
        l_UGCValidationService_0:ReportUGCValidationCounter(v34, v35);
    end;
end;
v26.reportFailure = function(v37, v38, v39) --[[ Line: 258 ]] --[[ Name: reportFailure ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy), v25 (copy), v26 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy), l_UGCValidationService_0 (copy)
    if not v8() then
        return;
    else
        local v40 = l_RunService_0:IsStudio() and "studio" or "rcc";
        local v41 = v25(v26.metadata, v38 or {}, {
            errorType = v37, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId(), 
            placeId = game.PlaceId, 
            userId = if v4 then v4:GetUserId() else 0
        });
        l_RbxAnalyticsService_0:SendEventDeferred(v40, "ugcValidation", "failure", v41);
        if v26.shouldReportIECTelemetry(v39) then
            l_UGCValidationService_0:ReportUGCValidationFailureTelemetry(v37);
        end;
        return;
    end;
end;
v26.reportThumbnailing = function(v42, v43) --[[ Line: 282 ]] --[[ Name: reportThumbnailing ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy), v25 (copy), v26 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    if not v8() then
        return;
    else
        local v44 = l_RunService_0:IsStudio() and "studio" or "rcc";
        local v45 = v25(v26.metadata, v43 or {}, {
            time = v42, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId(), 
            placeId = game.PlaceId, 
            userId = if v4 then v4:GetUserId() else 0
        });
        l_RbxAnalyticsService_0:SendEventDeferred(v44, "ugcValidation", "thumbnailing", v45);
        return;
    end;
end;
v26.recordScriptTime = function(v46, v47, v48) --[[ Line: 297 ]] --[[ Name: recordScriptTime ]]
    -- upvalues: v10 (copy)
    if not v10() then
        return;
    else
        if not v48.scriptTimes then
            v48.scriptTimes = {};
        end;
        local l_scriptTimes_0 = v48.scriptTimes;
        if not l_scriptTimes_0[v46] then
            l_scriptTimes_0[v46] = 0;
        end;
        local v50 = tick() - v47;
        l_scriptTimes_0[v46] = l_scriptTimes_0[v46] + v50;
        return;
    end;
end;
v26.reportScriptTimes = function(v51) --[[ Line: 315 ]] --[[ Name: reportScriptTimes ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), l_UGCValidationService_0 (copy)
    if not v10() then
        return;
    else
        if v51.isServer and not l_RunService_0:IsStudio() and v51.scriptTimes then
            l_UGCValidationService_0:ReportUGCValidationTelemetry(if v51.assetTypeEnum then v51.assetTypeEnum.Name else "FullBody", v51.scriptTimes);
        end;
        return;
    end;
end;
return v26;