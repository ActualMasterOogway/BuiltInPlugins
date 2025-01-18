local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = {
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
        AUDIO = 3, 
        PACKAGE = 4, 
        PLUGIN = 5, 
        HAT = 6, 
        TEE_SHIRT = 7, 
        SHIRT = 8, 
        PANTS = 9, 
        HAIR_ACCESSORY = 10, 
        FACE_ACCESSORY = 11, 
        NECK_ACCESSORY = 12, 
        SHOULDER_ACCESSORY = 13, 
        FRONT_ACCESSORY = 14, 
        BACK_ACCESSORY = 15, 
        WAIST_ACCESSORY = 16
    }
};
v2.ToolboxAssetTypeToEngine = {
    [v2.AssetType.MODEL] = Enum.AssetType.Model, 
    [v2.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v2.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v2.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v2.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v2.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v2.AssetType.HAT] = Enum.AssetType.Hat, 
    [v2.AssetType.TEE_SHIRT] = Enum.AssetType.TShirt, 
    [v2.AssetType.SHIRT] = Enum.AssetType.Shirt, 
    [v2.AssetType.PANTS] = Enum.AssetType.Pants, 
    [v2.AssetType.HAIR_ACCESSORY] = Enum.AssetType.HairAccessory, 
    [v2.AssetType.FACE_ACCESSORY] = Enum.AssetType.FaceAccessory, 
    [v2.AssetType.NECK_ACCESSORY] = Enum.AssetType.NeckAccessory, 
    [v2.AssetType.SHOULDER_ACCESSORY] = Enum.AssetType.ShoulderAccessory, 
    [v2.AssetType.FRONT_ACCESSORY] = Enum.AssetType.FrontAccessory, 
    [v2.AssetType.BACK_ACCESSORY] = Enum.AssetType.BackAccessory, 
    [v2.AssetType.WAIST_ACCESSORY] = Enum.AssetType.WaistAccessory
};
v2.FREE_MODELS = {
    name = "FreeModels", 
    category = "FreeModels", 
    ownershipType = v2.OwnershipType.FREE, 
    assetType = v2.AssetType.MODEL
};
v2.FREE_DECALS = {
    name = "FreeDecals", 
    category = "FreeDecals", 
    ownershipType = v2.OwnershipType.FREE, 
    assetType = v2.AssetType.DECAL
};
v2.FREE_MESHES = {
    name = "FreeMeshes", 
    category = "FreeMeshes", 
    ownershipType = v2.OwnershipType.FREE, 
    assetType = v2.AssetType.MESH
};
v2.FREE_AUDIO = {
    name = "FreeAudio", 
    category = "FreeAudio", 
    ownershipType = v2.OwnershipType.FREE, 
    assetType = v2.AssetType.AUDIO
};
v2.MY_MODELS = {
    name = "MyModels", 
    category = "MyModelsExceptPackage", 
    ownershipType = v2.OwnershipType.MY, 
    assetType = v2.AssetType.MODEL
};
v2.MY_DECALS = {
    name = "MyDecals", 
    category = "MyDecals", 
    ownershipType = v2.OwnershipType.MY, 
    assetType = v2.AssetType.DECAL
};
v2.MY_MESHES = {
    name = "MyMeshes", 
    category = "MyMeshes", 
    ownershipType = v2.OwnershipType.MY, 
    assetType = v2.AssetType.MESH
};
v2.MY_AUDIO = {
    name = "MyAudio", 
    category = "MyAudio", 
    ownershipType = v2.OwnershipType.MY, 
    assetType = v2.AssetType.AUDIO
};
v2.MY_PLUGINS = {
    name = "MyPlugins", 
    category = "MyPlugins", 
    ownershipType = v2.AssetType.PLUGIN, 
    assetType = v2.AssetType.PLUGIN
};
v2.RECENT_MODELS = {
    name = "RecentModels", 
    category = "RecentModels", 
    ownershipType = v2.OwnershipType.RECENT, 
    assetType = v2.AssetType.MODEL
};
v2.RECENT_DECALS = {
    name = "RecentDecals", 
    category = "RecentDecals", 
    ownershipType = v2.OwnershipType.RECENT, 
    assetType = v2.AssetType.DECAL
};
v2.RECENT_MESHES = {
    name = "RecentMeshes", 
    category = "RecentMeshes", 
    ownershipType = v2.OwnershipType.RECENT, 
    assetType = v2.AssetType.MESH
};
v2.RECENT_AUDIO = {
    name = "RecentAudio", 
    category = "RecentAudio", 
    ownershipType = v2.OwnershipType.RECENT, 
    assetType = v2.AssetType.AUDIO
};
v2.GROUP_MODELS = {
    name = "GroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v2.OwnershipType.GROUP, 
    assetType = v2.AssetType.MODEL
};
v2.GROUP_DECALS = {
    name = "GroupDecals", 
    category = "GroupDecals", 
    ownershipType = v2.OwnershipType.GROUP, 
    assetType = v2.AssetType.DECAL
};
v2.GROUP_MESHES = {
    name = "GroupMeshes", 
    category = "GroupMeshes", 
    ownershipType = v2.OwnershipType.GROUP, 
    assetType = v2.AssetType.MESH
};
v2.GROUP_AUDIO = {
    name = "GroupAudio", 
    category = "GroupAudio", 
    ownershipType = v2.OwnershipType.GROUP, 
    assetType = v2.AssetType.AUDIO
};
v2.MY_PACKAGES = {
    name = "MyPackages", 
    category = "MyPackages", 
    ownershipType = v2.OwnershipType.MY, 
    assetType = v2.AssetType.PACKAGE
};
v2.GROUP_PACKAGES = {
    name = "GroupPackages", 
    category = "GroupPackages", 
    ownershipType = v2.OwnershipType.GROUP, 
    assetType = v2.AssetType.PACKAGE
};
v2.CREATIONS_DEVELOPMENT_SECTION_DIVIDER = {
    name = "CreationsDevelopmentSectionDivider", 
    selectable = false
};
v2.CREATIONS_MODELS = {
    name = "CreationsModels", 
    assetType = v2.AssetType.MODEL
};
v2.CREATIONS_DECALS = {
    name = "CreationsDecals", 
    assetType = v2.AssetType.DECAL
};
v2.CREATIONS_AUDIO = {
    name = "CreationsAudio", 
    assetType = v2.AssetType.AUDIO
};
v2.CREATIONS_MESHES = {
    name = "CreationsMeshes", 
    assetType = v2.AssetType.MESH
};
v2.CREATIONS_CATALOG_SECTION_DIVIDER = {
    name = "CreationsCatalogSectionDivider", 
    selectable = false
};
v2.CREATIONS_HATS = {
    name = "CreationsHats", 
    assetType = v2.AssetType.HAT
};
v2.CREATIONS_TEE_SHIRT = {
    name = "CreationsTeeShirts", 
    assetType = v2.AssetType.TEE_SHIRT
};
v2.CREATIONS_SHIRT = {
    name = "CreationsShirts", 
    assetType = v2.AssetType.SHIRT
};
v2.CREATIONS_PANTS = {
    name = "CreationsPants", 
    assetType = v2.AssetType.PANTS
};
v2.CREATIONS_HAIR = {
    name = "CreationsHair", 
    assetType = v2.AssetType.HairAccessory
};
v2.CREATIONS_FACE_ACCESSORYS = {
    name = "CreationsFaceAccessorys", 
    assetType = v2.AssetType.FaceAccessory
};
v2.CREATIONS_NECK_ACCESSORYS = {
    name = "CreationsNeckAccessorys", 
    assetType = v2.AssetType.NeckAccessory
};
v2.CREATIONS_SHOULDER_ACCESSORYS = {
    name = "CreationsShoulderAccessorys", 
    assetType = v2.AssetType.ShoulderAccessory
};
v2.CREATIONS_FRONT_ACCESSORYS = {
    name = "CreationsFrontAccessorys", 
    assetType = v2.AssetType.FrontAccessory
};
v2.CREATIONS_BACK_ACCESSORYS = {
    name = "CreationsBackAccessorys", 
    assetType = v2.AssetType.BackAccessory
};
v2.CREATIONS_WAIST_ACCESSORYS = {
    name = "CreationsWaistAccessorys", 
    assetType = v2.AssetType.WaistAccessory
};
v2.MARKETPLACE = {
    v2.FREE_MODELS, 
    v2.FREE_DECALS, 
    v2.FREE_MESHES, 
    v2.FREE_AUDIO
};
v2.INVENTORY = {
    v2.MY_MODELS, 
    v2.MY_DECALS, 
    v2.MY_MESHES, 
    v2.MY_AUDIO, 
    v2.MY_PACKAGES
};
v2.INVENTORY_WITH_GROUPS = {
    v2.MY_MODELS, 
    v2.MY_DECALS, 
    v2.MY_MESHES, 
    v2.MY_AUDIO, 
    v2.MY_PACKAGES, 
    v2.GROUP_MODELS, 
    v2.GROUP_DECALS, 
    v2.GROUP_MESHES, 
    v2.GROUP_AUDIO
};
v2.RECENT = {
    v2.RECENT_MODELS, 
    v2.RECENT_DECALS, 
    v2.RECENT_MESHES, 
    v2.RECENT_AUDIO
};
local v3 = {
    v2.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
    v2.CREATIONS_MODELS, 
    v2.CREATIONS_DECALS, 
    v2.CREATIONS_AUDIO, 
    v2.CREATIONS_MESHES
};
local v4 = {
    v2.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
    v2.CREATIONS_MODELS, 
    v2.CREATIONS_DECALS, 
    v2.CREATIONS_AUDIO, 
    v2.CREATIONS_MESHES, 
    v2.CREATIONS_CATALOG_SECTION_DIVIDER, 
    v2.CREATIONS_HATS
};
v2.MARKETPLACE_KEY = "Marketplace";
v2.INVENTORY_KEY = "Inventory";
v2.RECENT_KEY = "Recent";
v2.CREATIONS_KEY = "Creations";
local v5 = {
    [v2.MARKETPLACE_KEY] = v2.MARKETPLACE, 
    [v2.INVENTORY_KEY] = v2.INVENTORY, 
    [v2.RECENT_KEY] = v2.RECENT, 
    [v2.CREATIONS_KEY] = {
        [1] = v3, 
        [2] = v4
    }
};
local function _(v6) --[[ Line: 264 ]] --[[ Name: checkBounds ]]
    -- upvalues: v2 (copy)
    return v6 and v6 >= 1 and v6 <= #v2.INVENTORY_WITH_GROUPS;
end;
v2.categoryIsPackage = function(v8) --[[ Line: 268 ]] --[[ Name: categoryIsPackage ]]
    -- upvalues: v2 (copy)
    return v8 and v8 >= 1 and v8 <= #v2.INVENTORY_WITH_GROUPS and v2.INVENTORY_WITH_GROUPS[v8].assetType == v2.AssetType.PACKAGE;
end;
v2.categoryIsFreeAsset = function(v9) --[[ Line: 272 ]] --[[ Name: categoryIsFreeAsset ]]
    -- upvalues: v2 (copy)
    return v9 and v9 >= 1 and v9 <= #v2.INVENTORY_WITH_GROUPS and v2.INVENTORY_WITH_GROUPS[v9].ownershipType == v2.OwnershipType.FREE;
end;
v2.categoryIsGroupAsset = function(v10, v11) --[[ Line: 276 ]] --[[ Name: categoryIsGroupAsset ]]
    -- upvalues: v2 (copy)
    if v10 == v2.CREATIONS_KEY then
        return false;
    else
        return v11 and v11 >= 1 and v11 <= #v2.INVENTORY_WITH_GROUPS and v2.INVENTORY_WITH_GROUPS[v11].ownershipType == v2.OwnershipType.GROUP;
    end;
end;
v2.categoryIsPlugin = function(v12) --[[ Line: 283 ]] --[[ Name: categoryIsPlugin ]]
    -- upvalues: v2 (copy)
    return v12 and v12 >= 1 and v12 <= #v2.INVENTORY_WITH_GROUPS and v2.INVENTORY_WITH_GROUPS[v12].assetType == v2.AssetType.PLUGIN;
end;
v2.getCategories = function(v13, v14) --[[ Line: 287 ]] --[[ Name: getCategories ]]
    -- upvalues: v2 (copy), v5 (copy)
    if v2.CREATIONS_KEY == v13 then
        if v14 and v14.isCatalogItemCreator then
            return v5[v13][2];
        else
            return v5[v13][1];
        end;
    else
        return v5[v13];
    end;
end;
v2.getEngineAssetType = function(v15) --[[ Line: 297 ]] --[[ Name: getEngineAssetType ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v16 = v2.ToolboxAssetTypeToEngine[v15];
    if not v16 and v1.shouldDebugWarnings() then
        warn(("Lua toolbox: No engine assetType for category asset type %s"):format((tostring(v15))));
    end;
    return v16;
end;
local function _(v17) --[[ Line: 307 ]] --[[ Name: ownershipTypeToString ]]
    -- upvalues: v2 (copy)
    if v17 == v2.OwnershipType.FREE then
        return "FREE";
    elseif v17 == v2.OwnershipType.MY then
        return "MY";
    elseif v17 == v2.OwnershipType.RECENT then
        return "RECENT";
    elseif v17 == v2.OwnershipType.GROUP then
        return "GROUP";
    else
        return "[unknown]";
    end;
end;
local function _(v19) --[[ Line: 320 ]] --[[ Name: assetTypeToString ]]
    -- upvalues: v2 (copy)
    if v19 == v2.AssetType.MODEL then
        return "MODEL";
    elseif v19 == v2.AssetType.DECAL then
        return "DECAL";
    elseif v19 == v2.AssetType.MESH then
        return "MESH";
    elseif v19 == v2.AssetType.AUDIO then
        return "AUDIO";
    elseif v19 == v2.AssetType.PACKAGE then
        return "PACKAGE";
    else
        return "[unknown]";
    end;
end;
v2.categoryToString = function(v21) --[[ Line: 335 ]] --[[ Name: categoryToString ]]
    -- upvalues: v2 (copy)
    local v22 = "Category(name=\"%s\", category=\"%s\", ownershipType=\"%s\", assetType=\"%s\")";
    local l_name_0 = v21.name;
    local l_category_0 = v21.category;
    local l_ownershipType_0 = v21.ownershipType;
    local v26 = l_ownershipType_0 == v2.OwnershipType.FREE and "FREE" or l_ownershipType_0 == v2.OwnershipType.MY and "MY" or l_ownershipType_0 == v2.OwnershipType.RECENT and "RECENT" or l_ownershipType_0 == v2.OwnershipType.GROUP and "GROUP" or "[unknown]";
    local l_assetType_0 = v21.assetType;
    return v22:format(l_name_0, l_category_0, v26, l_assetType_0 == v2.AssetType.MODEL and "MODEL" or l_assetType_0 == v2.AssetType.DECAL and "DECAL" or l_assetType_0 == v2.AssetType.MESH and "MESH" or l_assetType_0 == v2.AssetType.AUDIO and "AUDIO" or l_assetType_0 == v2.AssetType.PACKAGE and "PACKAGE" or "[unknown]");
end;
return v2;