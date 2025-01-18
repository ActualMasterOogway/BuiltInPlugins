local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.flags.getFIntMeshDivision);
local v3 = require(l_Parent_0.flags.getFIntMeshDivisionFull);
local v4 = require(l_Parent_0.flags.getFIntMeshDivisionFullExtended);
local v5 = require(l_Parent_0.flags.getFIntMeshDivisionMedium);
local v6 = require(l_Parent_0.flags.getFIntMeshDivisionNarrow);
local v7 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationAdjustLegBounds);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidateSurfaceAppearanceAlphaMode);
local v10 = require(l_Parent_0.flags.getFFlagUGCValidateAddSpecificPropertyRequirements);
local v11 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateRestrictAttachmentPositions);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableBodyBounds);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableFullBodyBounds);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableAssetTriangleLimits);
local v16 = game:DefineFastInt("UGCValidateTriangleLimitDynamicHead", 4000);
local v17 = game:DefineFastInt("UGCValidateTriangleLimitLeftArm", 1248);
local v18 = game:DefineFastInt("UGCValidateTriangleLimitRightArm", 1248);
local v19 = game:DefineFastInt("UGCValidateTriangleLimitTorso", 1750);
local v20 = game:DefineFastInt("UGCValidateTriangleLimitLeftLeg", 1248);
local v21 = game:DefineFastInt("UGCValidateTriangleLimitRightLeg", 1248);
local v22 = require(l_Parent_0.ConstantBounds);
local _ = function(v23) --[[ Line: 36 ]] --[[ Name: convertArrayToTable ]]
    local v24 = {};
    for _, v26 in pairs(v23) do
        v24[v26] = true;
    end;
    return v24;
end;
local v28 = {
    MAX_HAT_TRIANGLES = 4000, 
    MAX_TEXTURE_SIZE = 1024
};
local v29 = {
    Enum.Material.Plastic
};
local v30 = {};
for _, v32 in pairs(v29) do
    v30[v32] = true;
end;
v28.MATERIAL_WHITELIST = v30;
v28.BANNED_CLASS_NAMES = {
    "Script", 
    "LocalScript", 
    "ModuleScript", 
    "ParticleEmitter", 
    "Fire", 
    "Smoke", 
    "Sparkles"
};
v28.R6_BODY_PARTS = {
    "Torso", 
    "Left Leg", 
    "Right Leg", 
    "Left Arm", 
    "Right Arm"
};
v28.R15_BODY_PARTS = {
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
v28.UGC_BODY_PARTS = {
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
v28.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
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
v28.ASSET_TYPES_THAT_SKIP_FOLDER = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory, 
    Enum.AssetType.HairAccessory
};
v28.FOLDER_NAMES = {
    R6 = "R6", 
    R15ArtistIntent = "R15ArtistIntent", 
    R15Fixed = "R15Fixed"
};
v28.EXTRA_BANNED_NAMES = {
    "Head", 
    "HumanoidRootPart", 
    "Humanoid"
};
for _, v34 in ipairs({
    "Body Colors", 
    "Shirt Graphic", 
    "Shirt", 
    "Pants", 
    "Health", 
    "Animate"
}) do
    table.insert(v28.EXTRA_BANNED_NAMES, v34);
end;
v30 = v1.Dictionary.join(v28.R6_BODY_PARTS, v28.R15_BODY_PARTS, v28.EXTRA_BANNED_NAMES);
local v35 = {};
for _, v37 in pairs(v30) do
    v35[v37] = true;
end;
v28.BANNED_NAMES = v35;
v28.ASSET_STATUS = {
    UNKNOWN = "Unknown", 
    REVIEW_PENDING = "ReviewPending", 
    MODERATED = "Moderated"
};
v28.ASSET_TYPE_INFO = {};
v28.ASSET_TYPE_INFO[Enum.AssetType.Hat] = {
    attachmentNames = {
        "HatAttachment"
    }, 
    bounds = {
        HatAttachment = {
            size = Vector3.new(3, 4, 3, 0)
        }
    }, 
    rigidAllowed = true
};
v28.ASSET_TYPE_INFO[Enum.AssetType.HairAccessory] = {
    attachmentNames = {
        "HairAttachment"
    }, 
    bounds = {
        HairAttachment = {
            size = Vector3.new(3, 5, 3.5, 0), 
            offset = Vector3.new(0, -0.5, 0.25, 0)
        }
    }, 
    rigidAllowed = true
};
v29 = {
    size = Vector3.new(3, 2, 2, 0)
};
v28.ASSET_TYPE_INFO[Enum.AssetType.FaceAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    bounds = {
        FaceFrontAttachment = v29, 
        FaceCenterAttachment = v29
    }, 
    rigidAllowed = true
};
v28.ASSET_TYPE_INFO[Enum.AssetType.NeckAccessory] = {
    attachmentNames = {
        "NeckAttachment"
    }, 
    bounds = {
        NeckAttachment = {
            size = Vector3.new(3, 3, 2, 0)
        }
    }, 
    rigidAllowed = true
};
v30 = {
    size = Vector3.new(3, 3, 3, 0)
};
v28.ASSET_TYPE_INFO[Enum.AssetType.ShoulderAccessory] = {
    attachmentNames = {
        "NeckAttachment", 
        "LeftCollarAttachment", 
        "RightCollarAttachment", 
        "LeftShoulderAttachment", 
        "RightShoulderAttachment"
    }, 
    bounds = {
        NeckAttachment = {
            size = Vector3.new(7, 3, 3, 0)
        }, 
        LeftCollarAttachment = v30, 
        RightCollarAttachment = v30, 
        LeftShoulderAttachment = v30, 
        RightShoulderAttachment = v30
    }, 
    rigidAllowed = true
};
v28.ASSET_TYPE_INFO[Enum.AssetType.FrontAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }, 
    bounds = {
        BodyFrontAttachment = {
            size = Vector3.new(3, 3, 3, 0)
        }
    }, 
    rigidAllowed = true
};
v28.ASSET_TYPE_INFO[Enum.AssetType.BackAccessory] = {
    attachmentNames = {
        "BodyBackAttachment"
    }, 
    bounds = {
        BodyBackAttachment = {
            size = Vector3.new(10, 7, 4.5, 0), 
            offset = Vector3.new(0, 0, 0.75, 0)
        }
    }, 
    rigidAllowed = true
};
v35 = {
    size = Vector3.new(4, 3.5, 7, 0), 
    offset = Vector3.new(0, -0.25, 0, 0)
};
v28.ASSET_TYPE_INFO[Enum.AssetType.WaistAccessory] = {
    attachmentNames = {
        "WaistBackAttachment", 
        "WaistFrontAttachment", 
        "WaistCenterAttachment"
    }, 
    bounds = {
        WaistBackAttachment = v35, 
        WaistFrontAttachment = v35, 
        WaistCenterAttachment = v35
    }, 
    rigidAllowed = true
};
v28.ASSET_TYPE_INFO[Enum.AssetType.TShirtAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.ShirtAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.PantsAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.JacketAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.SweaterAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.ShortsAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.LeftShoeAccessory] = {
    attachmentNames = {
        "LeftFootAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.RightShoeAccessory] = {
    attachmentNames = {
        "RightFootAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.DressSkirtAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.EyebrowAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    layeredClothingBounds = {
        FaceFrontAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5, 0)
        }, 
        FaceCenterAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5, 0)
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.EyelashAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    layeredClothingBounds = {
        FaceFrontAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5, 0)
        }, 
        FaceCenterAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5, 0)
        }
    }
};
v28.AvatarPartScaleTypes = {
    Classic = true, 
    ProportionsSlender = true, 
    ProportionsNormal = true
};
local v38 = v4() / 100;
local v39 = v2() / 100;
local v40 = v3() / 100;
local v41 = v5() / 100;
local v42 = if v12() then v6() / 100 else nil;
local v43 = {
    min = Vector3.new(-v40, -v40, -v40), 
    max = Vector3.new(v40, v40, v40)
};
local v44 = {
    min = Vector3.new(-v38, -v38, -v38), 
    max = Vector3.new(v38, v38, v38)
};
local v45 = {
    min = v43.min, 
    max = Vector3.new(-v41, v43.max.y, v43.max.z)
};
local v46 = {
    min = Vector3.new(v41, v43.min.y, v43.min.z), 
    max = v43.max
};
local v47 = {
    min = Vector3.new(v43.min.x, v39, v43.min.z), 
    max = v43.max
};
local v48 = if v12() then {
    min = Vector3.new(v43.min.X, v39, -v42), 
    max = Vector3.new(-v39, v43.max.Y, v42)
} else nil;
local v49 = if v12() then {
    min = Vector3.new(v39, v39, -v42), 
    max = Vector3.new(v43.max.X, v43.max.Y, v42)
} else nil;
local v50 = if v12() then {
    min = Vector3.new(-v42, v39, -v42), 
    max = Vector3.new(v42, v43.max.Y, v42)
} else nil;
local v51 = {
    min = Vector3.new(v43.min.x, v39, v43.min.z), 
    max = Vector3.new(v43.max.x, v38, v43.max.z)
};
local v52 = {
    min = v43.min, 
    max = Vector3.new(v43.max.x, -v39, v43.max.z)
};
local v53 = if v12() then {
    min = Vector3.new(v43.min.X, v43.min.Y, -v42), 
    max = Vector3.new(-v39, -v39, v42)
} else nil;
local v54 = if v12() then {
    min = Vector3.new(v39, v43.min.Y, -v42), 
    max = Vector3.new(v43.max.X, -v39, v42)
} else nil;
local v55 = if v12() then {
    min = Vector3.new(-v42, v43.min.Y, -v42), 
    max = Vector3.new(v42, -v39, v42)
} else nil;
local v56 = {
    min = v43.min, 
    max = Vector3.new(v43.max.x, v43.max.y, -v39)
};
local v57 = {
    min = Vector3.new(v43.min.x, v43.min.y, v39), 
    max = v43.max
};
v28.ASSET_TYPE_INFO[Enum.AssetType.RightArm] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getArmBounds() else {
        Classic = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(2, 3, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(1.5, 4, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(2, 4.5, 2, 0)
        }
    }, 
    subParts = {
        RightHand = {
            rigAttachmentToParent = {
                name = "RightWristRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightGripAttachment = {
                    bounds = v44
                }
            }
        }, 
        RightUpperArm = {
            rigAttachmentToParent = {
                name = "RightShoulderRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightShoulderAttachment = {
                    bounds = v47
                }, 
                RightElbowRigAttachment = {
                    bounds = v52
                }
            }
        }, 
        RightLowerArm = {
            rigAttachmentToParent = {
                name = "RightElbowRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightWristRigAttachment = {
                    bounds = v52
                }
            }
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getHeadBounds() else {
        Classic = {
            minSize = Vector3.new(0.5, 0.5, 0.5, 0), 
            maxSize = Vector3.new(1.5, 1.75, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.5, 0.5, 0.5, 0), 
            maxSize = Vector3.new(2, 2, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.5, 0.5, 0.5, 0), 
            maxSize = Vector3.new(3, 2, 2, 0)
        }
    }, 
    subParts = {
        Head = {
            rigAttachmentToParent = {
                name = "NeckRigAttachment", 
                bounds = v52
            }, 
            otherAttachments = {
                FaceFrontAttachment = {
                    bounds = v56
                }, 
                HatAttachment = {
                    bounds = v47
                }, 
                HairAttachment = {
                    bounds = v47
                }, 
                FaceCenterAttachment = {
                    bounds = v43
                }
            }
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.LeftArm] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getArmBounds() else {
        Classic = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(2, 3, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(1.5, 4, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 1.5, 0.25, 0), 
            maxSize = Vector3.new(2, 4.5, 2, 0)
        }
    }, 
    subParts = {
        LeftLowerArm = {
            rigAttachmentToParent = {
                name = "LeftElbowRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftWristRigAttachment = {
                    bounds = v52
                }
            }
        }, 
        LeftUpperArm = {
            rigAttachmentToParent = {
                name = "LeftShoulderRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftElbowRigAttachment = {
                    bounds = v52
                }, 
                LeftShoulderAttachment = {
                    bounds = v47
                }
            }
        }, 
        LeftHand = {
            rigAttachmentToParent = {
                name = "LeftWristRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftGripAttachment = {
                    bounds = v44
                }
            }
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.Torso] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getTorsoBounds() else {
        Classic = {
            minSize = Vector3.new(1, 2, 0.699999988079071, 0), 
            maxSize = Vector3.new(3.5, 3.25, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(1, 2, 0.699999988079071, 0), 
            maxSize = Vector3.new(2.5, 3, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(1, 2, 0.699999988079071, 0), 
            maxSize = Vector3.new(4, 3, 2.25, 0)
        }
    }, 
    subParts = {
        UpperTorso = {
            rigAttachmentToParent = {
                name = "WaistRigAttachment", 
                bounds = if v12() then v55 else v52
            }, 
            otherAttachments = {
                LeftShoulderRigAttachment = {
                    bounds = if v12() then v48 else v45
                }, 
                RightCollarAttachment = {
                    bounds = v46
                }, 
                BodyBackAttachment = {
                    bounds = v57
                }, 
                NeckRigAttachment = {
                    bounds = v47
                }, 
                BodyFrontAttachment = {
                    bounds = v56
                }, 
                RightShoulderRigAttachment = {
                    bounds = if v12() then v49 else v46
                }, 
                LeftCollarAttachment = {
                    bounds = v45
                }, 
                NeckAttachment = {
                    bounds = v51
                }
            }
        }, 
        LowerTorso = {
            rigAttachmentToParent = {
                name = "RootRigAttachment", 
                bounds = v43
            }, 
            otherAttachments = {
                WaistCenterAttachment = {
                    bounds = v43
                }, 
                LeftHipRigAttachment = {
                    bounds = if v12() then v53 else v45
                }, 
                RightHipRigAttachment = {
                    bounds = if v12() then v54 else v46
                }, 
                WaistRigAttachment = {
                    bounds = if v12() then v50 else v47
                }, 
                WaistBackAttachment = {
                    bounds = v57
                }, 
                WaistFrontAttachment = {
                    bounds = v56
                }
            }
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.RightLeg] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getLegBounds() else {
        Classic = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = Vector3.new(1.5, 2.75, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = if v8() then Vector3.new(1.5, 3.299999952316284, 2, 0) else Vector3.new(1.5, 3, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = if v8() then Vector3.new(1.5, 3.299999952316284, 2, 0) else Vector3.new(1.5, 3, 2, 0)
        }
    }, 
    subParts = {
        RightUpperLeg = {
            rigAttachmentToParent = {
                name = "RightHipRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightKneeRigAttachment = {
                    bounds = v52
                }
            }
        }, 
        RightFoot = {
            rigAttachmentToParent = {
                name = "RightAnkleRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightFootAttachment = {
                    bounds = v43
                }
            }
        }, 
        RightLowerLeg = {
            rigAttachmentToParent = {
                name = "RightKneeRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                RightAnkleRigAttachment = {
                    bounds = v52
                }
            }
        }
    }
};
v28.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg] = {
    isBodyPart = true, 
    bounds = if v13() then v22.getLegBounds() else {
        Classic = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = Vector3.new(1.5, 2.75, 2, 0)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = if v8() then Vector3.new(1.5, 3.299999952316284, 2, 0) else Vector3.new(1.5, 3, 2, 0)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 2, 0.5, 0), 
            maxSize = if v8() then Vector3.new(1.5, 3.299999952316284, 2, 0) else Vector3.new(1.5, 3, 2, 0)
        }
    }, 
    subParts = {
        LeftFoot = {
            rigAttachmentToParent = {
                name = "LeftAnkleRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftFootAttachment = {
                    bounds = v43
                }
            }
        }, 
        LeftUpperLeg = {
            rigAttachmentToParent = {
                name = "LeftHipRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftKneeRigAttachment = {
                    bounds = v52
                }
            }
        }, 
        LeftLowerLeg = {
            rigAttachmentToParent = {
                name = "LeftKneeRigAttachment", 
                bounds = v47
            }, 
            otherAttachments = {
                LeftAnkleRigAttachment = {
                    bounds = v52
                }
            }
        }
    }
};
if v14() then
    v28.FULL_BODY_BOUNDS = v22.getFullBodyBounds();
end;
v28.RenderVsWrapMeshMaxDiff = 1;
v28.LC_BOUNDS = {
    size = Vector3.new(8, 8, 8, 0)
};
if v10() then
    v28.PROPERTIES_UNRESTRICTED = {};
end;
v28.PROPERTIES = {
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
    SurfaceAppearance = if v9() then {
        AlphaMode = Enum.AlphaMode.Overlay
    } else nil
};
if v10() then
    local v58 = {
        BasePart = {
            Color = v28.PROPERTIES_UNRESTRICTED
        }
    };
    v28.SPECIFIC_PROPERTIES = {
        [Enum.AssetType.DynamicHead] = v58, 
        [Enum.AssetType.Torso] = v58, 
        [Enum.AssetType.LeftArm] = v58, 
        [Enum.AssetType.RightArm] = v58, 
        [Enum.AssetType.LeftLeg] = v58, 
        [Enum.AssetType.RightLeg] = v58
    };
end;
v28.CONTENT_ID_FIELDS = {
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
v28.CONTENT_ID_REQUIRED_FIELDS = {
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
v28.MESH_CONTENT_ID_FIELDS = {
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
v28.TEXTURE_CONTENT_ID_FIELDS = {
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
v28.ASSET_RENDER_MESH_MAX_TRIANGLES = if v15() then {
    DynamicHead = v16, 
    LeftArm = v17, 
    RightArm = v18, 
    Torso = v19, 
    LeftLeg = v20, 
    RightLeg = v21
} else {
    DynamicHead = 4000, 
    LeftArm = 1248, 
    RightArm = 1248, 
    Torso = 1750, 
    LeftLeg = 1248, 
    RightLeg = 1248
};
v28.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
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
if v7() then
    v28.PACKAGE_CONTENT_ID_FIELDS = v1.Dictionary.join(v28.CONTENT_ID_FIELDS, if v11() then {
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
    v28.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization";
    v28.ContentType = "Content-Type";
    v28.ApplicationJson = "application/json";
end;
v28.GUIDAttributeName = "RBXGUID";
v28.GUIDAttributeMaxLength = 100;
v28.ProxyWrapAttributeName = "RBX_WRAP_DEFORMER_PROXY";
v28.AlternateMeshIdAttributeName = "RBX_ALT_MESH_ID";
return v28;