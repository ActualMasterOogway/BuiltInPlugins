local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.enumerate);
local l_Util_0 = l_Parent_0.Core.Util;
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v4 = require(l_Util_0.convertArrayToTable);
local v5 = {
    WIDTH = 1100, 
    HEIGHT = 860, 
    MIN_WIDTH = 900, 
    MIN_HEIGHT = 500, 
    TERM_OF_USE_URL = "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use", 
    ACCOUNT_SETTING_URL = "https://www.roblox.com/my/account#!/info", 
    NAME_CHARACTER_LIMIT = 50, 
    DESCRIPTION_CHARACTER_LIMIT = 1000, 
    PACKAGE_NOTE_CHARACTER_LIMIT = 500, 
    TITLE_GUTTER_WIDTH = 180, 
    OverrideAssetItemSize = UDim2.new(0, 150, 0, 200), 
    PreviewTypes = v4({
        "ImagePicker", 
        "Thumbnail", 
        "ModelPreview"
    }), 
    SIDE_TABS = v4({
        "Sales", 
        "General", 
        "Versions", 
        "Override", 
        "Permissions"
    }), 
    FIELD_NAMES = v4({
        "Title", 
        "Description", 
        "Price"
    }), 
    GENRE_TYPE = {
        {
            name = Enum.Genre.All.Name
        }, 
        {
            name = Enum.Genre.TownAndCity.Name
        }, 
        {
            name = Enum.Genre.Fantasy.Name
        }, 
        {
            name = Enum.Genre.SciFi.Name
        }, 
        {
            name = Enum.Genre.Ninja.Name
        }, 
        {
            name = Enum.Genre.Scary.Name
        }, 
        {
            name = Enum.Genre.Pirate.Name
        }, 
        {
            name = Enum.Genre.Adventure.Name
        }, 
        {
            name = Enum.Genre.Sports.Name
        }, 
        {
            name = Enum.Genre.Funny.Name
        }, 
        {
            name = Enum.Genre.WildWest.Name
        }, 
        {
            name = Enum.Genre.War.Name
        }, 
        {
            name = Enum.Genre.SkatePark.Name
        }, 
        {
            name = Enum.Genre.Tutorial.Name
        }
    }, 
    FLOW_TYPE = v4({
        "EDIT_FLOW", 
        "UPLOAD_FLOW", 
        "DOWNLOAD_FLOW"
    }), 
    SCREENS = v4({
        "ASSET_TYPE_SELECTION", 
        "ASSET_VALIDATION", 
        "CONFIGURE_ASSET", 
        "UPLOADING_ASSET", 
        "UPLOAD_ASSET_RESULT"
    }), 
    ASSET_STATUS = v4({
        "Unknown", 
        "ReviewPending", 
        "Moderated", 
        "ReviewApproved", 
        "OnSale", 
        "OffSale", 
        "DelayedRelease", 
        "Free"
    }), 
    RESTRICTION_TYPE = if v3() then v4({
        "AssetType", 
        "Authorization", 
        "Invalid", 
        "KillSwitch", 
        "Quota", 
        "SafetyStatus", 
        "SellerAccountNotOnboarded", 
        "SellerAccountRestricted", 
        "UnsupportedAssetOwner", 
        "Verification"
    }) else nil, 
    SALES_STATUS_FOR_PRICE = v4({
        "OnSale"
    })
};
local function _(v6, v7) --[[ Line: 110 ]] --[[ Name: catalogAssetInfo ]]
    return {
        type = v6, 
        isCatalog = true, 
        isUploadable = v7 == true
    };
end;
local function _(v9, v10) --[[ Line: 118 ]] --[[ Name: marketplaceAssetInfo ]]
    return {
        type = v9, 
        isMarketplace = true, 
        isBuyable = v10 == true
    };
end;
v5.ASSET_TYPE_INFO = {
    {
        type = Enum.AssetType.Hat, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.TShirt, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.Shirt, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.Pants, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.HairAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.FaceAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.NeckAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShoulderAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.FrontAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.BackAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.WaistAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.TShirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.PantsAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.JacketAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.SweaterAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShortsAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.LeftShoeAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.RightShoeAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.DressSkirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.Model, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Decal, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Mesh, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.MeshPart, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Audio, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Animation, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Video, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Plugin, 
        isMarketplace = true, 
        isBuyable = true
    }
};
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.Package, 
    isMarketplace = true, 
    isBuyable = false
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.Torso, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.RightArm, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.LeftArm, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.LeftLeg, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.RightLeg, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.DynamicHead, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.EyebrowAccessory, 
    isCatalog = true, 
    isUploadable = true
});
table.insert(v5.ASSET_TYPE_INFO, {
    type = Enum.AssetType.EyelashAccessory, 
    isCatalog = true, 
    isUploadable = true
});
for _, v13 in ipairs(v5.ASSET_TYPE_INFO) do
    if next(v13) ~= nil then
        if v13.isCatalog and v13.isMarketplace then
            error(tostring(v13.type) .. " cannot be both a catalog and marketplace asset");
        end;
        if v5.ASSET_TYPE_INFO[v13.type] then
            error("AssetConfigConstants.ASSET_TYPE_INFO contains a duplicate of " .. tostring(v13.type));
        end;
        v5.ASSET_TYPE_INFO[v13.type] = v13;
    end;
end;
v5.developCategoryType = v4({
    "WhitelistedPlugins", 
    "MyPlugins", 
    "GroupPlugins"
});
v5.packagesCategoryType = v4({
    "MyPackages", 
    "GroupPackages"
});
v5.rbxThumbTypes = v4({
    "Asset", 
    "Avatar", 
    "AvatarHeadShot", 
    "BadgeIcon", 
    "BundleThumbnail", 
    "GameIcon", 
    "GamePass", 
    "GroupIcon", 
    "Outfit"
});
v5.rbxThumbSizes = {
    AvatarHeadshotImageSize = 60, 
    GroupIconImageSize = 150, 
    AssetThumbnailSize = 420
};
v5.additionalImages = {
    MaxThumbnails = 5, 
    AspectRatioHeight = 9, 
    AspectRatioWidth = 16, 
    RecommendedHeight = 432, 
    RecommendedWidth = 768
};
v5.IMAGE_TYPES = {
    "jpg", 
    "jpeg", 
    "png"
};
v5.TAGS_SUGGESTION_SUCCESS = "Success";
v5.MAX_DISPLAY_SUGGESTIONS = 5;
v5.MAX_FETCH_SUGGESTIONS = 10;
v5.AVATAR_MESHPART_ACCESSORY_FORMAT = "avatar_meshpart_accessory";
v5.MULTIPART_FORM_BOUNDARY = "EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E";
v5.OVERRIDE_ASSET_ID = "OverrideAssetId";
v5.SHARING_KEYS = {
    Public = true, 
    Private = false
};
v5.UGCBundleTypes = v1("UGCBundleTypes", {
    "Body", 
    "DynamicHead"
});
v5.UGCBundleTypeStringToEnumeration = {
    [v5.UGCBundleTypes.Body.rawValue()] = v5.UGCBundleTypes.Body, 
    [v5.UGCBundleTypes.DynamicHead.rawValue()] = v5.UGCBundleTypes.DynamicHead
};
v5.AllowedAssetStringsMetadataToAssetTypeMap = {
    DynamicHead = Enum.AssetType.DynamicHead, 
    LeftArm = Enum.AssetType.LeftArm, 
    LeftLeg = Enum.AssetType.LeftLeg, 
    RightArm = Enum.AssetType.RightArm, 
    RightLeg = Enum.AssetType.RightLeg, 
    Torso = Enum.AssetType.Torso, 
    EyebrowAccessory = Enum.AssetType.EyebrowAccessory, 
    EyelashAccessory = Enum.AssetType.EyelashAccessory, 
    HairAccessory = Enum.AssetType.HairAccessory
};
v5.UGC_BODY_PARTS = {
    Head = "Head", 
    UpperTorso = "UpperTorso", 
    LowerTorso = "LowerTorso", 
    LeftUpperLeg = "LeftUpperLeg", 
    LeftLowerLeg = "LeftLowerLeg", 
    LeftHand = "LeftHand", 
    RightUpperArm = "RightUpperArm", 
    RightLowerArm = "RightLowerArm", 
    RightHand = "RightHand", 
    LeftUpperArm = "LeftUpperArm", 
    LeftLowerArm = "LeftLowerArm", 
    LeftFoot = "LeftFoot", 
    RightUpperLeg = "RightUpperLeg", 
    RightLowerLeg = "RightLowerLeg", 
    RightFoot = "RightFoot", 
    EyebrowAccessory = "EyebrowAccessory", 
    EyelashAccessory = "EyelashAccessory", 
    HairAccessory = "HairAccessory"
};
v5.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
    [v5.UGC_BODY_PARTS.Head] = Enum.AssetType.DynamicHead, 
    [v5.UGC_BODY_PARTS.UpperTorso] = Enum.AssetType.Torso, 
    [v5.UGC_BODY_PARTS.LowerTorso] = Enum.AssetType.Torso, 
    [v5.UGC_BODY_PARTS.LeftUpperArm] = Enum.AssetType.LeftArm, 
    [v5.UGC_BODY_PARTS.LeftLowerArm] = Enum.AssetType.LeftArm, 
    [v5.UGC_BODY_PARTS.LeftHand] = Enum.AssetType.LeftArm, 
    [v5.UGC_BODY_PARTS.RightUpperArm] = Enum.AssetType.RightArm, 
    [v5.UGC_BODY_PARTS.RightLowerArm] = Enum.AssetType.RightArm, 
    [v5.UGC_BODY_PARTS.RightHand] = Enum.AssetType.RightArm, 
    [v5.UGC_BODY_PARTS.LeftUpperLeg] = Enum.AssetType.LeftLeg, 
    [v5.UGC_BODY_PARTS.LeftLowerLeg] = Enum.AssetType.LeftLeg, 
    [v5.UGC_BODY_PARTS.LeftFoot] = Enum.AssetType.LeftLeg, 
    [v5.UGC_BODY_PARTS.RightUpperLeg] = Enum.AssetType.RightLeg, 
    [v5.UGC_BODY_PARTS.RightLowerLeg] = Enum.AssetType.RightLeg, 
    [v5.UGC_BODY_PARTS.RightFoot] = Enum.AssetType.RightLeg, 
    [v5.UGC_BODY_PARTS.EyebrowAccessory] = Enum.AssetType.EyebrowAccessory, 
    [v5.UGC_BODY_PARTS.EyelashAccessory] = Enum.AssetType.EyelashAccessory, 
    [v5.UGC_BODY_PARTS.HairAccessory] = Enum.AssetType.HairAccessory
};
return v5;