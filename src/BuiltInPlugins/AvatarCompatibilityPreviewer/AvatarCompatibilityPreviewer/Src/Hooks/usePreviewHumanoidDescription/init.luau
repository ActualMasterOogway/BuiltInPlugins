local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.copyHumanoidScaleToHumanoidDescription);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v9 = v8();
local v10 = Color3.fromRGB(205, 205, 204);
local function _(v11, v12) --[[ Line: 18 ]] --[[ Name: assignHumanoidDescriptionSkinTone ]]
    v11.HeadColor = v12;
    v11.TorsoColor = v12;
    v11.LeftArmColor = v12;
    v11.RightArmColor = v12;
    v11.LeftLegColor = v12;
    v11.RightLegColor = v12;
end;
local function _(v14) --[[ Line: 27 ]] --[[ Name: processAccessories ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.map(v14, function(v15) --[[ Line: 28 ]]
        -- upvalues: v4 (ref)
        return {
            AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v15.AssetType], (("No known accessory type for %*"):format(v15.AssetType))), 
            AssetId = v15.AssetId, 
            Order = v15.Order
        };
    end);
end;
local function _(v17, v18, v19) --[[ Line: 42 ]] --[[ Name: patchHumanoidDescription ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v20 = v17:Clone();
    for v21, v22 in v18 do
        v20[v21.Name] = v22;
    end;
    v20:SetAccessories(v2.map(v19, function(v23) --[[ Line: 28 ]]
        -- upvalues: v4 (ref)
        return {
            AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v23.AssetType], (("No known accessory type for %*"):format(v23.AssetType))), 
            AssetId = v23.AssetId, 
            Order = v23.Order
        };
    end), true);
    return v20;
end;
return function(v25, v26, v27) --[[ Line: 58 ]] --[[ Name: usePreviewHumanoidDescription ]]
    -- upvalues: v3 (copy), v5 (copy), v9 (copy), v1 (copy), v2 (copy), v10 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v28 = v3.useContext(v5);
    local v33 = if v9 then v3.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v27 (copy), v1 (ref), v28 (copy), v2 (ref)
        if v27 ~= nil and not v27.includeAccessories then
            return {};
        else
            return v1.List.join(v28.avatarAssets.clothing, v2.collectArray(v28.avatarAssets.accessories, function(v29, v30) --[[ Line: 77 ]]
                return {
                    AssetId = v30, 
                    AssetType = v29
                };
            end));
        end;
    end, {
        v27 and v27.includeAccessories, 
        v28.avatarAssets.clothing, 
        v28.avatarAssets.accessories
    }) else v1.List.join(v28.avatarAssets.clothing, v2.collectArray(v28.avatarAssets.accessories, function(v31, v32) --[[ Line: 93 ]]
        return {
            AssetId = v32, 
            AssetType = v31
        };
    end));
    return v3.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: v28 (copy), v25 (copy), v10 (ref), v4 (ref), v33 (copy), v2 (ref), v7 (ref), v8 (ref), v27 (copy)
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        if v28.avatarAssets.skinTone ~= nil then
            local l_l_HumanoidDescription_0_0 = l_HumanoidDescription_0;
            local l_skinTone_0 = v28.avatarAssets.skinTone;
            l_l_HumanoidDescription_0_0.HeadColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.TorsoColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.LeftArmColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.RightArmColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.LeftLegColor = l_skinTone_0;
            l_l_HumanoidDescription_0_0.RightLegColor = l_skinTone_0;
        else
            local l_BodyColors_0 = v25.WorldModel:FindFirstChildWhichIsA("BodyColors");
            if l_BodyColors_0 == nil then
                local l_l_HumanoidDescription_0_1 = l_HumanoidDescription_0;
                local l_v10_0 = v10;
                l_l_HumanoidDescription_0_1.HeadColor = l_v10_0;
                l_l_HumanoidDescription_0_1.TorsoColor = l_v10_0;
                l_l_HumanoidDescription_0_1.LeftArmColor = l_v10_0;
                l_l_HumanoidDescription_0_1.RightArmColor = l_v10_0;
                l_l_HumanoidDescription_0_1.LeftLegColor = l_v10_0;
                l_l_HumanoidDescription_0_1.RightLegColor = l_v10_0;
            else
                assert(l_BodyColors_0:IsA("BodyColors"), v4.LUAU_ANALYZE_ERROR);
                l_HumanoidDescription_0.HeadColor = l_BodyColors_0.HeadColor3;
                l_HumanoidDescription_0.TorsoColor = l_BodyColors_0.TorsoColor3;
                l_HumanoidDescription_0.LeftArmColor = l_BodyColors_0.LeftArmColor3;
                l_HumanoidDescription_0.RightArmColor = l_BodyColors_0.RightArmColor3;
                l_HumanoidDescription_0.LeftLegColor = l_BodyColors_0.LeftLegColor3;
                l_HumanoidDescription_0.RightLegColor = l_BodyColors_0.RightLegColor3;
            end;
        end;
        local l_l_HumanoidDescription_0_2 = l_HumanoidDescription_0;
        local l_patches_0 = v28.avatarAssets.patches;
        local l_v33_0 = v33;
        local v43 = l_l_HumanoidDescription_0_2:Clone();
        for v44, v45 in l_patches_0 do
            v43[v44.Name] = v45;
        end;
        v43:SetAccessories(v2.map(l_v33_0, function(v46) --[[ Line: 28 ]]
            -- upvalues: v4 (ref)
            return {
                AccessoryType = assert(v4.ASSET_TYPE_TO_ACCESSORY_TYPE[v46.AssetType], (("No known accessory type for %*"):format(v46.AssetType))), 
                AssetId = v46.AssetId, 
                Order = v46.Order
            };
        end), true);
        l_HumanoidDescription_0 = v43;
        v7(l_HumanoidDescription_0, v25.WorldModel.Humanoid);
        if v8() and (v27 and v27.resetIncludesBodyParts) ~= nil and v27 ~= nil and v27.resetIncludesBodyParts ~= nil then
            l_HumanoidDescription_0.ResetIncludesBodyParts = v27.resetIncludesBodyParts;
        end;
        return l_HumanoidDescription_0;
    end, v1.List.join({
        v28.avatarAssets, 
        if v9 then v33 else nil, 
        if v9 then v27 and v27.resetIncludesBodyParts else nil
    }, v26));
end;