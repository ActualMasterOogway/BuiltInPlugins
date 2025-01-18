local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.AssetIdProperty);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.AnimationListProperty);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.UploadDestinationProperty);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagShowOffCenterOriginImporter);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagChooseAnimationForRestPose);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagKeepZeroInfluenceBones);
local function v11(_, v10) --[[ Line: 15 ]] --[[ Name: hideIfNoAnimation ]]
    -- upvalues: v6 (copy)
    if v10:IsGltf() then
        return true;
    elseif not v6() then
        return true;
    else
        return not v10:HasAnimation();
    end;
end;
local function v14(_, v13) --[[ Line: 25 ]] --[[ Name: hideIfNoAnimationAndNotCustomRestPose ]]
    -- upvalues: v6 (copy)
    if v13:IsGltf() then
        return true;
    elseif not v6() then
        return true;
    else
        return not v13:HasAnimation() or not v13:usesCustomRestPoseLua();
    end;
end;
local function v17(_, v16) --[[ Line: 35 ]] --[[ Name: hideIfNotR15 ]]
    return not v16:IsR15();
end;
local function v20(_, v19) --[[ Line: 39 ]] --[[ Name: hideIfCannotValidateUgc ]]
    -- upvalues: v7 (copy)
    return v7() or not v19:IsR15();
end;
local function v22(v21) --[[ Line: 43 ]] --[[ Name: hideIfNotInsertToWorkspace ]]
    return not v21.InsertInWorkspace;
end;
local function v24(v23) --[[ Line: 47 ]] --[[ Name: hideIfNotIsPackage ]]
    return not (v23.AddModelToInventory and v23.ImportAsPackage);
end;
local function v26(v25) --[[ Line: 51 ]] --[[ Name: hideIfNotAddingToInventory ]]
    return not v25.AddModelToInventory;
end;
local function _() --[[ Line: 55 ]] --[[ Name: shouldShowCallouts ]]
    -- upvalues: v1 (copy)
    return not v1.RunningUnderCLI();
end;
local function v29(v28) --[[ Line: 59 ]] --[[ Name: shouldShowAvatarPreviewCallout ]]
    -- upvalues: v7 (copy), v1 (copy)
    return not v7() and not v1.RunningUnderCLI() and v28:IsR15();
end;
return {
    {
        Section = "FileGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "ImportAsModelAsset", 
                Editable = true
            }, 
            {
                Name = "AddModelToInventory", 
                Editable = true
            }, 
            {
                Name = "ImportAsPackage", 
                Editable = true, 
                ShouldHide = v26
            }, 
            {
                Name = "ExistingPackageId", 
                Editable = true, 
                ComponentFactory = v2, 
                ShouldHide = v24
            }, 
            {
                Name = "PreferredUploadId", 
                Editable = true, 
                ComponentFactory = v4
            }, 
            {
                Name = "InsertInWorkspace", 
                Editable = true
            }, 
            {
                Name = "InsertWithScenePosition", 
                Editable = true, 
                ShouldHide = v22
            }, 
            {
                Name = "UseSceneOriginAsCFrame", 
                Editable = true, 
                ShouldHide = function(_) --[[ Line: 63 ]] --[[ Name: hideIfNotShowOffCenterOriginImporter ]]
                    -- upvalues: v5 (copy)
                    return not v5();
                end
            }, 
            {
                Name = "KeepZeroInfluenceBones", 
                Editable = true, 
                ShouldHide = function() --[[ Line: 72 ]] --[[ Name: hideIfKeepZeroInfluenceBonesFlagOff ]]
                    -- upvalues: v8 (copy)
                    return not v8();
                end
            }, 
            {
                Name = "UseSceneOriginAsPivot", 
                Editable = true
            }, 
            {
                Name = "Anchored", 
                Editable = true
            }, 
            {
                Name = "UsesCages", 
                Editable = true
            }
        }
    }, 
    {
        Section = "RigGeneral", 
        Properties = {
            {
                Name = "RigType", 
                Editable = true
            }, 
            {
                Name = "ValidateUgcBody", 
                Editable = true, 
                ShouldHide = v20, 
                Callouts = {
                    {
                        Name = "OpenAvatarPreviewCallout", 
                        ShouldShow = v29
                    }
                }
            }, 
            {
                Name = "RigScale", 
                Editable = true, 
                ShouldHide = v17
            }
        }, 
        Callouts = {
            {
                Name = "OpenAvatarPreviewCallout", 
                ShouldShow = v29
            }
        }
    }, 
    {
        Section = "AnimationGeneral", 
        Properties = {
            {
                Name = "RestPose", 
                Editable = true, 
                ShouldHide = v11
            }, 
            {
                Name = "AnimationIdForRestPose", 
                Editable = true, 
                ComponentFactory = v3, 
                ShouldHide = v14
            }
        }
    }, 
    {
        Section = "FileTransform", 
        Properties = {
            {
                Name = "WorldForward", 
                Editable = true, 
                Dependencies = {
                    "WorldUp"
                }
            }, 
            {
                Name = "WorldUp", 
                Editable = true, 
                Dependencies = {
                    "WorldForward"
                }
            }
        }
    }, 
    {
        Section = "FileGeometry", 
        Properties = {
            {
                Name = "ScaleUnit", 
                Editable = true
            }, 
            {
                Name = "FileDimensions", 
                Editable = false, 
                Dependencies = {
                    "ScaleUnit"
                }
            }, 
            {
                Name = "PolygonCount", 
                Editable = false
            }, 
            {
                Name = "MergeMeshes", 
                Editable = true, 
                ShouldHide = function(v31) --[[ Line: 68 ]] --[[ Name: hideIfPackage ]]
                    return v31.AddModelToInventory and v31.ImportAsPackage;
                end
            }, 
            {
                Name = "InvertNegativeFaces", 
                Editable = true
            }
        }
    }
};