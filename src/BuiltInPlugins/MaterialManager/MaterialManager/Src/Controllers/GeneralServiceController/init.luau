local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_Util_0 = l_Parent_0.Src.Util;
local v6 = require(l_Util_0.ApplyToBasePart);
local v7 = require(l_Util_0.ApplyToInstances);
local v8 = require(l_Util_0.GenerateMaterialName);
local v9 = require(l_Util_0.GenerateTerrainDetailName);
local v10 = require(l_Util_0.getNumberIdFromURL);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v12 = require(l_Constants_0.getMaterialName);
local v13 = require(l_Constants_0.getMaterialPatternName);
local v14 = require(l_Constants_0.getErrorTypes)();
local v15 = l_ContextItem_0:extend("GeneralServiceController");
v15.new = function(v16) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: l_ServiceWrapper_0 (copy), v15 (copy)
    return (setmetatable({
        _changeHistoryService = l_ServiceWrapper_0.new("ChangeHistoryService", v16), 
        _insertService = l_ServiceWrapper_0.new("InsertService", v16), 
        _selection = l_ServiceWrapper_0.new("Selection", v16), 
        _assetManagerService = l_ServiceWrapper_0.new("AssetManagerService", v16), 
        _materialService = l_ServiceWrapper_0.new("MaterialService", v16), 
        _studioService = l_ServiceWrapper_0.new("StudioService", v16), 
        _marketplaceService = l_ServiceWrapper_0.new("MarketplaceService", v16), 
        _loadedFiles = {}, 
        _mock = v16
    }, v15));
end;
v15.mock = function() --[[ Line: 41 ]] --[[ Name: mock ]]
    -- upvalues: v15 (copy)
    return v15.new(true);
end;
v15.destroy = function(v17) --[[ Line: 45 ]] --[[ Name: destroy ]]
    v17._changeHistoryService:destroy();
    v17._insertService:destroy();
    v17._assetManagerService:destroy();
end;
v15.destroyWithUndo = function(v18, v19) --[[ Line: 51 ]] --[[ Name: destroyWithUndo ]]
    v19.Parent = nil;
    v18._changeHistoryService:asService():SetWaypoint("Deleted " .. v19.Name);
end;
v15.LoadLocalAsset = function(v20, v21) --[[ Line: 56 ]] --[[ Name: LoadLocalAsset ]]
    if v20._mock then
        local l_Model_0 = Instance.new("Model");
        Instance.new("MeshPart").Parent = l_Model_0;
        return l_Model_0;
    else
        if not v20._loadedFiles[v21] then
            v20._loadedFiles[v21] = v20._insertService:asService():LoadLocalAsset(v21);
        end;
        return v20._loadedFiles[v21];
    end;
end;
v15.SetSelection = function(v23, v24) --[[ Line: 72 ]] --[[ Name: SetSelection ]]
    v23._selection:asService():Set(v24);
end;
v15.ApplyToBasePart = function(v25, v26, v27, v28) --[[ Line: 76 ]] --[[ Name: ApplyToBasePart ]]
    -- upvalues: v6 (copy)
    v6(v26, v27, v28);
    v25._changeHistoryService:asService():SetWaypoint("Applied Material to BasePart");
end;
v15.ApplyToSelection = function(v29, v30, v31) --[[ Line: 85 ]] --[[ Name: ApplyToSelection ]]
    -- upvalues: v7 (copy)
    local v32 = v29._selection:asService():Get();
    v7(v32, v30, v31);
    v29._changeHistoryService:asService():SetWaypoint("Applied Material to Selection");
end;
v15.setName = function(v33, v34, v35) --[[ Line: 91 ]] --[[ Name: setName ]]
    v34.Name = v35;
    v33._changeHistoryService:asService():SetWaypoint("Set Name for Material Variant to" .. v35);
end;
v15.setBaseMaterial = function(v36, v37, v38) --[[ Line: 96 ]] --[[ Name: setBaseMaterial ]]
    -- upvalues: v12 (copy)
    v37.BaseMaterial = v38;
    v36._changeHistoryService:asService():SetWaypoint("Set BaseMaterial for Material Variant to" .. v12(v38));
end;
v15.setTextureMap = function(v39, v40, v41, v42) --[[ Line: 103 ]] --[[ Name: setTextureMap ]]
    v40[v41] = v42;
    v39._changeHistoryService:asService():SetWaypoint("Set" .. v41 .. "for Material Variant to" .. v42);
end;
v15.importFile = function(v43) --[[ Line: 108 ]] --[[ Name: importFile ]]
    local v44 = {
        "png", 
        "jpg", 
        "jpeg"
    };
    local v45 = nil;
    local l_status_0, _ = pcall(function() --[[ Line: 112 ]]
        -- upvalues: v45 (ref), v43 (copy), v44 (copy)
        v45 = v43._studioService:asService():PromptImportFile(v44);
    end);
    return l_status_0, v45;
end;
v15.insertAssetId = function(v48, v49, v50) --[[ Line: 119 ]] --[[ Name: insertAssetId ]]
    local v51 = tonumber(v49:match("://(%d+)"));
    if v51 then
        v50 = v50:match("[^.]+");
        if v50:sub(1, 7) ~= "Images/" then
            v50 = "Images/" .. v50;
        end;
        pcall(function() --[[ Line: 129 ]]
            -- upvalues: v48 (copy), v50 (ref)
            v48._assetManagerService:asService():DeleteAlias(v50);
        end);
        return (pcall(function() --[[ Line: 132 ]]
            -- upvalues: v48 (copy), v51 (copy), v50 (ref)
            v48._assetManagerService:asService():CreateAlias(Enum.AssetType.Image.Value, v51, v50);
        end));
    else
        return false;
    end;
end;
v15.uploadTextureMap = function(v52, _, _, v55, v56, v57, v58) --[[ Line: 141 ]] --[[ Name: uploadTextureMap ]]
    -- upvalues: v14 (copy)
    local _ = v55:handleAsset(v56, v57):andThen(function(v59) --[[ Line: 151 ]]
        -- upvalues: v52 (copy), v56 (copy), v14 (ref), v58 (copy)
        local v60 = v52:insertAssetId(v59, v56.Name);
        local v61 = nil;
        if not v60 then
            v61 = v14.FailedToInsertAssetManager;
        end;
        v58(v59, "uploadTextureMapSuccess", v61);
    end):catch(function(v62) --[[ Line: 159 ]]
        -- upvalues: v58 (copy), v14 (ref)
        warn("Error uploading asset, responseCode " .. tostring(v62.responseCode));
        if not v62 or not v62.responseCode or v62.responseCode == -1 then
            v58("", "uploadTextureMapFromFileError", v14.FailedToUploadTooLarge);
            return;
        else
            v58("", "uploadTextureMapGeneralError", v14.FailedToUploadFromFileMap);
            return;
        end;
    end);
end;
v15.setTextureMapFromFile = function(v64, v65, v66, v67, v68, v69, v70) --[[ Line: 169 ]] --[[ Name: setTextureMapFromFile ]]
    -- upvalues: v14 (copy)
    v70("", "importTextureMap", nil);
    local v71, v72 = v64:importFile();
    if v71 then
        if v72 then
            local l_v72_TemporaryId_0 = v72:GetTemporaryId();
            v64:uploadTextureMap(v65, v66, v67, v72, v68, v70);
            v69(v72, l_v72_TemporaryId_0);
            return;
        end;
    else
        v70("", "importTextureMapError", v14.FailedToImportMap);
    end;
end;
v15.setTextureMapFromURL = function(v74, v75, v76, v77, v78, v79) --[[ Line: 191 ]] --[[ Name: setTextureMapFromURL ]]
    -- upvalues: v10 (copy), v14 (copy)
    v79("", "uploadAssetIdTextureMap", nil);
    local v80 = v10(v77);
    if not v80 then
        v79("", "uploadFromURLTextureMapError", v14.FailedUrl);
        return;
    else
        local v81 = nil;
        spawn(function() --[[ Line: 207 ]]
            -- upvalues: v78 (copy), v81 (ref), v74 (copy), v80 (copy), v79 (copy), v14 (ref), v75 (copy), v76 (copy)
            if not v78() then
                return;
            else
                local l_status_1, _ = pcall(function() --[[ Line: 212 ]]
                    -- upvalues: v81 (ref), v74 (ref), v80 (ref)
                    v81 = v74._marketplaceService:asService():GetProductInfo(v80);
                end);
                if not v78() then
                    return;
                elseif not l_status_1 or not v81 or v81.AssetTypeId ~= Enum.AssetType.Image.Value then
                    v79("", "uploadFromURLTextureMapError", v14.FailedUrl);
                    return;
                else
                    local v84 = "rbxassetid://" .. tostring(v80);
                    v74:setTextureMap(v75, v76, v84);
                    return;
                end;
            end;
        end);
        return;
    end;
end;
v15.setStudsPerTile = function(v85, v86, v87) --[[ Line: 229 ]] --[[ Name: setStudsPerTile ]]
    v86.StudsPerTile = v87;
    v85._changeHistoryService:asService():SetWaypoint("Set StudsPerTile for Material Variant to" .. v87);
end;
v15.setMaterialPattern = function(v88, v89, v90) --[[ Line: 234 ]] --[[ Name: setMaterialPattern ]]
    -- upvalues: v13 (copy)
    v89.MaterialPattern = v90;
    v88._changeHistoryService:asService():SetWaypoint("Set MaterialPattern for Material Variant to" .. v13(v90));
end;
v15.setTerrainDetailName = function(v91, v92, v93) --[[ Line: 244 ]] --[[ Name: setTerrainDetailName ]]
    v92.Name = v93;
    v91._changeHistoryService:asService():SetWaypoint("Set Name for Terrain Detail to" .. v93);
end;
v15.createMaterialVariant = function(v94, v95, v96) --[[ Line: 249 ]] --[[ Name: createMaterialVariant ]]
    -- upvalues: v8 (copy)
    v94._changeHistoryService:asService():SetWaypoint("Create new Material Variant");
    local l_MaterialVariant_0 = Instance.new("MaterialVariant");
    local v98 = if v96 and v96 ~= "" then v96 else "MaterialVariant";
    local v99 = v95 or Enum.Material.Plastic;
    local v100 = v8(v94._materialService:asInstance(), v99, v98);
    l_MaterialVariant_0.Name = if v100 then v98 .. v100 else v98;
    l_MaterialVariant_0.BaseMaterial = v99;
    l_MaterialVariant_0.StudsPerTile = 10;
    l_MaterialVariant_0.Parent = game:GetService("MaterialService");
    return l_MaterialVariant_0;
end;
v15.createTerrainDetail = function(v101, v102, v103) --[[ Line: 263 ]] --[[ Name: createTerrainDetail ]]
    -- upvalues: v9 (copy)
    local l_TerrainDetail_0 = Instance.new("TerrainDetail");
    l_TerrainDetail_0.Face = v103;
    l_TerrainDetail_0.Name = "TerrainDetail" .. v9(v102, "TerrainDetail");
    l_TerrainDetail_0.Parent = v102;
    v101._changeHistoryService:asService():SetWaypoint("Create new Terrain Detail to" .. l_TerrainDetail_0.Name);
    return l_TerrainDetail_0;
end;
return v15;