local l_AssetService_0 = game:GetService("AssetService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Framework).ContextServices.ContextItem:extend("AssetServiceWrapper");
local v5 = {
    GetBundleDetailsAsync = function(_, v4) --[[ Line: 15 ]] --[[ Name: GetBundleDetailsAsync ]]
        return {
            id = v4, 
            Name = "ROBLOX Boy", 
            description = "A free package awarded to new users on sign up.", 
            bundleType = "BodyParts", 
            Items = {
                {
                    owned = true, 
                    id = 376530220, 
                    name = "ROBLOX Boy Left Arm", 
                    type = "Asset"
                }, 
                {
                    owned = true, 
                    id = 376531012, 
                    name = "ROBLOX Boy Right Arm", 
                    type = "Asset"
                }, 
                {
                    owned = true, 
                    id = 376531300, 
                    name = "ROBLOX Boy Left Leg", 
                    type = "Asset"
                }, 
                {
                    owned = true, 
                    id = 376531703, 
                    name = "ROBLOX Boy Right Leg", 
                    type = "Asset"
                }, 
                {
                    owned = true, 
                    id = 376532000, 
                    name = "ROBLOX Boy Torso", 
                    type = "Asset"
                }, 
                {
                    id = 131830044, 
                    name = "ROBLOX Boy", 
                    type = "UserOutfit"
                }
            }, 
            Creator = {
                id = 1, 
                name = "Roblox", 
                type = "User"
            }, 
            product = {
                id = 369653750, 
                type = "productType", 
                isPublicDomain = true, 
                isForSale = false, 
                priceInRobux = "null", 
                isFree = true, 
                noPriceText = "Free"
            }
        };
    end
};
local function _(v6) --[[ Line: 75 ]] --[[ Name: newAssetServiceWrapper ]]
    -- upvalues: v2 (copy)
    local v7 = {};
    setmetatable(v7, v2);
    v7._service = v6;
    return v7;
end;
v2.new = function() --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: l_AssetService_0 (copy), v2 (copy)
    local l_l_AssetService_0_0 = l_AssetService_0;
    local v10 = {};
    setmetatable(v10, v2);
    v10._service = l_l_AssetService_0_0;
    return v10;
end;
v2.get = function(v11) --[[ Line: 89 ]] --[[ Name: get ]]
    return v11._service;
end;
v2.mock = function(_) --[[ Line: 93 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy), v2 (copy)
    local l_v5_0 = v5;
    local v14 = {};
    setmetatable(v14, v2);
    v14._service = l_v5_0;
    return v14;
end;
return v2;