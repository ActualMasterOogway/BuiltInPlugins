local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.DEPRECATED_Constants);
if not require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationEnableGetValidationRules)() then
    return v2;
else
    local v3 = require(l_Parent_0.util.ValidationRulesUtil);
    local v4 = require(l_Parent_0.ConstantBounds);
    local v5 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
    local v6 = require(l_Parent_0.flags.getFFlagUGCValidateSurfaceAppearanceAlphaMode);
    local v7 = require(l_Parent_0.flags.getFFlagUGCValidateAddSpecificPropertyRequirements);
    local v8 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
    local v9 = require(l_Parent_0.flags.getEngineFeatureUGCValidateFullBodyBoundsAvatarRules);
    local v10 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableFullBodyBounds);
    local _ = function(v11) --[[ Line: 27 ]] --[[ Name: convertArrayToTable ]]
        local v12 = {};
        for _, v14 in pairs(v11) do
            v12[v14] = true;
        end;
        return v12;
    end;
    local v16 = {
        MAX_HAT_TRIANGLES = v3:getRules().MeshRules.AccessoryMaxTriangles, 
        MAX_TEXTURE_SIZE = v3:getRules().TextureRules.MaxTextureSize
    };
    local v17 = {
        Enum.Material.Plastic
    };
    local v18 = {};
    for _, v20 in pairs(v17) do
        v18[v20] = true;
    end;
    v16.MATERIAL_WHITELIST = v18;
    v16.BANNED_CLASS_NAMES = {
        "Script", 
        "LocalScript", 
        "ModuleScript", 
        "ParticleEmitter", 
        "Fire", 
        "Smoke", 
        "Sparkles"
    };
    v16.R6_BODY_PARTS = {
        "Torso", 
        "Left Leg", 
        "Right Leg", 
        "Left Arm", 
        "Right Arm"
    };
    v16.R15_BODY_PARTS = {
        "UpperTorso", 
        "LowerTorso", 
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot", 
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot", 
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand", 
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand"
    };
    v16.UGC_BODY_PARTS = {
        "Head", 
        "UpperTorso", 
        "LowerTorso", 
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftHand", 
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand", 
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftFoot", 
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot", 
        "EyebrowAccessory", 
        "EyelashAccessory", 
        "HairAccessory"
    };
    v16.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
        Head = Enum.AssetType.DynamicHead, 
        UpperTorso = Enum.AssetType.Torso, 
        LowerTorso = Enum.AssetType.Torso, 
        LeftUpperArm = Enum.AssetType.LeftArm, 
        LeftLowerArm = Enum.AssetType.LeftArm, 
        LeftHand = Enum.AssetType.LeftArm, 
        RightUpperArm = Enum.AssetType.RightArm, 
        RightLowerArm = Enum.AssetType.RightArm, 
        RightHand = Enum.AssetType.RightArm, 
        LeftUpperLeg = Enum.AssetType.LeftLeg, 
        LeftLowerLeg = Enum.AssetType.LeftLeg, 
        LeftFoot = Enum.AssetType.LeftLeg, 
        RightUpperLeg = Enum.AssetType.RightLeg, 
        RightLowerLeg = Enum.AssetType.RightLeg, 
        RightFoot = Enum.AssetType.RightLeg, 
        EyebrowAccessory = Enum.AssetType.EyebrowAccessory, 
        EyelashAccessory = Enum.AssetType.EyelashAccessory, 
        HairAccessory = Enum.AssetType.HairAccessory
    };
    v16.ASSET_TYPES_THAT_SKIP_FOLDER = {
        Enum.AssetType.DynamicHead, 
        Enum.AssetType.EyebrowAccessory, 
        Enum.AssetType.EyelashAccessory, 
        Enum.AssetType.HairAccessory
    };
    v16.FOLDER_NAMES = {
        R6 = "R6", 
        R15ArtistIntent = "R15ArtistIntent", 
        R15Fixed = "R15Fixed"
    };
    v16.EXTRA_BANNED_NAMES = {
        "Head", 
        "HumanoidRootPart", 
        "Humanoid"
    };
    for _, v22 in ipairs({
        "Body Colors", 
        "Shirt Graphic", 
        "Shirt", 
        "Pants", 
        "Health", 
        "Animate"
    }) do
        table.insert(v16.EXTRA_BANNED_NAMES, v22);
    end;
    v18 = v1.Dictionary.join(v16.R6_BODY_PARTS, v16.R15_BODY_PARTS, v16.EXTRA_BANNED_NAMES);
    local v23 = {};
    for _, v25 in pairs(v18) do
        v23[v25] = true;
    end;
    v16.BANNED_NAMES = v23;
    v16.ASSET_STATUS = {
        UNKNOWN = "Unknown", 
        REVIEW_PENDING = "ReviewPending", 
        MODERATED = "Moderated"
    };
    v16.ASSET_TYPE_INFO = {};
    v3:getAccessoryRules(v16.ASSET_TYPE_INFO);
    if v9() then
        v16.FULL_BODY_BOUNDS = v3:getFullBodyRulesBounds();
    elseif v10() then
        v16.FULL_BODY_BOUNDS = v4.getFullBodyBounds();
    end;
    v16.AvatarPartScaleTypes = {
        Classic = true, 
        ProportionsSlender = true, 
        ProportionsNormal = true
    };
    v3:getBodyPartRules(v16.ASSET_TYPE_INFO);
    v16.RenderVsWrapMeshMaxDiff = v3:getRules().MeshRules.CageMeshMaxDistanceFromRenderMesh;
    if v7() then
        v16.PROPERTIES_UNRESTRICTED = {};
    end;
    v16.PROPERTIES = {
        Instance = {
            Archivable = true
        }, 
        Attachment = {
            Visible = false
        }, 
        SpecialMesh = {
            MeshType = Enum.MeshType.FileMesh, 
            Offset = Vector3.new(0, 0, 0, 0), 
            VertexColor = Vector3.new(1, 1, 1, 0)
        }, 
        BasePart = {
            Anchored = false, 
            Color = BrickColor.new("Medium stone grey").Color, 
            CollisionGroupId = 0, 
            CustomPhysicalProperties = v1.None, 
            Elasticity = 0.5, 
            Friction = 0.3, 
            LocalTransparencyModifier = 0, 
            Massless = false, 
            Reflectance = 0, 
            RootPriority = 0, 
            RotVelocity = Vector3.new(0, 0, 0, 0), 
            Transparency = 0, 
            Velocity = Vector3.new(0, 0, 0, 0), 
            BackParamA = -0.5, 
            BackParamB = 0.5, 
            BackSurfaceInput = Enum.InputType.NoInput, 
            BottomParamA = -0.5, 
            BottomParamB = 0.5, 
            BottomSurfaceInput = Enum.InputType.NoInput, 
            FrontParamA = -0.5, 
            FrontParamB = 0.5, 
            FrontSurfaceInput = Enum.InputType.NoInput, 
            LeftParamA = -0.5, 
            LeftParamB = 0.5, 
            LeftSurfaceInput = Enum.InputType.NoInput, 
            RightParamA = -0.5, 
            RightParamB = 0.5, 
            RightSurfaceInput = Enum.InputType.NoInput, 
            TopParamA = -0.5, 
            TopParamB = 0.5, 
            TopSurfaceInput = Enum.InputType.NoInput, 
            BackSurface = Enum.SurfaceType.Smooth, 
            BottomSurface = Enum.SurfaceType.Smooth, 
            FrontSurface = Enum.SurfaceType.Smooth, 
            LeftSurface = Enum.SurfaceType.Smooth, 
            RightSurface = Enum.SurfaceType.Smooth, 
            TopSurface = Enum.SurfaceType.Smooth
        }, 
        Part = {
            Shape = Enum.PartType.Block
        }, 
        SurfaceAppearance = if v6() then {
            AlphaMode = Enum.AlphaMode.Overlay
        } else nil
    };
    if v7() then
        v17 = {
            BasePart = {
                Color = v16.PROPERTIES_UNRESTRICTED
            }
        };
        v16.SPECIFIC_PROPERTIES = {
            [Enum.AssetType.DynamicHead] = v17, 
            [Enum.AssetType.Torso] = v17, 
            [Enum.AssetType.LeftArm] = v17, 
            [Enum.AssetType.RightArm] = v17, 
            [Enum.AssetType.LeftLeg] = v17, 
            [Enum.AssetType.RightLeg] = v17
        };
    end;
    v16.CONTENT_ID_FIELDS = {
        SpecialMesh = {
            "MeshId", 
            "TextureId"
        }, 
        MeshPart = {
            "MeshId", 
            "TextureID"
        }, 
        SurfaceAppearance = {
            "ColorMap", 
            "MetalnessMap", 
            "NormalMap", 
            "RoughnessMap"
        }, 
        WrapLayer = {
            "CageMeshId", 
            "ReferenceMeshId"
        }, 
        WrapTarget = {
            "CageMeshId"
        }
    };
    v16.CONTENT_ID_REQUIRED_FIELDS = {
        SpecialMesh = {
            MeshId = true, 
            TextureId = true
        }, 
        MeshPart = {
            MeshId = true
        }, 
        WrapTarget = {
            CageMeshId = true
        }
    };
    v16.MESH_CONTENT_ID_FIELDS = {
        SpecialMesh = {
            "MeshId"
        }, 
        MeshPart = {
            "MeshId"
        }, 
        WrapTarget = {
            "CageMeshId"
        }, 
        WrapLayer = {
            "CageMeshId", 
            "ReferenceMeshId"
        }
    };
    v16.TEXTURE_CONTENT_ID_FIELDS = {
        SpecialMesh = {
            "TextureId"
        }, 
        MeshPart = {
            "TextureID"
        }, 
        SurfaceAppearance = {
            "ColorMap", 
            "MetalnessMap", 
            "NormalMap", 
            "RoughnessMap"
        }
    };
    v16.ASSET_RENDER_MESH_MAX_TRIANGLES = {
        DynamicHead = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.DynamicHead), 
        LeftArm = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftArm), 
        RightArm = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.RightArm), 
        Torso = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.Torso), 
        LeftLeg = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftLeg), 
        RightLeg = v3:getBodyPartMaxTrianglesRule(Enum.AssetType.RightLeg)
    };
    v16.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
        Head = 343, 
        LeftUpperArm = 77, 
        LeftLowerArm = 77, 
        LeftHand = 86, 
        RightUpperArm = 77, 
        RightLowerArm = 77, 
        RightHand = 86, 
        UpperTorso = 257, 
        LowerTorso = 105, 
        LeftUpperLeg = 88, 
        LeftLowerLeg = 88, 
        LeftFoot = 86, 
        RightUpperLeg = 88, 
        RightLowerLeg = 88, 
        RightFoot = 86
    };
    if v5() then
        v16.PACKAGE_CONTENT_ID_FIELDS = v1.Dictionary.join(v16.CONTENT_ID_FIELDS, if v8() then {
            Sound = {
                "SoundId"
            }, 
            Decal = {
                "Texture"
            }, 
            VideoFrame = {
                "Video"
            }, 
            PackageLink = {
                "PackageId"
            }, 
            CharacterMesh = {
                "OverlayTextureId", 
                "MeshId", 
                "BaseTextureId"
            }, 
            Tool = {
                "TextureId"
            }, 
            Trail = {
                "Texture"
            }, 
            Beam = {
                "Texture"
            }, 
            ShirtGraphic = {
                "Graphic"
            }, 
            Shirt = {
                "ShirtTemplate"
            }, 
            Pants = {
                "PantsTemplate"
            }, 
            AdGui = {
                "FallbackImage"
            }
        } else {
            Sound = {
                "SoundId"
            }, 
            Decal = {
                "Texture"
            }, 
            VideoFrame = {
                "Video"
            }, 
            PackageLink = {
                "PackageId"
            }, 
            CharacterMesh = {
                "baseTextureAssetId", 
                "overlayTextureAssetId", 
                "meshAssetId"
            }, 
            Tool = {
                "TextureId"
            }, 
            Sky = {
                "SkyUp", 
                "SkyLf", 
                "SkyRt", 
                "SkyBk", 
                "SkyFt", 
                "SkyDn", 
                "Sun", 
                "Moon"
            }, 
            Trail = {
                "texture"
            }, 
            Beam = {
                "texture"
            }, 
            ShirtGraphic = {
                "Graphic"
            }, 
            Shirt = {
                "ShirtTemplate"
            }, 
            Pants = {
                "PantsTemplate"
            }, 
            AdGui = {
                "FallbackImage"
            }
        });
        v16.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization";
        v16.ContentType = "Content-Type";
        v16.ApplicationJson = "application/json";
    end;
    v16.GUIDAttributeName = "RBXGUID";
    v16.GUIDAttributeMaxLength = 100;
    v16.ProxyWrapAttributeName = "RBX_WRAP_DEFORMER_PROXY";
    v16.AlternateMeshIdAttributeName = "RBX_ALT_MESH_ID";
    return v16;
end;