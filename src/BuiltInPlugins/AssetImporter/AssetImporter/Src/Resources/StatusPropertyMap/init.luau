local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v2 = {
    ImportName = {
        "NameExceedsCharacterLimitWarning"
    }, 
    ImportAsPackage = {
        "AnimationInPackageWarning"
    }, 
    Dimensions = {
        "MeshScaleWarning"
    }, 
    FileDimensions = {
        "MeshScaleWarning"
    }, 
    PolygonCount = {
        "MeshSizeWarning"
    }, 
    CageNonManifoldPreview = {
        "CageNonManifoldWarning"
    }, 
    CageOverlappingVerticesPreview = {
        "CageOverlappingVerticesWarning"
    }, 
    CageUVMisMatchedPreview = {
        "CageUVMisMatchedWarning"
    }, 
    CageMeshIntersectedPreview = {
        "CageMeshIntersectedWarning"
    }, 
    MeshHoleDetectedPreview = {
        "MeshHoleDetectedWarning"
    }, 
    IrrelevantCageModifiedPreview = {
        "IrrelevantCageModifiedWarning"
    }, 
    OuterCageFarExtendedFromMeshPreview = {
        "OuterCageFarExtendedFromMeshWarning"
    }, 
    RigType = {
        "IncorrectR15Warning"
    }, 
    DiffuseFilePath = {
        "CouldNotReadDiffuseError", 
        "DiffuseBadFileFormatError"
    }, 
    RoughnessFilePath = {
        "CouldNotReadRoughnessError", 
        "RoughnessBadFileFormatError"
    }, 
    NormalFilePath = {
        "CouldNotReadNormalError", 
        "NormalBadFileFormatError"
    }, 
    MetalnessFilePath = {
        "CouldNotReadMetalnessError", 
        "MetalnessBadFileFormatError"
    }, 
    FileGeneral = {
        "CantImportAvatarGltfsWarning", 
        "CantImportScaleOrWeightAnimationsWarning"
    }, 
    ValidateUgcBody = if v1() then nil else {
        "ValidateUgcButNoInsertError"
    }, 
    ObjectGeneral = {
        "MaterialIgnoredWarning", 
        "CouldNotReadTextureError", 
        "TextureBadFileFormatError", 
        "ContentNotFoundError", 
        "MeshIdNotFoundError", 
        "NoValidParentError", 
        "NullNodeError", 
        "ImportDataTypeMismatchError", 
        "ImportDataNotCreatedError", 
        "ImportDataInstanceNotCreatedError", 
        "TextureInvalidSizeError", 
        "IllegalNodeTypeError", 
        "BadCallError", 
        "PoseError", 
        "UncaughtExceptionError", 
        "UploadAlreadyRunningError", 
        "CageMismatchWarning", 
        "CageHasMaterialWarning", 
        "CageNoGeoParentError", 
        "UGCMeshVertColorsWarning", 
        "UGCMaxMeshTrianglesWarning", 
        "UGCExceedUVSpaceWarning", 
        "UGCExceedTextureSizeWarning", 
        "InnerButNoOuterCageWarning", 
        "NoRefMeshForCageWarning", 
        "NoRefMeshForCageWithSuggestionWarning", 
        "AvatarCagesMissingWarning", 
        "CageNameHasTypoWarning", 
        "DeletedCageGeometryWarning", 
        "UnsupportedPreviewTextureTypeWarning", 
        "OuterCageBloatingWarning", 
        "FacsFrameExtraCharsWarning", 
        "FacsMax3CorrectivesError", 
        "FacsUnrecognizedFacsError", 
        "FacsInvalidCorrectiveError", 
        "FacsCorrectiveDupeError", 
        "FacsRootFaceJointNotStringError", 
        "FacsRootFaceJointNoValueError", 
        "FacsFrameAttrNotStringError", 
        "FacsUnparseableFrameNumberError", 
        "FacsEmptyAttributeWarning", 
        "FacsDupeControlError", 
        "FacsRootFaceJointExtraCharsError", 
        "FacsHasFramesNoRootFaceJointError", 
        "FacsNoAttributesError", 
        "FacsNoNeutralError", 
        "FacsMissingSupportCorrectiveWarning", 
        "FacsMissingBaseError", 
        "FacsMissingKeyFrameError", 
        "FacsNoAnimationStackError", 
        "FacsMultipleAnimationStackWarning", 
        "FacsNoRootFaceJointError", 
        "FacsMultipleRootFaceJointsError", 
        "FacsNoJointsError", 
        "FacsNearNeutralWarning", 
        "FacsIncompletePosesWarning", 
        "FacsOnlyNeutralError", 
        "FacsNoFaceControlsAllowedError"
    }
};
local _ = function(v3) --[[ Line: 91 ]] --[[ Name: convertToSet ]]
    local v4 = {};
    for _, v6 in pairs(v3) do
        v4[v6] = true;
    end;
    return v4;
end;
for v8, v9 in pairs(v2) do
    local v10 = {};
    for _, v12 in pairs(v9) do
        v10[v12] = true;
    end;
    v2[v8] = v10;
end;
return v2;