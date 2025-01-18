local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Networking_0 = v1.Http.Networking;
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local v4 = v1.RobloxAPI.Url.new();
local v5 = l_ContextItem_0:extend("NetworkInterface");
v5.new = function() --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: l_Networking_0 (copy), v5 (copy)
    local v6 = {
        _networkImp = l_Networking_0.new({
            isInternal = true
        })
    };
    setmetatable(v6, v5);
    return v6;
end;
v5.httpGetJson = function(v7, v8) --[[ Line: 21 ]] --[[ Name: httpGetJson ]]
    local v9 = v7._networkImp:get(v8);
    local v10 = v7._networkImp:handleRetry(v9, 5);
    return v7._networkImp:parseJson(v10);
end;
local function _(v11, v12, v13, v14) --[[ Line: 27 ]] --[[ Name: constructGetAssetCreationsUrl ]]
    -- upvalues: v4 (copy)
    return v4.composeUrl(v4.ITEM_CONFIGURATION_URL, "v1/creations/get-assets", {
        assetType = v11, 
        isArchived = false, 
        limit = v12, 
        cursor = v13, 
        groupId = v14
    });
end;
v5.getGroupAnimations = function(v16, v17, v18) --[[ Line: 37 ]] --[[ Name: getGroupAnimations ]]
    -- upvalues: v4 (copy)
    return v16:httpGetJson((v4.composeUrl(v4.ITEM_CONFIGURATION_URL, "v1/creations/get-assets", {
        assetType = "Animation", 
        isArchived = false, 
        limit = 25, 
        cursor = v17, 
        groupId = v18
    })));
end;
local function v25(v19, v20, v21, v22, v23) --[[ Line: 43 ]] --[[ Name: constructGetUserAssetsUrl ]]
    -- upvalues: v4 (copy)
    local v24 = string.format("toolbox-service/v1/inventory/user/%d/%s?", v23, v19);
    return v4.composeUrl(v4.APIS_URL, v24, {
        keyword = v22, 
        limit = v20, 
        searchSource = v22 and "keyword" or nil, 
        cursor = v21
    });
end;
v5.getUserAnimations = function(v26, v27, v28, v29) --[[ Line: 53 ]] --[[ Name: getUserAnimations ]]
    -- upvalues: v25 (copy)
    return v26:httpGetJson((v25("animation", 30, v27, v29, v28)));
end;
local function _(v30) --[[ Line: 59 ]] --[[ Name: constructGetGameConfigurationUrl ]]
    -- upvalues: v4 (copy)
    return v4.composeUrl(v4.DEVELOP_URL, "v2/universes/" .. v30 .. "/configuration");
end;
v5.getAvatarType = function(v32, v33) --[[ Line: 63 ]] --[[ Name: getAvatarType ]]
    -- upvalues: v4 (copy)
    local l_StarterPlayer_0 = v33:GetService("StarterPlayer");
    local l_GameId_0 = v33.GameId;
    if l_GameId_0 == 0 then
        return l_StarterPlayer_0.GameSettingsAvatar;
    else
        local v36 = v32:httpGetJson((v4.composeUrl(v4.DEVELOP_URL, "v2/universes/" .. l_GameId_0 .. "/configuration"))):catch(function() --[[ Line: 73 ]]
            return nil;
        end):await();
        if not v36 then
            return nil;
        else
            local l_universeAvatarType_0 = v36.responseBody.universeAvatarType;
            if l_universeAvatarType_0 == "MorphToR6" then
                return Enum.GameAvatarType.R6;
            elseif l_universeAvatarType_0 == "MorphToR15" then
                return Enum.GameAvatarType.R15;
            else
                return Enum.GameAvatarType.PlayerChoice;
            end;
        end;
    end;
end;
return v5;