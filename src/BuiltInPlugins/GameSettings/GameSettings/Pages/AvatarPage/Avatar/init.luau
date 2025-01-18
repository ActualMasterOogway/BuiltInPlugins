local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_1.Src.Util.Thread);
local v8 = require(l_Parent_1.Src.Actions.AddChange);
local v9 = require(l_Parent_1.Src.Actions.AddWarning);
local v10 = require(l_Parent_1.Src.Actions.DiscardWarning);
local v11 = require(l_Parent_0.Actions.SettingsSaveScaleBoundaries);
local v12 = require(l_Parent_1.Src.Util.AssetOverrides);
local v13 = require(l_Parent_1.Src.Actions.AddErrors);
local v14 = require(l_Parent_0.Components.RootPanelExternal);
local v15 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v16 = require(l_Parent_1.Src.Components.SettingsPages.InsufficientPermissionsPage);
local l_Name_0 = script.Name;
local function v58(v18, v19) --[[ Line: 39 ]] --[[ Name: loadSettings ]]
    -- upvalues: v7 (copy), v11 (copy)
    local l_game_0 = v18:getState().Metadata.game;
    local l_universeAvatarController_0 = v19.universeAvatarController;
    return {
        function(v22) --[[ Line: 45 ]]
            -- upvalues: l_universeAvatarController_0 (copy), l_game_0 (copy)
            local v23 = l_universeAvatarController_0:getAvatarType(l_game_0);
            local _ = nil;
            v22.universeAvatarType = v23 == Enum.GameAvatarType.R6 and "MorphToR6" or v23 == Enum.GameAvatarType.R15 and "MorphToR15" or "PlayerChoice";
        end, 
        function(v25) --[[ Line: 61 ]]
            -- upvalues: l_universeAvatarController_0 (copy), l_game_0 (copy)
            v25.universeAnimationType = l_universeAvatarController_0:getAnimationType(l_game_0);
        end, 
        function(v26) --[[ Line: 66 ]]
            -- upvalues: l_universeAvatarController_0 (copy), l_game_0 (copy)
            v26.universeCollisionType = l_universeAvatarController_0:getCollisionType(l_game_0).Name;
        end, 
        function(v27) --[[ Line: 71 ]]
            -- upvalues: v7 (ref), l_universeAvatarController_0 (copy), l_game_0 (copy)
            local v28 = {};
            local v29 = {};
            local v35 = {
                v7.new(function() --[[ Line: 77 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), l_game_0 (ref), v28 (copy), v29 (copy)
                    local v30 = l_universeAvatarController_0:getHeightRange(l_game_0);
                    v28.height = v30.Min;
                    v29.height = v30.Max;
                end), 
                v7.new(function() --[[ Line: 82 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), l_game_0 (ref), v28 (copy), v29 (copy)
                    local v31 = l_universeAvatarController_0:getWidthRange(l_game_0);
                    v28.width = v31.Min;
                    v29.width = v31.Max;
                end), 
                v7.new(function() --[[ Line: 87 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), l_game_0 (ref), v28 (copy), v29 (copy)
                    local v32 = l_universeAvatarController_0:getHeadScaleRange(l_game_0);
                    v28.head = v32.Min;
                    v29.head = v32.Max;
                end), 
                v7.new(function() --[[ Line: 92 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), l_game_0 (ref), v28 (copy), v29 (copy)
                    local v33 = l_universeAvatarController_0:getBodyTypeRange(l_game_0);
                    v28.bodyType = v33.Min;
                    v29.bodyType = v33.Max;
                end), 
                v7.new(function() --[[ Line: 97 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), l_game_0 (ref), v28 (copy), v29 (copy)
                    local v34 = l_universeAvatarController_0:getProportionsRange(l_game_0);
                    v28.proportion = v34.Min;
                    v29.proportion = v34.Max;
                end)
            };
            for _, v37 in ipairs(v35) do
                v37:start();
            end;
            for _, v39 in ipairs(v35) do
                v39:join();
            end;
            v27.universeAvatarMinScales = v28;
            v27.universeAvatarMaxScales = v29;
        end, 
        function(v40) --[[ Line: 114 ]]
            -- upvalues: l_universeAvatarController_0 (copy), l_game_0 (copy)
            v40.universeAvatarAssetOverrides = l_universeAvatarController_0:getAssetOverrides(l_game_0);
        end, 
        function(_) --[[ Line: 119 ]]
            -- upvalues: v7 (ref), l_universeAvatarController_0 (copy), v18 (copy), v11 (ref)
            local v42 = {};
            local v53 = {
                v7.new(function() --[[ Line: 124 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), v42 (copy)
                    local v43, v44 = l_universeAvatarController_0:getHeightRules();
                    v42.height = {
                        min = v43.Min, 
                        max = v43.Max, 
                        increment = v44
                    };
                end), 
                v7.new(function() --[[ Line: 132 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), v42 (copy)
                    local v45, v46 = l_universeAvatarController_0:getWidthRules();
                    v42.width = {
                        min = v45.Min, 
                        max = v45.Max, 
                        increment = v46
                    };
                end), 
                v7.new(function() --[[ Line: 140 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), v42 (copy)
                    local v47, v48 = l_universeAvatarController_0:getHeadScaleRules();
                    v42.head = {
                        min = v47.Min, 
                        max = v47.Max, 
                        increment = v48
                    };
                end), 
                v7.new(function() --[[ Line: 148 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), v42 (copy)
                    local v49, v50 = l_universeAvatarController_0:getBodyTypeRules();
                    v42.bodyType = {
                        min = v49.Min, 
                        max = v49.Max, 
                        increment = v50
                    };
                end), 
                v7.new(function() --[[ Line: 156 ]]
                    -- upvalues: l_universeAvatarController_0 (ref), v42 (copy)
                    local v51, v52 = l_universeAvatarController_0:getProportionsRules();
                    v42.proportion = {
                        min = v51.Min, 
                        max = v51.Max, 
                        increment = v52
                    };
                end)
            };
            for _, v55 in ipairs(v53) do
                v55:start();
            end;
            for _, v57 in ipairs(v53) do
                v57:join();
            end;
            v18:dispatch(v11({
                scales = v42
            }));
        end
    };
end;
local function v77(v59, v60) --[[ Line: 178 ]] --[[ Name: saveSettings ]]
    -- upvalues: v7 (copy)
    local v61 = v59:getState();
    local l_game_1 = v61.Metadata.game;
    local l_universeAvatarController_1 = v60.universeAvatarController;
    return {
        function() --[[ Line: 184 ]]
            -- upvalues: v61 (copy), l_universeAvatarController_1 (copy), l_game_1 (copy)
            local l_universeAvatarType_0 = v61.Settings.Changed.universeAvatarType;
            if l_universeAvatarType_0 ~= nil then
                local v65 = nil;
                v65 = if l_universeAvatarType_0 == "MorphToR6" then Enum.GameAvatarType.R6 else if l_universeAvatarType_0 == "MorphToR15" then Enum.GameAvatarType.R15 else Enum.GameAvatarType.PlayerChoice;
                l_universeAvatarController_1:setAvatarType(l_game_1, v65);
            end;
        end, 
        function() --[[ Line: 199 ]]
            -- upvalues: v61 (copy), l_universeAvatarController_1 (copy), l_game_1 (copy)
            local l_universeAnimationType_0 = v61.Settings.Changed.universeAnimationType;
            if l_universeAnimationType_0 ~= nil then
                l_universeAvatarController_1:setAnimationType(l_game_1, l_universeAnimationType_0);
            end;
        end, 
        function() --[[ Line: 206 ]]
            -- upvalues: v61 (copy), l_universeAvatarController_1 (copy), l_game_1 (copy)
            local l_universeCollisionType_0 = v61.Settings.Changed.universeCollisionType;
            if l_universeCollisionType_0 ~= nil then
                local v68 = Enum.R15CollisionType[l_universeCollisionType_0];
                l_universeAvatarController_1:setCollisionType(l_game_1, v68);
            end;
        end, 
        function() --[[ Line: 214 ]]
            -- upvalues: v61 (copy), l_universeAvatarController_1 (copy), l_game_1 (copy)
            local l_universeAvatarAssetOverrides_0 = v61.Settings.Changed.universeAvatarAssetOverrides;
            if l_universeAvatarAssetOverrides_0 ~= nil then
                l_universeAvatarController_1:setAssetOverrides(l_game_1, l_universeAvatarAssetOverrides_0);
            end;
        end, 
        function() --[[ Line: 221 ]]
            -- upvalues: v61 (copy), v7 (ref), l_universeAvatarController_1 (copy), l_game_1 (copy)
            local l_universeAvatarMinScales_0 = v61.Settings.Changed.universeAvatarMinScales;
            local l_universeAvatarMaxScales_0 = v61.Settings.Changed.universeAvatarMaxScales;
            if l_universeAvatarMinScales_0 ~= nil or l_universeAvatarMaxScales_0 ~= nil then
                l_universeAvatarMinScales_0 = l_universeAvatarMinScales_0 or v61.Settings.Current.universeAvatarMinScales;
                l_universeAvatarMaxScales_0 = l_universeAvatarMaxScales_0 or v61.Settings.Current.universeAvatarMaxScales;
                local v72 = {
                    v7.new(function() --[[ Line: 230 ]]
                        -- upvalues: l_universeAvatarController_1 (ref), l_game_1 (ref), l_universeAvatarMinScales_0 (ref), l_universeAvatarMaxScales_0 (ref)
                        l_universeAvatarController_1:setHeightRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.height, l_universeAvatarMaxScales_0.height));
                    end), 
                    v7.new(function() --[[ Line: 236 ]]
                        -- upvalues: l_universeAvatarController_1 (ref), l_game_1 (ref), l_universeAvatarMinScales_0 (ref), l_universeAvatarMaxScales_0 (ref)
                        l_universeAvatarController_1:setWidthRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.width, l_universeAvatarMaxScales_0.width));
                    end), 
                    v7.new(function() --[[ Line: 242 ]]
                        -- upvalues: l_universeAvatarController_1 (ref), l_game_1 (ref), l_universeAvatarMinScales_0 (ref), l_universeAvatarMaxScales_0 (ref)
                        l_universeAvatarController_1:setHeadScaleRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.head, l_universeAvatarMaxScales_0.head));
                    end), 
                    v7.new(function() --[[ Line: 248 ]]
                        -- upvalues: l_universeAvatarController_1 (ref), l_game_1 (ref), l_universeAvatarMinScales_0 (ref), l_universeAvatarMaxScales_0 (ref)
                        l_universeAvatarController_1:setBodyTypeRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.bodyType, l_universeAvatarMaxScales_0.bodyType));
                    end), 
                    v7.new(function() --[[ Line: 254 ]]
                        -- upvalues: l_universeAvatarController_1 (ref), l_game_1 (ref), l_universeAvatarMinScales_0 (ref), l_universeAvatarMaxScales_0 (ref)
                        l_universeAvatarController_1:setProportionsRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.proportion, l_universeAvatarMaxScales_0.proportion));
                    end)
                };
                for _, v74 in ipairs(v72) do
                    v74:start();
                end;
                for _, v76 in ipairs(v72) do
                    v76:join();
                end;
            end;
        end
    };
end;
local function v80(v78, v79) --[[ Line: 274 ]] --[[ Name: loadValuesToProps ]]
    return {
        AvatarType = v78("universeAvatarType"), 
        AvatarAnimation = v78("universeAnimationType"), 
        AvatarCollision = v78("universeCollisionType"), 
        AvatarAssetOverrides = v78("universeAvatarAssetOverrides"), 
        AvatarScalingMin = v78("universeAvatarMinScales"), 
        AvatarScalingMax = v78("universeAvatarMaxScales"), 
        CurrentAvatarType = v79.Settings.Current.universeAvatarType, 
        AssetOverrideErrors = v79.Settings.Errors.universeAvatarAssetOverrides, 
        OwnerId = v79.GameOwnerMetadata.creatorId, 
        OwnerType = v79.GameOwnerMetadata.creatorType
    };
end;
local function v88(v81, v82) --[[ Line: 292 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v9 (copy), v10 (copy), v8 (copy), v12 (copy), v13 (copy), v11 (copy)
    return {
        AvatarAnimationChanged = v81("universeAnimationType"), 
        AvatarCollisionChanged = v81("universeCollisionType"), 
        AvatarScalingMinChanged = v81("universeAvatarMinScales"), 
        AvatarScalingMaxChanged = v81("universeAvatarMaxScales"), 
        AvatarTypeChanged = function(v83, v84) --[[ Line: 299 ]] --[[ Name: AvatarTypeChanged ]]
            -- upvalues: v82 (copy), v9 (ref), v10 (ref), v8 (ref)
            if v84 then
                v82(v9("universeAvatarType"));
            else
                v82(v10("universeAvatarType"));
            end;
            v82(v8("universeAvatarType", v83));
        end, 
        AvatarAssetOverridesChanged = function(v85) --[[ Line: 307 ]] --[[ Name: AvatarAssetOverridesChanged ]]
            -- upvalues: v82 (copy), v8 (ref), v12 (ref), v13 (ref)
            v82(v8("universeAvatarAssetOverrides", v85));
            local v86 = v12.getErrors(v85);
            if v86 then
                v82(v13({
                    universeAvatarAssetOverrides = v86
                }));
            end;
        end, 
        SaveScaleBoundaries = function(v87) --[[ Line: 315 ]] --[[ Name: SaveScaleBoundaries ]]
            -- upvalues: v82 (copy), v11 (ref)
            v82(v11({
                scales = v87
            }));
        end
    };
end;
local _ = function(_) --[[ Line: 321 ]]
    return game.GameId ~= 0;
end;
local function _(v91, v92) --[[ Line: 325 ]]
    local v93 = false;
    if v91 ~= "PlayerChoice" then
        v93 = v92 ~= v91;
    end;
    return v93;
end;
local v95 = v3.PureComponent:extend(script.Name);
v95.hasPermissionToEdit = function(v96) --[[ Line: 331 ]] --[[ Name: hasPermissionToEdit ]]
    -- upvalues: l_StudioService_0 (copy)
    local l_props_0 = v96.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v100 = true;
    if l_OwnerType_0 ~= Enum.CreatorType.Group then
        v100 = l_OwnerId_0 == l_StudioService_0:GetUserId();
    end;
    return v100;
end;
v95.createChildren = function(v101) --[[ Line: 340 ]] --[[ Name: createChildren ]]
    -- upvalues: v3 (copy), v14 (copy)
    local l_props_1 = v101.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Mouse_0 = l_props_1.Mouse;
    local v105 = {};
    local l_createElement_0 = v3.createElement;
    local l_v14_0 = v14;
    local v108 = {
        ThemeData = l_Stylizer_0, 
        IsEnabled = true
    };
    local l_CurrentAvatarType_0 = l_props_1.CurrentAvatarType;
    local l_AvatarType_0 = l_props_1.AvatarType;
    local v111 = false;
    if l_CurrentAvatarType_0 ~= "PlayerChoice" then
        v111 = l_AvatarType_0 ~= l_CurrentAvatarType_0;
    end;
    v108.IsGameShutdownRequired = v111;
    v108.AssetOverrideErrors = l_props_1.AssetOverrideErrors;
    v108.Mouse = l_Mouse_0:get();
    v108.IsPlacePublished = game.GameId ~= 0;
    v108.AvatarType = l_props_1.AvatarType;
    v108.AvatarAnimation = l_props_1.AvatarAnimation;
    v108.AvatarCollision = l_props_1.AvatarCollision;
    v108.AvatarAssetOverrides = l_props_1.AvatarAssetOverrides;
    v108.AvatarScalingMin = l_props_1.AvatarScalingMin;
    v108.AvatarScalingMax = l_props_1.AvatarScalingMax;
    v108.OnAvatarTypeChanged = function(v112) --[[ Line: 364 ]] --[[ Name: OnAvatarTypeChanged ]]
        -- upvalues: l_props_1 (copy)
        local l_l_props_1_0 = l_props_1;
        if game.GameId ~= 0 then
            l_l_props_1_0 = l_props_1.CurrentAvatarType;
            local v114 = false;
            if l_l_props_1_0 ~= "PlayerChoice" then
                v114 = v112 ~= l_l_props_1_0;
            end;
            l_props_1.AvatarTypeChanged(v112, v114);
            return;
        else
            l_props_1.AvatarTypeChanged(v112);
            return;
        end;
    end;
    v108.OnAvatarAnimationChanged = l_props_1.AvatarAnimationChanged;
    v108.OnAvatarCollisionChanged = l_props_1.AvatarCollisionChanged;
    v108.OnAvatarAssetOverridesChanged = l_props_1.AvatarAssetOverridesChanged;
    v108.OnAvatarScalingMinChanged = l_props_1.AvatarScalingMinChanged;
    v108.OnAvatarScalingMaxChanged = l_props_1.AvatarScalingMaxChanged;
    v105.Morpher = l_createElement_0(l_v14_0, v108);
    return v105;
end;
v95.render = function(v115) --[[ Line: 382 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v16 (copy), v15 (copy), v58 (copy), v77 (copy), l_Name_0 (copy)
    local l_Localization_0 = v115.props.Localization;
    if not v115:hasPermissionToEdit() then
        return v3.createElement(v16);
    else
        return v3.createElement(v15, {
            SettingsLoadJobs = v58, 
            SettingsSaveJobs = v77, 
            Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
            PageId = l_Name_0, 
            CreateChildren = function() --[[ Line: 394 ]] --[[ Name: CreateChildren ]]
                -- upvalues: v115 (copy)
                return v115:createChildren();
            end
        });
    end;
end;
v95 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v95);
local v117 = require(l_Parent_1.Src.Networking.settingFromState);
v95 = v4.connect(function(v118, _) --[[ Line: 407 ]]
    -- upvalues: v117 (copy), v80 (copy)
    if not v118 then
        return;
    else
        return (v80(function(v120) --[[ Line: 412 ]]
            -- upvalues: v117 (ref), v118 (copy)
            return v117(v118.Settings, v120);
        end, v118));
    end;
end, function(v121) --[[ Line: 417 ]]
    -- upvalues: v8 (copy), v88 (copy)
    return (v88(function(v122) --[[ Line: 418 ]]
        -- upvalues: v121 (copy), v8 (ref)
        return function(v123) --[[ Line: 419 ]]
            -- upvalues: v121 (ref), v8 (ref), v122 (copy)
            v121(v8(v122, v123));
        end;
    end, v121));
end)(v95);
v95.LocalizationId = l_Name_0;
return v95;