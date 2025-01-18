local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local v4 = require(l_Parent_0.Src.Actions.LoadLanguages);
local v5 = "v1/locales?displayValueLocale=" .. l_getStudioLocaleId_0();
local v6 = v1.BuildUrl("locale", v5);
return function(v7) --[[ Line: 13 ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy)
    return function(v8) --[[ Line: 14 ]]
        -- upvalues: v7 (copy), v6 (ref), v2 (ref), v4 (ref)
        local v9 = v7:get(v6);
        local v10 = v7:handleRetry(v9);
        v7.parseJson(v10):andThen(function(v11) --[[ Line: 17 ]]
            -- upvalues: v2 (ref), v8 (copy), v4 (ref)
            if v11.responseCode == v2.StatusCodes.OK then
                v8:dispatch(v4(v11.responseBody.data));
                return;
            else
                warn("Player Emulator can't get language list: HTTP error " .. tostring(v11.responseCode));
                return;
            end;
        end, function(v12) --[[ Line: 23 ]]
            warn("Player Emulator can't get languages list: " .. v12);
        end);
    end;
end;