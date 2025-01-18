local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Math_0 = require(l_Parent_0.Packages.Framework).Util.Math;
local v2 = {};
v2.__index = v2;
local function _(v3) --[[ Line: 25 ]] --[[ Name: formatAvatarRange ]]
    -- upvalues: l_Math_0 (copy)
    return tostring(l_Math_0.round(v3.Min, 2)), (tostring(l_Math_0.round(v3.Max, 2)));
end;
v2.new = function(v5) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        __networking = v5
    }, v2));
end;
v2.avatarRulesV1GET = function(v6) --[[ Line: 37 ]] --[[ Name: avatarRulesV1GET ]]
    return v6.__networking:get("avatar", "/v1/avatar-rules");
end;
v2.configurationV2GET = function(v7, v8) --[[ Line: 43 ]] --[[ Name: configurationV2GET ]]
    return v7.__networking:get("develop", "/v2/universes/" .. v8 .. "/configuration");
end;
v2.configurationV2PATCH = function(v9, v10, v11) --[[ Line: 49 ]] --[[ Name: configurationV2PATCH ]]
    return v9.__networking:patch("develop", "/v2/universes/" .. v10 .. "/configuration", {
        Body = v11
    });
end;
v2.getAvatarType = function(v12, v13) --[[ Line: 59 ]] --[[ Name: getAvatarType ]]
    local l_StarterPlayer_0 = v13:GetService("StarterPlayer");
    local l_GameId_0 = v13.GameId;
    if l_GameId_0 == 0 then
        return l_StarterPlayer_0.GameSettingsAvatar;
    else
        local l_universeAvatarType_0 = v12:configurationV2GET(l_GameId_0):await().responseBody.universeAvatarType;
        if l_universeAvatarType_0 == "MorphToR6" then
            return Enum.GameAvatarType.R6;
        elseif l_universeAvatarType_0 == "MorphToR15" then
            return Enum.GameAvatarType.R15;
        else
            return Enum.GameAvatarType.PlayerChoice;
        end;
    end;
end;
v2.setAvatarType = function(v17, v18, v19) --[[ Line: 79 ]] --[[ Name: setAvatarType ]]
    local l_StarterPlayer_1 = v18:GetService("StarterPlayer");
    local l_GameId_1 = v18.GameId;
    if l_GameId_1 == 0 then
        l_StarterPlayer_1.GameSettingsAvatar = v19;
        return;
    else
        local _ = nil;
        v17:configurationV2PATCH(l_GameId_1, {
            universeAvatarType = v19 == Enum.GameAvatarType.R6 and "MorphToR6" or v19 == Enum.GameAvatarType.R15 and "MorphToR15" or "PlayerChoice"
        }):await();
        return;
    end;
end;
v2.getAnimationType = function(v23, v24) --[[ Line: 98 ]] --[[ Name: getAnimationType ]]
    local l_StarterPlayer_2 = v24:GetService("StarterPlayer");
    local l_GameId_2 = v24.GameId;
    if l_GameId_2 == 0 then
        if l_StarterPlayer_2.AllowCustomAnimations then
            return "PlayerChoice";
        else
            return "Standard";
        end;
    else
        return v23:configurationV2GET(l_GameId_2):await().responseBody.universeAnimationType;
    end;
end;
v2.setAnimationType = function(v27, v28, v29) --[[ Line: 110 ]] --[[ Name: setAnimationType ]]
    local l_StarterPlayer_3 = v28:GetService("StarterPlayer");
    local l_GameId_3 = v28.GameId;
    if l_GameId_3 == 0 then
        l_StarterPlayer_3.AllowCustomAnimations = v29 == "Standard";
        return;
    else
        v27:configurationV2PATCH(l_GameId_3, {
            universeAnimationType = v29
        }):await();
        return;
    end;
end;
v2.getCollisionType = function(v32, v33) --[[ Line: 121 ]] --[[ Name: getCollisionType ]]
    local l_StarterPlayer_4 = v33:GetService("StarterPlayer");
    local l_GameId_4 = v33.GameId;
    if l_GameId_4 == 0 then
        return l_StarterPlayer_4.GameSettingsR15Collision;
    else
        local v36 = v32:configurationV2GET(l_GameId_4):await();
        return Enum.R15CollisionType[v36.responseBody.universeCollisionType];
    end;
end;
v2.setCollisionType = function(v37, v38, v39) --[[ Line: 133 ]] --[[ Name: setCollisionType ]]
    local l_StarterPlayer_5 = v38:GetService("StarterPlayer");
    local l_GameId_5 = v38.GameId;
    if l_GameId_5 == 0 then
        l_StarterPlayer_5.GameSettingsR15Collision = v39;
        return;
    else
        v37:configurationV2PATCH(l_GameId_5, {
            universeCollisionType = v39.Name
        }):await();
        return;
    end;
end;
v2.getHeightRules = function(v42) --[[ Line: 144 ]] --[[ Name: getHeightRules ]]
    local l_height_0 = v42:avatarRulesV1GET():await().responseBody.scales.height;
    return NumberRange.new(l_height_0.min, l_height_0.max), l_height_0.increment;
end;
v2.getHeightRange = function(v44, v45) --[[ Line: 150 ]] --[[ Name: getHeightRange ]]
    local l_StarterPlayer_6 = v45:GetService("StarterPlayer");
    local l_GameId_6 = v45.GameId;
    local v48 = nil;
    local v49 = nil;
    if l_GameId_6 == 0 then
        v48 = l_StarterPlayer_6.GameSettingsScaleRangeHeight.Min;
        v49 = l_StarterPlayer_6.GameSettingsScaleRangeHeight.Max;
    else
        local v50 = v44:configurationV2GET(l_GameId_6):await();
        v48 = v50.responseBody.universeAvatarMinScales.height;
        v49 = v50.responseBody.universeAvatarMaxScales.height;
    end;
    return NumberRange.new(v48, v49);
end;
v2.setHeightRange = function(v51, v52, v53) --[[ Line: 167 ]] --[[ Name: setHeightRange ]]
    -- upvalues: l_Math_0 (copy)
    local l_StarterPlayer_7 = v52:GetService("StarterPlayer");
    local l_GameId_7 = v52.GameId;
    if l_GameId_7 == 0 then
        l_StarterPlayer_7.GameSettingsScaleRangeHeight = v53;
        return;
    else
        local v56 = tostring(l_Math_0.round(v53.Min, 2));
        local v57 = tostring(l_Math_0.round(v53.Max, 2));
        v51:configurationV2PATCH(l_GameId_7, {
            universeAvatarMinScales = {
                height = v56
            }, 
            universeAvatarMaxScales = {
                height = v57
            }
        }):await();
        return;
    end;
end;
v2.getWidthRules = function(v58) --[[ Line: 186 ]] --[[ Name: getWidthRules ]]
    local l_width_0 = v58:avatarRulesV1GET():await().responseBody.scales.width;
    return NumberRange.new(l_width_0.min, l_width_0.max), l_width_0.increment;
end;
v2.getWidthRange = function(v60, v61) --[[ Line: 192 ]] --[[ Name: getWidthRange ]]
    local l_StarterPlayer_8 = v61:GetService("StarterPlayer");
    local l_GameId_8 = v61.GameId;
    local v64 = nil;
    local v65 = nil;
    if l_GameId_8 == 0 then
        v64 = l_StarterPlayer_8.GameSettingsScaleRangeWidth.Min;
        v65 = l_StarterPlayer_8.GameSettingsScaleRangeWidth.Max;
    else
        local v66 = v60:configurationV2GET(l_GameId_8):await();
        v64 = v66.responseBody.universeAvatarMinScales.width;
        v65 = v66.responseBody.universeAvatarMaxScales.width;
    end;
    return NumberRange.new(v64, v65);
end;
v2.setWidthRange = function(v67, v68, v69) --[[ Line: 209 ]] --[[ Name: setWidthRange ]]
    -- upvalues: l_Math_0 (copy)
    local l_StarterPlayer_9 = v68:GetService("StarterPlayer");
    local l_GameId_9 = v68.GameId;
    if l_GameId_9 == 0 then
        l_StarterPlayer_9.GameSettingsScaleRangeWidth = v69;
        return;
    else
        local v72 = tostring(l_Math_0.round(v69.Min, 2));
        local v73 = tostring(l_Math_0.round(v69.Max, 2));
        v67:configurationV2PATCH(l_GameId_9, {
            universeAvatarMinScales = {
                width = v72, 
                depth = 0
            }, 
            universeAvatarMaxScales = {
                width = v73, 
                depth = 0
            }
        }):await();
        return;
    end;
end;
v2.getHeadScaleRules = function(v74) --[[ Line: 230 ]] --[[ Name: getHeadScaleRules ]]
    local l_head_0 = v74:avatarRulesV1GET():await().responseBody.scales.head;
    return NumberRange.new(l_head_0.min, l_head_0.max), l_head_0.increment;
end;
v2.getHeadScaleRange = function(v76, v77) --[[ Line: 236 ]] --[[ Name: getHeadScaleRange ]]
    local l_StarterPlayer_10 = v77:GetService("StarterPlayer");
    local l_GameId_10 = v77.GameId;
    local v80 = nil;
    local v81 = nil;
    if l_GameId_10 == 0 then
        v80 = l_StarterPlayer_10.GameSettingsScaleRangeHead.Min;
        v81 = l_StarterPlayer_10.GameSettingsScaleRangeHead.Max;
    else
        local v82 = v76:configurationV2GET(l_GameId_10):await();
        v80 = v82.responseBody.universeAvatarMinScales.head;
        v81 = v82.responseBody.universeAvatarMaxScales.head;
    end;
    return NumberRange.new(v80, v81);
end;
v2.setHeadScaleRange = function(v83, v84, v85) --[[ Line: 253 ]] --[[ Name: setHeadScaleRange ]]
    -- upvalues: l_Math_0 (copy)
    local l_StarterPlayer_11 = v84:GetService("StarterPlayer");
    local l_GameId_11 = v84.GameId;
    if l_GameId_11 == 0 then
        l_StarterPlayer_11.GameSettingsScaleRangeHead = v85;
        return;
    else
        local v88 = tostring(l_Math_0.round(v85.Min, 2));
        local v89 = tostring(l_Math_0.round(v85.Max, 2));
        v83:configurationV2PATCH(l_GameId_11, {
            universeAvatarMinScales = {
                head = v88
            }, 
            universeAvatarMaxScales = {
                head = v89
            }
        }):await();
        return;
    end;
end;
v2.getBodyTypeRules = function(v90) --[[ Line: 272 ]] --[[ Name: getBodyTypeRules ]]
    local l_bodyType_0 = v90:avatarRulesV1GET():await().responseBody.scales.bodyType;
    return NumberRange.new(l_bodyType_0.min, l_bodyType_0.max), l_bodyType_0.increment;
end;
v2.getBodyTypeRange = function(v92, v93) --[[ Line: 278 ]] --[[ Name: getBodyTypeRange ]]
    local l_StarterPlayer_12 = v93:GetService("StarterPlayer");
    local l_GameId_12 = v93.GameId;
    local v96 = nil;
    local v97 = nil;
    if l_GameId_12 == 0 then
        v96 = l_StarterPlayer_12.GameSettingsScaleRangeBodyType.Min;
        v97 = l_StarterPlayer_12.GameSettingsScaleRangeBodyType.Max;
    else
        local v98 = v92:configurationV2GET(l_GameId_12):await();
        v96 = v98.responseBody.universeAvatarMinScales.bodyType;
        v97 = v98.responseBody.universeAvatarMaxScales.bodyType;
    end;
    return NumberRange.new(v96, v97);
end;
v2.setBodyTypeRange = function(v99, v100, v101) --[[ Line: 295 ]] --[[ Name: setBodyTypeRange ]]
    -- upvalues: l_Math_0 (copy)
    local l_StarterPlayer_13 = v100:GetService("StarterPlayer");
    local l_GameId_13 = v100.GameId;
    if l_GameId_13 == 0 then
        l_StarterPlayer_13.GameSettingsScaleRangeBodyType = v101;
        return;
    else
        local v104 = tostring(l_Math_0.round(v101.Min, 2));
        local v105 = tostring(l_Math_0.round(v101.Max, 2));
        v99:configurationV2PATCH(l_GameId_13, {
            universeAvatarMinScales = {
                bodyType = v104
            }, 
            universeAvatarMaxScales = {
                bodyType = v105
            }
        }):await();
        return;
    end;
end;
v2.getProportionsRules = function(v106) --[[ Line: 314 ]] --[[ Name: getProportionsRules ]]
    local l_proportion_0 = v106:avatarRulesV1GET():await().responseBody.scales.proportion;
    return NumberRange.new(l_proportion_0.min, l_proportion_0.max), l_proportion_0.increment;
end;
v2.getProportionsRange = function(v108, v109) --[[ Line: 320 ]] --[[ Name: getProportionsRange ]]
    local l_StarterPlayer_14 = v109:GetService("StarterPlayer");
    local l_GameId_14 = v109.GameId;
    local v112 = nil;
    local v113 = nil;
    if l_GameId_14 == 0 then
        v112 = l_StarterPlayer_14.GameSettingsScaleRangeProportion.Min;
        v113 = l_StarterPlayer_14.GameSettingsScaleRangeProportion.Max;
    else
        local v114 = v108:configurationV2GET(l_GameId_14):await();
        v112 = v114.responseBody.universeAvatarMinScales.proportion;
        v113 = v114.responseBody.universeAvatarMaxScales.proportion;
    end;
    return NumberRange.new(v112, v113);
end;
v2.setProportionsRange = function(v115, v116, v117) --[[ Line: 337 ]] --[[ Name: setProportionsRange ]]
    -- upvalues: l_Math_0 (copy)
    local l_StarterPlayer_15 = v116:GetService("StarterPlayer");
    local l_GameId_15 = v116.GameId;
    if l_GameId_15 == 0 then
        l_StarterPlayer_15.GameSettingsScaleRangeProportion = v117;
        return;
    else
        local v120 = tostring(l_Math_0.round(v117.Min, 2));
        local v121 = tostring(l_Math_0.round(v117.Max, 2));
        v115:configurationV2PATCH(l_GameId_15, {
            universeAvatarMinScales = {
                proportion = v120
            }, 
            universeAvatarMaxScales = {
                proportion = v121
            }
        }):await();
        return;
    end;
end;
local v122 = {
    [Enum.AssetType.Face] = "GameSettingsAssetIDFace", 
    [Enum.AssetType.Head] = "GameSettingsAssetIDHead", 
    [Enum.AssetType.Torso] = "GameSettingsAssetIDTorso", 
    [Enum.AssetType.LeftArm] = "GameSettingsAssetIDLeftArm", 
    [Enum.AssetType.RightArm] = "GameSettingsAssetIDRightArm", 
    [Enum.AssetType.LeftLeg] = "GameSettingsAssetIDLeftLeg", 
    [Enum.AssetType.RightLeg] = "GameSettingsAssetIDRightLeg", 
    [Enum.AssetType.Shirt] = "GameSettingsAssetIDShirt", 
    [Enum.AssetType.Pants] = "GameSettingsAssetIDPants", 
    [Enum.AssetType.TShirt] = "GameSettingsAssetIDTeeShirt"
};
local v123 = {};
for _, v125 in pairs(Enum.AssetType:GetEnumItems()) do
    v123[v125.Value] = v125;
end;
v2.getAssetOverrides = function(v126, v127) --[[ Line: 377 ]] --[[ Name: getAssetOverrides ]]
    -- upvalues: v122 (copy)
    local l_StarterPlayer_16 = v127:GetService("StarterPlayer");
    local l_GameId_16 = v127.GameId;
    local v130 = nil;
    if l_GameId_16 == 0 then
        v130 = {};
        for v131, v132 in pairs(v122) do
            local v133 = l_StarterPlayer_16[v132];
            v130[v131] = {
                assetTypeID = v131.Value, 
                assetID = v133, 
                isPlayerChoice = v133 == 0
            };
        end;
        return v130;
    else
        return v126:configurationV2GET(l_GameId_16):await().responseBody.universeAvatarAssetOverrides;
    end;
end;
v2.setAssetOverrides = function(v134, v135, v136) --[[ Line: 399 ]] --[[ Name: setAssetOverrides ]]
    -- upvalues: v123 (copy), v122 (copy)
    local l_StarterPlayer_17 = v135:GetService("StarterPlayer");
    local l_GameId_17 = v135.GameId;
    if l_GameId_17 == 0 then
        for _, v140 in ipairs(v136) do
            local v141 = v123[v140.assetTypeID];
            local l_assetID_0 = v140.assetID;
            local l_isPlayerChoice_0 = v140.isPlayerChoice;
            l_StarterPlayer_17[v122[v141]] = l_isPlayerChoice_0 and 0 or l_assetID_0;
        end;
        return;
    else
        v134:configurationV2PATCH(l_GameId_17, {
            universeAvatarAssetOverrides = v136
        }):await();
        return;
    end;
end;
return v2;