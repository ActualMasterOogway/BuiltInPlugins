local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v8, v9, v10 = (function() --[[ Line: 12 ]] --[[ Name: parseBaseUrlInformation ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v5 = l_BaseUrl_0:find("://");
    local v6, v7 = l_BaseUrl_0:find("%.", v5 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v5 + 1, v6 - 1), (l_BaseUrl_0:sub(v7 + 1));
end)();
local v11 = string.format("https://apis.%s", v10);
local v12 = string.format("https://auth.%s", v10);
local v13 = string.format("https://chat.%sv2", v10);
local v14 = string.format("https://create.%s", v10);
local v15 = string.format("https://assetgame.%s", v10);
local v16 = string.format("https://games.%s", v10);
local v17 = string.format("https://notifications.%s", v10);
local v18 = string.format("https://realtime.%s", v10);
local v19 = string.format("https://web.%s", v10);
local v20 = string.format("https://catalog.%s", v10);
local v21 = string.format("https://develop.%s", v10);
local v22 = string.format("https://itemconfiguration.%s", v10);
local v23 = string.format("https://publish.%s", v10);
local v24 = string.format("https://data.%s", v10);
local v25 = string.format("https://groups.%s", v10);
local v26 = string.format("https://thumbnails.%s", v10);
local v27 = string.format("https://economy.%s", v10);
local v28 = string.format("https://friends.%s", v10);
local v29 = string.format("https://users.%s", v10);
local v30 = if l_game_EngineFeature_0 then string.format("https://inventory.%s", v10) else nil;
local v32 = {
    DOMAIN = v10, 
    PREFIX = v9, 
    BASE_URL = v8, 
    APIS_URL = v11, 
    AUTH_URL = v12, 
    CREATE_URL = v14, 
    GAME_URL = v16, 
    GAME_ASSET_URL = v15, 
    CHAT_URL = v13, 
    NOTIFICATION_URL = v17, 
    REALTIME_URL = v18, 
    WEB_URL = v19, 
    CATALOG_URL = v20, 
    DEVELOP_URL = v21, 
    ITEM_CONFIGURATION_URL = v22, 
    PUBLISH_URL = v23, 
    DATA_URL = v24, 
    GROUP_URL = v25, 
    THUMBNAIL_URL = v26, 
    ECONOMY_URL = v27, 
    FRIENDS_URL = v28, 
    USERS_URL = v29, 
    INVENTORY_URL = if l_game_EngineFeature_0 then v30 else nil, 
    isVanitySite = function(v31) --[[ Line: 87 ]] --[[ Name: isVanitySite ]]
        return v31.PREFIX ~= "www";
    end
};
isMap = function(v33) --[[ Line: 91 ]] --[[ Name: isMap ]]
    local v34 = false;
    if typeof(v33) == "table" then
        v34 = #v33 == 0;
    end;
    return v34;
end;
addArrayToParams = function(v35, v36, v37, v38) --[[ Line: 96 ]] --[[ Name: addArrayToParams ]]
    -- upvalues: l_HttpService_0 (copy)
    if v37 ~= nil and #v37 > 0 then
        if v38 then
            v35[l_HttpService_0:UrlEncode(v36)] = l_HttpService_0:UrlEncode(table.concat(v37, ","));
            return;
        else
            local v39 = l_HttpService_0:UrlEncode(v37[1]);
            for v40 = 2, #v37 do
                v39 = v39 .. "&" .. l_HttpService_0:UrlEncode(v36) .. "=" .. l_HttpService_0:UrlEncode(v37[v40]);
            end;
            v35[l_HttpService_0:UrlEncode(v36)] = v39;
        end;
    end;
end;
addNonMapValueToParams = function(v41, v42, v43, v44) --[[ Line: 115 ]] --[[ Name: addNonMapValueToParams ]]
    -- upvalues: l_HttpService_0 (copy)
    if v43 ~= nil and not isMap(v43) then
        if type(v43) == "table" then
            addArrayToParams(v41, v42, v43, v44);
            return;
        else
            v41[l_HttpService_0:UrlEncode(v42)] = l_HttpService_0:UrlEncode((tostring(v43)));
        end;
    end;
end;
v32.makeQueryString = function(v45, v46, v47) --[[ Line: 132 ]] --[[ Name: makeQueryString ]]
    local v48 = {};
    for v49, v50 in pairs(v45) do
        local v51 = isMap(v50);
        if not v51 then
            addNonMapValueToParams(v48, v49, v50, v47);
        elseif v51 and v46 then
            for v52, v53 in pairs(v50) do
                assert(not isMap(v53), "Nested maps are not currently supported");
                addNonMapValueToParams(v48, v52, v53, v47);
            end;
        end;
    end;
    local v54 = {};
    for v55, v56 in pairs(v48) do
        table.insert(v54, v55 .. "=" .. v56);
    end;
    return table.concat(v54, "&");
end;
return v32;