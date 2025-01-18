local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = game:DefineFastFlag("DevFrameworkTostringQueryParams", false);
local v3 = game:DefineFastFlag("DevFrameworkUrlNonStrEncode", false);
local l_Parent_0 = script:FindFirstAncestor("RobloxAPI").Parent;
local v5 = require(l_Parent_0.SharedFlags.getFFlagAssetPreviewFixGroupLinks);
local function v11(v6) --[[ Line: 34 ]] --[[ Name: parseBaseUrlInformation ]]
    if v6:sub(#v6) ~= "/" then
        v6 = v6 .. "/";
    end;
    local _, v8 = v6:find("://");
    local v9, v10 = v6:find("%.", v8 + 1);
    return v6, v6:sub(v8 + 1, v9 - 1), (v6:sub(v10 + 1));
end;
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: l_ContentProvider_0 (copy), v11 (copy), v12 (copy)
    if v13 then
        assert(type(v13) == "string", "Expected baseUrl to be a string");
    else
        v13 = l_ContentProvider_0.BaseUrl;
    end;
    local v14, _, v16 = v11(v13);
    local v17 = {
        BASE_URL = v14, 
        API_URL = string.format("https://api.%s", v16), 
        APIS_URL = string.format("https://apis.%s", v16), 
        ASSET_GAME_URL = string.format("https://assetgame.%s", v16), 
        AUTH_URL = string.format("https://auth.%s", v16), 
        CATALOG_URL = string.format("https://catalog.%s", v16), 
        CHAT_URL = string.format("https://chat.%s", v16), 
        CREATOR_HUB_URL = string.format("https://create.%s", v16), 
        DATA_URL = string.format("https://data.%s", v16), 
        DEVELOP_URL = string.format("https://develop.%s", v16), 
        GAMES_INTERNATIONALIZATION_URL = string.format("https://gameinternationalization.%s", v16), 
        GAMES_URL = string.format("https://games.%s", v16), 
        GROUPS_URL = string.format("https://groups.%s", v16), 
        INVENTORY_URL = string.format("https://inventory.%s", v16), 
        ITEM_CONFIGURATION_URL = string.format("https://itemconfiguration.%s", v16), 
        LOCALE_URL = string.format("https://locale.%s", v16), 
        LOCALIZATION_TABLES_URL = string.format("https://localizationtables.%s", v16), 
        NOTIFICATIONS_URL = string.format("https://notifications.%s", v16), 
        PUBLISH_URL = string.format("https://publish.%s", v16), 
        REALTIME_URL = string.format("https://realtime.%s", v16), 
        THUMBNAILS_URL = string.format("https://thumbnails.%s", v16), 
        TRANSLATION_ROLES_URL = string.format("https://translationroles.%s", v16), 
        WEB_URL = string.format("https://web.%s", v16)
    };
    setmetatable(v17, v12);
    return v17;
end;
v12.composeUrl = function(v18, v19, v20) --[[ Line: 100 ]] --[[ Name: composeUrl ]]
    -- upvalues: v12 (copy)
    assert(type(v18) == "string", "Expected 'base' to be a string.");
    assert(type(v19) == "string", "Expected 'path' to be a string.");
    if v20 then
        assert(type(v20) == "table", "Expected 'args' to be a map.");
        assert(type((next(v20))) == "string", "Expected 'args' to be map, not an array.");
    end;
    if v18:sub(#v18) ~= "/" then
        v18 = v18 .. "/";
    end;
    local v21 = v12.makeQueryString(v20);
    return string.format("%s%s%s", v18, v19, v21);
end;
v12.makeQueryString = function(v22, v23) --[[ Line: 120 ]] --[[ Name: makeQueryString ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), v3 (copy)
    local v24 = "";
    if not v22 then
        return v24;
    else
        local v25 = {};
        for v26, v27 in pairs(v22) do
            if type(v27) == "userdata" then
                error(string.format("Userdata values are not supported as arguments. Please update argument : %s", v26));
            elseif type(v27) == "table" then
                if #v27 == 0 and next(v27) ~= nil then
                    error(string.format("Nested maps as arguments are not supported. Please update argument : %s", v26));
                elseif #v27 == 0 then
                    error(string.format("Empty arrays are not supported. Please update argument : %s", v26));
                else
                    local v28 = {};
                    for _, v30 in ipairs(v27) do
                        if v2 then
                            table.insert(v28, l_HttpService_0:UrlEncode((tostring(v30))));
                        else
                            table.insert(v28, l_HttpService_0:UrlEncode(v30));
                        end;
                    end;
                    table.insert(v25, string.format("%s=%s", v26, table.concat(v28, ",")));
                end;
            elseif v3 and type(v27) == "boolean" then
                local v31 = tostring(v27);
                table.insert(v25, string.format("%s=%s", v26, v31));
            elseif v3 and type(v27) == "number" then
                local v32 = l_HttpService_0:UrlEncode((tostring(v27)));
                table.insert(v25, string.format("%s=%s", v26, v32));
            else
                v27 = l_HttpService_0:UrlEncode(v27);
                table.insert(v25, string.format("%s=%s", v26, (tostring(v27))));
            end;
        end;
        if #v25 > 0 then
            v24 = (v23 or "?") .. table.concat(v25, "&");
        end;
        return v24;
    end;
end;
local v33 = v5() and 2 or nil;
v12.composeUrlToUserProfile = function(v34, v35) --[[ Line: 169 ]] --[[ Name: composeUrlToUserProfile ]]
    -- upvalues: v12 (copy), v5 (copy), v33 (copy)
    assert(type(v34) == "number", "Expected 'userId' to be a number.");
    local l_BASE_URL_0 = v12.new().BASE_URL;
    local v37 = if v5() and v35 == v33 then "groups/" .. tostring(v34) else "users/" .. tostring(v34) .. "/profile";
    return v12.composeUrl(l_BASE_URL_0, v37);
end;
v12.composeUrlToUniverse = function(v38) --[[ Line: 179 ]] --[[ Name: composeUrlToUniverse ]]
    -- upvalues: v12 (copy)
    assert(type(v38) == "number", "Expected 'universeId' to be a number.");
    local l_BASE_URL_1 = v12.new().BASE_URL;
    local v40 = "games/" .. tostring(v38);
    return v12.composeUrl(l_BASE_URL_1, v40);
end;
return v12;