local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxAddVideosToCreationCategories_0 = game:GetFastFlag("ToolboxAddVideosToCreationCategories");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v3 = require(l_script_FirstAncestor_0.Core.Util.CreatorInfoHelper);
local v4 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v5 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v6 = require(l_script_FirstAncestor_0.Core.Util.getAllowedAssetTypeEnums);
local _ = l_script_FirstAncestor_0.Packages;
local l_showRobloxCreatedAssets_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local l_disableMarketplaceAndRecents_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).disableMarketplaceAndRecents;
local l_getMarketplaceDisabledCategories_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).getMarketplaceDisabledCategories;
local v11 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v12 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v13 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixDefaultTabForCreations);
local v14 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v15 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixSharedAssetInsert);
local v16 = {
    OwnershipType = {
        FREE = 0, 
        MY = 1, 
        RECENT = 2, 
        GROUP = 3
    }, 
    AssetType = {
        MODEL = 0, 
        DECAL = 1, 
        MESH = 2, 
        MESHPART = 3, 
        AUDIO = 4, 
        PACKAGE = 5, 
        PLUGIN = 6, 
        HAT = 7, 
        TEE_SHIRT = 8, 
        SHIRT = 9, 
        PANTS = 10, 
        HAIR_ACCESSORY = 11, 
        FACE_ACCESSORY = 12, 
        NECK_ACCESSORY = 13, 
        SHOULDER_ACCESSORY = 14, 
        FRONT_ACCESSORY = 15, 
        BACK_ACCESSORY = 16, 
        WAIST_ACCESSORY = 17, 
        VIDEO = 18, 
        TSHIRT_ACCESSORY = 19, 
        SHIRT_ACCESSORY = 20, 
        PANTS_ACCESSORY = 21, 
        JACKET_ACCESSORY = 22, 
        SWEATER_ACCESSORY = 23, 
        SHORTS_ACCESSORY = 24, 
        LEFT_SHOE_ACCESSORY = 25, 
        RIGHT_SHOE_ACCESSORY = 26, 
        DRESS_SKIRT_ACCESSORY = 27, 
        ANIMATION = 28, 
        FONT_FAMILY = 73, 
        MUSIC = 300, 
        SOUND_EFFECT = 301, 
        UNKNOWN_AUDIO = 302
    }, 
    AssetTypeInverted = {}
};
for v17, v18 in pairs(v16.AssetType) do
    v16.AssetTypeInverted[v18] = v17;
end;
v16.MUSIC = {
    name = "Music", 
    category = "Music", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.MUSIC
};
v16.SOUND_EFFECTS = {
    name = "SoundEffect", 
    category = "SoundEffect", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.SOUND_EFFECT
};
v16.UNKNOWN_AUDIO = {
    name = "UnknownAudio", 
    category = "UnknownAudio", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.UNKNOWN_AUDIO
};
v16.ToolboxAssetTypeToEngine = {
    [v16.AssetType.MODEL] = Enum.AssetType.Model, 
    [v16.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v16.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v16.AssetType.MESHPART] = Enum.AssetType.MeshPart, 
    [v16.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v16.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v16.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v16.AssetType.HAT] = Enum.AssetType.Hat, 
    [v16.AssetType.TEE_SHIRT] = Enum.AssetType.TShirt, 
    [v16.AssetType.SHIRT] = Enum.AssetType.Shirt, 
    [v16.AssetType.PANTS] = Enum.AssetType.Pants, 
    [v16.AssetType.HAIR_ACCESSORY] = Enum.AssetType.HairAccessory, 
    [v16.AssetType.FACE_ACCESSORY] = Enum.AssetType.FaceAccessory, 
    [v16.AssetType.NECK_ACCESSORY] = Enum.AssetType.NeckAccessory, 
    [v16.AssetType.SHOULDER_ACCESSORY] = Enum.AssetType.ShoulderAccessory, 
    [v16.AssetType.FRONT_ACCESSORY] = Enum.AssetType.FrontAccessory, 
    [v16.AssetType.BACK_ACCESSORY] = Enum.AssetType.BackAccessory, 
    [v16.AssetType.WAIST_ACCESSORY] = Enum.AssetType.WaistAccessory, 
    [v16.AssetType.VIDEO] = Enum.AssetType.Video, 
    [v16.AssetType.ANIMATION] = Enum.AssetType.Animation, 
    [v16.AssetType.TSHIRT_ACCESSORY] = Enum.AssetType.TShirtAccessory, 
    [v16.AssetType.SHIRT_ACCESSORY] = Enum.AssetType.ShirtAccessory, 
    [v16.AssetType.PANTS_ACCESSORY] = Enum.AssetType.PantsAccessory, 
    [v16.AssetType.JACKET_ACCESSORY] = Enum.AssetType.JacketAccessory, 
    [v16.AssetType.SWEATER_ACCESSORY] = Enum.AssetType.SweaterAccessory, 
    [v16.AssetType.SHORTS_ACCESSORY] = Enum.AssetType.ShortsAccessory, 
    [v16.AssetType.LEFT_SHOE_ACCESSORY] = Enum.AssetType.LeftShoeAccessory, 
    [v16.AssetType.RIGHT_SHOE_ACCESSORY] = Enum.AssetType.RightShoeAccessory, 
    [v16.AssetType.DRESS_SKIRT_ACCESSORY] = Enum.AssetType.DressSkirtAccessory, 
    [v16.AssetType.FONT_FAMILY] = Enum.AssetType.FontFamily
};
v16.EngineAssetTypeIdToToolboxAssetType = {};
for v19, v20 in pairs(v16.ToolboxAssetTypeToEngine) do
    v16.EngineAssetTypeIdToToolboxAssetType[v20.Value] = v19;
end;
v16.ToolboxMarketplaceAssetTypes = {
    [v16.AssetType.ANIMATION] = Enum.AssetType.Animation, 
    [v16.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v16.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v16.AssetType.FONT_FAMILY] = Enum.AssetType.FontFamily, 
    [v16.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v16.AssetType.MESHPART] = Enum.AssetType.MeshPart, 
    [v16.AssetType.MODEL] = Enum.AssetType.Model, 
    [v16.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v16.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v16.AssetType.VIDEO] = Enum.AssetType.Video
};
v16.FREE_MODELS = {
    name = "FreeModels", 
    category = "FreeModels", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.MODEL
};
v16.FREE_DECALS = {
    name = "FreeDecals", 
    category = "FreeDecals", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.DECAL
};
v16.FREE_MESHES = {
    name = "FreeMeshes", 
    category = "FreeMeshes", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.MESHPART
};
v16.FREE_AUDIO = {
    name = "FreeAudio", 
    category = "FreeAudio", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.AUDIO
};
v16.WHITELISTED_PLUGINS = {
    name = "PaidPlugins", 
    category = "WhitelistedPlugins", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.PLUGIN
};
v16.FREE_FONTS = {
    name = "FreeFonts", 
    category = "FreeFonts", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.FONT_FAMILY
};
v16.MY_MODELS = {
    name = "MyModels", 
    category = "MyModelsExceptPackage", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.MODEL
};
v16.MY_DECALS = {
    name = "MyDecals", 
    category = "MyDecals", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.DECAL
};
v16.MY_MESHES = {
    name = "MyMeshes", 
    category = "MyMeshes", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.MESH
};
v16.MY_AUDIO = {
    name = "MyAudio", 
    category = "MyAudio", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.AUDIO
};
v16.MY_PLUGINS = {
    name = "MyPlugins", 
    category = "MyPlugins", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.PLUGIN
};
v16.MY_ANIMATIONS = {
    name = "MyAnimations", 
    category = "MyAnimations", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.ANIMATION
};
v16.MY_FONTS = {
    name = "MyFonts", 
    category = "MyFonts", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.FONT_FAMILY
};
v16.MARKETPLACE_VIDEOS = {
    name = "FreeVideo", 
    category = "FreeVideo", 
    ownershipType = v16.OwnershipType.FREE, 
    assetType = v16.AssetType.VIDEO
};
v16.MY_VIDEOS = {
    name = "MyVideo", 
    category = "MyVideo", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.VIDEO
};
v16.RECENT_VIDEO = {
    name = "RecentVideo", 
    category = "RecentVideo", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.VIDEO
};
v16.RECENT_MODELS = {
    name = "RecentModels", 
    category = "RecentModels", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.MODEL
};
v16.RECENT_DECALS = {
    name = "RecentDecals", 
    category = "RecentDecals", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.DECAL
};
v16.RECENT_MESHES = {
    name = "RecentMeshes", 
    category = "RecentMeshes", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.MESH
};
v16.RECENT_AUDIO = {
    name = "RecentAudio", 
    category = "RecentAudio", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.AUDIO
};
v16.RECENT_ANIMATIONS = {
    name = "RecentAnimations", 
    category = "RecentAnimations", 
    ownershipType = v16.OwnershipType.RECENT, 
    assetType = v16.AssetType.ANIMATION
};
v16.GROUP_MODELS = {
    name = "GroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.MODEL
};
v16.GROUP_DECALS = {
    name = "GroupDecals", 
    category = "GroupDecals", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.DECAL
};
v16.GROUP_MESHES = {
    name = "GroupMeshes", 
    category = "GroupMeshes", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.MESH
};
v16.GROUP_AUDIO = {
    name = "GroupAudio", 
    category = "GroupAudio", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.AUDIO
};
v16.GROUP_PLUGINS = {
    name = "GroupPlugins", 
    category = "GroupPlugins", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.PLUGIN
};
v16.MY_PACKAGES = {
    name = "MyPackages", 
    category = "MyPackages", 
    ownershipType = v16.OwnershipType.MY, 
    assetType = v16.AssetType.PACKAGE
};
v16.GROUP_PACKAGES = {
    name = "GroupPackages", 
    category = "GroupPackages", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.PACKAGE
};
v16.CREATIONS_DEVELOPMENT_SECTION_DIVIDER = {
    name = "CreationsDevelopmentSectionDivider", 
    selectable = false
};
v16.CREATIONS_GROUP_MODELS = {
    name = "CreationsGroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.MODEL
};
v16.CREATIONS_GROUP_PACKAGES = {
    name = "CreationsGroupPackages", 
    category = "GroupPackages", 
    ownershipType = v16.OwnershipType.GROUP, 
    assetType = v16.AssetType.PACKAGE
};
v16.CREATIONS_MODELS = {
    name = "CreationsModels", 
    category = "CreationsModels", 
    assetType = v16.AssetType.MODEL, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_DECALS = {
    name = "CreationsDecals", 
    category = "CreationsDecals", 
    assetType = v16.AssetType.DECAL, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_AUDIO = {
    name = "CreationsAudio", 
    category = "CreationsAudio", 
    assetType = v16.AssetType.AUDIO, 
    ownershipType = v16.OwnershipType.MY
};
if l_ToolboxAddVideosToCreationCategories_0 then
    v16.CREATIONS_VIDEOS = {
        name = "CreationsVideos", 
        category = "CreationsVideos", 
        assetType = v16.AssetType.VIDEO, 
        ownershipType = v16.OwnershipType.MY
    };
end;
v16.CREATIONS_MESHES = {
    name = "CreationsMeshes", 
    category = "CreationsMeshes", 
    assetType = v16.AssetType.MESHPART, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_PLUGIN = {
    name = "CreationsPlugins", 
    category = "CreationsPlugins", 
    assetType = v16.AssetType.PLUGIN, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_ANIMATIONS = {
    name = "CreationsAnimations", 
    category = "CreationsAnimations", 
    assetType = v16.AssetType.ANIMATION, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_GROUP_DECALS = {
    name = "CreationsGroupDecals", 
    category = "CreationsGroupDecals", 
    assetType = v16.AssetType.DECAL, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_AUDIO = {
    name = "CreationsGroupAudio", 
    category = "CreationsGroupAudio", 
    assetType = v16.AssetType.AUDIO, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_MESHES = {
    name = "CreationsGroupMeshes", 
    category = "CreationsGroupMeshes", 
    assetType = v16.AssetType.MESHPART, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_PLUGIN = {
    name = "CreationsGroupPlugins", 
    category = "CreationsGroupPlugins", 
    assetType = v16.AssetType.PLUGIN, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_ANIMATIONS = {
    name = "CreationsGroupAnimations", 
    category = "CreationsGroupAnimations", 
    assetType = v16.AssetType.ANIMATION, 
    ownershipType = v16.OwnershipType.GROUP
};
if l_ToolboxAddVideosToCreationCategories_0 then
    v16.CREATIONS_GROUP_VIDEOS = {
        name = "CreationsGroupVideos", 
        category = "CreationsGroupVideos", 
        assetType = v16.AssetType.VIDEO, 
        ownershipType = v16.OwnershipType.GROUP
    };
end;
v16.CREATIONS_CATALOG_SECTION_DIVIDER = {
    name = "CreationsCatalogSectionDivider", 
    selectable = false
};
v16.CREATIONS_HATS = {
    name = "CreationsHats", 
    category = "CreationsHats", 
    assetType = v16.AssetType.HAT, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_TEE_SHIRT = {
    name = "CreationsTeeShirts", 
    category = "CreationsTeeShirts", 
    assetType = v16.AssetType.TEE_SHIRT, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_SHIRT = {
    name = "CreationsShirts", 
    category = "CreationsShirts", 
    assetType = v16.AssetType.SHIRT, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_PANTS = {
    name = "CreationsPants", 
    category = "CreationsPants", 
    assetType = v16.AssetType.PANTS, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_HAIR = {
    name = "CreationsHair", 
    category = "CreationsHair", 
    assetType = v16.AssetType.HAIR_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_FACE_ACCESSORIES = {
    name = "CreationsFaceAccessories", 
    category = "CreationsFaceAccessories", 
    assetType = v16.AssetType.FACE_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_NECK_ACCESSORIES = {
    name = "CreationsNeckAccessories", 
    category = "CreationsNeckAccessories", 
    assetType = v16.AssetType.NECK_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_SHOULDER_ACCESSORIES = {
    name = "CreationsShoulderAccessories", 
    category = "CreationsShoulderAccessories", 
    assetType = v16.AssetType.SHOULDER_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_FRONT_ACCESSORIES = {
    name = "CreationsFrontAccessories", 
    category = "CreationsFrontAccessories", 
    assetType = v16.AssetType.FRONT_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_BACK_ACCESSORIES = {
    name = "CreationsBackAccessories", 
    category = "CreationsBackAccessories", 
    assetType = v16.AssetType.BACK_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_WAIST_ACCESSORIES = {
    name = "CreationsWaistAccessories", 
    category = "CreationsWaistAccessories", 
    assetType = v16.AssetType.WAIST_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_TSHIRT_ACCESSORIES = {
    name = "CreationsTShirtAccessories", 
    category = "CreationsTShirtAccessories", 
    assetType = v16.AssetType.TSHIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_SHIRT_ACCESSORIES = {
    name = "CreationsShirtAccessories", 
    category = "CreationsShirtAccessories", 
    assetType = v16.AssetType.SHIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_PANTS_ACCESSORIES = {
    name = "CreationsPantsAccessories", 
    category = "CreationsPantsAccessories", 
    assetType = v16.AssetType.PANTS_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_JACKET_ACCESSORIES = {
    name = "CreationsJacketAccessories", 
    category = "CreationsJacketAccessories", 
    assetType = v16.AssetType.JACKET_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_SWEATER_ACCESSORIES = {
    name = "CreationsSweaterAccessories", 
    category = "CreationsSweaterAccessories", 
    assetType = v16.AssetType.SWEATER_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_SHORTS_ACCESSORIES = {
    name = "CreationsShortsAccessories", 
    category = "CreationsShortsAccessories", 
    assetType = v16.AssetType.SHORTS_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_LEFT_SHOE_ACCESSORIES = {
    name = "CreationsLeftShoeAccessories", 
    category = "CreationsLeftShoeAccessories", 
    assetType = v16.AssetType.LEFT_SHOE_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_RIGHT_SHOE_ACCESSORIES = {
    name = "CreationsRightShoeAccessories", 
    category = "CreationsRightShoeAccessories", 
    assetType = v16.AssetType.RIGHT_SHOE_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_DRESS_SKIRT_ACCESSORIES = {
    name = "CreationsDressSkirtAccessories", 
    category = "CreationsDressSkirtAccessories", 
    assetType = v16.AssetType.DRESS_SKIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.MY
};
v16.CREATIONS_GROUP_HATS = {
    name = "CreationsGroupHats", 
    category = "CreationsGroupHats", 
    assetType = v16.AssetType.HAT, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_HAIR = {
    name = "CreationsGroupHair", 
    category = "CreationsGroupHair", 
    assetType = v16.AssetType.HAIR_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_FACE_ACCESSORIES = {
    name = "CreationsGroupFaceAccessories", 
    category = "CreationsGroupFaceAccessories", 
    assetType = v16.AssetType.FACE_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_NECK_ACCESSORIES = {
    name = "CreationsGroupNeckAccessories", 
    category = "CreationsGroupNeckAccessories", 
    assetType = v16.AssetType.NECK_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_SHOULDER_ACCESSORIES = {
    name = "CreationsGroupShoulderAccessories", 
    category = "CreationsGroupShoulderAccessories", 
    assetType = v16.AssetType.SHOULDER_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_FRONT_ACCESSORIES = {
    name = "CreationsGroupFrontAccessories", 
    category = "CreationsGroupFrontAccessories", 
    assetType = v16.AssetType.FRONT_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_BACK_ACCESSORIES = {
    name = "CreationsGroupBackAccessories", 
    category = "CreationsGroupBackAccessories", 
    assetType = v16.AssetType.BACK_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_WAIST_ACCESSORIES = {
    name = "CreationsGroupWaistAccessories", 
    category = "CreationsGroupWaistAccessories", 
    assetType = v16.AssetType.WAIST_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_TSHIRT_ACCESSORIES = {
    name = "CreationsGroupTShirtAccessories", 
    category = "CreationsGroupTShirtAccessories", 
    assetType = v16.AssetType.TSHIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_SHIRT_ACCESSORIES = {
    name = "CreationsGroupShirtAccessories", 
    category = "CreationsGroupShirtAccessories", 
    assetType = v16.AssetType.SHIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_PANTS_ACCESSORIES = {
    name = "CreationsGroupPantsAccessories", 
    category = "CreationsGroupPantsAccessories", 
    assetType = v16.AssetType.PANTS_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_JACKET_ACCESSORIES = {
    name = "CreationsGroupJacketAccessories", 
    category = "CreationsGroupJacketAccessories", 
    assetType = v16.AssetType.JACKET_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_SWEATER_ACCESSORIES = {
    name = "CreationsGroupSweaterAccessories", 
    category = "CreationsGroupSweaterAccessories", 
    assetType = v16.AssetType.SWEATER_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_SHORTS_ACCESSORIES = {
    name = "CreationsGroupShortsAccessories", 
    category = "CreationsGroupShortsAccessories", 
    assetType = v16.AssetType.SHORTS_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_LEFT_SHOE_ACCESSORIES = {
    name = "CreationsGroupLeftShoeAccessories", 
    category = "CreationsGroupLeftShoeAccessories", 
    assetType = v16.AssetType.LEFT_SHOE_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_RIGHT_SHOE_ACCESSORIES = {
    name = "CreationsGroupRightShoeAccessories", 
    category = "CreationsGroupRightShoeAccessories", 
    assetType = v16.AssetType.RIGHT_SHOE_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.CREATIONS_GROUP_DRESS_SKIRT_ACCESSORIES = {
    name = "CreationsGroupDressSkirtAccessories", 
    category = "CreationsGroupDressSkirtAccessories", 
    assetType = v16.AssetType.DRESS_SKIRT_ACCESSORY, 
    ownershipType = v16.OwnershipType.GROUP
};
v16.MARKETPLACE = {
    v16.FREE_MODELS, 
    v16.WHITELISTED_PLUGINS, 
    v16.FREE_AUDIO, 
    v16.FREE_DECALS, 
    v16.FREE_MESHES, 
    v16.MARKETPLACE_VIDEOS, 
    v16.FREE_FONTS
};
if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
    v16.INVENTORY = {
        v16.MY_MODELS, 
        v16.MY_PLUGINS, 
        v16.MY_AUDIO, 
        v16.MY_DECALS, 
        v16.MY_MESHES, 
        v16.MY_ANIMATIONS, 
        v16.MY_VIDEOS, 
        v16.MY_FONTS
    };
else
    v16.INVENTORY = {
        v16.MY_MODELS, 
        v16.MY_PLUGINS, 
        v16.MY_AUDIO, 
        v16.MY_DECALS, 
        v16.MY_MESHES, 
        v16.MY_PACKAGES, 
        v16.MY_ANIMATIONS, 
        v16.MY_VIDEOS, 
        v16.MY_FONTS
    };
end;
v16.RECENT = {
    v16.RECENT_MODELS, 
    v16.RECENT_AUDIO, 
    v16.RECENT_DECALS, 
    v16.RECENT_MESHES, 
    v16.RECENT_ANIMATIONS, 
    v16.RECENT_VIDEO
};
v16.DEFAULT = nil;
if l_disableMarketplaceAndRecents_0() then
    v16.DEFAULT = v16.MY_MODELS;
else
    v16.DEFAULT = v16.FREE_MODELS;
end;
if v13() then
    if l_disableMarketplaceAndRecents_0() then
        v16.DEFAULT_TAB = v16.INVENTORY;
    else
        v16.DEFAULT_TAB = v16.MARKETPLACE;
    end;
end;
v16.CREATOR_ROBLOX = {
    Id = 1, 
    Type = Enum.CreatorType.User.Value
};
v16.CREATOR_ROBLOX_DEVELOP_API = {
    Id = 1, 
    Type = v3.clientToBackend(Enum.CreatorType.User.Value)
};
v16.API_NAMES = {
    [v16.FREE_AUDIO.name] = "Audio", 
    [v16.WHITELISTED_PLUGINS.name] = "Plugins", 
    [v16.FREE_MESHES.name] = "Meshes", 
    [v16.FREE_DECALS.name] = "Decals", 
    [v16.MARKETPLACE_VIDEOS.name] = "Videos", 
    [v16.FREE_MODELS.name] = "Models", 
    [v16.MY_AUDIO.name] = "audio", 
    [v16.MY_PLUGINS.name] = "plugin", 
    [v16.MY_MODELS.name] = "model", 
    [v16.MY_MESHES.name] = "meshpart", 
    [v16.MY_DECALS.name] = "decal", 
    [v16.MY_VIDEOS.name] = "video", 
    [v16.MY_PACKAGES.name] = "package", 
    [v16.MY_ANIMATIONS.name] = "animation", 
    [v16.RECENT_AUDIO.name] = "audio", 
    [v16.RECENT_MODELS.name] = "model", 
    [v16.RECENT_MESHES.name] = "meshpart", 
    [v16.RECENT_DECALS.name] = "decal", 
    [v16.RECENT_VIDEO.name] = "video", 
    [v16.RECENT_ANIMATIONS.name] = "animation", 
    [v16.CREATIONS_AUDIO.name] = "audio", 
    [v16.FREE_FONTS.name] = "FontFamily", 
    [v16.MY_FONTS.name] = "fontFamily"
};
if l_ToolboxAddVideosToCreationCategories_0 then
    v16.API_NAMES[v16.CREATIONS_VIDEOS.name] = "video";
end;
v16.AUTOCOMPLETE_API_NAMES = {
    [v16.FREE_AUDIO.name] = "audio", 
    [v16.WHITELISTED_PLUGINS.name] = "plugin", 
    [v16.FREE_MESHES.name] = "mesh", 
    [v16.FREE_DECALS.name] = "image", 
    [v16.MARKETPLACE_VIDEOS.name] = "video", 
    [v16.FREE_MODELS.name] = "model", 
    [v16.MY_ANIMATIONS.name] = "animation", 
    [v16.FREE_FONTS.name] = "fontFamily"
};
v16.ASSET_PREVIEW_SUGGESTIONS_ENABLED_FOR_ASSET_TYPE = {
    [v16.FREE_AUDIO.name] = true, 
    [v16.FREE_DECALS.name] = true, 
    [v16.FREE_MESHES.name] = true, 
    [v16.FREE_MODELS.name] = true, 
    [v16.MARKETPLACE_VIDEOS.name] = true, 
    [v16.WHITELISTED_PLUGINS.name] = true
};
local function v21() --[[ Line: 781 ]] --[[ Name: getCreationCategories ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxAddVideosToCreationCategories_0 (copy), v16 (copy)
    if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
        if l_ToolboxAddVideosToCreationCategories_0 then
            return {
                v16.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
                v16.CREATIONS_MODELS, 
                v16.CREATIONS_PLUGIN, 
                v16.CREATIONS_AUDIO, 
                v16.CREATIONS_DECALS, 
                v16.CREATIONS_MESHES, 
                v16.CREATIONS_ANIMATIONS, 
                v16.CREATIONS_VIDEOS, 
                v16.CREATIONS_GROUP_MODELS, 
                v16.CREATIONS_GROUP_PLUGIN, 
                v16.CREATIONS_GROUP_AUDIO, 
                v16.CREATIONS_GROUP_DECALS, 
                v16.CREATIONS_GROUP_MESHES, 
                v16.CREATIONS_GROUP_ANIMATIONS, 
                v16.CREATIONS_GROUP_VIDEOS
            };
        else
            return {
                v16.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
                v16.CREATIONS_MODELS, 
                v16.CREATIONS_PLUGIN, 
                v16.CREATIONS_AUDIO, 
                v16.CREATIONS_DECALS, 
                v16.CREATIONS_MESHES, 
                v16.CREATIONS_ANIMATIONS, 
                v16.CREATIONS_GROUP_MODELS, 
                v16.CREATIONS_GROUP_PLUGIN, 
                v16.CREATIONS_GROUP_AUDIO, 
                v16.CREATIONS_GROUP_DECALS, 
                v16.CREATIONS_GROUP_MESHES, 
                v16.CREATIONS_GROUP_ANIMATIONS
            };
        end;
    elseif l_ToolboxAddVideosToCreationCategories_0 then
        return {
            v16.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
            v16.CREATIONS_MODELS, 
            v16.CREATIONS_PLUGIN, 
            v16.CREATIONS_AUDIO, 
            v16.CREATIONS_DECALS, 
            v16.CREATIONS_MESHES, 
            v16.CREATIONS_ANIMATIONS, 
            v16.CREATIONS_VIDEOS, 
            v16.CREATIONS_GROUP_MODELS, 
            v16.CREATIONS_GROUP_PLUGIN, 
            v16.CREATIONS_GROUP_AUDIO, 
            v16.CREATIONS_GROUP_DECALS, 
            v16.CREATIONS_GROUP_MESHES, 
            v16.CREATIONS_GROUP_PACKAGES, 
            v16.CREATIONS_GROUP_ANIMATIONS, 
            v16.CREATIONS_GROUP_VIDEOS
        };
    else
        return {
            v16.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
            v16.CREATIONS_MODELS, 
            v16.CREATIONS_PLUGIN, 
            v16.CREATIONS_AUDIO, 
            v16.CREATIONS_DECALS, 
            v16.CREATIONS_MESHES, 
            v16.CREATIONS_ANIMATIONS, 
            v16.CREATIONS_GROUP_MODELS, 
            v16.CREATIONS_GROUP_PLUGIN, 
            v16.CREATIONS_GROUP_AUDIO, 
            v16.CREATIONS_GROUP_DECALS, 
            v16.CREATIONS_GROUP_MESHES, 
            v16.CREATIONS_GROUP_PACKAGES, 
            v16.CREATIONS_GROUP_ANIMATIONS
        };
    end;
end;
v16.MARKETPLACE_KEY = "Marketplace";
v16.INVENTORY_KEY = "Inventory";
v16.RECENT_KEY = "Recent";
v16.CREATIONS_KEY = "Creations";
local v22 = string.split(l_getMarketplaceDisabledCategories_0(), ";");
for _, v24 in pairs(v22) do
    local v25 = nil;
    for v26, v27 in pairs(v16.MARKETPLACE) do
        if v27.name == v24 then
            v25 = v26;
        end;
    end;
    if v25 then
        table.remove(v16.MARKETPLACE, v25);
    end;
end;
local v28 = {};
local v29 = {};
local v30 = {};
for _, v32 in pairs(v16) do
    if v32.name then
        v30[v32.name] = v32;
    end;
end;
v16.CREATIONS = v21();
local v33 = nil;
local v34 = nil;
if l_disableMarketplaceAndRecents_0() then
    v33 = {
        v16.INVENTORY, 
        v16.CREATIONS
    };
    v34 = {
        v16.INVENTORY_KEY, 
        v16.CREATIONS_KEY
    };
elseif l_showRobloxCreatedAssets_0() then
    v33 = {
        v16.MARKETPLACE, 
        v16.INVENTORY, 
        v16.CREATIONS
    };
    v34 = {
        v16.MARKETPLACE_KEY, 
        v16.INVENTORY_KEY, 
        v16.CREATIONS_KEY
    };
else
    v33 = {
        v16.MARKETPLACE, 
        v16.INVENTORY, 
        v16.RECENT, 
        v16.CREATIONS
    };
    v34 = {
        v16.MARKETPLACE_KEY, 
        v16.INVENTORY_KEY, 
        v16.RECENT_KEY, 
        v16.CREATIONS_KEY
    };
end;
for v35, v36 in ipairs(v33) do
    for _, v38 in ipairs(v36) do
        v28[v38.name] = v36;
        v29[v38.name] = v34[v35];
    end;
end;
v16.getTabForCategoryName = function(v39) --[[ Line: 935 ]] --[[ Name: getTabForCategoryName ]]
    -- upvalues: v28 (copy), v16 (copy)
    return v28[v39] or v16.CREATIONS;
end;
v16.getTabKeyForCategoryName = function(v40) --[[ Line: 938 ]] --[[ Name: getTabKeyForCategoryName ]]
    -- upvalues: v29 (copy), v16 (copy)
    return v29[v40] or v16.CREATIONS_KEY;
end;
v16.getCategoryByName = function(v41) --[[ Line: 942 ]] --[[ Name: getCategoryByName ]]
    -- upvalues: v30 (copy), v5 (copy)
    local v42 = v30[v41];
    if not v42 and v5.shouldDebugWarnings() then
        warn(("Lua Toolbox: no category for name %s"):format((tostring(v41))));
    end;
    return v42;
end;
v16.getCategoryIndex = function(v43, v44, v45) --[[ Line: 950 ]] --[[ Name: getCategoryIndex ]]
    -- upvalues: v16 (copy), v12 (copy), v5 (copy)
    if v43 == "" then
        return 1;
    else
        local v46 = v16.getTabKeyForCategoryName(v43);
        local v47 = v16.getCategories(v46, v44, if v12() then v45 else nil);
        for v48, v49 in ipairs(v47) do
            if v49.name == v43 then
                return v48;
            end;
        end;
        if v5.shouldDebugWarnings() then
            warn(("Lua Toolbox: no category index for name %s"):format((tostring(v43))));
        end;
        return 1;
    end;
end;
v16.getAssetTypeByNumber = function(v50) --[[ Line: 968 ]] --[[ Name: getAssetTypeByNumber ]]
    -- upvalues: v16 (copy)
    return v16.AssetTypeInverted[v50];
end;
v16.categoryIsPackage = function(v51) --[[ Line: 972 ]] --[[ Name: categoryIsPackage ]]
    -- upvalues: v16 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy)
    local v52 = v16.getCategoryByName(v51);
    if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
        local v53 = true;
        if v52.assetType ~= v16.AssetType.PACKAGE then
            v53 = v52 == v16.FREE_MODELS;
        end;
        return v53;
    else
        return v52.assetType == v16.AssetType.PACKAGE;
    end;
end;
v16.categoryIsFreeAsset = function(v54) --[[ Line: 981 ]] --[[ Name: categoryIsFreeAsset ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v54).ownershipType == v16.OwnershipType.FREE;
end;
v16.categoryIsGroupAsset = function(v55) --[[ Line: 986 ]] --[[ Name: categoryIsGroupAsset ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v55).ownershipType == v16.OwnershipType.GROUP;
end;
v16.categoryIsAudio = function(v56) --[[ Line: 991 ]] --[[ Name: categoryIsAudio ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v56).assetType == v16.AssetType.AUDIO;
end;
v16.categoryIsModel = function(v57) --[[ Line: 996 ]] --[[ Name: categoryIsModel ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v57).assetType == v16.AssetType.MODEL;
end;
v16.categoryIsFont = function(v58) --[[ Line: 1001 ]] --[[ Name: categoryIsFont ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v58).assetType == v16.AssetType.FONT_FAMILY;
end;
v16.categoryIsVideo = function(v59) --[[ Line: 1006 ]] --[[ Name: categoryIsVideo ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v59).assetType == v16.AssetType.VIDEO;
end;
v16.categoryIsGroupPackages = function(v60) --[[ Line: 1011 ]] --[[ Name: categoryIsGroupPackages ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v60).assetType == v16.AssetType.GROUP_PACKAGES;
end;
v16.categoryIsPlugin = function(v61) --[[ Line: 1016 ]] --[[ Name: categoryIsPlugin ]]
    -- upvalues: v16 (copy)
    return v16.getCategoryByName(v61).assetType == v16.AssetType.PLUGIN;
end;
v16.shouldShowPrices = function(v62) --[[ Line: 1021 ]] --[[ Name: shouldShowPrices ]]
    -- upvalues: v16 (copy), v15 (copy), v14 (copy), v4 (copy)
    local v63 = v16.getCategoryByName(v62);
    local v64 = v16.getEngineAssetType(v63.assetType);
    if v15() and (v63.ownershipType == v16.OwnershipType.MY or v63.ownershipType == v16.OwnershipType.GROUP) then
        return false;
    elseif v14() then
        return v4.MONETIZABLE_ASSET_TYPES[v64.Name];
    else
        return v4.ENABLED_ASSET_TYPES[v64.Name];
    end;
end;
local v65 = {
    [Enum.AssetType.Hat] = v16.CREATIONS_HATS, 
    [Enum.AssetType.HairAccessory] = v16.CREATIONS_HAIR, 
    [Enum.AssetType.FaceAccessory] = v16.CREATIONS_FACE_ACCESSORIES, 
    [Enum.AssetType.NeckAccessory] = v16.CREATIONS_NECK_ACCESSORIES, 
    [Enum.AssetType.ShoulderAccessory] = v16.CREATIONS_SHOULDER_ACCESSORIES, 
    [Enum.AssetType.FrontAccessory] = v16.CREATIONS_FRONT_ACCESSORIES, 
    [Enum.AssetType.BackAccessory] = v16.CREATIONS_BACK_ACCESSORIES, 
    [Enum.AssetType.WaistAccessory] = v16.CREATIONS_WAIST_ACCESSORIES, 
    [Enum.AssetType.TShirtAccessory] = v16.CREATIONS_TSHIRT_ACCESSORIES, 
    [Enum.AssetType.ShirtAccessory] = v16.CREATIONS_SHIRT_ACCESSORIES, 
    [Enum.AssetType.PantsAccessory] = v16.CREATIONS_PANTS_ACCESSORIES, 
    [Enum.AssetType.JacketAccessory] = v16.CREATIONS_JACKET_ACCESSORIES, 
    [Enum.AssetType.SweaterAccessory] = v16.CREATIONS_SWEATER_ACCESSORIES, 
    [Enum.AssetType.ShortsAccessory] = v16.CREATIONS_SHORTS_ACCESSORIES, 
    [Enum.AssetType.LeftShoeAccessory] = v16.CREATIONS_LEFT_SHOE_ACCESSORIES, 
    [Enum.AssetType.RightShoeAccessory] = v16.CREATIONS_RIGHT_SHOE_ACCESSORIES, 
    [Enum.AssetType.DressSkirtAccessory] = v16.CREATIONS_DRESS_SKIRT_ACCESSORIES
};
local v66 = {
    [Enum.AssetType.Hat] = v16.CREATIONS_GROUP_HATS, 
    [Enum.AssetType.HairAccessory] = v16.CREATIONS_GROUP_HAIR, 
    [Enum.AssetType.FaceAccessory] = v16.CREATIONS_GROUP_FACE_ACCESSORIES, 
    [Enum.AssetType.NeckAccessory] = v16.CREATIONS_GROUP_NECK_ACCESSORIES, 
    [Enum.AssetType.ShoulderAccessory] = v16.CREATIONS_GROUP_SHOULDER_ACCESSORIES, 
    [Enum.AssetType.FrontAccessory] = v16.CREATIONS_GROUP_FRONT_ACCESSORIES, 
    [Enum.AssetType.BackAccessory] = v16.CREATIONS_GROUP_BACK_ACCESSORIES, 
    [Enum.AssetType.WaistAccessory] = v16.CREATIONS_GROUP_WAIST_ACCESSORIES, 
    [Enum.AssetType.TShirtAccessory] = v16.CREATIONS_GROUP_TSHIRT_ACCESSORIES, 
    [Enum.AssetType.ShirtAccessory] = v16.CREATIONS_GROUP_SHIRT_ACCESSORIES, 
    [Enum.AssetType.PantsAccessory] = v16.CREATIONS_GROUP_PANTS_ACCESSORIES, 
    [Enum.AssetType.JacketAccessory] = v16.CREATIONS_GROUP_JACKET_ACCESSORIES, 
    [Enum.AssetType.SweaterAccessory] = v16.CREATIONS_GROUP_SWEATER_ACCESSORIES, 
    [Enum.AssetType.ShortsAccessory] = v16.CREATIONS_GROUP_SHORTS_ACCESSORIES, 
    [Enum.AssetType.LeftShoeAccessory] = v16.CREATIONS_GROUP_LEFT_SHOE_ACCESSORIES, 
    [Enum.AssetType.RightShoeAccessory] = v16.CREATIONS_GROUP_RIGHT_SHOE_ACCESSORIES, 
    [Enum.AssetType.DressSkirtAccessory] = v16.CREATIONS_GROUP_DRESS_SKIRT_ACCESSORIES
};
v16.getCategories = function(v67, v68, v69) --[[ Line: 1080 ]] --[[ Name: getCategories ]]
    -- upvalues: v16 (copy), v12 (copy), v5 (copy), v11 (copy), v21 (copy), v6 (copy), v65 (copy), v66 (copy)
    if v16.CREATIONS_KEY == v67 then
        if v12() and v5.shouldDebugWarnings() and v69 == nil then
            warn("IXP variable was not found for getCategoryIndex");
        end;
        local v70 = if v12() and v11(v69) then {} else v21();
        if v68 then
            local v71 = v6(v68.allowedAssetTypesForRelease);
            if #v71 > 0 then
                table.insert(v70, v16.CREATIONS_CATALOG_SECTION_DIVIDER);
                for _, v73 in pairs(v71) do
                    table.insert(v70, v65[v73]);
                end;
                for _, v75 in pairs(v71) do
                    table.insert(v70, v66[v75]);
                end;
            end;
        end;
        return v70;
    elseif v16.MARKETPLACE_KEY == v67 then
        return v16.MARKETPLACE;
    elseif v16.INVENTORY_KEY == v67 then
        return v16.INVENTORY;
    elseif v16.RECENT_KEY == v67 then
        return v16.RECENT;
    else
        return;
    end;
end;
v16.getEngineAssetType = function(v76) --[[ Line: 1110 ]] --[[ Name: getEngineAssetType ]]
    -- upvalues: v16 (copy), v5 (copy)
    local v77 = v16.ToolboxAssetTypeToEngine[v76];
    if not v77 and v5.shouldDebugWarnings() then
        warn(("Lua toolbox: No engine assetType for category asset type %s"):format((tostring(v76))));
    end;
    return v77;
end;
v16.categoryIsAvatarAssetByCategoryName = function(v78) --[[ Line: 1120 ]] --[[ Name: categoryIsAvatarAssetByCategoryName ]]
    -- upvalues: v16 (copy), v66 (copy)
    local v79 = v16.getCategoryByName(v78);
    return v66[v16.getEngineAssetType(v79.assetType)] ~= nil;
end;
v16.getMarketplaceCategoryByAssetType = function(v80) --[[ Line: 1126 ]] --[[ Name: getMarketplaceCategoryByAssetType ]]
    -- upvalues: v16 (copy), v5 (copy)
    for _, v82 in pairs(v16.MARKETPLACE) do
        if v82.assetType == v80.Value then
            return v82;
        end;
    end;
    if v5.shouldDebugWarnings() then
        warn(("No category found for assetType of %s"):format((tostring(v80))));
    end;
    return nil;
end;
return v16;