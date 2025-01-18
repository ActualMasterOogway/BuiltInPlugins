local l_ContentProvider_0 = game:GetService("ContentProvider");
local v6, v7, v8 = (function() --[[ Line: 10 ]] --[[ Name: parseBaseUrlInformation ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end)();
local v9 = string.format("https://api.%s", v8);
local v10 = string.format("https://auth.%s", v8);
local v11 = string.format("https://chat.%sv2", v8);
local v12 = string.format("https://assetgame.%s", v8);
local v13 = string.format("https://games.%s", v8);
local v14 = string.format("https://notifications.%s", v8);
local v15 = string.format("https://realtime.%s", v8);
local v16 = string.format("https://web.%s", v8);
local v17 = string.format("https://catalog.%s", v8);
local v18 = string.format("https://develop.%s", v8);
local v19 = string.format("https://itemconfiguration.%s", v8);
local v20 = string.format("https://publish.%s", v8);
local v21 = string.format("https://data.%s", v8);
local v22 = string.format("https://groups.%s", v8);
return {
    DOMAIN = v8, 
    PREFIX = v7, 
    BASE_URL = v6, 
    API_URL = v9, 
    AUTH_URL = v10, 
    GAME_URL = v13, 
    GAME_ASSET_URL = v12, 
    CHAT_URL = v11, 
    NOTIFICATION_URL = v14, 
    REALTIME_URL = v15, 
    WEB_URL = v16, 
    CATALOG_URL = v17, 
    DEVELOP_URL = v18, 
    ITEM_CONFIGURATION_URL = v19, 
    PUBLISH_URL = v20, 
    DATA_URL = v21, 
    GROUP_URL = v22, 
    isVanitySite = function(v23) --[[ Line: 73 ]] --[[ Name: isVanitySite ]]
        return v23.PREFIX ~= "www";
    end, 
    makeQueryString = function(v24) --[[ Line: 78 ]] --[[ Name: makeQueryString ]]
        local v25 = {};
        for v26, v27 in pairs(v24) do
            if v27 ~= nil then
                if type(v27) == "table" then
                    for v28 = 1, #v27 do
                        table.insert(v25, v26 .. "=" .. v27[v28]);
                    end;
                else
                    table.insert(v25, v26 .. "=" .. tostring(v27));
                end;
            end;
        end;
        return table.concat(v25, "&");
    end
};