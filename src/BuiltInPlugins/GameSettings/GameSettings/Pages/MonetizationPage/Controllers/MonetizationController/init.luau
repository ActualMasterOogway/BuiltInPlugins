local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = game:DefineFastInt("ListDevProductsUniverseRollout", 0);
local v4 = game:DefineFastInt("CreateUpdateDevProductRollout", 0);
local v5 = game:DefineFastFlag("ListDevProductsCursorStudioRollout", false);
v0.__index = v0;
v0.new = function(v6) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v6
    }, v0));
end;
v0.economyV1GET = function(v7) --[[ Line: 20 ]] --[[ Name: economyV1GET ]]
    return v7.__networking:get("economy", "/v1/resale-tax-rate");
end;
v0.configurationV2GET = function(v8, v9) --[[ Line: 25 ]] --[[ Name: configurationV2GET ]]
    return v8.__networking:get("develop", "/v2/universes/" .. v9 .. "/configuration");
end;
v0.configurationV2PATCH = function(v10, v11, v12) --[[ Line: 30 ]] --[[ Name: configurationV2PATCH ]]
    return v10.__networking:patch("develop", "/v2/universes/" .. v11 .. "/configuration", {
        Body = v12
    });
end;
v0.developerAdsStatsV1GET = function(v13, v14) --[[ Line: 37 ]] --[[ Name: developerAdsStatsV1GET ]]
    return v13.__networking:get("apis", "/developer-ads-stats-api/v1/universe-suitability-criteria/" .. v14);
end;
v0.vipServersV1GET = function(v15, v16) --[[ Line: 42 ]] --[[ Name: vipServersV1GET ]]
    return v15.__networking:get("develop", "/v1/universes/" .. v16 .. "/configuration/vip-servers");
end;
v0.developerProductsV1GET = function(v17, v18, v19) --[[ Line: 47 ]] --[[ Name: developerProductsV1GET ]]
    -- upvalues: v3 (copy)
    local l___networking_0 = v17.__networking;
    if v18 % 100 < v3 then
        return l___networking_0:get("apis", "/developer-products/v1/developer-products/list", {
            Params = {
                universeId = v18, 
                page = v19
            }
        });
    else
        return l___networking_0:get("api", "/developerproducts/list", {
            Params = {
                universeId = v18, 
                page = v19
            }
        });
    end;
end;
v0.developerProductsV2GET = function(v21, v22, v23) --[[ Line: 66 ]] --[[ Name: developerProductsV2GET ]]
    return v21.__networking:get("apis", "/developer-products/v2/universes/" .. v22 .. "/developerproducts", {
        Params = {
            cursor = v23, 
            limit = 50
        }
    });
end;
v0.developerProductsCreateV1POST = function(v24, v25, v26) --[[ Line: 76 ]] --[[ Name: developerProductsCreateV1POST ]]
    -- upvalues: v4 (copy)
    local l___networking_1 = v24.__networking;
    if v25 % 100 < v4 then
        return l___networking_1:post("apis", "/developer-products/v1/universes/" .. v25 .. "/developerproducts", {
            Params = {
                name = v26.name, 
                description = " ", 
                priceInRobux = v26.price
            }, 
            Body = {}
        });
    else
        return l___networking_1:post("develop", "/v1/universes/" .. v25 .. "/developerproducts", {
            Params = {
                name = v26.name, 
                description = " ", 
                priceInRobux = v26.price
            }, 
            Body = {}
        });
    end;
end;
v0.developerProductsUpdateV1POST = function(v28, v29, v30) --[[ Line: 109 ]] --[[ Name: developerProductsUpdateV1POST ]]
    -- upvalues: v4 (copy)
    local l___networking_2 = v28.__networking;
    if v29 % 100 < v4 then
        return l___networking_2:post("apis", "/developer-products/v1/universes/" .. v29 .. "/developerproducts/" .. v30.id .. "/update", {
            Body = {
                name = v30.name, 
                priceInRobux = v30.price
            }
        });
    else
        return l___networking_2:post("develop", "/v1/universes/" .. v29 .. "/developerproducts/" .. v30.id .. "/update", {
            Body = {
                name = v30.name, 
                priceInRobux = v30.price
            }
        });
    end;
end;
v0.badgesV1GET = function(v32, v33, v34) --[[ Line: 136 ]] --[[ Name: badgesV1GET ]]
    return v32.__networking:get("badges", "/v1/universes/" .. v33 .. "/badges", {
        Params = {
            sortOrder = "Asc", 
            cursor = v34
        }
    });
end;
v0.getTaxRate = function(v35) --[[ Line: 146 ]] --[[ Name: getTaxRate ]]
    return v35:economyV1GET():await().responseBody.taxRate;
end;
v0.getMinimumFee = function(v36) --[[ Line: 151 ]] --[[ Name: getMinimumFee ]]
    return v36:economyV1GET():await().responseBody.minimumFee;
end;
v0.getIsUniverseEligibleForRewardedOnDemandAds = function(v37, v38) --[[ Line: 156 ]] --[[ Name: getIsUniverseEligibleForRewardedOnDemandAds ]]
    return v37:developerAdsStatsV1GET(v38):await().responseBody.isUniverseEligible;
end;
v0.getIsRewardedOnDemandAdsAllowed = function(v39, v40) --[[ Line: 161 ]] --[[ Name: getIsRewardedOnDemandAdsAllowed ]]
    return v39:configurationV2GET(v40):await().responseBody.isRewardedOnDemandAdsAllowed;
end;
v0.setIsRewardedOnDemandAdsAllowed = function(v41, v42, v43) --[[ Line: 166 ]] --[[ Name: setIsRewardedOnDemandAdsAllowed ]]
    v41:configurationV2PATCH(v42, {
        isRewardedOnDemandAdsAllowed = v43
    });
end;
v0.getPaidAccessEnabled = function(v44, v45) --[[ Line: 170 ]] --[[ Name: getPaidAccessEnabled ]]
    return v44:configurationV2GET(v45):await().responseBody.isForSale;
end;
v0.setPaidAccessEnabled = function(v46, v47, v48) --[[ Line: 175 ]] --[[ Name: setPaidAccessEnabled ]]
    v46:configurationV2PATCH(v47, {
        isForSale = v48
    });
end;
v0.getPaidAccessPrice = function(v49, v50) --[[ Line: 179 ]] --[[ Name: getPaidAccessPrice ]]
    return v49:configurationV2GET(v50):await().responseBody.price;
end;
v0.setPaidAccessPrice = function(v51, v52, v53) --[[ Line: 184 ]] --[[ Name: setPaidAccessPrice ]]
    v51:configurationV2PATCH(v52, {
        price = v53
    });
end;
v0.getVIPServersEnabled = function(v54, v55) --[[ Line: 188 ]] --[[ Name: getVIPServersEnabled ]]
    return v54:vipServersV1GET(v55):await().responseBody.isEnabled;
end;
v0.setVIPServersEnabled = function(v56, v57, v58) --[[ Line: 193 ]] --[[ Name: setVIPServersEnabled ]]
    v56:configurationV2PATCH(v57, {
        allowPrivateServers = v58
    });
end;
v0.getVIPServersPrice = function(v59, v60) --[[ Line: 197 ]] --[[ Name: getVIPServersPrice ]]
    return v59:vipServersV1GET(v60):await().responseBody.price;
end;
v0.setVIPServersPrice = function(v61, v62, v63) --[[ Line: 202 ]] --[[ Name: setVIPServersPrice ]]
    v61:configurationV2PATCH(v62, {
        privateServerPrice = v63
    });
end;
v0.getVIPServersActiveServersCount = function(v64, v65) --[[ Line: 206 ]] --[[ Name: getVIPServersActiveServersCount ]]
    return v64:vipServersV1GET(v65):await().responseBody.activeServersCount;
end;
v0.getVIPServersActiveSubscriptionsCount = function(v66, v67) --[[ Line: 211 ]] --[[ Name: getVIPServersActiveSubscriptionsCount ]]
    return v66:vipServersV1GET(v67):await().responseBody.activeSubscriptionsCount;
end;
v0.getDeveloperProducts = function(v68, v69, v70) --[[ Line: 216 ]] --[[ Name: getDeveloperProducts ]]
    -- upvalues: v5 (copy), v2 (copy)
    if v5 then
        return v68:getDeveloperProductsV2(v69, v70);
    else
        local v71 = v70 and v70.page and v70.page or 1;
        local v72 = v68:developerProductsV1GET(v69, v71):await();
        v70 = if v72.responseBody.FinalPage then v2.None else {
            page = v71 + 1
        };
        local l_DeveloperProducts_0 = v72.responseBody.DeveloperProducts;
        local v74 = {};
        for _, v76 in ipairs(l_DeveloperProducts_0) do
            v74[v76.ProductId] = {
                id = v76.ProductId, 
                name = v76.Name, 
                price = v76.PriceInRobux
            };
        end;
        return v74, v70;
    end;
end;
v0.getDeveloperProductsV2 = function(v77, v78, v79) --[[ Line: 247 ]] --[[ Name: getDeveloperProductsV2 ]]
    -- upvalues: v2 (copy)
    local v80 = v77:developerProductsV2GET(v78, v79):await();
    local v81 = v80.responseBody.nextPageCursor or v2.None;
    local l_developerProducts_0 = v80.responseBody.developerProducts;
    local v83 = {};
    for _, v85 in ipairs(l_developerProducts_0) do
        v83[v85.ProductId] = {
            id = v85.ProductId, 
            name = v85.Name, 
            price = v85.PriceInRobux
        };
    end;
    return v83, v81;
end;
v0.createDevProduct = function(v86, v87, v88) --[[ Line: 265 ]] --[[ Name: createDevProduct ]]
    v86:developerProductsCreateV1POST(v87, v88):await();
end;
v0.updateDevProduct = function(v89, v90, v91) --[[ Line: 269 ]] --[[ Name: updateDevProduct ]]
    v89:developerProductsUpdateV1POST(v90, v91):await();
end;
v0.getBadges = function(v92, v93, v94) --[[ Line: 273 ]] --[[ Name: getBadges ]]
    local v95 = v92:badgesV1GET(v93, v94):await();
    v94 = v95.responseBody.nextPageCursor;
    local l_data_0 = v95.responseBody.data;
    local v97 = {};
    for _, v99 in ipairs(l_data_0) do
        v97[v99.id] = {
            id = v99.id, 
            name = v99.name, 
            description = v99.description or "", 
            iconImageId = v99.iconImageId
        };
    end;
    return v97, v94;
end;
return v0;