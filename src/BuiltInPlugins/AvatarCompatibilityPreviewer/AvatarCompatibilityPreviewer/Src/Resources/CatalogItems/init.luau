local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v8 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v9 = require(l_script_FirstAncestor_0.Packages.Dash);
local v10 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v11 = require(l_script_FirstAncestor_0.Src.Util.CatalogItemUtil);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCheckFaceItems);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerNewCatalogAccessories);
local v17 = game:DefineFastString("AvatarPreviewerEyebrowIds", "11572097774");
local v18 = game:DefineFastString("AvatarPreviewerEyelashIds", "11572100557");
local function _(v19) --[[ Line: 21 ]] --[[ Name: brickColor3 ]]
    return BrickColor.new(v19).Color;
end;
local function _(v21) --[[ Line: 26 ]] --[[ Name: DEPRECATED_assetIdsFromFString ]]
    -- upvalues: v9 (copy)
    return v9.map(string.split(v21, ","), function(v22) --[[ Line: 27 ]]
        return (tonumber(v22));
    end);
end;
local _ = function(v24) --[[ Line: 32 ]] --[[ Name: builtinIds ]]
    local v25 = {};
    for _, v27 in v24 do
        table.insert(v25, v27.id);
    end;
    return v25;
end;
local v29 = {};
local l_join_0 = v8.List.join;
local v31 = {};
local l_layeredClothingPalette_0 = v11.layeredClothingPalette;
local v33 = "Hair";
local l_HairAccessory_0 = Enum.AssetType.HairAccessory;
local l_hair_0 = v10.hair;
local v36 = {};
for _, v38 in l_hair_0 do
    table.insert(v36, v38.id);
end;
v6(v31, 1, l_layeredClothingPalette_0(v33, l_HairAccessory_0, v36, v12.PREFERRED_LAYERS.Hair));
if v14() then
    l_layeredClothingPalette_0 = {};
    v33 = v11.basicAccessoryPalette;
    l_HairAccessory_0 = "Head";
    local l_Hat_0 = Enum.AssetType.Hat;
    v36 = v10.head;
    local v40 = {};
    for _, v42 in v36 do
        table.insert(v40, v42.id);
    end;
    v33 = v33(l_HairAccessory_0, l_Hat_0, v40);
    l_HairAccessory_0 = v11.layeredClothingPalette;
    l_Hat_0 = "Face";
    l_hair_0 = Enum.AssetType.FaceAccessory;
    v40 = v10.face;
    local v43 = {};
    for _, v45 in v40 do
        table.insert(v43, v45.id);
    end;
    l_HairAccessory_0 = l_HairAccessory_0(l_Hat_0, l_hair_0, v43, v12.PREFERRED_LAYERS.Face);
    l_Hat_0 = v11.layeredClothingPalette;
    l_hair_0 = "Eyebrows";
    v36 = Enum.AssetType.EyebrowAccessory;
    if v15() then
        v43 = v10.eyebrows;
        local v46 = {};
        for _, v48 in v43 do
            table.insert(v46, v48.id);
        end;
        v40 = v46;
    else
        v40 = v9.map(string.split(v17, ","), function(v49) --[[ Line: 27 ]]
            return (tonumber(v49));
        end);
    end;
    l_Hat_0 = l_Hat_0(l_hair_0, v36, v40, v12.PREFERRED_LAYERS.Eyebrows);
    l_hair_0 = v11.layeredClothingPalette;
    v36 = "Eyelashes";
    v40 = Enum.AssetType.EyelashAccessory;
    if v15() then
        local l_eyelashes_0 = v10.eyelashes;
        local v51 = {};
        for _, v53 in l_eyelashes_0 do
            table.insert(v51, v53.id);
        end;
        v43 = v51;
    else
        v43 = v9.map(string.split(v18, ","), function(v54) --[[ Line: 27 ]]
            return (tonumber(v54));
        end);
    end;
    v6(l_layeredClothingPalette_0, 1, v33, l_HairAccessory_0, l_Hat_0, l_hair_0(v36, v40, v43, v12.PREFERRED_LAYERS.Eyelashes));
else
    l_layeredClothingPalette_0 = {};
end;
if v16() then
    v33 = {};
    l_HairAccessory_0 = v11.basicAccessoryPalette;
    local v55 = "Front";
    l_hair_0 = Enum.AssetType.FrontAccessory;
    local l_front_0 = v10.front;
    local v57 = {};
    for _, v59 in l_front_0 do
        table.insert(v57, v59.id);
    end;
    v6(v33, 1, l_HairAccessory_0(v55, l_hair_0, v57));
else
    v33 = {};
end;
l_HairAccessory_0 = {};
local l_basicAccessoryPalette_0 = v11.basicAccessoryPalette;
l_hair_0 = "Neck";
v36 = Enum.AssetType.NeckAccessory;
local v61;
if v16() then
    local l_neck_0 = v10.neck;
    local v63 = {};
    for _, v65 in l_neck_0 do
        table.insert(v63, v65.id);
    end;
    v61 = v63;
else
    v61 = {
        13881788203, 
        12566318504, 
        12272017766, 
        11515295880, 
        12272010851, 
        10648495674
    };
end;
l_basicAccessoryPalette_0 = l_basicAccessoryPalette_0(l_hair_0, v36, v61);
l_hair_0 = v11.basicAccessoryPalette;
v36 = "Shoulder";
v61 = Enum.AssetType.ShoulderAccessory;
local v66;
if v16() then
    local l_shoulder_0 = v10.shoulder;
    local v68 = {};
    for _, v70 in l_shoulder_0 do
        table.insert(v68, v70.id);
    end;
    v66 = v68;
else
    v66 = {
        2620477453, 
        106709021, 
        7243878029, 
        8760832521, 
        6467614725
    };
end;
l_hair_0 = l_hair_0(v36, v61, v66);
v36 = v11.basicAccessoryPalette;
v61 = "Back";
v66 = Enum.AssetType.BackAccessory;
local v71;
if v16() then
    local l_back_0 = v10.back;
    local v73 = {};
    for _, v75 in l_back_0 do
        table.insert(v73, v75.id);
    end;
    v71 = v73;
else
    v71 = {
        1180432276, 
        11821667294, 
        12272035364, 
        13820443205, 
        1744123855
    };
end;
v36 = v36(v61, v66, v71);
v61 = v11.basicAccessoryPalette;
v66 = "Waist";
v71 = Enum.AssetType.WaistAccessory;
local v76;
if v16() then
    local l_waist_0 = v10.waist;
    local v78 = {};
    for _, v80 in l_waist_0 do
        table.insert(v78, v80.id);
    end;
    v76 = v78;
else
    v76 = {
        791329052, 
        187846604, 
        738679517, 
        472507574, 
        3576665068, 
        1117719026, 
        8697885688, 
        10616839810, 
        3230476122, 
        7065897530
    };
end;
v6(l_HairAccessory_0, 1, l_basicAccessoryPalette_0, l_hair_0, v36, v61(v66, v71, v76));
v29.accessories = l_join_0(v31, l_layeredClothingPalette_0, v33, l_HairAccessory_0);
v29.animations = {
    v11.createBodyAnimationPalette("Movement", {
        16540596584, 
        16562317918, 
        16562332340, 
        16562326358, 
        16562321958, 
        16562307212, 
        16562311455, 
        16562329379
    }), 
    v11.createBodyAnimationPalette("BodyEmotes", {
        16569676514, 
        16569175989, 
        16569548328, 
        16569163126, 
        10714358528, 
        10714395441, 
        10714383856, 
        4940563117, 
        10714347256, 
        10714369325
    })
};
v29.body = v8.List.join({
    v11.skinPalette({
        BrickColor.new("Dirt brown").Color, 
        BrickColor.new("Reddish brown").Color, 
        BrickColor.new("Brown").Color, 
        BrickColor.new("Sand red").Color, 
        BrickColor.new("Linen").Color, 
        BrickColor.new("Burlap").Color, 
        BrickColor.new("Brick yellow").Color, 
        BrickColor.new("Medium red").Color, 
        BrickColor.new("Dusty Rose").Color, 
        BrickColor.new("CGA brown").Color, 
        BrickColor.new("Dark orange").Color, 
        BrickColor.new("Nougat").Color, 
        BrickColor.new("Light orange").Color, 
        BrickColor.new("Pastel brown").Color, 
        BrickColor.new("Neon orange").Color, 
        BrickColor.new("Bright orange").Color, 
        BrickColor.new("Br. yellowish orange").Color, 
        BrickColor.new("Deep orange").Color, 
        BrickColor.new("Bright yellow").Color, 
        BrickColor.new("Daisy orange").Color, 
        BrickColor.new("Cool yellow").Color, 
        BrickColor.new("Earth green").Color, 
        BrickColor.new("Camo").Color, 
        BrickColor.new("Dark green").Color, 
        BrickColor.new("Bright green").Color, 
        BrickColor.new("Shamrock").Color, 
        BrickColor.new("Moss").Color, 
        BrickColor.new("Br. yellowish green").Color, 
        BrickColor.new("Navy blue").Color, 
        BrickColor.new("Deep blue").Color, 
        BrickColor.new("Really blue").Color, 
        BrickColor.new("Bright blue").Color, 
        BrickColor.new("Steel blue").Color, 
        BrickColor.new("Medium blue").Color, 
        BrickColor.new("Light blue").Color, 
        BrickColor.new("Bright bluish green").Color, 
        BrickColor.new("Teal").Color, 
        BrickColor.new("Pastel blue-green").Color, 
        BrickColor.new("Toothpaste").Color, 
        BrickColor.new("Cyan").Color, 
        BrickColor.new("Pastel Blue").Color, 
        BrickColor.new("Pastel light blue").Color, 
        BrickColor.new("Bright violet").Color, 
        BrickColor.new("Lavender").Color, 
        BrickColor.new("Lilac").Color, 
        BrickColor.new("Magenta").Color, 
        BrickColor.new("Royal purple").Color, 
        BrickColor.new("Alder").Color, 
        BrickColor.new("Pastel violet").Color, 
        BrickColor.new("Bright red").Color, 
        BrickColor.new("Really red").Color, 
        BrickColor.new("Hot pink").Color, 
        BrickColor.new("Pink").Color, 
        BrickColor.new("Carnation pink").Color, 
        BrickColor.new("Light reddish violet").Color, 
        BrickColor.new("Pastel orange").Color, 
        BrickColor.new("Dark taupe").Color, 
        BrickColor.new("Cork").Color, 
        BrickColor.new("Olive").Color, 
        BrickColor.new("Medium green").Color, 
        BrickColor.new("Grime").Color, 
        BrickColor.new("Sand green").Color, 
        BrickColor.new("Sand blue").Color, 
        BrickColor.new("Lime green").Color, 
        BrickColor.new("Pastel green").Color, 
        BrickColor.new("New Yeller").Color, 
        BrickColor.new("Pastel yellow").Color, 
        BrickColor.new("Really black").Color, 
        BrickColor.new("Black").Color, 
        BrickColor.new("Dark stone grey").Color, 
        BrickColor.new("Medium stone grey").Color, 
        BrickColor.new("Mid gray").Color, 
        BrickColor.new("Light stone grey").Color, 
        BrickColor.new("White").Color
    }), 
    v11.createHeadPalette({
        10687288296, 
        10725626210, 
        11572085825, 
        11584333045, 
        9107287520, 
        4908014528, 
        11775683481, 
        10407915508, 
        13207192743
    })
}, v11.createBodyCategory({
    {
        Torso = 10610645439, 
        LeftArm = 10610637502, 
        RightArm = 10610642340, 
        LeftLeg = 10610640030, 
        RightLeg = 10610643939
    }, 
    {
        Torso = 11572083496, 
        LeftArm = 11572074613, 
        RightArm = 11572079320, 
        LeftLeg = 11572076845, 
        RightLeg = 11572081357
    }, 
    {
        Torso = 11740060397, 
        LeftArm = 11740050465, 
        RightArm = 11740055375, 
        LeftLeg = 11740052832, 
        RightLeg = 11740057815
    }, 
    {
        Torso = 11775682187, 
        LeftArm = 11775676733, 
        RightArm = 11775679683, 
        LeftLeg = 11775678171, 
        RightLeg = 11775680970
    }, 
    {
        Torso = 7200824885, 
        LeftArm = 7200822331, 
        RightArm = 7200823471, 
        LeftLeg = 7200822888, 
        RightLeg = 7200824015
    }, 
    {
        Torso = 13207187481, 
        LeftArm = 13207165801, 
        RightArm = 13207181458, 
        LeftLeg = 13207168831, 
        RightLeg = 13207184265
    }
}));
l_join_0 = {};
v31 = v11.layeredClothingPalette;
l_layeredClothingPalette_0 = "Shirts";
v33 = Enum.AssetType.ShirtAccessory;
if v15() then
    l_basicAccessoryPalette_0 = v10.shirts;
    l_hair_0 = {};
    for _, v82 in l_basicAccessoryPalette_0 do
        table.insert(l_hair_0, v82.id);
    end;
    l_HairAccessory_0 = l_hair_0;
else
    l_HairAccessory_0 = {
        7178736794, 
        7178735702, 
        6984729814, 
        7178740556, 
        9620950227, 
        9620976296
    };
end;
v31 = v31(l_layeredClothingPalette_0, v33, l_HairAccessory_0, v12.PREFERRED_LAYERS.Tops);
l_layeredClothingPalette_0 = v11.layeredClothingPalette;
v33 = "TShirts";
l_HairAccessory_0 = Enum.AssetType.TShirtAccessory;
if v15() then
    l_hair_0 = v10.tshirts;
    v36 = {};
    for _, v84 in l_hair_0 do
        table.insert(v36, v84.id);
    end;
    l_basicAccessoryPalette_0 = v36;
else
    l_basicAccessoryPalette_0 = {
        9112474888, 
        7178736794, 
        7178737816
    };
end;
l_layeredClothingPalette_0 = l_layeredClothingPalette_0(v33, l_HairAccessory_0, l_basicAccessoryPalette_0, v12.PREFERRED_LAYERS.Tops);
v33 = v11.layeredClothingPalette;
l_HairAccessory_0 = "Jackets";
l_basicAccessoryPalette_0 = Enum.AssetType.JacketAccessory;
if v15() then
    v36 = v10.jackets;
    v61 = {};
    for _, v86 in v36 do
        table.insert(v61, v86.id);
    end;
    l_hair_0 = v61;
else
    l_hair_0 = {
        6984765766, 
        6984767443, 
        7272485361, 
        7192535654, 
        7192544729
    };
end;
v33 = v33(l_HairAccessory_0, l_basicAccessoryPalette_0, l_hair_0, v12.PREFERRED_LAYERS.Outerwear);
l_HairAccessory_0 = v11.layeredClothingPalette;
l_basicAccessoryPalette_0 = "Sweaters";
l_hair_0 = Enum.AssetType.SweaterAccessory;
if v15() then
    v61 = v10.sweaters;
    v66 = {};
    for _, v88 in v61 do
        table.insert(v66, v88.id);
    end;
    v36 = v66;
else
    v36 = {
        9240758221, 
        9913119150, 
        9913110927, 
        9174379982, 
        6984769289, 
        6984771334, 
        9240757332, 
        9274353324
    };
end;
l_HairAccessory_0 = l_HairAccessory_0(l_basicAccessoryPalette_0, l_hair_0, v36, v12.PREFERRED_LAYERS.Tops);
l_basicAccessoryPalette_0 = v11.layeredClothingPalette;
l_hair_0 = "Pants";
v36 = Enum.AssetType.PantsAccessory;
if v15() then
    v66 = v10.pants;
    v71 = {};
    for _, v90 in v66 do
        table.insert(v71, v90.id);
    end;
    v61 = v71;
else
    v61 = {
        6984763785, 
        6984740059, 
        7192673981, 
        7192681239, 
        7192679765
    };
end;
l_basicAccessoryPalette_0 = l_basicAccessoryPalette_0(l_hair_0, v36, v61, v12.PREFERRED_LAYERS.Bottoms);
l_hair_0 = v11.layeredClothingPalette;
v36 = "Shorts";
v61 = Enum.AssetType.ShortsAccessory;
if v15() then
    v71 = v10.shorts;
    v76 = {};
    for _, v92 in v71 do
        table.insert(v76, v92.id);
    end;
    v66 = v76;
else
    v66 = {
        6984773235, 
        7192683061, 
        7192685245
    };
end;
l_hair_0 = l_hair_0(v36, v61, v66, v12.PREFERRED_LAYERS.Bottoms);
v36 = v11.layeredClothingPalette;
v61 = "Skirts";
v66 = Enum.AssetType.DressSkirtAccessory;
if v15() then
    v76 = v10.skirts;
    local v93 = {};
    for _, v95 in v76 do
        table.insert(v93, v95.id);
    end;
    v71 = v93;
else
    v71 = {
        7192691582, 
        7192690731, 
        9284466791, 
        10278865927, 
        7192695838
    };
end;
v36 = v36(v61, v66, v71, v12.PREFERRED_LAYERS.Bottoms);
v61 = v11.shoesPalette({
    {
        left = 8722031289, 
        right = 8722020587
    }, 
    {
        left = 7193170137, 
        right = 7193171232
    }, 
    {
        left = 7193104827, 
        right = 7193106211
    }
});
v6(l_join_0, 1, v31, l_layeredClothingPalette_0, v33, l_HairAccessory_0, l_basicAccessoryPalette_0, l_hair_0, v36, v61);
v29.clothing = l_join_0;
v29.animations_face = {
    v11.emotionPalette({
        13965126930, 
        13965139478, 
        13965076233, 
        13965039145, 
        13965064041, 
        13965162732
    })
};
l_join_0 = v8.List.join;
if v14() then
    v31 = {};
    l_layeredClothingPalette_0 = v11.layeredClothingPalette;
    v33 = "Hair";
    l_HairAccessory_0 = Enum.AssetType.HairAccessory;
    l_hair_0 = v10.hair;
    v36 = {};
    for _, v97 in l_hair_0 do
        table.insert(v36, v97.id);
    end;
    v6(v31, 1, l_layeredClothingPalette_0(v33, l_HairAccessory_0, v36, v12.PREFERRED_LAYERS.Hair));
else
    v31 = {};
end;
l_layeredClothingPalette_0 = {};
v33 = v11.basicAccessoryPalette;
l_HairAccessory_0 = "Head";
l_basicAccessoryPalette_0 = Enum.AssetType.Hat;
if v16() then
    v36 = v10.head;
    v61 = {};
    for _, v99 in v36 do
        table.insert(v61, v99.id);
    end;
    l_hair_0 = v61;
else
    l_hair_0 = {
        607702162, 
        7951064603, 
        7893381364, 
        102619342, 
        1374269, 
        1038669, 
        10527448135, 
        89615321, 
        13476872
    };
end;
v33 = v33(l_HairAccessory_0, l_basicAccessoryPalette_0, l_hair_0);
l_HairAccessory_0 = v11.layeredClothingPalette;
l_basicAccessoryPalette_0 = "Face";
l_hair_0 = Enum.AssetType.FaceAccessory;
if v16() then
    v61 = v10.face;
    v66 = {};
    for _, v101 in v61 do
        table.insert(v66, v101.id);
    end;
    v36 = v66;
else
    v36 = {
        1192464705, 
        74970669, 
        1241185542, 
        20642008, 
        3210207381, 
        12313685, 
        158066137, 
        13702134
    };
end;
l_HairAccessory_0 = l_HairAccessory_0(l_basicAccessoryPalette_0, l_hair_0, v36, v12.PREFERRED_LAYERS.Face);
l_basicAccessoryPalette_0 = v11.layeredClothingPalette;
l_hair_0 = "Eyebrows";
v36 = Enum.AssetType.EyebrowAccessory;
if v15() then
    v66 = v10.eyebrows;
    v71 = {};
    for _, v103 in v66 do
        table.insert(v71, v103.id);
    end;
    v61 = v71;
else
    v61 = v9.map(string.split(v17, ","), function(v104) --[[ Line: 27 ]]
        return (tonumber(v104));
    end);
end;
l_basicAccessoryPalette_0 = l_basicAccessoryPalette_0(l_hair_0, v36, v61, v12.PREFERRED_LAYERS.Eyebrows);
l_hair_0 = v11.layeredClothingPalette;
v36 = "Eyelashes";
v61 = Enum.AssetType.EyelashAccessory;
if v15() then
    v71 = v10.eyelashes;
    v76 = {};
    for _, v106 in v71 do
        table.insert(v76, v106.id);
    end;
    v66 = v76;
else
    v66 = v9.map(string.split(v18, ","), function(v107) --[[ Line: 27 ]]
        return (tonumber(v107));
    end);
end;
v6(l_layeredClothingPalette_0, 1, v33, l_HairAccessory_0, l_basicAccessoryPalette_0, l_hair_0(v36, v61, v66, v12.PREFERRED_LAYERS.Eyelashes));
v29.accessories_face = l_join_0(v31, l_layeredClothingPalette_0);
return v29;