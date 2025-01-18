local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.ConstantAvatar);
local v2 = require(l_Parent_0.Util.ConstantScaleBoundaries);
local v3 = require(l_Parent_0.Util.ConstantTemplate);
local v4 = require(l_Parent_0.Util.UtilityFunctionsTable);
local v5 = {};
v5.__index = v5;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = {
    v1.AssetTypes.Face, 
    v1.AssetTypes.Head, 
    v1.AssetTypes.Torso, 
    v1.AssetTypes.LeftArm, 
    v1.AssetTypes.RightArm, 
    v1.AssetTypes.LeftLeg, 
    v1.AssetTypes.RightLeg, 
    v1.AssetTypes.Shirt, 
    v1.AssetTypes.Pants, 
    v1.AssetTypes.ShirtGraphic
};
v5.new = function(v15) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (ref), v7 (ref), v2 (copy), v3 (copy)
    local v16 = setmetatable({}, v5);
    v6(v16);
    if v15 then
        v16.ScalesMin = v7(v15.height.min, v15.width.min, v15.head.min, v15.bodyType.min, v15.proportion.min, 0);
        v16.ScalesMax = v7(v15.height.max, v15.width.max, v15.head.max, v15.bodyType.max, v15.proportion.max, 0);
    else
        v15 = v2;
        v16.ScalesMin = v7(v15.Height.min, v15.Width.min, v15.Head.min, v15.BodyType.min, v15.Proportion.min, 0);
        v16.ScalesMax = v7(v15.Height.max, v15.Width.max, v15.Head.max, v15.BodyType.max, v15.Proportion.max, 0);
    end;
    v16.CollisionValue = v3.OuterCollision;
    v16.AnimationValue = v3.PlayerChoice;
    v16.RigTypeValue = v3.PlayerChoice;
    return v16;
end;
v5.makeCopy = function(v17) --[[ Line: 84 ]] --[[ Name: makeCopy ]]
    -- upvalues: v5 (copy), v11 (ref), v12 (ref)
    local v18 = v5.new();
    local v19 = {
        AssetsOverrides = v11, 
        ScalesMin = v12, 
        ScalesMax = v12
    };
    if v17 then
        for v20, v21 in pairs(v17) do
            v18[v20] = (v19[v20] or function(v22) --[[ Line: 95 ]]
                return v22;
            end)(v21);
        end;
    end;
    return v18;
end;
v5.fromUniverseData = function(v23) --[[ Line: 105 ]] --[[ Name: fromUniverseData ]]
    -- upvalues: v5 (copy), v8 (ref), v9 (ref), v10 (ref)
    local v24 = v5.new();
    v24.RigTypeValue = v23.AvatarType or v24.RigTypeValue;
    v24.AnimationValue = v23.AvatarAnimation or v24.AnimationValue;
    v24.CollisionValue = v23.AvatarCollision or v24.CollisionValue;
    v8(v24, v23.AvatarAssetOverrides);
    v9(v24, v23.AvatarScalingMin);
    v10(v24, v23.AvatarScalingMax);
    return v24;
end;
v5.apply = function(v25, v26) --[[ Line: 119 ]] --[[ Name: apply ]]
    -- upvalues: v1 (copy)
    v26.HeightScale = math.clamp(v26.HeightScale, v25.ScalesMin.height, v25.ScalesMax.height);
    v26.WidthScale = math.clamp(v26.WidthScale, v25.ScalesMin.width, v25.ScalesMax.width);
    v26.HeadScale = math.clamp(v26.HeadScale, v25.ScalesMin.head, v25.ScalesMax.head);
    v26.BodyTypeScale = math.clamp(v26.BodyTypeScale, v25.ScalesMin.bodyType, v25.ScalesMax.bodyType);
    v26.ProportionScale = math.clamp(v26.ProportionScale, v25.ScalesMin.proportion, v25.ScalesMax.proportion);
    local v27 = {
        [v1.AssetTypes.Face] = "Face", 
        [v1.AssetTypes.Head] = "Head", 
        [v1.AssetTypes.Torso] = "Torso", 
        [v1.AssetTypes.LeftArm] = "LeftArm", 
        [v1.AssetTypes.RightArm] = "RightArm", 
        [v1.AssetTypes.LeftLeg] = "LeftLeg", 
        [v1.AssetTypes.RightLeg] = "RightLeg", 
        [v1.AssetTypes.Shirt] = "Shirt", 
        [v1.AssetTypes.Pants] = "Pants", 
        [v1.AssetTypes.ShirtGraphic] = "GraphicTShirt"
    };
    for v28, v29 in pairs(v27) do
        if not v25.AssetsOverrides[v28].isPlayerChoice and v25.AssetsOverrides[v28].assetID ~= 0 then
            v26[v29] = v25.AssetsOverrides[v28].assetID;
        end;
    end;
end;
v5.extractAssetOverridesForSaving = function(v30) --[[ Line: 154 ]] --[[ Name: extractAssetOverridesForSaving ]]
    -- upvalues: v14 (copy)
    local v31 = {};
    for _, v33 in ipairs(v14) do
        local v34, v35 = v30:getAsset(v33);
        v31[#v31 + 1] = {
            assetTypeID = v33, 
            assetID = v34, 
            isPlayerChoice = v35
        };
    end;
    return v31;
end;
v5.extractScalingMinForSaving = function(v36) --[[ Line: 163 ]] --[[ Name: extractScalingMinForSaving ]]
    -- upvalues: v12 (ref)
    return v12(v36.ScalesMin);
end;
v5.extractScalingMaxForSaving = function(v37) --[[ Line: 167 ]] --[[ Name: extractScalingMaxForSaving ]]
    -- upvalues: v12 (ref)
    return v12(v37.ScalesMax);
end;
v5.isAvatarTypeEqualTo = function(v38, v39) --[[ Line: 171 ]] --[[ Name: isAvatarTypeEqualTo ]]
    return v38.RigTypeValue == v39.RigTypeValue;
end;
v5.isAnimationEqualTo = function(v40, v41) --[[ Line: 175 ]] --[[ Name: isAnimationEqualTo ]]
    return v40.AnimationValue == v41.AnimationValue;
end;
v5.isCollisionEqualTo = function(v42, v43) --[[ Line: 179 ]] --[[ Name: isCollisionEqualTo ]]
    return v42.CollisionValue == v43.CollisionValue;
end;
v5.areAssetsEqualTo = function(v44, v45) --[[ Line: 183 ]] --[[ Name: areAssetsEqualTo ]]
    -- upvalues: v14 (copy)
    for _, v47 in ipairs(v14) do
        local v48, v49 = v44:getAsset(v47);
        local v50, v51 = v45:getAsset(v47);
        if v48 ~= v50 or v49 ~= v51 then
            return false;
        end;
    end;
    return true;
end;
v5.areMinScalesEqualTo = function(v52, v53) --[[ Line: 195 ]] --[[ Name: areMinScalesEqualTo ]]
    -- upvalues: v13 (ref)
    return v13(v52.ScalesMin, v53.ScalesMin);
end;
v5.areMaxScalesEqualTo = function(v54, v55) --[[ Line: 199 ]] --[[ Name: areMaxScalesEqualTo ]]
    -- upvalues: v13 (ref)
    return v13(v54.ScalesMax, v55.ScalesMax);
end;
v5.isRigTypePlayerChoice = function(v56) --[[ Line: 203 ]] --[[ Name: isRigTypePlayerChoice ]]
    -- upvalues: v3 (copy)
    return v56.RigTypeValue == v3.PlayerChoice;
end;
v5.isRigTypeR6 = function(v57) --[[ Line: 207 ]] --[[ Name: isRigTypeR6 ]]
    -- upvalues: v3 (copy)
    return v57.RigTypeValue == v3.R6;
end;
v5.isRigTypeR15 = function(v58) --[[ Line: 211 ]] --[[ Name: isRigTypeR15 ]]
    -- upvalues: v3 (copy)
    return v58.RigTypeValue == v3.R15;
end;
v5.setRigTypeR6 = function(v59) --[[ Line: 215 ]] --[[ Name: setRigTypeR6 ]]
    -- upvalues: v3 (copy)
    v59.RigTypeValue = v3.R6;
end;
v5.setRigTypeR15 = function(v60) --[[ Line: 219 ]] --[[ Name: setRigTypeR15 ]]
    -- upvalues: v3 (copy)
    v60.RigTypeValue = v3.R15;
end;
v5.setRigTypePlayerChoice = function(v61) --[[ Line: 223 ]] --[[ Name: setRigTypePlayerChoice ]]
    -- upvalues: v3 (copy)
    v61.RigTypeValue = v3.PlayerChoice;
end;
v5.isAnimationStandard = function(v62) --[[ Line: 227 ]] --[[ Name: isAnimationStandard ]]
    -- upvalues: v3 (copy)
    return v62.AnimationValue == v3.AnimationStandard;
end;
v5.isAnimationPlayerChoice = function(v63) --[[ Line: 231 ]] --[[ Name: isAnimationPlayerChoice ]]
    -- upvalues: v3 (copy)
    return v63.AnimationValue == v3.PlayerChoice;
end;
v5.setAnimationStandard = function(v64) --[[ Line: 235 ]] --[[ Name: setAnimationStandard ]]
    -- upvalues: v3 (copy)
    v64.AnimationValue = v3.AnimationStandard;
end;
v5.setAnimationPlayerChoice = function(v65) --[[ Line: 239 ]] --[[ Name: setAnimationPlayerChoice ]]
    -- upvalues: v3 (copy)
    v65.AnimationValue = v3.PlayerChoice;
end;
v5.isCollisionInnerBox = function(v66) --[[ Line: 243 ]] --[[ Name: isCollisionInnerBox ]]
    -- upvalues: v3 (copy)
    return v66.CollisionValue == v3.InnerCollision;
end;
v5.setCollisionInnerBox = function(v67) --[[ Line: 247 ]] --[[ Name: setCollisionInnerBox ]]
    -- upvalues: v3 (copy)
    v67.CollisionValue = v3.InnerCollision;
end;
v5.isCollisionOuterBox = function(v68) --[[ Line: 251 ]] --[[ Name: isCollisionOuterBox ]]
    -- upvalues: v3 (copy)
    return v68.CollisionValue == v3.OuterCollision;
end;
v5.setCollisionOuterBox = function(v69) --[[ Line: 255 ]] --[[ Name: setCollisionOuterBox ]]
    -- upvalues: v3 (copy)
    v69.CollisionValue = v3.OuterCollision;
end;
v5.setScaleHeightMin = function(v70, v71, v72) --[[ Line: 259 ]] --[[ Name: setScaleHeightMin ]]
    v71 = math.min(v72.height.max, v71);
    v71 = math.max(v72.height.min, v71);
    v70.ScalesMin.height = v71;
end;
v5.setScaleWidthMin = function(v73, v74, v75) --[[ Line: 265 ]] --[[ Name: setScaleWidthMin ]]
    v74 = math.min(v75.width.max, v74);
    v74 = math.max(v75.width.min, v74);
    v73.ScalesMin.width = v74;
end;
v5.setScaleHeadMin = function(v76, v77, v78) --[[ Line: 271 ]] --[[ Name: setScaleHeadMin ]]
    v77 = math.min(v78.head.max, v77);
    v77 = math.max(v78.head.min, v77);
    v76.ScalesMin.head = v77;
end;
v5.setScaleBodyTypeMin = function(v79, v80, v81) --[[ Line: 277 ]] --[[ Name: setScaleBodyTypeMin ]]
    v80 = math.min(v81.bodyType.max, v80);
    v80 = math.max(v81.bodyType.min, v80);
    v79.ScalesMin.bodyType = v80;
end;
v5.setScaleProportionMin = function(v82, v83, v84) --[[ Line: 283 ]] --[[ Name: setScaleProportionMin ]]
    v83 = math.min(v84.proportion.max, v83);
    v83 = math.max(v84.proportion.min, v83);
    v82.ScalesMin.proportion = v83;
end;
v5.setScaleHeightMax = function(v85, v86, v87) --[[ Line: 289 ]] --[[ Name: setScaleHeightMax ]]
    v86 = math.min(v87.height.max, v86);
    v86 = math.max(v87.height.min, v86);
    v85.ScalesMax.height = v86;
end;
v5.setScaleWidthMax = function(v88, v89, v90) --[[ Line: 295 ]] --[[ Name: setScaleWidthMax ]]
    v89 = math.min(v90.width.max, v89);
    v89 = math.max(v90.width.min, v89);
    v88.ScalesMax.width = v89;
end;
v5.setScaleHeadMax = function(v91, v92, v93) --[[ Line: 301 ]] --[[ Name: setScaleHeadMax ]]
    v92 = math.min(v93.head.max, v92);
    v92 = math.max(v93.head.min, v92);
    v91.ScalesMax.head = v92;
end;
v5.setScaleBodyTypeMax = function(v94, v95, v96) --[[ Line: 307 ]] --[[ Name: setScaleBodyTypeMax ]]
    v95 = math.min(v96.bodyType.max, v95);
    v95 = math.max(v96.bodyType.min, v95);
    v94.ScalesMax.bodyType = v95;
end;
v5.setScaleProportionMax = function(v97, v98, v99) --[[ Line: 313 ]] --[[ Name: setScaleProportionMax ]]
    v98 = math.min(v99.proportion.max, v98);
    v98 = math.max(v99.proportion.min, v98);
    v97.ScalesMax.proportion = v98;
end;
v5.getScaleHeightMin = function(v100) --[[ Line: 319 ]] --[[ Name: getScaleHeightMin ]]
    return v100.ScalesMin.height;
end;
v5.getScaleWidthMin = function(v101) --[[ Line: 323 ]] --[[ Name: getScaleWidthMin ]]
    return v101.ScalesMin.width;
end;
v5.getScaleHeadMin = function(v102) --[[ Line: 327 ]] --[[ Name: getScaleHeadMin ]]
    return v102.ScalesMin.head;
end;
v5.getScaleBodyTypeMin = function(v103) --[[ Line: 331 ]] --[[ Name: getScaleBodyTypeMin ]]
    return v103.ScalesMin.bodyType;
end;
v5.getScaleProportionMin = function(v104) --[[ Line: 335 ]] --[[ Name: getScaleProportionMin ]]
    return v104.ScalesMin.proportion;
end;
v5.getScaleHeightMax = function(v105) --[[ Line: 339 ]] --[[ Name: getScaleHeightMax ]]
    return v105.ScalesMax.height;
end;
v5.getScaleWidthMax = function(v106) --[[ Line: 343 ]] --[[ Name: getScaleWidthMax ]]
    return v106.ScalesMax.width;
end;
v5.getScaleHeadMax = function(v107) --[[ Line: 347 ]] --[[ Name: getScaleHeadMax ]]
    return v107.ScalesMax.head;
end;
v5.getScaleBodyTypeMax = function(v108) --[[ Line: 351 ]] --[[ Name: getScaleBodyTypeMax ]]
    return v108.ScalesMax.bodyType;
end;
v5.getScaleProportionMax = function(v109) --[[ Line: 355 ]] --[[ Name: getScaleProportionMax ]]
    return v109.ScalesMax.proportion;
end;
v5.setAsset = function(v110, v111, v112, v113) --[[ Line: 359 ]] --[[ Name: setAsset ]]
    if v110.AssetsOverrides[v111] then
        if v112 ~= nil then
            v110.AssetsOverrides[v111].assetID = v112;
        end;
        if v113 ~= nil then
            v110.AssetsOverrides[v111].isPlayerChoice = v113;
        end;
    end;
end;
v5.getAsset = function(v114, v115) --[[ Line: 371 ]] --[[ Name: getAsset ]]
    if v114.AssetsOverrides[v115] then
        return v114.AssetsOverrides[v115].assetID, v114.AssetsOverrides[v115].isPlayerChoice;
    else
        return nil, nil;
    end;
end;
v6 = function(v116) --[[ Line: 379 ]]
    -- upvalues: v14 (copy)
    v116.AssetsOverrides = {};
    for _, v118 in ipairs(v14) do
        v116.AssetsOverrides[v118] = {
            assetID = 0, 
            isPlayerChoice = true
        };
    end;
end;
v7 = function(v119, v120, v121, v122, v123, v124) --[[ Line: 386 ]]
    return {
        height = v119, 
        width = v120, 
        head = v121, 
        bodyType = v122, 
        proportion = v123, 
        depth = v124
    };
end;
v8 = function(v125, v126) --[[ Line: 397 ]]
    if v126 then
        for _, v128 in pairs(v126) do
            v125:setAsset(v128.assetTypeID, v128.assetID, v128.isPlayerChoice);
        end;
    end;
end;
v9 = function(v129, v130) --[[ Line: 405 ]]
    -- upvalues: v7 (ref)
    if v130 then
        v129.ScalesMin = v7(v130.height, v130.width, v130.head, v130.bodyType, v130.proportion, v130.depth);
    end;
end;
v10 = function(v131, v132) --[[ Line: 418 ]]
    -- upvalues: v7 (ref)
    if v132 then
        v131.ScalesMax = v7(v132.height, v132.width, v132.head, v132.bodyType, v132.proportion, v132.depth);
    end;
end;
v11 = function(v133) --[[ Line: 431 ]]
    local v134 = {};
    for v135, v136 in pairs(v133) do
        v134[v135] = {
            assetID = v136.assetID, 
            isPlayerChoice = v136.isPlayerChoice
        };
    end;
    return v134;
end;
v12 = function(v137) --[[ Line: 439 ]]
    local v138 = {};
    for v139, v140 in pairs(v137) do
        v138[v139] = v140;
    end;
    return v138;
end;
v13 = function(v141, v142) --[[ Line: 447 ]]
    -- upvalues: v4 (copy)
    for v143, v144 in pairs(v141) do
        if v144 ~= v142[v143] then
            return false;
        end;
    end;
    return v4.countDictionaryKeys(v141) == v4.countDictionaryKeys(v142);
end;
return v5;