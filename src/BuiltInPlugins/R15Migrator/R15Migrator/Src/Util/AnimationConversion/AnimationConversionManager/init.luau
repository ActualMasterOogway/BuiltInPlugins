local v0 = {};
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_KeyframeSequenceProvider_0 = game:GetService("KeyframeSequenceProvider");
local l_InsertService_0 = game:GetService("InsertService");
local l_UserId_0 = game:GetService("StudioService"):GetUserId();
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Attributes_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).Attributes;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.AssetIdUtil);
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v11 = require(l_AnimationConversion_0.normalizeAssetId);
local v12 = require(l_AnimationConversion_0.constructAssetUrl);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v14 = require(l_AnimationConversion_0.AnimationAssetInfo);
local v15 = require(l_AnimationConversion_0.robloxAnimationsMap);
local v16 = nil;
local function _() --[[ Line: 29 ]] --[[ Name: createAnimationCacheFolder ]]
    -- upvalues: v16 (ref), l_CoreGui_0 (copy)
    if not v16 then
        v16 = l_CoreGui_0:FindFirstChild("converted_animation_cache");
    end;
    if not v16 then
        v16 = Instance.new("Folder", l_CoreGui_0);
        v16.Name = "converted_animation_cache";
        v16.Archivable = true;
    end;
end;
if not v16 then
    v16 = l_CoreGui_0:FindFirstChild("converted_animation_cache");
end;
if not v16 then
    v16 = Instance.new("Folder", l_CoreGui_0);
    v16.Name = "converted_animation_cache";
    v16.Archivable = true;
end;
local v18 = {};
local v19 = {
    ["Left Arm"] = "LeftUpperArm", 
    ["Right Arm"] = "RightUpperArm", 
    ["Left Leg"] = "LeftUpperLeg", 
    ["Right Leg"] = "RightUpperLeg", 
    Torso = "LowerTorso"
};
local v20 = {
    LeftUpperArm = "UpperTorso", 
    RightUpperArm = "UpperTorso", 
    Head = "UpperTorso", 
    LeftUpperLeg = "LowerTorso", 
    RightUpperLeg = "LowerTorso"
};
local v21 = CFrame.fromEulerAnglesYXZ(0, -1.5707963267948966, 0);
local v22 = CFrame.fromEulerAnglesYXZ(0, 1.5707963267948966, 0);
local v23 = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, 3.141592653589793, 0);
local v24 = {
    RightUpperArm = {
        v21:Inverse(), 
        v21
    }, 
    RightUpperLeg = {
        v21:Inverse(), 
        v21
    }, 
    LeftUpperArm = {
        v22:Inverse(), 
        v22
    }, 
    LeftUpperLeg = {
        v22:Inverse(), 
        v22
    }, 
    LowerTorso = {
        v23:Inverse(), 
        v23
    }, 
    Head = {
        v23:Inverse(), 
        v23
    }
};
local function _(v25, v26) --[[ Line: 73 ]] --[[ Name: jointMappingAdjustment ]]
    -- upvalues: v24 (copy)
    local v27 = v24[v26];
    if not v27 then
        return v25;
    else
        return v27[1] * v25 * v27[2];
    end;
end;
local function _(v29) --[[ Line: 81 ]] --[[ Name: getR6ToR15PartMapping ]]
    -- upvalues: v19 (copy)
    if v19[v29] then
        return v19[v29];
    else
        return v29;
    end;
end;
local v31 = {
    Head = {
        requiredParent = "Torso"
    }, 
    ["Left Arm"] = {
        requiredParent = "Torso"
    }, 
    ["Right Arm"] = {
        requiredParent = "Torso"
    }, 
    ["Left Leg"] = {
        requiredParent = "Torso"
    }, 
    ["Right Leg"] = {
        requiredParent = "Torso"
    }, 
    Torso = {}
};
local v32 = {
    LeftUpperArm = true, 
    LeftLowerArm = true, 
    LeftHand = true, 
    RightUpperArm = true, 
    RightLowerArm = true, 
    RightHand = true, 
    LeftUpperLeg = true, 
    LeftLowerLeg = true, 
    LeftFoot = true, 
    RightUpperLeg = true, 
    RightLowerLeg = true, 
    RightFoot = true, 
    UpperTorso = true, 
    LowerTorso = true
};
local v33 = {};
v0.isR6KeyframeSequence = function(v34) --[[ Line: 119 ]] --[[ Name: isR6KeyframeSequence ]]
    -- upvalues: v31 (copy), v32 (copy)
    if not v34 then
        return false;
    elseif #v34:GetChildren() < 1 then
        return false;
    else
        local v35 = false;
        for _, v37 in v34:GetChildren() do
            if v37:IsA("AnimationRigData") then
                return false;
            else
                for _, v39 in v37:GetDescendants() do
                    local v40 = v31[v39.Name];
                    if v40 then
                        v35 = true;
                        if v40.requiredParent and v39.Parent.Name ~= v40.requiredParent then
                            return false;
                        end;
                    end;
                    if v32[v39.Name] then
                        return false;
                    end;
                end;
            end;
        end;
        return v35;
    end;
end;
v0.convertKeyframeSequence = function(v41) --[[ Line: 150 ]] --[[ Name: convertKeyframeSequence ]]
    -- upvalues: v0 (copy), v19 (copy), v24 (copy), v20 (copy)
    local v42 = v41:Clone();
    if not v0.isR6KeyframeSequence(v41) then
        warn("Asset is not an r6 animation. Have you changed any Attributes on Animations?");
        return v42;
    else
        for _, v44 in v42:getChildren() do
            local v45 = {};
            local v46 = nil;
            for _, v48 in v44:GetDescendants() do
                if v48:IsA("Pose") then
                    local l_Name_0 = v48.Name;
                    local v50 = if v19[l_Name_0] then v19[l_Name_0] else l_Name_0;
                    if v48.Name == "Torso" then
                        v46 = Instance.new("Pose");
                        v46.Name = "UpperTorso";
                    end;
                    v48.Name = v50;
                    local l_CFrame_0 = v48.CFrame;
                    local v52 = v24[v50];
                    v48.CFrame = if not v52 then l_CFrame_0 else v52[1] * l_CFrame_0 * v52[2];
                    v45[v50] = v48;
                end;
            end;
            for v53, v54 in v45 do
                local v55 = v20[v53];
                if v55 then
                    if v55 == "UpperTorso" then
                        v46.Parent = v45.LowerTorso;
                        v54.Parent = v46;
                    else
                        v54.Parent = v45[v55];
                    end;
                end;
            end;
        end;
        return v42;
    end;
end;
local function _(v56) --[[ Line: 197 ]] --[[ Name: getTempIdFromKeyframeSequence ]]
    -- upvalues: l_KeyframeSequenceProvider_0 (copy)
    local v57 = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v56);
    if v57 then
        return v57;
    else
        return nil;
    end;
end;
local function _(v59) --[[ Line: 205 ]] --[[ Name: lookupCache ]]
    -- upvalues: v16 (ref), l_Attributes_0 (copy)
    local l_v16_FirstChild_0 = v16:FindFirstChild(v59);
    if not l_v16_FirstChild_0 then
        return;
    else
        local l_Value_0 = l_v16_FirstChild_0.Value;
        local l_l_v16_FirstChild_0_Attribute_0 = l_v16_FirstChild_0:GetAttribute(l_Attributes_0.TempId);
        if l_Value_0 ~= "" and l_l_v16_FirstChild_0_Attribute_0 then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v59, "converted_animation_cache")));
        end;
        return l_v16_FirstChild_0, l_l_v16_FirstChild_0_Attribute_0 or l_Value_0;
    end;
end;
v0.addCacheEntry = function(v64, v65, v66, v67) --[[ Line: 221 ]] --[[ Name: addCacheEntry ]]
    -- upvalues: v16 (ref), l_Attributes_0 (copy)
    assert(not (v65 and v67));
    local l_v16_FirstChild_1 = v16:FindFirstChild(v64);
    local v69;
    if not l_v16_FirstChild_1 then
        v69 = nil;
    else
        local l_Value_1 = l_v16_FirstChild_1.Value;
        local l_l_v16_FirstChild_1_Attribute_0 = l_v16_FirstChild_1:GetAttribute(l_Attributes_0.TempId);
        if l_Value_1 ~= "" and l_l_v16_FirstChild_1_Attribute_0 then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v64, "converted_animation_cache")));
        end;
        local _ = l_l_v16_FirstChild_1_Attribute_0 or l_Value_1;
        v69 = l_v16_FirstChild_1;
    end;
    if not v69 then
        v69 = Instance.new("StringValue", v16);
        v69.Name = v64;
    end;
    v69.Value = v65 or "";
    v69:SetAttribute(l_Attributes_0.TempId, v67);
    if v66 then
        v69:ClearAllChildren();
        v66:Clone().Parent = v69;
    end;
end;
local function _(v73, v74) --[[ Line: 239 ]] --[[ Name: addNameToCache ]]
    -- upvalues: v16 (ref), l_Attributes_0 (copy)
    local l_v16_FirstChild_2 = v16:FindFirstChild(v73);
    if not l_v16_FirstChild_2 then
        return;
    else
        l_v16_FirstChild_2:SetAttribute(l_Attributes_0.Name, v74);
        return;
    end;
end;
local function _(v77, v78) --[[ Line: 247 ]] --[[ Name: registerOrRetrieveKeyframeSequence ]]
    -- upvalues: v33 (copy), l_KeyframeSequenceProvider_0 (copy)
    local v79 = v78 or v77;
    if not v33[v79] then
        v33[v79] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v77) or nil;
    end;
    return v33[v79];
end;
v0.registerConvertedKeyframeSequence = function(v81, v82) --[[ Line: 256 ]] --[[ Name: registerConvertedKeyframeSequence ]]
    -- upvalues: v33 (copy), l_KeyframeSequenceProvider_0 (copy), v0 (copy)
    local v83 = v82 or v81;
    if not v33[v83] then
        v33[v83] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v81) or nil;
    end;
    local v84 = v33[v83];
    v83 = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v82) or nil;
    v0.addCacheEntry(v84, nil, v82, v83);
end;
local function v88(v85) --[[ Line: 268 ]] --[[ Name: getAnimationAssetInfoFromAnimation ]]
    -- upvalues: v12 (copy), l_AssetType_0 (copy), v11 (copy), v33 (copy), l_KeyframeSequenceProvider_0 (copy)
    if not v85 then
        return nil;
    elseif tonumber(v85) then
        return tonumber(v85), v12(v85), l_AssetType_0.RobloxAsset;
    elseif typeof(v85) == "string" then
        if v11(v85) then
            return v11(v85), v85, l_AssetType_0.AssetIdString;
        else
            return v85, v85, l_AssetType_0.LocalAsset;
        end;
    elseif typeof(v85) == "table" then
        if v85.id then
            return v85.id, v85.url, v85._type;
        else
            return;
        end;
    elseif typeof(v85) ~= "Instance" then
        return;
    elseif v85:IsA("Animation") then
        return v11(v85.AnimationId), v85.AnimationId, l_AssetType_0.AnimationInstance, v85;
    elseif v85:IsA("KeyframeSequence") then
        local l_v85_0 = v85;
        if not v33[l_v85_0] then
            v33[l_v85_0] = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v85) or nil;
        end;
        local v87 = v33[l_v85_0];
        return v87, v87, l_AssetType_0.LocalAsset, v85;
    else
        return;
    end;
end;
v0.getAnimationId = function(v89) --[[ Line: 301 ]] --[[ Name: getAnimationId ]]
    -- upvalues: v88 (copy), v12 (copy)
    local v90 = v88(v89);
    if tonumber(v90) then
        return v12(v90);
    else
        return v90;
    end;
end;
v0.getCachedName = function(v91) --[[ Line: 309 ]] --[[ Name: getCachedName ]]
    -- upvalues: v88 (copy), v16 (ref), l_Attributes_0 (copy)
    local v92, _, _ = v88(v91);
    local l_v16_FirstChild_3 = v16:FindFirstChild(v92);
    local v96;
    if not l_v16_FirstChild_3 then
        v96 = nil;
        local _ = nil;
    else
        local l_Value_2 = l_v16_FirstChild_3.Value;
        local l_l_v16_FirstChild_3_Attribute_0 = l_v16_FirstChild_3:GetAttribute(l_Attributes_0.TempId);
        if l_Value_2 ~= "" and l_l_v16_FirstChild_3_Attribute_0 then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v92, "converted_animation_cache")));
        end;
        local v100 = l_l_v16_FirstChild_3_Attribute_0 or l_Value_2;
        v96 = l_v16_FirstChild_3;
        local _ = v100;
    end;
    if not v96 then
        return;
    else
        return v96:GetAttribute(l_Attributes_0.Name);
    end;
end;
local function v108(v102) --[[ Line: 318 ]] --[[ Name: getKeyframeSequenceFromAssetId ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 319 ]]
        -- upvalues: l_InsertService_0 (ref), v102 (copy)
        return l_InsertService_0:LoadAsset(v102);
    end);
    if not l_status_0 then
        return;
    else
        local v105 = nil;
        for _, v107 in l_result_0:GetChildren() do
            if v107:IsA("KeyframeSequence") then
                v105 = v107;
            end;
        end;
        return v105;
    end;
end;
v0.overrideIsR6Cache = function(v109, v110) --[[ Line: 334 ]] --[[ Name: overrideIsR6Cache ]]
    -- upvalues: v88 (copy), v18 (copy)
    v18[v88(v109)] = v110;
end;
v0.isR6Animation = function(v111, v112) --[[ Line: 339 ]] --[[ Name: isR6Animation ]]
    -- upvalues: v0 (copy), l_AssetType_0 (copy), v18 (copy), v16 (ref), l_Attributes_0 (copy), v108 (copy)
    local v113 = v0.getAnimationAssetInfo(v111);
    local v114 = nil;
    if v113:IsA(l_AssetType_0.RobloxAsset) then
        if not v113.id then
            return false;
        elseif v18[v113.id] ~= nil then
            return v18[v113.id];
        else
            local l_id_0 = v113.id;
            local l_v16_FirstChild_4 = v16:FindFirstChild(l_id_0);
            local v117;
            if not l_v16_FirstChild_4 then
                v117 = nil;
            else
                local l_Value_3 = l_v16_FirstChild_4.Value;
                local l_l_v16_FirstChild_4_Attribute_0 = l_v16_FirstChild_4:GetAttribute(l_Attributes_0.TempId);
                if l_Value_3 ~= "" and l_l_v16_FirstChild_4_Attribute_0 then
                    warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(l_id_0, "converted_animation_cache")));
                end;
                local _ = l_l_v16_FirstChild_4_Attribute_0 or l_Value_3;
                v117 = l_v16_FirstChild_4;
            end;
            if v117 then
                v18[v113.id] = true;
                return true;
            elseif v113:IsA(l_AssetType_0.AnimationInstance) and v111:GetAttribute(l_Attributes_0.OriginalId) then
                l_id_0 = v111:GetAttribute(l_Attributes_0.OriginalId);
                v18[l_id_0] = true;
                v18[v113.id] = l_id_0 == v113.id;
                return v18[v113.id];
            elseif v112 then
                return;
            else
                v114 = v108(v113.id);
                l_id_0 = v0.isR6KeyframeSequence(v114);
                v18[v113.id] = l_id_0;
                return l_id_0;
            end;
        end;
    else
        if v113:IsA(l_AssetType_0.LocalAsset) then
            v114 = v111;
        end;
        return v0.isR6KeyframeSequence(v114);
    end;
end;
v0.getNormalizedAssetId = function(v121) --[[ Line: 375 ]] --[[ Name: getNormalizedAssetId ]]
    -- upvalues: v88 (copy)
    local v122, _, _ = v88(v121);
    return v122;
end;
v0.convertAnimation = function(v125) --[[ Line: 381 ]] --[[ Name: convertAnimation ]]
    -- upvalues: v0 (copy), v88 (copy), v108 (copy), l_KeyframeSequenceProvider_0 (copy)
    local v126 = v0.getConvertedKeyframeSequence(v125);
    if v126 then
        return v126;
    else
        local v127 = v88(v125);
        assert(v127, "no valid animation provided");
        local v128 = nil;
        v128 = if tonumber(v127) then v108(v127) else v125;
        v126 = v0.convertKeyframeSequence(v128);
        local v129 = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v126) or nil;
        v0.addCacheEntry(v127, nil, v126, v129);
        return v126;
    end;
end;
v0.registerConvertedAssetId = function(v130, v131, v132, v133) --[[ Line: 401 ]] --[[ Name: registerConvertedAssetId ]]
    -- upvalues: v9 (copy), v0 (copy), l_KeyframeSequenceProvider_0 (copy), v16 (ref), l_Attributes_0 (copy)
    if v9.isValidAssetId(v131) then
        v0.addCacheEntry(v130, v131, v132, nil);
    else
        local v134 = l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v132) or nil;
        v0.addCacheEntry(v130, nil, v132, v134);
    end;
    if v133 then
        local l_v16_FirstChild_5 = v16:FindFirstChild(v130);
        if not l_v16_FirstChild_5 then
            return;
        else
            l_v16_FirstChild_5:SetAttribute(l_Attributes_0.Name, v133);
        end;
    end;
end;
v0.getConvertedKeyframeSequence = function(v136) --[[ Line: 418 ]] --[[ Name: getConvertedKeyframeSequence ]]
    -- upvalues: v88 (copy), v16 (ref), l_Attributes_0 (copy)
    local v137 = v88(v136);
    local l_v16_FirstChild_6 = v16:FindFirstChild(v137);
    local v139;
    if not l_v16_FirstChild_6 then
        v139 = nil;
    else
        local l_Value_4 = l_v16_FirstChild_6.Value;
        local l_l_v16_FirstChild_6_Attribute_0 = l_v16_FirstChild_6:GetAttribute(l_Attributes_0.TempId);
        if l_Value_4 ~= "" and l_l_v16_FirstChild_6_Attribute_0 then
            warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v137, "converted_animation_cache")));
        end;
        local _ = l_l_v16_FirstChild_6_Attribute_0 or l_Value_4;
        v139 = l_v16_FirstChild_6;
    end;
    if not v139 then
        return nil;
    else
        for _, v144 in v139:GetChildren() do
            if v144:IsA("KeyframeSequence") then
                return v144;
            end;
        end;
        return nil;
    end;
end;
v0.getConvertedAssetId = function(v145) --[[ Line: 433 ]] --[[ Name: getConvertedAssetId ]]
    -- upvalues: v88 (copy), v0 (copy)
    local _, _, v148 = v88(v145);
    local v149 = v0.getConvertedAnimationAssetInfo(v145);
    if v149:IsA(v148) then
        return v149.id;
    else
        return nil;
    end;
end;
v0.getConvertedAssetUrl = function(v150) --[[ Line: 443 ]] --[[ Name: getConvertedAssetUrl ]]
    -- upvalues: v0 (copy), l_AssetType_0 (copy)
    local v151 = v0.getConvertedAnimationAssetInfo(v150);
    if v151:IsA(l_AssetType_0.RobloxAsset) then
        return v151.url;
    else
        return nil;
    end;
end;
v0.getConvertedAnimationAssetInfo = function(v152) --[[ Line: 451 ]] --[[ Name: getConvertedAnimationAssetInfo ]]
    -- upvalues: v88 (copy), v14 (copy), v16 (ref), l_Attributes_0 (copy)
    local v153, _, _ = v88(v152);
    if not v153 then
        return v14.new(nil, nil, nil, nil);
    else
        local l_v16_FirstChild_7 = v16:FindFirstChild(v153);
        local v157;
        if not l_v16_FirstChild_7 then
            local _ = nil;
            v157 = nil;
        else
            local l_Value_5 = l_v16_FirstChild_7.Value;
            local l_l_v16_FirstChild_7_Attribute_0 = l_v16_FirstChild_7:GetAttribute(l_Attributes_0.TempId);
            if l_Value_5 ~= "" and l_l_v16_FirstChild_7_Attribute_0 then
                warn((("StringValue %* has both val and tempId - has %* been manually edited?"):format(v153, "converted_animation_cache")));
            end;
            local v161 = l_l_v16_FirstChild_7_Attribute_0 or l_Value_5;
            local _ = l_v16_FirstChild_7;
            v157 = v161;
        end;
        local v163, v164, v165;
        l_v16_FirstChild_7, v163, v164, v165 = v88(v157);
        return v14.new(l_v16_FirstChild_7, v163, v164, v165);
    end;
end;
v0.getAnimationAssetInfo = function(v166) --[[ Line: 461 ]] --[[ Name: getAnimationAssetInfo ]]
    -- upvalues: v88 (copy), v14 (copy)
    local v167, v168, v169, v170 = v88(v166);
    return v14.new(v167, v168, v169, v170);
end;
local function _(v171, v172) --[[ Line: 466 ]] --[[ Name: isKeyframeSequencesEqual ]]
    -- upvalues: l_KeyframeSequenceProvider_0 (copy)
    assert(v171:IsA("KeyframeSequence") and v172:IsA("KeyframeSequence"));
    return (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v171) or nil) == (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v172) or nil);
end;
local function v179(v174, v175) --[[ Line: 473 ]] --[[ Name: findConvertedAnimation ]]
    -- upvalues: v108 (copy), l_KeyframeSequenceProvider_0 (copy)
    for _, v177 in v174 do
        local v178 = v108(v177);
        assert(v178:IsA("KeyframeSequence") and v175:IsA("KeyframeSequence"));
        if (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v178) or nil) == (l_KeyframeSequenceProvider_0:RegisterKeyframeSequence(v175) or nil) then
            return v177;
        end;
    end;
    return nil;
end;
v0.checkIfAssetsAlreadyConverted = function(v180, v181) --[[ Line: 483 ]] --[[ Name: checkIfAssetsAlreadyConverted ]]
    -- upvalues: v0 (copy), l_AssetType_0 (copy), l_MarketplaceService_0 (copy), v16 (ref), l_Attributes_0 (copy), v179 (copy), v15 (copy), l_UserId_0 (copy)
    local v182 = {};
    for v183, _ in v181 do
        local v185 = v0.getConvertedAnimationAssetInfo(v183);
        if v185.id and v185:IsA(l_AssetType_0.RobloxAsset) then
            v182[v183] = v185.id;
        else
            local v186 = v0.convertAnimation(v183);
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 492 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v183 (copy)
                return l_MarketplaceService_0:GetProductInfo(v183);
            end);
            if not l_status_1 then
                warn(l_result_1);
            else
                local l_Name_1 = l_result_1.Name;
                local l_v16_FirstChild_8 = v16:FindFirstChild(v183);
                if l_v16_FirstChild_8 then
                    l_v16_FirstChild_8:SetAttribute(l_Attributes_0.Name, l_Name_1);
                end;
                l_Name_1 = l_result_1.Name .. " R15";
                l_v16_FirstChild_8 = l_result_1.Creator.CreatorType;
                local l_CreatorTargetId_0 = l_result_1.Creator.CreatorTargetId;
                if l_v16_FirstChild_8 == Enum.CreatorType.Group.Name then
                    local v192 = nil;
                    while true do
                        v192 = v180:getGroupAnimations(v192, l_CreatorTargetId_0):andThen(function(v193) --[[ Line: 508 ]]
                            -- upvalues: l_Name_1 (copy), v179 (ref), v186 (copy)
                            local l_data_0 = v193.responseBody.data;
                            local v195 = {};
                            for _, v197 in l_data_0 do
                                if v197.name == l_Name_1 then
                                    table.insert(v195, v197.assetId);
                                end;
                            end;
                            return v179(v195, v186) or v193.responseBody.nextPageCursor;
                        end, function(v198) --[[ Line: 519 ]]
                            warn("ERROR: ", v198);
                        end):await();
                        if tonumber(v192) then
                            v182[v183] = v192;
                            v0.addCacheEntry(v183, v192);
                            break;
                        elseif not v192 then
                            break;
                        end;
                    end;
                elseif l_v16_FirstChild_8 == Enum.CreatorType.User.Name then
                    if l_CreatorTargetId_0 == 1 then
                        if v15[v183] then
                            v182[v183] = v15[v183];
                            v0.addCacheEntry(v183, v15[v183]);
                            continue;
                        else
                            l_CreatorTargetId_0 = l_UserId_0;
                        end;
                    end;
                    local v199 = nil;
                    while true do
                        v199 = v180:getUserAnimations(v199, l_CreatorTargetId_0, l_Name_1):andThen(function(v200) --[[ Line: 544 ]]
                            -- upvalues: l_MarketplaceService_0 (ref), l_Name_1 (copy), v179 (ref), v186 (copy)
                            local l_data_1 = v200.responseBody.data;
                            local l_nextPageCursor_0 = v200.responseBody.nextPageCursor;
                            local v203 = {};
                            for _, v205 in l_data_1 do
                                local _, l_result_2 = pcall(function() --[[ Line: 549 ]]
                                    -- upvalues: l_MarketplaceService_0 (ref), v205 (copy)
                                    return l_MarketplaceService_0:GetProductInfo(v205.id);
                                end);
                                if l_result_2 and l_result_2.Name ~= l_Name_1 then
                                    l_nextPageCursor_0 = nil;
                                    break;
                                else
                                    table.insert(v203, v205.id);
                                end;
                            end;
                            return v179(v203, v186) or l_nextPageCursor_0;
                        end, function(v208) --[[ Line: 560 ]]
                            warn("ERROR: ", v208);
                        end):await();
                        if tonumber(v199) then
                            v182[v183] = v199;
                            v0.addCacheEntry(v183, v199);
                            break;
                        elseif not v199 then
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v182;
end;
return v0;