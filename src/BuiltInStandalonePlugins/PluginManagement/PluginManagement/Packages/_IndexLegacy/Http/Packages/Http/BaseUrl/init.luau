local l_ContentProvider_0 = game:GetService("ContentProvider");
local function v6(v1) --[[ Line: 10 ]] --[[ Name: parseBaseUrlInformation ]]
    if v1:sub(#v1) ~= "/" then
        v1 = v1 .. "/";
    end;
    local _, v3 = v1:find("://");
    local v4, v5 = v1:find("%.", v3 + 1);
    return v1, v1:sub(v3 + 1, v4 - 1), (v1:sub(v5 + 1));
end;
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: l_ContentProvider_0 (copy), v6 (copy), v7 (copy)
    if not v8 then
        v8 = l_ContentProvider_0.BaseUrl;
    end;
    local v9, v10, v11 = v6(v8);
    local v12 = {
        PREFIX = v10, 
        DOMAIN = v11, 
        BASE_URL = v9, 
        APIS_URL = string.format("https://apis.%s", v11), 
        ASSET_GAME_URL = string.format("https://assetgame.%s", v11), 
        AUTH_URL = string.format("https://auth.%s", v11), 
        CATALOG_URL = string.format("https://catalog.%s", v11), 
        CHAT_URL = string.format("https://chat.%s", v11), 
        DATA_URL = string.format("https://data.%s", v11), 
        DEVELOP_URL = string.format("https://develop.%s", v11), 
        GAME_URL = string.format("https://games.%s", v11), 
        GROUP_URL = string.format("https://groups.%s", v11), 
        INVENTORY_URL = string.format("https://inventory.%s", v11), 
        ITEM_CONFIGURATION_URL = string.format("https://itemconfiguration.%s", v11), 
        NOTIFICATION_URL = string.format("https://notifications.%s", v11), 
        PUBLISH_URL = string.format("https://publish.%s", v11), 
        REALTIME_URL = string.format("https://realtime.%s", v11), 
        WEB_URL = string.format("https://web.%s", v11)
    };
    setmetatable(v12, v7);
    return v12;
end;
v7.makeQueryString = function(v13) --[[ Line: 72 ]] --[[ Name: makeQueryString ]]
    local v14 = {};
    for v15, v16 in pairs(v13) do
        if v16 ~= nil then
            if type(v16) == "table" then
                for v17 = 1, #v16 do
                    table.insert(v14, v15 .. "=" .. v16[v17]);
                end;
            else
                table.insert(v14, v15 .. "=" .. tostring(v16));
            end;
        end;
    end;
    return table.concat(v14, "&");
end;
return (v7.new());