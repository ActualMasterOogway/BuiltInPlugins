local v0 = game:DefineFastInt("MaxNameLength", 50);
local v1 = game:DefineFastInt("PaidAccessMinPrice", 25);
local v2 = game:DefineFastInt("PaidAccessMaxPrice", 1000);
local v3 = game:DefineFastInt("PrivateServersMinPrice", 10);
local v4 = game:DefineFastInt("DevProductsMinPrice", 1);
local v5 = game:DefineFastInt("DevProductsMaxPrice", 1000000000);
local v6 = game:DefineFastInt("DeveloperSubscriptionsMaxRobuxPrice", 2000);
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_1.Packages.Roact);
local v10 = require(l_Parent_1.Packages.RoactRodux);
local v11 = require(l_Parent_1.Packages.Cryo);
local v12 = require(l_Parent_1.Packages.Framework);
local l_Util_0 = v12.Util;
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = require(l_Parent_1.Src.Components.Header);
local v17 = require(l_Parent_0.Components.RewardedOnDemandAdsSetting);
local v18 = require(l_Parent_0.Components.PaidAccess);
local v19 = require(l_Parent_0.Components.VIPServers);
local v20 = require(l_Parent_0.Components.DevProducts);
local v21 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v22 = require(l_Parent_0.Components.DevSubList);
local v23 = require(l_Parent_0.Components.DevSubDetails);
local v24 = require(l_Parent_0.Components.Badges);
local l_UI_0 = v12.UI;
local l_Container_0 = l_UI_0.Container;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Image_0 = l_UI_0.Image;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Separator_0 = l_UI_0.Separator;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v36 = require(l_Parent_1.Src.Components.AutoThumbnails.BadgeIconThumbnail);
local v37 = require(l_Parent_1.Src.Actions.AddChange);
local v38 = require(l_Parent_1.Src.Actions.AddErrors);
local v39 = require(l_Parent_1.Src.Actions.DiscardError);
local v40 = require(l_Parent_1.Src.Actions.SetEditDevProductId);
local v41 = require(l_Parent_1.Src.Actions.SetComponentLoadState);
local v42 = require(l_Parent_0.Thunks.LoadDeveloperProducts);
local v43 = require(l_Parent_0.Thunks.LoadBadges);
local v44 = require(l_Parent_0.Thunks.AddDevSubKeyChange);
local v45 = require(l_Parent_0.Thunks.AddDevSubKeyError);
local v46 = require(l_Parent_0.Thunks.AddDevSubChange);
local v47 = require(l_Parent_1.Src.Util.LoadState);
local l_shouldAllowBadges_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldAllowBadges;
local l_PaidAccessInFiat_0 = game:GetFastFlag("PaidAccessInFiat");
local l_HttpService_0 = game:GetService("HttpService");
local v51 = require(l_Parent_0.FFlagDeveloperSubscriptionsEnabled);
local v52 = v9.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local v54 = require(l_Parent_0.Flags);
local v55 = false;
local v56 = {
    BelowMin = "ErrorPriceBelowMin", 
    AboveMax = "ErrorPriceAboveMax", 
    Invalid = "ErrorPriceInvalid"
};
local v57 = {
    Empty = "ErrorNameEmpty"
};
local v58 = "";
local v59 = require(l_Parent_1.Src.Util.KeyProvider);
local l_getIsFriendOnlyKeyName_0 = v59.getIsFriendOnlyKeyName;
local l_getIsActiveKeyName_0 = v59.getIsActiveKeyName;
local l_getIsForSaleKeyName_0 = v59.getIsForSaleKeyName;
local l_getIsRewardedOnDemandAdsAllowedKeyName_0 = v59.getIsRewardedOnDemandAdsAllowedKeyName;
local l_getVipServersIsEnabledKeyName_0 = v59.getVipServersIsEnabledKeyName;
local function v97(v65, v66) --[[ Line: 102 ]] --[[ Name: loadSettings ]]
    -- upvalues: v55 (ref), v54 (copy), l_getIsRewardedOnDemandAdsAllowedKeyName_0 (copy), l_getIsForSaleKeyName_0 (copy), l_getVipServersIsEnabledKeyName_0 (copy), v51 (copy), l_getIsActiveKeyName_0 (copy), l_getIsFriendOnlyKeyName_0 (copy), l_shouldAllowBadges_0 (copy)
    local v67 = v65:getState();
    local l_gameId_0 = v67.Metadata.gameId;
    local l_monetizationController_0 = v66.monetizationController;
    local l_devSubsController_0 = v66.devSubsController;
    local l_gamePermissionsController_0 = v66.gamePermissionsController;
    v55 = v54.GetFFlagEnableRewardedVideoAdsStudioSettings(l_gameId_0);
    local v93 = {
        function(v72) --[[ Line: 112 ]]
            -- upvalues: l_monetizationController_0 (copy)
            v72.taxRate = l_monetizationController_0:getTaxRate();
        end, 
        function(v73) --[[ Line: 118 ]]
            -- upvalues: l_monetizationController_0 (copy)
            v73.minimumFee = l_monetizationController_0:getMinimumFee();
        end, 
        function(v74) --[[ Line: 123 ]]
            -- upvalues: v55 (ref), l_monetizationController_0 (copy), l_gameId_0 (copy), l_getIsRewardedOnDemandAdsAllowedKeyName_0 (ref)
            if v55 then
                v74.isUniverseEligibleForRewardedOnDemandAds = l_monetizationController_0:getIsUniverseEligibleForRewardedOnDemandAds(l_gameId_0);
                local v75 = l_monetizationController_0:getIsRewardedOnDemandAdsAllowed(l_gameId_0);
                v74[l_getIsRewardedOnDemandAdsAllowedKeyName_0()] = v75;
            end;
        end, 
        function(v76) --[[ Line: 134 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy), l_getIsForSaleKeyName_0 (ref)
            local v77 = l_monetizationController_0:getPaidAccessEnabled(l_gameId_0);
            v76[l_getIsForSaleKeyName_0()] = v77;
        end, 
        function(v78) --[[ Line: 139 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy)
            v78.price = l_monetizationController_0:getPaidAccessPrice(l_gameId_0);
        end, 
        function(v79) --[[ Line: 144 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy), l_getVipServersIsEnabledKeyName_0 (ref)
            local v80 = l_monetizationController_0:getVIPServersEnabled(l_gameId_0);
            v79[l_getVipServersIsEnabledKeyName_0()] = v80;
        end, 
        function(v81) --[[ Line: 149 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy)
            local v82 = l_monetizationController_0:getVIPServersPrice(l_gameId_0);
            v81.vipServersPrice = v82 and v82 or 0;
        end, 
        function(v83) --[[ Line: 154 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy)
            v83.vipServersActiveServersCount = l_monetizationController_0:getVIPServersActiveServersCount(l_gameId_0);
        end, 
        function(v84) --[[ Line: 159 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy)
            v84.vipServersActiveSubscriptionsCount = l_monetizationController_0:getVIPServersActiveSubscriptionsCount(l_gameId_0);
        end, 
        function(v85) --[[ Line: 165 ]]
            -- upvalues: l_monetizationController_0 (copy), l_gameId_0 (copy)
            local v86, v87 = l_monetizationController_0:getDeveloperProducts(l_gameId_0);
            v85.developerProducts = v86;
            v85.devProductsCursor = v87;
        end, 
        function(v88) --[[ Line: 172 ]]
            -- upvalues: v51 (ref), l_devSubsController_0 (copy), l_gameId_0 (copy)
            if not v51 then
                return;
            else
                v88.DeveloperSubscriptions = l_devSubsController_0:getDevSubs(l_gameId_0, true);
                return;
            end;
        end, 
        function(v89) --[[ Line: 182 ]]
            -- upvalues: v67 (copy), l_getIsActiveKeyName_0 (ref), l_gamePermissionsController_0 (copy), l_gameId_0 (copy)
            if v67.Settings.Current[l_getIsActiveKeyName_0()] == nil then
                local v90 = l_gamePermissionsController_0:isActive(l_gameId_0);
                v89[l_getIsActiveKeyName_0()] = v90;
            end;
        end, 
        function(v91) --[[ Line: 189 ]]
            -- upvalues: v67 (copy), l_getIsFriendOnlyKeyName_0 (ref), l_gamePermissionsController_0 (copy), l_gameId_0 (copy)
            if v67.Settings.Current[l_getIsFriendOnlyKeyName_0()] == nil then
                local v92 = l_gamePermissionsController_0:isFriendsOnly(l_gameId_0);
                v91[l_getIsFriendOnlyKeyName_0()] = v92;
            end;
        end
    };
    table.insert(v93, function(v94) --[[ Line: 197 ]]
        -- upvalues: l_shouldAllowBadges_0 (ref), l_monetizationController_0 (copy), l_gameId_0 (copy)
        if l_shouldAllowBadges_0() then
            local v95, v96 = l_monetizationController_0:getBadges(l_gameId_0);
            v94.badges = v95;
            v94.badgesCursor = v96;
        end;
    end);
    return v93;
end;
local function v120(v98, v99) --[[ Line: 209 ]] --[[ Name: saveSettings ]]
    -- upvalues: v55 (ref), v54 (copy), v51 (copy)
    local v100 = v98:getState();
    local l_gameId_1 = v100.Metadata.gameId;
    local l_monetizationController_1 = v99.monetizationController;
    local l_devsubs_0 = v99.devsubs;
    local l_unsavedDevProducts_0 = v100.Settings.Changed.unsavedDevProducts;
    local l_editedDeveloperProducts_0 = v100.Settings.Changed.editedDeveloperProducts;
    local l_DeveloperSubscriptions_0 = v100.Settings.Current.DeveloperSubscriptions;
    local v107 = v100.Settings.Changed.DeveloperSubscriptions or {};
    v55 = v54.GetFFlagEnableRewardedVideoAdsStudioSettings(l_gameId_1);
    local v113 = {
        function() --[[ Line: 222 ]]
            -- upvalues: v100 (copy), l_monetizationController_1 (copy), l_gameId_1 (copy)
            local l_isForSale_0 = v100.Settings.Changed.isForSale;
            if l_isForSale_0 ~= nil then
                l_monetizationController_1:setPaidAccessEnabled(l_gameId_1, l_isForSale_0);
            end;
        end, 
        function() --[[ Line: 230 ]]
            -- upvalues: v100 (copy), l_monetizationController_1 (copy), l_gameId_1 (copy)
            local l_price_0 = v100.Settings.Changed.price;
            if l_price_0 ~= nil then
                l_monetizationController_1:setPaidAccessPrice(l_gameId_1, l_price_0);
            end;
        end, 
        function() --[[ Line: 238 ]]
            -- upvalues: v100 (copy), l_monetizationController_1 (copy), l_gameId_1 (copy)
            local l_vipServersIsEnabled_0 = v100.Settings.Changed.vipServersIsEnabled;
            if l_vipServersIsEnabled_0 ~= nil then
                l_monetizationController_1:setVIPServersEnabled(l_gameId_1, l_vipServersIsEnabled_0);
            end;
        end, 
        function() --[[ Line: 246 ]]
            -- upvalues: v100 (copy), l_monetizationController_1 (copy), l_gameId_1 (copy)
            local l_vipServersPrice_0 = v100.Settings.Changed.vipServersPrice;
            if l_vipServersPrice_0 ~= nil then
                l_monetizationController_1:setVIPServersPrice(l_gameId_1, l_vipServersPrice_0);
            end;
        end, 
        function() --[[ Line: 254 ]]
            -- upvalues: v55 (ref), v100 (copy), l_monetizationController_1 (copy), l_gameId_1 (copy)
            if v55 then
                local l_isRewardedOnDemandAdsAllowed_0 = v100.Settings.Changed.isRewardedOnDemandAdsAllowed;
                if l_isRewardedOnDemandAdsAllowed_0 ~= nil then
                    l_monetizationController_1:setIsRewardedOnDemandAdsAllowed(l_gameId_1, l_isRewardedOnDemandAdsAllowed_0);
                end;
            end;
        end
    };
    if l_unsavedDevProducts_0 ~= nil then
        for _, v115 in pairs(l_unsavedDevProducts_0) do
            table.insert(v113, function() --[[ Line: 267 ]]
                -- upvalues: l_monetizationController_1 (copy), l_gameId_1 (copy), v115 (copy)
                l_monetizationController_1:createDevProduct(l_gameId_1, v115);
            end);
        end;
    end;
    if l_editedDeveloperProducts_0 ~= nil then
        for _, v117 in pairs(l_editedDeveloperProducts_0) do
            table.insert(v113, function() --[[ Line: 275 ]]
                -- upvalues: l_monetizationController_1 (copy), l_gameId_1 (copy), v117 (copy)
                l_monetizationController_1:updateDevProduct(l_gameId_1, v117);
            end);
        end;
    end;
    if v51 and v107 ~= nil then
        for v118, v119 in pairs(v107) do
            if v119.IsNew then
                table.insert(v113, function() --[[ Line: 284 ]]
                    -- upvalues: l_devsubs_0 (copy), l_gameId_1 (copy), v119 (copy)
                    l_devsubs_0:createDevSub(l_gameId_1, v119);
                end);
            elseif v119.Active == false then
                table.insert(v113, function() --[[ Line: 289 ]]
                    -- upvalues: l_devsubs_0 (copy), l_DeveloperSubscriptions_0 (copy), v118 (copy)
                    l_devsubs_0:discontinueDevSub(l_DeveloperSubscriptions_0[v118]);
                end);
            else
                table.insert(v113, function() --[[ Line: 293 ]]
                    -- upvalues: l_devsubs_0 (copy), l_DeveloperSubscriptions_0 (copy), v118 (copy), v119 (copy)
                    l_devsubs_0:changeDevSub(l_DeveloperSubscriptions_0[v118], v119);
                end);
            end;
        end;
    end;
    return v113;
end;
local function v128(v121, v122) --[[ Line: 305 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: v55 (ref), v54 (copy), l_getIsForSaleKeyName_0 (copy), l_getVipServersIsEnabledKeyName_0 (copy), l_getIsActiveKeyName_0 (copy), l_getIsFriendOnlyKeyName_0 (copy), l_PaidAccessInFiat_0 (copy)
    local l_Errors_0 = v122.Settings.Errors;
    local l_gameId_2 = v122.Metadata.gameId;
    v55 = v54.GetFFlagEnableRewardedVideoAdsStudioSettings(l_gameId_2);
    local v125 = false;
    local v126 = v122.Settings.Changed.vipServersIsEnabled == false;
    if v122.Settings.Current.vipServersIsEnabled and v122.Settings.Changed.vipServersPrice ~= nil then
        v125 = true;
    end;
    local v127 = {
        TaxRate = v121("taxRate"), 
        MinimumFee = v121("minimumFee"), 
        RewardedOnDemandAdsSetting = {
            isUniverseEligibleForRewardedOnDemandAds = if v55 then v121("isUniverseEligibleForRewardedOnDemandAds") else nil, 
            isRewardedOnDemandAdsAllowed = if v55 then v122.Settings.Current.isRewardedOnDemandAdsAllowed else nil
        }, 
        PaidAccess = {
            enabled = v121(l_getIsForSaleKeyName_0()), 
            price = v121("price"), 
            initialPrice = v122.Settings.Current.price and v122.Settings.Current.price or 0
        }, 
        VIPServers = {
            isEnabled = v121(l_getVipServersIsEnabledKeyName_0()), 
            price = v121("vipServersPrice"), 
            initialPrice = v122.Settings.Current.vipServersPrice and v122.Settings.Current.vipServersPrice or 0, 
            activeServersCount = v121("vipServersActiveServersCount"), 
            activeSubscriptionsCount = v121("vipServersActiveSubscriptionsCount"), 
            changed = v125, 
            willShutdown = v126
        }, 
        UnsavedDevProducts = v121("unsavedDevProducts"), 
        DevProducts = v122.Settings.Current.developerProducts, 
        EditedDevProducts = v122.Settings.Changed.editedDeveloperProducts, 
        EditDevProductId = v122.EditAsset.editDevProductId, 
        AccessPriceError = l_Errors_0.monetizationPrice, 
        DevProductPriceError = l_Errors_0.devProductPrice, 
        DevProductNameError = l_Errors_0.devProductName, 
        isEditingSubscription = v121("isEditingSubscription"), 
        editedSubscriptionKey = v121("editedSubscriptionKey"), 
        Badges = v122.Settings.Current.badges, 
        BadgeLoadState = v122.ComponentLoadState.Badges, 
        isPublic = v121(l_getIsActiveKeyName_0()) and not v121(l_getIsFriendOnlyKeyName_0()), 
        isInitiallyEnabled = (not v122.Settings.Current[l_getIsActiveKeyName_0()] or v122.Settings.Current[l_getIsFriendOnlyKeyName_0()]) and (v122.Settings.Current[l_getIsForSaleKeyName_0()] or v122.Settings.Current[l_getVipServersIsEnabledKeyName_0()])
    };
    if l_PaidAccessInFiat_0 then
        v127.GameId = v122.Metadata.gameId;
    end;
    return v127;
end;
local function v134(v129, v130, v131, v132) --[[ Line: 382 ]] --[[ Name: checkChangedDevSubKey ]]
    -- upvalues: v45 (copy), v6 (copy)
    if v131 == "Name" and (v132 == "" or v132 == nil) then
        v129(v45(v130, v131, {
            Empty = "Name can't be empty"
        }));
        return;
    else
        if v131 == "Price" then
            local v133 = tonumber(v132);
            if not v133 or v133 <= 0 then
                v129(v45(v130, v131, {
                    NotANumber = "Price needs to be a valid number"
                }));
                return;
            elseif v6 and v6 < v133 then
                v129(v45(v130, v131, {
                    AboveMaxRobuxAmount = "Price must be less than a certain amount"
                }));
                return;
            end;
        elseif v131 == "Image" and (v132 == nil or v132 == "None") then
            v129(v45(v130, v131, {
                Empty = "Image can't be empty"
            }));
        end;
        return;
    end;
end;
local function _(v135, v136) --[[ Line: 403 ]] --[[ Name: checkChangedDevSub ]]
    -- upvalues: v134 (copy)
    v134(v135, v136.Key, "Name", v136.Name);
    v134(v135, v136.Key, "Image", v136.Image);
    v134(v135, v136.Key, "Price", v136.Price);
end;
local function v168(_, v139) --[[ Line: 410 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v37 (copy), l_getIsRewardedOnDemandAdsAllowedKeyName_0 (copy), v39 (copy), l_getIsForSaleKeyName_0 (copy), v38 (copy), v1 (copy), v2 (copy), l_getVipServersIsEnabledKeyName_0 (copy), v3 (copy), v40 (copy), v42 (copy), v43 (copy), v41 (copy), v47 (copy), v44 (copy), v134 (copy), l_HttpService_0 (copy), v46 (copy)
    return {
        RewardedOnDemandAdsToggled = function(v140) --[[ Line: 412 ]] --[[ Name: RewardedOnDemandAdsToggled ]]
            -- upvalues: v139 (copy), v37 (ref), l_getIsRewardedOnDemandAdsAllowedKeyName_0 (ref)
            v139(v37(l_getIsRewardedOnDemandAdsAllowedKeyName_0(), v140));
        end, 
        PaidAccessToggled = function(v141, v142) --[[ Line: 417 ]] --[[ Name: PaidAccessToggled ]]
            -- upvalues: v139 (copy), v37 (ref), v39 (ref), l_getIsForSaleKeyName_0 (ref)
            v139(v37("price", v142));
            v139(v39("monetizationPrice"));
            v139(v37(l_getIsForSaleKeyName_0(), v141));
        end, 
        PaidAccessPriceChanged = function(v143) --[[ Line: 426 ]] --[[ Name: PaidAccessPriceChanged ]]
            -- upvalues: v139 (copy), v37 (ref), v39 (ref), v38 (ref), v1 (ref), v2 (ref)
            local v144 = tonumber(v143);
            v139(v37("price", v144));
            v139(v39("monetizationPrice"));
            if not v144 then
                v139(v38({
                    monetizationPrice = "Invalid"
                }));
                return;
            elseif v144 < v1 then
                v139(v38({
                    monetizationPrice = "BelowMin"
                }));
                return;
            else
                if v2 < v144 then
                    v139(v38({
                        monetizationPrice = "AboveMax"
                    }));
                end;
                return;
            end;
        end, 
        VIPServersToggled = function(v145, v146) --[[ Line: 441 ]] --[[ Name: VIPServersToggled ]]
            -- upvalues: v139 (copy), v37 (ref), v39 (ref), l_getVipServersIsEnabledKeyName_0 (ref)
            v139(v37("vipServersPrice", v146));
            v139(v39("monetizationPrice"));
            v139(v37(l_getVipServersIsEnabledKeyName_0(), v145));
        end, 
        VIPServersPriceChanged = function(v147) --[[ Line: 450 ]] --[[ Name: VIPServersPriceChanged ]]
            -- upvalues: v139 (copy), v37 (ref), v39 (ref), v38 (ref), v3 (ref)
            local v148 = tonumber(v147);
            v139(v37("vipServersPrice", v148));
            v139(v39("monetizationPrice"));
            if not v148 then
                v139(v38({
                    monetizationPrice = "Invalid"
                }));
                return;
            else
                if v148 ~= 0 and v148 < v3 then
                    v139(v38({
                        monetizationPrice = "BelowMin"
                    }));
                end;
                return;
            end;
        end, 
        SetEditDevProductId = function(v149) --[[ Line: 463 ]] --[[ Name: SetEditDevProductId ]]
            -- upvalues: v139 (copy), v40 (ref)
            v139(v40(v149));
        end, 
        SetUnsavedDevProducts = function(v150, v151, v152) --[[ Line: 467 ]] --[[ Name: SetUnsavedDevProducts ]]
            -- upvalues: v139 (copy), v38 (ref), v39 (ref), v37 (ref)
            if v152 then
                v139(v38({
                    [v151] = v152
                }));
            elseif v151 then
                if type(v151) == "table" then
                    for _, v154 in ipairs(v151) do
                        v139(v39(v154));
                    end;
                else
                    v139(v39(v151));
                end;
            end;
            v139(v37("unsavedDevProducts", v150));
        end, 
        SetDevProducts = function(v155, v156, v157) --[[ Line: 483 ]] --[[ Name: SetDevProducts ]]
            -- upvalues: v139 (copy), v38 (ref), v39 (ref), v37 (ref)
            if v157 then
                v139(v38({
                    [v156] = v157
                }));
            elseif v156 then
                if type(v156) == "table" then
                    for _, v159 in ipairs(v156) do
                        v139(v39(v159));
                    end;
                else
                    v139(v39(v156));
                end;
            end;
            v139(v37("editedDeveloperProducts", v155));
        end, 
        LoadMoreDevProducts = function() --[[ Line: 498 ]] --[[ Name: LoadMoreDevProducts ]]
            -- upvalues: v139 (copy), v42 (ref)
            v139(v42());
        end, 
        LoadMoreBadges = function() --[[ Line: 502 ]] --[[ Name: LoadMoreBadges ]]
            -- upvalues: v139 (copy), v43 (ref)
            v139(v43());
        end, 
        RefreshBadges = function() --[[ Line: 506 ]]
            -- upvalues: v139 (copy), v41 (ref), v47 (ref), v43 (ref)
            v139(v41("Badges", v47.Loading));
            v139(v43(true));
            v139(v41("Badges", v47.Loaded));
        end or nil, 
        SetDevSubKey = function(v160, v161, v162) --[[ Line: 512 ]] --[[ Name: SetDevSubKey ]]
            -- upvalues: v139 (copy), v44 (ref), v134 (ref)
            v139(v44(v160, v161, v162));
            v134(v139, v160, v161, v162);
        end, 
        OnDeveloperSubscriptionChanged = function(v163) --[[ Line: 517 ]] --[[ Name: OnDeveloperSubscriptionChanged ]]
            -- upvalues: v139 (copy), v134 (ref)
            local l_v139_0 = v139;
            v134(l_v139_0, v163.Key, "Name", v163.Name);
            v134(l_v139_0, v163.Key, "Image", v163.Image);
            v134(l_v139_0, v163.Key, "Price", v163.Price);
        end, 
        OnDeveloperSubscriptionCreated = function() --[[ Line: 521 ]] --[[ Name: OnDeveloperSubscriptionCreated ]]
            -- upvalues: l_HttpService_0 (ref), v139 (copy), v46 (ref), v134 (ref), v37 (ref)
            local v165 = "TEMPORARY_" .. l_HttpService_0:GenerateGUID();
            local v166 = {
                IsNew = true, 
                Key = v165, 
                Price = 0, 
                Subscribers = 0, 
                Active = false, 
                Id = -1, 
                Prepaid = 6
            };
            v139(v46(v166.Key, v166));
            local l_v139_1 = v139;
            v134(l_v139_1, v166.Key, "Name", v166.Name);
            v134(l_v139_1, v166.Key, "Image", v166.Image);
            v134(l_v139_1, v166.Key, "Price", v166.Price);
            v139(v37("isEditingSubscription", true));
            v139(v37("editedSubscriptionKey", v166.Key));
        end
    };
end;
local function v173(v169) --[[ Line: 553 ]] --[[ Name: convertBadgesForTable ]]
    -- upvalues: v9 (copy), v36 (copy)
    local v170 = {};
    for v171, v172 in pairs(v169) do
        v170[v172.id] = {
            index = v171, 
            row = {
                v172.name, 
                v172.description
            }, 
            icon = v9.createElement(v36, {
                Id = v172.iconImageId, 
                Size = UDim2.fromScale(1, 1)
            })
        };
    end;
    return v170;
end;
local function v182(v174, v175) --[[ Line: 572 ]] --[[ Name: convertDeveloperProductsForTable ]]
    local v176 = {};
    local v177 = 1;
    for v178, v179 in pairs(v174) do
        local v180 = v179.id ~= nil;
        local v181 = v180 and v179.id or v175:getText("Monetization", "UnsavedDevProduct");
        v176[v180 and v179.id or v177] = {
            index = v178, 
            row = {
                v181, 
                v179.name, 
                v179.price
            }
        };
        v177 = v177 + 1;
    end;
    return v176, v177 - 1;
end;
local function v194(v183, v184) --[[ Line: 597 ]] --[[ Name: combineUnsavedAndSavedDevProducts ]]
    local v185 = {};
    for v186, _ in pairs(v184) do
        table.insert(v185, v186);
    end;
    table.sort(v185);
    local v188 = {};
    local v189 = 1;
    for _, v191 in pairs(v183) do
        table.insert(v188, v189, v191);
        v189 = v189 + 1;
    end;
    for _, v193 in ipairs(v185) do
        table.insert(v188, v189, v184[v193]);
        v189 = v189 + 1;
    end;
    return v188;
end;
local function v201(v195, v196, v197, v198) --[[ Line: 620 ]] --[[ Name: getPriceErrorText ]]
    -- upvalues: v56 (copy), v3 (copy), v1 (copy), v4 (copy), v2 (copy), v5 (copy)
    if not v195 then
        return nil;
    else
        local v199 = nil;
        if v56[v195] then
            local v200 = nil;
            if v195 == "BelowMin" then
                v200 = if v196 then string.format("%.f", v3) else if v197 then string.format("%.f", v1) else string.format("%.f", v4);
            elseif v195 == "AboveMax" then
                v200 = if v197 then string.format("%.f", v2) else string.format("%.f", v5);
            end;
            v199 = v198:getText("Errors", v56[v195], {
                v200
            });
        end;
        return v199;
    end;
end;
local function _(v202, v203) --[[ Line: 652 ]] --[[ Name: getNameErrorText ]]
    -- upvalues: v57 (copy)
    if not v202 then
        return nil;
    else
        local v204 = nil;
        if v57[v202] and v202 == "Empty" then
            v204 = v203:getText("General", v57[v202]);
        end;
        return v204;
    end;
end;
local function v212(v206, v207) --[[ Line: 667 ]] --[[ Name: sanitizeCurrentDevProduct ]]
    -- upvalues: v0 (copy), v11 (copy)
    local v208 = {};
    local l_name_0 = v206.name;
    local v210 = utf8.len(l_name_0);
    local v211 = tonumber(v206.price);
    if v210 < 1 or v0 < v210 then
        v206 = v11.Dictionary.join(v206, {
            name = v207
        });
        table.insert(v208, "devProductName");
    end;
    if type(v211) ~= "number" or v211 < 1 then
        v206 = v11.Dictionary.join(v206, {
            price = 1
        });
        table.insert(v208, "devProductPrice");
    end;
    return v206, v208;
end;
local function v259(v213) --[[ Line: 691 ]] --[[ Name: displayMonetizationPage ]]
    -- upvalues: l_PaidAccessInFiat_0 (copy), v55 (ref), v54 (copy), v11 (copy), v194 (copy), v182 (copy), l_shouldAllowBadges_0 (copy), v173 (copy), v201 (copy), l_LayoutOrderIterator_0 (copy), v47 (copy), v9 (copy), l_Container_0 (copy), l_LoadingIndicator_0 (copy), v24 (copy), l_Separator_0 (copy), v17 (copy), v18 (copy), v1 (copy), v19 (copy), v3 (copy), v51 (copy), v22 (copy), v20 (copy), v58 (ref)
    local v214 = nil;
    if l_PaidAccessInFiat_0 then
        v214 = v213.GameId;
    end;
    v55 = v54.GetFFlagEnableRewardedVideoAdsStudioSettings(v214);
    local l_Localization_0 = v213.Localization;
    local l_Stylizer_0 = v213.Stylizer;
    local l_TaxRate_0 = v213.TaxRate;
    local l_MinimumFee_0 = v213.MinimumFee;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    if v55 then
        v219 = v213.RewardedOnDemandAdsSetting.isUniverseEligibleForRewardedOnDemandAds;
        v220 = v213.RewardedOnDemandAdsSetting.isRewardedOnDemandAdsAllowed;
        v221 = v213.RewardedOnDemandAdsToggled;
    end;
    local l_enabled_0 = v213.PaidAccess.enabled;
    local l_price_1 = v213.PaidAccess.price;
    local l_VIPServers_0 = v213.VIPServers;
    local v225 = v213.UnsavedDevProducts and v213.UnsavedDevProducts or {};
    local v226 = v213.DevProducts and v213.DevProducts or {};
    local v227 = v213.EditedDevProducts and v213.EditedDevProducts or {};
    v226 = v11.Dictionary.join(v226, v227);
    local v228 = v194(v225, v226);
    local v229, v230 = v182(v228, l_Localization_0);
    local l_PaidAccessToggled_0 = v213.PaidAccessToggled;
    local l_PaidAccessPriceChanged_0 = v213.PaidAccessPriceChanged;
    local l_VIPServersToggled_0 = v213.VIPServersToggled;
    local l_VIPServersPriceChanged_0 = v213.VIPServersPriceChanged;
    local l_SetUnsavedDevProducts_0 = v213.SetUnsavedDevProducts;
    local l_SetEditDevProductId_0 = v213.SetEditDevProductId;
    local l_LoadMoreDevProducts_0 = v213.LoadMoreDevProducts;
    local l_isPublic_0 = v213.isPublic;
    local l_isInitiallyEnabled_0 = v213.isInitiallyEnabled;
    local v240 = nil;
    local v241 = nil;
    local v242 = nil;
    local v243 = nil;
    local v244 = l_shouldAllowBadges_0();
    if v244 then
        v240 = v173(v213.Badges);
        v241 = v213.LoadMoreBadges;
        v242 = v213.RefreshBadges;
        v243 = v213.BadgeLoadState;
    end;
    local l_OnDeveloperSubscriptionCreated_0 = v213.OnDeveloperSubscriptionCreated;
    local v246 = v201(v213.AccessPriceError, l_VIPServers_0.isEnabled, l_enabled_0, l_Localization_0);
    local v247 = l_LayoutOrderIterator_0.new();
    if not l_TaxRate_0 then
        l_enabled_0 = nil;
        l_VIPServers_0.isEnabled = nil;
    end;
    local v249 = {
        BadgesLoadingIndicatorContainer = v244 and v243 == v47.Loading and v9.createElement(l_Container_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.table.height / 2)
        }, {
            BadgesLoadingIndicator = v9.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            })
        }), 
        Badges = v244 and v243 ~= v47.Loading and v9.createElement(v24, {
            BadgeList = v240, 
            LayoutOrder = v247:getNextOrder(), 
            OnLoadMoreBadges = v241, 
            RefreshBadges = v242
        }), 
        Separator = v244 and v9.createElement(l_Separator_0, {
            LayoutOrder = v247:getNextOrder()
        }), 
        RewardedOnDemandAdsSetting = if v55 and v219 then v9.createElement(v17, {
            LayoutOrder = v247:getNextOrder(), 
            IsEligible = v219, 
            IsEnabled = v220, 
            Title = l_Localization_0:getText("Monetization", "RewardedAdsTitle"), 
            SubText = l_Localization_0:getText("Monetization", "RewardedAdsSubtext"), 
            LinkText = l_Localization_0:getText("Monetization", "RewardedAdsSubtextLink"), 
            OnToggled = function(v248) --[[ Line: 796 ]] --[[ Name: OnToggled ]]
                -- upvalues: v221 (ref)
                return v221(v248);
            end
        }) else nil
    };
    local l_createElement_0 = v9.createElement;
    local l_v18_0 = v18;
    local v252 = {
        GameId = if l_PaidAccessInFiat_0 then v214 else nil, 
        Price = l_price_1, 
        TaxRate = l_TaxRate_0, 
        MinimumFee = l_MinimumFee_0, 
        PriceError = l_enabled_0 and v246 or nil, 
        LayoutOrder = v247:getNextOrder()
    };
    local v253 = false;
    if l_VIPServers_0.isEnabled == false then
        v253 = l_enabled_0 and l_isInitiallyEnabled_0 or l_isPublic_0;
    end;
    v252.Enabled = v253;
    v252.Selected = l_enabled_0;
    v252.OnPaidAccessToggle = function(v254) --[[ Line: 816 ]] --[[ Name: OnPaidAccessToggle ]]
        -- upvalues: v213 (copy), v1 (ref), l_PaidAccessToggled_0 (copy)
        local v255 = math.max(v213.PaidAccess.initialPrice, v1);
        return l_PaidAccessToggled_0(v254, v255);
    end;
    v252.OnPaidAccessPriceChanged = l_PaidAccessPriceChanged_0;
    v249.PaidAccess = l_createElement_0(l_v18_0, v252);
    l_createElement_0 = v9.createElement;
    l_v18_0 = v19;
    v252 = {
        VIPServersData = l_VIPServers_0, 
        TaxRate = l_TaxRate_0, 
        MinimumFee = l_MinimumFee_0, 
        PriceError = l_VIPServers_0.isEnabled and v246 or nil, 
        LayoutOrder = v247:getNextOrder()
    };
    v253 = false;
    if l_enabled_0 == false then
        v253 = l_VIPServers_0.isEnabled and l_isInitiallyEnabled_0 or l_isPublic_0;
    end;
    v252.Enabled = v253;
    v252.OnVipServersToggled = function(v256) --[[ Line: 834 ]] --[[ Name: OnVipServersToggled ]]
        -- upvalues: v213 (copy), v3 (ref), l_VIPServersToggled_0 (copy)
        local v257 = math.max(v213.VIPServers.initialPrice, v3);
        return l_VIPServersToggled_0(v256, v257);
    end;
    v252.OnVipServersPriceChanged = l_VIPServersPriceChanged_0;
    v249.VIPServers = l_createElement_0(l_v18_0, v252);
    v249.DevSubsList = v51 and v9.createElement(v22, {
        LayoutOrder = v247:getNextOrder(), 
        OnDeveloperSubscriptionCreated = l_OnDeveloperSubscriptionCreated_0
    });
    v249.DevProducts = v9.createElement(v20, {
        ProductList = v229, 
        ShowTable = v230 ~= 0, 
        LayoutOrder = v247:getNextOrder(), 
        CreateNewDevProduct = function() --[[ Line: 852 ]] --[[ Name: CreateNewDevProduct ]]
            -- upvalues: v230 (copy), v58 (ref), l_Localization_0 (copy), v225 (copy), l_SetUnsavedDevProducts_0 (copy)
            local v258 = string.format("%d", v230 + 1);
            v58 = l_Localization_0:getText("Monetization", "UnsavedDevProductName1", {
                v258
            });
            table.insert(v225, 1, {
                name = v58, 
                price = 1, 
                iconImageAssetId = "None"
            });
            l_SetUnsavedDevProducts_0(v225, nil, nil);
        end, 
        OnLoadMoreDevProducts = l_LoadMoreDevProducts_0, 
        OnEditDevProductClicked = l_SetEditDevProductId_0
    });
    return v249;
end;
local function v289(v260) --[[ Line: 868 ]] --[[ Name: displayEditDevProductsPage ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v58 (ref), v11 (copy), v201 (copy), l_GetTextSize_0 (copy), v57 (copy), v4 (copy), v5 (copy), v9 (copy), l_FitFrameOnAxis_0 (copy), v212 (copy), l_HoverArea_0 (copy), l_Separator_0 (copy), v16 (copy), l_TitledFrame_0 (copy), l_TextInput_0 (copy), v0 (copy), l_Image_0 (copy)
    local l_Stylizer_1 = v260.Stylizer;
    local l_Localization_1 = v260.Localization;
    local v263 = l_LayoutOrderIterator_0.new();
    local l_EditDevProductId_0 = v260.EditDevProductId;
    local v265 = v260.UnsavedDevProducts and v260.UnsavedDevProducts or {};
    local v266 = v260.DevProducts and v260.DevProducts or {};
    local v267 = nil;
    if v266[l_EditDevProductId_0] then
        v267 = v266[l_EditDevProductId_0].name;
    elseif v265[l_EditDevProductId_0] then
        v267 = v58;
    end;
    local v268 = v260.EditedDevProducts and v260.EditedDevProducts or {};
    v266 = v11.Dictionary.join(v266, v268);
    local v269 = v11.Dictionary.join(v265, v266)[l_EditDevProductId_0] or {};
    if not v267 then
        v267 = v269.name;
    end;
    local l_name_1 = v269.name;
    local l_price_2 = v269.price;
    local l_SetEditDevProductId_1 = v260.SetEditDevProductId;
    local l_SetDevProducts_0 = v260.SetDevProducts;
    local v274 = v201(v260.DevProductPriceError, nil, nil, l_Localization_1);
    local v275 = nil;
    v275 = if v274 then l_GetTextSize_0(v274, l_Stylizer_1.fontStyle.SmallError.TextSize, l_Stylizer_1.fontStyle.SmallError.Font) else {};
    local l_DevProductNameError_0 = v260.DevProductNameError;
    local v277;
    if not l_DevProductNameError_0 then
        v277 = nil;
    else
        local v278 = nil;
        if v57[l_DevProductNameError_0] and l_DevProductNameError_0 == "Empty" then
            v278 = l_Localization_1:getText("General", v57[l_DevProductNameError_0]);
        end;
        v277 = v278;
    end;
    l_DevProductNameError_0 = v260.SetUnsavedDevProducts;
    local function v282(v279) --[[ Line: 915 ]]
        -- upvalues: v269 (ref), v11 (ref), v268 (ref), l_EditDevProductId_0 (copy), l_SetDevProducts_0 (copy), v265 (ref), l_DevProductNameError_0 (copy)
        local v280 = utf8.len(v279);
        local v281 = nil;
        if v280 == 0 then
            v281 = "Empty";
        end;
        v269 = v11.Dictionary.join(v269, {
            name = tostring(v279)
        });
        if v269.id then
            v268 = v11.Dictionary.join(v268, {
                [l_EditDevProductId_0] = v269
            });
            l_SetDevProducts_0(v268, "devProductName", v281);
            return;
        else
            v265 = v11.Dictionary.join(v265, {
                [l_EditDevProductId_0] = v269
            });
            l_DevProductNameError_0(v265, "devProductName", v281);
            return;
        end;
    end;
    local function v286(v283) --[[ Line: 941 ]]
        -- upvalues: v4 (ref), v5 (ref), v269 (ref), v11 (ref), v268 (ref), l_EditDevProductId_0 (copy), l_SetDevProducts_0 (copy), v265 (ref), l_DevProductNameError_0 (copy)
        local v284 = tonumber(v283);
        local v285 = nil;
        if not v284 then
            v285 = "Invalid";
        elseif v284 < v4 then
            v285 = "BelowMin";
        elseif v5 < v284 then
            v285 = "AboveMax";
        end;
        v269 = v11.Dictionary.join(v269, {
            price = tostring(v283)
        });
        if v269.id then
            v268 = v11.Dictionary.join(v268, {
                [l_EditDevProductId_0] = v269
            });
            l_SetDevProducts_0(v268, "devProductPrice", v285);
            return;
        else
            v265 = v11.Dictionary.join(v265, {
                [l_EditDevProductId_0] = v269
            });
            l_DevProductNameError_0(v265, "devProductPrice", v285);
            return;
        end;
    end;
    return {
        HeaderFrame = v9.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v263:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_1.settingsPage.headerPadding)
        }, {
            BackButton = v9.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_1.backButton.size, 0, l_Stylizer_1.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_1.backButton.image, 
                BackgroundTransparency = 1, 
                [v9.Event.Activated] = function() --[[ Line: 987 ]]
                    -- upvalues: v212 (ref), v269 (ref), v267 (ref), v268 (ref), v11 (ref), l_EditDevProductId_0 (copy), l_SetDevProducts_0 (copy), v265 (ref), l_DevProductNameError_0 (copy), l_SetEditDevProductId_1 (copy)
                    local v287, v288 = v212(v269, v267);
                    if v287.id then
                        v268 = v11.Dictionary.join(v268, {
                            [l_EditDevProductId_0] = v287
                        });
                        l_SetDevProducts_0(v268, v288);
                    else
                        v265 = v11.Dictionary.join(v265, {
                            [l_EditDevProductId_0] = v287
                        });
                        l_DevProductNameError_0(v265, v288);
                    end;
                    l_SetEditDevProductId_1(nil);
                end
            }, {
                v9.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v9.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v9.createElement(v16, {
                Title = l_Localization_1:getText("Monetization", "EditDeveloperProduct"), 
                LayoutOrder = 2
            })
        }), 
        Name = v9.createElement(l_TitledFrame_0, {
            LayoutOrder = v263:getNextOrder(), 
            Title = l_Localization_1:getText("General", "TitleName")
        }, {
            TextBox = v9.createElement(l_TextInput_0, {
                ErrorText = v277, 
                MaxLength = v0, 
                OnTextChanged = v282, 
                Text = l_name_1
            })
        }), 
        Price = v9.createElement(l_TitledFrame_0, {
            LayoutOrder = v263:getNextOrder(), 
            Title = l_Localization_1:getText("Monetization", "PriceTitle")
        }, {
            VerticalLayout = v9.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            PriceFrame = v9.createElement(l_TextInput_0, {
                OnTextChanged = v286, 
                Size = UDim2.new(0, 200, 0, 32), 
                Text = l_price_2, 
                LeadingComponent = l_Image_0, 
                LeadingComponentProps = {
                    Size = UDim2.new(0, l_Stylizer_1.robuxFeeBase.icon.size, 0, l_Stylizer_1.robuxFeeBase.icon.size), 
                    ImageColor3 = l_Stylizer_1.robuxFeeBase.icon.imageColor, 
                    Image = l_Stylizer_1.robuxFeeBase.icon.image
                }
            }), 
            ErrorMessage = v274 and v9.createElement("TextLabel", v11.Dictionary.join(l_Stylizer_1.fontStyle.SmallError, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = v274, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = 2
            }))
        })
    };
end;
local function v291(v290) --[[ Line: 1071 ]] --[[ Name: displayEditDevSubPage ]]
    -- upvalues: v9 (copy), v23 (copy)
    return {
        v9.createElement(v23, {
            SetDevSubKey = v290.SetDevSubKey, 
            OnDeveloperSubscriptionChanged = v290.OnDeveloperSubscriptionChanged
        })
    };
end;
v52.render = function(v292) --[[ Line: 1080 ]] --[[ Name: render ]]
    -- upvalues: v291 (copy), v259 (copy), v289 (copy), v9 (copy), v21 (copy), v97 (copy), v120 (copy), l_Name_0 (copy)
    local l_props_0 = v292.props;
    local l_Localization_2 = l_props_0.Localization;
    local l_EditDevProductId_1 = l_props_0.EditDevProductId;
    local l_isEditingSubscription_0 = l_props_0.isEditingSubscription;
    local v297 = nil;
    local v298 = l_EditDevProductId_1 == 0;
    if l_isEditingSubscription_0 then
        v297 = function() --[[ Line: 1090 ]]
            -- upvalues: v291 (ref), l_props_0 (copy)
            return (v291(l_props_0));
        end;
    elseif l_EditDevProductId_1 == nil then
        v298 = true;
        v297 = function() --[[ Line: 1095 ]]
            -- upvalues: v259 (ref), l_props_0 (copy)
            return (v259(l_props_0));
        end;
    elseif type(l_EditDevProductId_1) == "number" then
        v298 = false;
        v297 = function() --[[ Line: 1100 ]]
            -- upvalues: v289 (ref), l_props_0 (copy)
            return (v289(l_props_0));
        end;
    end;
    return v9.createElement(v21, {
        SettingsLoadJobs = v97, 
        SettingsSaveJobs = v120, 
        Title = l_Localization_2:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v297, 
        ShowHeader = v298
    });
end;
v52 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v52);
local v299 = require(l_Parent_1.Src.Networking.settingFromState);
v52 = v10.connect(function(v300, _) --[[ Line: 1121 ]]
    -- upvalues: v299 (copy), v128 (copy)
    if not v300 then
        return;
    else
        return (v128(function(v302) --[[ Line: 1126 ]]
            -- upvalues: v299 (ref), v300 (copy)
            return v299(v300.Settings, v302);
        end, v300));
    end;
end, function(v303) --[[ Line: 1131 ]]
    -- upvalues: v37 (copy), v168 (copy)
    return (v168(function(v304) --[[ Line: 1132 ]]
        -- upvalues: v303 (copy), v37 (ref)
        return function(v305) --[[ Line: 1133 ]]
            -- upvalues: v303 (ref), v37 (ref), v304 (copy)
            v303(v37(v304, v305));
        end;
    end, v303));
end)(v52);
v52.LocalizationId = l_Name_0;
return v52;