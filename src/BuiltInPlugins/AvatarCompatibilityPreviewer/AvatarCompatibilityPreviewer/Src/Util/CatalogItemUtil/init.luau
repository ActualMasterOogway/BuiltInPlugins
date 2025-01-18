local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.AnimationPreview);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v7 = require(l_script_FirstAncestor_0.Src.Components.CatalogPreviewBasic);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Components.SkinPreview);
local v10 = require(l_script_FirstAncestor_0.Src.Util.find);
local l_AssetTypeAttachmentInfo_0 = v1.Util.AccessoryAndBodyToolShared.AssetTypeAttachmentInfo;
local v12 = {};
local function v13() --[[ Line: 20 ]] --[[ Name: noCustomInstance ]]
    return nil;
end;
local function v14() --[[ Line: 24 ]] --[[ Name: noWearInstance ]]
    error("Attempting to wear an instance from something that has no custom instance implementation");
end;
local function v25(v15, v16) --[[ Line: 32 ]] --[[ Name: createCustomInstanceFromSelectionForAccessory ]]
    -- upvalues: v8 (copy), v2 (copy), l_AssetTypeAttachmentInfo_0 (copy)
    if not v15.Archivable then
        return nil;
    elseif not v15:IsA("Accessory") then
        return nil;
    else
        assert(v15:IsA("Accessory"), v8.LUAU_ANALYZE_ERROR);
        if v15.AccessoryType ~= Enum.AccessoryType.Unknown and v15.AccessoryType ~= v8.ASSET_TYPE_TO_ACCESSORY_TYPE[v16] then
            return nil;
        else
            local l_Handle_0 = v15:FindFirstChild("Handle");
            if l_Handle_0 == nil or not l_Handle_0.Archivable then
                return nil;
            else
                for _, v19 in v2.Dictionary.join(l_AssetTypeAttachmentInfo_0.Accessory, l_AssetTypeAttachmentInfo_0.Clothing) do
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 60 ]]
                        -- upvalues: v19 (copy)
                        return Enum.AssetType[v19.AssetType];
                    end);
                    if l_status_0 and l_result_0 == v16 then
                        for _, v23 in v19.Attachments do
                            if l_Handle_0:FindFirstChild(v23.Name) then
                                local v24 = v15:Clone();
                                v24.Handle.Position = Vector3.new();
                                return v24;
                            end;
                        end;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v31(v26, v27, v28) --[[ Line: 80 ]] --[[ Name: wearAccessory ]]
    local v29 = v26:Clone();
    if v29:FindFirstChild("Handle") == nil then
        return nil;
    else
        local l_WrapLayer_0 = v29.Handle:FindFirstChildWhichIsA("WrapLayer");
        if l_WrapLayer_0 ~= nil then
            l_WrapLayer_0.Order = v28;
        end;
        v27.Humanoid:AddAccessory(v29);
        return {
            v29
        };
    end;
end;
local function v38(v32, v33) --[[ Line: 97 ]] --[[ Name: updateAccessories ]]
    for _, v35 in v32 do
        local l_v35_FirstChildWhichIsA_0 = v35:FindFirstChildWhichIsA("WrapLayer", true);
        if l_v35_FirstChildWhichIsA_0 ~= nil then
            l_v35_FirstChildWhichIsA_0.Order = v33;
            task.defer(function() --[[ Line: 106 ]]
                -- upvalues: l_v35_FirstChildWhichIsA_0 (copy)
                local l_l_v35_FirstChildWhichIsA_0_0 = l_v35_FirstChildWhichIsA_0;
                l_l_v35_FirstChildWhichIsA_0_0.Order = l_l_v35_FirstChildWhichIsA_0_0.Order + 1;
                l_l_v35_FirstChildWhichIsA_0_0 = l_v35_FirstChildWhichIsA_0;
                l_l_v35_FirstChildWhichIsA_0_0.Order = l_l_v35_FirstChildWhichIsA_0_0.Order - 1;
            end);
        end;
    end;
end;
local function v42(v39) --[[ Line: 114 ]] --[[ Name: getBuiltinItemDataFromId ]]
    -- upvalues: v10 (copy), v6 (copy), v8 (copy)
    local v41 = v10(v6.allItems, function(v40) --[[ Line: 115 ]]
        -- upvalues: v39 (copy)
        return v40.id == v39;
    end);
    if v41 == nil then
        error((("Couldn't getBuiltinItemDataFromId: %*"):format(v39)));
    end;
    assert(v41 ~= nil, v8.LUAU_ANALYZE_ERROR);
    return v41;
end;
v12.basicAccessoryPalette = function(v43, v44, v45) --[[ Line: 127 ]] --[[ Name: basicAccessoryPalette ]]
    -- upvalues: v7 (copy), v31 (copy), v25 (copy), v42 (copy), v38 (copy)
    return {
        Key = v43, 
        Items = v45, 
        PreviewComponent = v7, 
        PublishAssetType = v44, 
        WearBuiltin = function(v46, v47) --[[ Line: 138 ]] --[[ Name: WearBuiltin ]]
            -- upvalues: v44 (copy)
            v47.accessories[v44] = v46;
        end, 
        WearInstance = v31, 
        CreateCustomInstanceFromSelection = function(v48) --[[ Line: 144 ]] --[[ Name: CreateCustomInstanceFromSelection ]]
            -- upvalues: v25 (ref), v44 (copy)
            return (v25(v48, v44));
        end, 
        GetBuiltinItemData = v42, 
        UpdateInstances = v38
    };
end;
v12.layeredClothingPalette = function(v49, v50, v51, v52) --[[ Line: 154 ]] --[[ Name: layeredClothingPalette ]]
    -- upvalues: v7 (copy), v25 (copy), v31 (copy), v38 (copy), v42 (copy)
    return {
        Key = v49, 
        Items = v51, 
        PreviewComponent = v7, 
        PublishAssetType = v50, 
        WearBuiltin = function(v53, v54, v55) --[[ Line: 160 ]] --[[ Name: setLayeredClothingItem ]]
            -- upvalues: v50 (copy)
            for v56, v57 in v54.clothing do
                if v57.AssetType == v50 then
                    v54.clothing[v56] = {
                        AssetId = v53, 
                        AssetType = v50
                    };
                    return;
                end;
            end;
            table.insert(v54.clothing, {
                AssetId = v53, 
                AssetType = v50, 
                Order = v55
            });
        end, 
        CreateCustomInstanceFromSelection = function(v58) --[[ Line: 189 ]] --[[ Name: CreateCustomInstanceFromSelection ]]
            -- upvalues: v25 (ref), v50 (copy)
            return (v25(v58, v50));
        end, 
        WearInstance = v31, 
        UpdateInstances = v38, 
        GetBuiltinItemData = v42, 
        PreferredLayer = v52
    };
end;
v12.createBodyPalette = function(v59, v60, v61, v62) --[[ Line: 203 ]] --[[ Name: createBodyPalette ]]
    -- upvalues: v7 (copy)
    return {
        Key = v59, 
        PreviewComponent = v7, 
        Items = v61, 
        WearBuiltin = function(v63, v64) --[[ Line: 218 ]] --[[ Name: WearBuiltin ]]
            -- upvalues: v60 (copy)
            v64.patches[v60] = v63;
        end, 
        CreateCustomInstanceFromSelection = v62.CreateCustomInstanceFromSelection, 
        GetBuiltinItemData = function() --[[ Line: 224 ]] --[[ Name: GetBuiltinItemData ]]
            return nil;
        end, 
        WearInstance = v62.WearInstance
    };
end;
v12.createBodyCategory = function(v65) --[[ Line: 234 ]] --[[ Name: createBodyCategory ]]
    -- upvalues: v12 (copy), v13 (copy), v14 (copy)
    local v66 = {};
    for _, v68 in v65 do
        for v69, v70 in v68 do
            if v66[v69] == nil then
                v66[v69] = {
                    v70
                };
            else
                table.insert(v66[v69], v70);
            end;
        end;
    end;
    local function v72(v71) --[[ Line: 254 ]] --[[ Name: palette ]]
        -- upvalues: v12 (ref), v66 (copy), v13 (ref), v14 (ref)
        return v12.createBodyPalette(v71, Enum.AssetType[v71], v66[v71], {
            CreateCustomInstanceFromSelection = v13, 
            WearInstance = v14
        });
    end;
    return {
        v12.createBodyPalette("Torso", Enum.AssetType.Torso, v66.Torso, {
            CreateCustomInstanceFromSelection = v13, 
            WearInstance = v14
        }), 
        v12.createBodyPalette("LeftArm", Enum.AssetType.LeftArm, v66.LeftArm, {
            CreateCustomInstanceFromSelection = v13, 
            WearInstance = v14
        }), 
        v12.createBodyPalette("RightArm", Enum.AssetType.RightArm, v66.RightArm, {
            CreateCustomInstanceFromSelection = v13, 
            WearInstance = v14
        }), 
        v12.createBodyPalette("LeftLeg", Enum.AssetType.LeftLeg, v66.LeftLeg, {
            CreateCustomInstanceFromSelection = v13, 
            WearInstance = v14
        }), 
        v72("RightLeg")
    };
end;
v12.createHeadPalette = function(v73) --[[ Line: 270 ]] --[[ Name: createHeadPalette ]]
    -- upvalues: v12 (copy)
    return v12.createBodyPalette("HeadBodyPart", Enum.AssetType.Head, v73, {
        CreateCustomInstanceFromSelection = function(v74) --[[ Line: 272 ]] --[[ Name: CreateCustomInstanceFromSelection ]]
            if v74.Name ~= "Head" or not v74:IsA("MeshPart") then
                return nil;
            else
                local v75 = v74:Clone();
                v75.Position = Vector3.new();
                return v75;
            end;
        end, 
        WearInstance = function(v76, v77) --[[ Line: 282 ]] --[[ Name: WearInstance ]]
            local v78 = v76:Clone();
            v78.Name = "Head";
            v77.Humanoid:ReplaceBodyPartR15(Enum.BodyPartR15.Head, v78);
            return {};
        end
    });
end;
v12.createBodyAnimationPalette = function(v79, v80) --[[ Line: 293 ]] --[[ Name: createBodyAnimationPalette ]]
    -- upvalues: v3 (copy), v5 (copy), v8 (copy), v13 (copy), v14 (copy)
    return {
        Key = v79, 
        OverrideEquipKey = "animations", 
        Items = v80, 
        PreviewComponent = function(v81) --[[ Line: 302 ]] --[[ Name: PreviewComponent ]]
            -- upvalues: v3 (ref), v5 (ref), v8 (ref)
            return v3.createElement(v5, {
                AnimationId = v81.Item, 
                AnimateTargetAsset = v8.BODY_PREVIEW_PATH, 
                Style = "BodyPreview", 
                Transparency = v81.Transparency
            });
        end, 
        WearBuiltin = function(v82, v83) --[[ Line: 311 ]] --[[ Name: WearBuiltin ]]
            v83.animation = v82;
        end, 
        CreateCustomInstanceFromSelection = v13, 
        GetBuiltinItemData = function() --[[ Line: 317 ]] --[[ Name: GetBuiltinItemData ]]
            return nil;
        end, 
        WearInstance = v14
    };
end;
v12.shoesPalette = function(v84) --[[ Line: 330 ]] --[[ Name: shoesPalette ]]
    -- upvalues: v3 (copy), v7 (copy), v25 (copy), v31 (copy), v38 (copy), v10 (copy), v6 (copy), v8 (copy)
    return {
        Key = "Shoes", 
        Items = v84, 
        PreviewComponent = function(v85) --[[ Line: 336 ]] --[[ Name: PreviewComponent ]]
            -- upvalues: v3 (ref), v7 (ref)
            return v3.createElement(v7, {
                Item = v85.Item.right, 
                Transparency = v85.Transparency
            });
        end, 
        WearBuiltin = function(v86, v87, v88) --[[ Line: 343 ]] --[[ Name: WearBuiltin ]]
            table.insert(v87.clothing, {
                AssetId = v86.left, 
                AssetType = Enum.AssetType.LeftShoeAccessory, 
                Order = v88
            });
            table.insert(v87.clothing, {
                AssetId = v86.right, 
                AssetType = Enum.AssetType.RightShoeAccessory, 
                Order = v88
            });
        end, 
        CreateCustomInstanceFromSelection = function(v89) --[[ Line: 357 ]] --[[ Name: CreateCustomInstanceFromSelection ]]
            -- upvalues: v25 (ref)
            if v89:IsA("Folder") then
                local l_v89_Children_0 = v89:GetChildren();
                if #l_v89_Children_0 == 2 then
                    local v91 = nil;
                    local v92 = nil;
                    for _, v94 in l_v89_Children_0 do
                        v91 = v91 or v25(v94, Enum.AssetType.LeftShoeAccessory);
                        v92 = v92 or v25(v94, Enum.AssetType.RightShoeAccessory);
                    end;
                    if v91 ~= nil and v92 ~= nil then
                        return (v89:Clone());
                    else
                        return "InvalidPair";
                    end;
                elseif #l_v89_Children_0 > 2 and #l_v89_Children_0 < 10 then
                    for _, v96 in l_v89_Children_0 do
                        if v25(v96, Enum.AssetType.LeftShoeAccessory) == nil and v25(v96, Enum.AssetType.RightShoeAccessory) == nil then
                            return nil;
                        end;
                    end;
                    return "NeedTwoShoes";
                elseif #l_v89_Children_0 == 1 then
                    return v25(l_v89_Children_0[1], Enum.AssetType.LeftShoeAccessory) or v25(l_v89_Children_0[1], Enum.AssetType.RightShoeAccessory);
                else
                    return nil;
                end;
            else
                return v25(v89, Enum.AssetType.LeftShoeAccessory) or v25(v89, Enum.AssetType.RightShoeAccessory);
            end;
        end, 
        WearInstance = function(v97, v98, v99) --[[ Line: 417 ]] --[[ Name: WearInstance ]]
            -- upvalues: v31 (ref)
            if v97:IsA("Folder") then
                local v100 = {};
                for _, v102 in v97:GetChildren() do
                    if v102:IsA("Accessory") then
                        table.insert(v100, v31(v102, v98, v99)[1]);
                    end;
                end;
                return v100;
            else
                return (v31(v97, v98, v99));
            end;
        end, 
        UpdateInstances = v38, 
        GetBuiltinItemData = function(v103) --[[ Line: 435 ]] --[[ Name: GetBuiltinItemData ]]
            -- upvalues: v10 (ref), v6 (ref), v8 (ref)
            local l_left_0 = v103.left;
            local v106 = v10(v6.allItems, function(v105) --[[ Line: 115 ]]
                -- upvalues: l_left_0 (copy)
                return v105.id == l_left_0;
            end);
            if v106 == nil then
                error((("Couldn't getBuiltinItemDataFromId: %*"):format(l_left_0)));
            end;
            assert(v106 ~= nil, v8.LUAU_ANALYZE_ERROR);
            return v106;
        end, 
        Serializer = {
            serialize = function(v107) --[[ Line: 440 ]] --[[ Name: serialize ]]
                return v107.left;
            end, 
            deserialize = function(v108) --[[ Line: 444 ]] --[[ Name: deserialize ]]
                -- upvalues: v84 (copy)
                for _, v110 in v84 do
                    if v110.left == v108 then
                        return v110;
                    end;
                end;
                error((("Invalid pair of shoes for %*"):format(v108)));
            end
        }, 
        PreferredLayer = v8.PREFERRED_LAYERS.Shoes
    };
end;
v12.emotionPalette = function(v111) --[[ Line: 459 ]] --[[ Name: emotionPalette ]]
    -- upvalues: v3 (copy), v5 (copy), v8 (copy), v13 (copy), v14 (copy)
    return {
        Key = "Emotions", 
        Items = v111, 
        PreviewComponent = function(v112) --[[ Line: 463 ]] --[[ Name: PreviewComponent ]]
            -- upvalues: v3 (ref), v5 (ref), v8 (ref)
            return v3.createElement(v5, {
                AnimationId = v112.Item, 
                AnimateTargetAsset = v8.HEAD_PREVIEW_PATH, 
                Style = "FacePreview", 
                Transparency = v112.Transparency
            });
        end, 
        WearBuiltin = function(v113, v114) --[[ Line: 472 ]] --[[ Name: WearBuiltin ]]
            v114.emotion = v113;
        end, 
        GetBuiltinItemData = function() --[[ Line: 476 ]] --[[ Name: GetBuiltinItemData ]]
            return nil;
        end, 
        CreateCustomInstanceFromSelection = v13, 
        WearInstance = v14
    };
end;
v12.skinPalette = function(v115) --[[ Line: 485 ]] --[[ Name: skinPalette ]]
    -- upvalues: v9 (copy), v13 (copy), v14 (copy)
    return {
        Key = "Skin", 
        Items = v115, 
        PreviewAspectRatio = 2, 
        PreviewComponent = v9, 
        CreateCustomInstanceFromSelection = v13, 
        WearBuiltin = function(v116, v117) --[[ Line: 495 ]] --[[ Name: WearBuiltin ]]
            v117.skinTone = v116;
        end, 
        WearInstance = v14, 
        GetBuiltinItemData = function() --[[ Line: 501 ]] --[[ Name: GetBuiltinItemData ]]
            return nil;
        end, 
        Serializer = {
            serialize = function(v118) --[[ Line: 506 ]] --[[ Name: serialize ]]
                return {
                    v118.R, 
                    v118.G, 
                    v118.B
                };
            end, 
            deserialize = function(v119) --[[ Line: 510 ]] --[[ Name: deserialize ]]
                return Color3.new(v119[1], v119[2], v119[3]);
            end
        }
    };
end;
return v12;