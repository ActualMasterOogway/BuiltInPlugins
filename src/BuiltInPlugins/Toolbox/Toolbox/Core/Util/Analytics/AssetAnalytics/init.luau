local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Dash);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v6 = require(l_Parent_0.Core.Util.getUserId);
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = require(l_Parent_0.Core.Util.FiatUtil);
local v9 = require(script.Parent.Analytics);
local v10 = require(script.Parent.Senders);
local l_ToolboxLogInsertDuration_0 = game:GetFastFlag("ToolboxLogInsertDuration");
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableWebView);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFFlagFixBuyerStatusAnalytics);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixAnalyticCapitalization);
local v15 = {};
v15.__index = v15;
v15.InsertRemainsCheckDelays = {
    30, 
    120, 
    600
};
v15.new = function(v16) --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v15 (copy)
    return (setmetatable({
        _searches = {}, 
        senders = v16 or v10
    }, v15));
end;
v15.mock = function() --[[ Line: 98 ]] --[[ Name: mock ]]
    -- upvalues: v15 (copy)
    local v17 = {};
    local v18 = {
        sendEventDeferredCalls = v17, 
        sendEventDeferred = function(...) --[[ Line: 102 ]] --[[ Name: sendEventDeferred ]]
            -- upvalues: v17 (copy)
            table.insert(v17, {
                ...
            });
        end
    };
    return v15.new(v18);
end;
v15.getNavigationContext = function(v19, v20) --[[ Line: 109 ]] --[[ Name: getNavigationContext ]]
    -- upvalues: v7 (copy), l_HttpService_0 (copy)
    local v21 = v19:getBreadcrumbRoute();
    local v22 = v19:getNavigationRoute();
    local v23 = table.find(v22, v7.NAVIGATION.RESULTS) ~= nil;
    local v24 = table.find(v22, v7.NAVIGATION.ALL_SUBCATEGORIES) ~= nil;
    return {
        navBreadcrumbs = l_HttpService_0:JSONEncode(v21), 
        navSwimlane = v20, 
        navSeeAll = v23, 
        navSeeAllSubcategory = v24
    };
end;
v15.schedule = function(v25, v26) --[[ Line: 128 ]] --[[ Name: schedule ]]
    delay(v25, v26);
end;
v15.getAssetCategoryName = function(v27) --[[ Line: 132 ]] --[[ Name: getAssetCategoryName ]]
    for _, v29 in ipairs(Enum.AssetType:GetEnumItems()) do
        if v29.Value == v27 then
            return v29.Name;
        end;
    end;
    return "";
end;
v15.isAssetDataTrackable = function(v30) --[[ Line: 141 ]] --[[ Name: isAssetDataTrackable ]]
    return v30 and v30.Asset and v30.Asset.Id;
end;
v15.isAssetTrackable = function(v31, v32) --[[ Line: 145 ]] --[[ Name: isAssetTrackable ]]
    -- upvalues: v15 (copy)
    return v15.isAssetDataTrackable(v31) and v32 and v32.searchId;
end;
v15.getTrackingAttributes = function(v33, v34, v35) --[[ Line: 150 ]] --[[ Name: getTrackingAttributes ]]
    -- upvalues: v3 (copy), v14 (copy), v15 (copy), v6 (copy), v9 (copy)
    local v36 = v33.Context or {};
    local v37 = v3.Dictionary.join(v34, v36);
    local l_searchId_0 = v34.searchId;
    local v39 = nil;
    local l_AssetSubTypes_0 = v33.Asset.AssetSubTypes;
    if l_AssetSubTypes_0 then
        v39 = table.concat(l_AssetSubTypes_0, ",");
    end;
    local v41 = nil;
    if v14() or v35 then
        v41 = v3.Dictionary.join(v37, {
            assetId = v33.Asset.Id, 
            assetSubTypes = v39, 
            assetType = v15.getAssetCategoryName(v33.Asset.TypeId), 
            assetTypeId = if v14() then v33.Asset.TypeId else nil, 
            userId = v6(), 
            placeId = v9.getPlaceId(), 
            platformId = v9.getPlatformId(), 
            clientId = v9.getClientId(), 
            searchId = l_searchId_0, 
            studioSid = v9.getStudioSessionId(), 
            isEditMode = v9.getIsEditMode(), 
            isVerifiedCreator = v33.Creator.IsVerifiedCreator, 
            label = v33.Asset.Id, 
            value = 0, 
            isEndorsed = v33.Asset.IsEndorsed, 
            hasScripts = v33.Asset.HasScripts
        });
    else
        v41 = v3.Dictionary.join(v37, {
            assetID = v33.Asset.Id, 
            assetSubTypes = v39, 
            assetType = v15.getAssetCategoryName(v33.Asset.TypeId), 
            userID = v6(), 
            placeID = v9.getPlaceId(), 
            platformID = v9.getPlatformId(), 
            clientID = v9.getClientId(), 
            searchID = l_searchId_0, 
            studioSid = v9.getStudioSessionId(), 
            isEditMode = v9.getIsEditMode(), 
            isVerifiedCreator = v33.Creator.IsVerifiedCreator, 
            label = v33.Asset.Id, 
            value = 0, 
            isEndorsed = v33.Asset.IsEndorsed, 
            hasScripts = v33.Asset.HasScripts
        });
        v41.searchId = nil;
    end;
    for v42, v43 in pairs(v41) do
        v41[v42] = tostring(v43);
    end;
    return v41;
end;
v15.logImpression = function(v44, v45, v46, v47, v48) --[[ Line: 224 ]] --[[ Name: logImpression ]]
    -- upvalues: v15 (copy), v4 (copy), v12 (copy), v9 (copy)
    if not v15.isAssetTrackable(v45, v46) then
        return;
    else
        local l_Id_0 = v45.Asset.Id;
        local l_searchId_1 = v46.searchId;
        if not v44._searches[l_searchId_1] then
            v44._searches[l_searchId_1] = {
                impressions = {}
            };
        end;
        local v51 = v44._searches[l_searchId_1];
        local v52 = v15.getTrackingAttributes(v45, v46);
        v52 = v4.join(v52, {
            layoutMode = v48
        });
        v52 = v4.join(v52, v47 or {});
        if not v51.impressions[l_Id_0] then
            v44.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "MarketplaceAssetImpression", v52);
            v9.incrementAssetImpressionCounter();
            v51.impressions[l_Id_0] = true;
        end;
        return;
    end;
end;
v15.logPreview = function(v53, v54, v55, v56) --[[ Line: 269 ]] --[[ Name: logPreview ]]
    -- upvalues: v15 (copy), v13 (copy), v3 (copy), v8 (copy), v12 (copy), v9 (copy)
    if not v15.isAssetTrackable(v54, v55) then
        return;
    else
        local v57 = v15.getTrackingAttributes(v54, v55);
        local v58 = if v13() and v56 then v56.purchaserStatus else nil;
        local v59 = v54.FiatProduct and v54.FiatProduct.PurchasePrice;
        v57 = v3.Dictionary.join(v57, {
            buyerStatus = if v13() then v58 else v56, 
            currencyCode = if v59 then v59.currencyCode else nil, 
            fiatPrice = if v59 then v8.calculateQuantity(v59) else nil
        });
        v53.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "MarketplaceAssetPreview", v57);
        return;
    end;
end;
v15.logInsert = function(v60, v61, v62, v63, v64, v65, v66, v67) --[[ Line: 292 ]] --[[ Name: logInsert ]]
    -- upvalues: v15 (copy), l_ToolboxLogInsertDuration_0 (copy), v4 (copy), v12 (copy), v9 (copy)
    if not v15.isAssetTrackable(v61, v64) then
        return;
    else
        local v68 = {
            method = v62, 
            layoutMode = v66
        };
        if l_ToolboxLogInsertDuration_0 then
            v68.insertDuration = v67;
        end;
        local v69 = v4.join(v68, v15.getTrackingAttributes(v61, v64), {
            navSwimlane = v65
        });
        v60.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "MarketplaceInsert", v69);
        if v63 == nil then
            return;
        else
            for _, v71 in ipairs(v15.InsertRemainsCheckDelays) do
                v15.schedule(v71, function() --[[ Line: 335 ]]
                    -- upvalues: v63 (copy), v60 (copy), v71 (copy), v69 (copy)
                    if type(v63) == "table" then
                        v60:logRemainsOrDeleted(v71, v69, v63[1]);
                        return;
                    else
                        v60:logRemainsOrDeleted(v71, v69, v63);
                        return;
                    end;
                end);
            end;
            return;
        end;
    end;
end;
v15.logRemainsOrDeleted = function(v72, v73, v74, v75) --[[ Line: 347 ]] --[[ Name: logRemainsOrDeleted ]]
    -- upvalues: v12 (copy), v9 (copy)
    local v76 = v75 and v75.Parent and "InsertRemains" or "InsertDeleted";
    v72.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", v76 .. tostring(v73), v74);
end;
v15.logNavigationButtonInteraction = function(v77, v78, v79, v80, v81, v82, v83, v84) --[[ Line: 358 ]] --[[ Name: logNavigationButtonInteraction ]]
    -- upvalues: v12 (copy), v9 (copy), l_HttpService_0 (copy)
    v77.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", v78, {
        searchID = v79, 
        searchCategory = v80, 
        subcategoryName = v81, 
        navBreadcrumbs = v82 and l_HttpService_0:JSONEncode(v82) or nil, 
        toolboxTab = v83, 
        assetType = v84
    });
end;
v15.logPageView = function(v85, v86, v87, v88, v89, v90, v91) --[[ Line: 382 ]] --[[ Name: logPageView ]]
    v85:logNavigationButtonInteraction("MarketplaceNavigatePageView", v86, v87, v88, v89, v90, v91);
end;
v15.logGoBack = function(v92, v93, v94, v95, v96, v97, v98) --[[ Line: 401 ]] --[[ Name: logGoBack ]]
    v92:logNavigationButtonInteraction("MarketplaceNavigateViewBack", v93, v94, v95, v96, v97, v98);
end;
v15.onCallToActionBannerClicked = function(v99, v100) --[[ Line: 420 ]] --[[ Name: onCallToActionBannerClicked ]]
    -- upvalues: v12 (copy), v9 (copy)
    v99.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "CallToActionBannerClicked", {
        creatorId = v100
    });
end;
v15.logAssetMediaImpression = function(v101, v102, v103, v104, v105, v106, v107) --[[ Line: 431 ]] --[[ Name: logAssetMediaImpression ]]
    -- upvalues: v15 (copy), v4 (copy), v12 (copy), v9 (copy)
    if not v15.isAssetDataTrackable(v102) then
        return;
    else
        local v108 = v15.getTrackingAttributes(v102, {}, true);
        v108 = v4.join(v108, {
            imageId = v103, 
            imageIndex = v104, 
            searchId = v105, 
            source = v106, 
            parentAssetId = v107
        });
        v101.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "AssetMediaImpression", v108);
        return;
    end;
end;
v15.onAssetDescriptionLinkClicked = function(v109, v110, v111, v112, v113) --[[ Line: 460 ]] --[[ Name: onAssetDescriptionLinkClicked ]]
    -- upvalues: v15 (copy), v4 (copy), v12 (copy), v9 (copy)
    if not v15.isAssetTrackable(v110, v111) then
        return;
    else
        local v114 = v15.getTrackingAttributes(v110, v111, true);
        local v115 = v4.join(v114, {
            searchId = v112, 
            url = v113
        });
        v109.senders.sendEventDeferred(if v12() then v9.eventTarget else "studio", "Marketplace", "AssetDescriptionLinkClicked", v115);
        return;
    end;
end;
return v15;