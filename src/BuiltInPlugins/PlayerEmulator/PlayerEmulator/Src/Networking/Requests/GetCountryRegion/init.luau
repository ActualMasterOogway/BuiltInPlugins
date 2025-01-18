local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local v4 = require(l_Parent_0.Src.Actions.LoadCountryRegion);
local v5 = require(l_Parent_0.Src.Thunks.InitCountryRegionSetting);
local v6 = "v1/country-regions?locale=" .. l_getStudioLocaleId_0();
local v7 = v1.BuildUrl("locale", v6);
return function(v8, v9) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), v2 (copy), v4 (copy), v5 (copy)
    return function(v10) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v7 (ref), v2 (ref), v4 (ref), v5 (ref), v9 (copy)
        local v11 = v8:get(v7);
        local v12 = v8:handleRetry(v11);
        v8.parseJson(v12):andThen(function(v13) --[[ Line: 18 ]]
            -- upvalues: v2 (ref), v10 (copy), v4 (ref), v5 (ref), v8 (ref), v9 (ref)
            if v13.responseCode == v2.StatusCodes.OK then
                v10:dispatch(v4(v13.responseBody.countryRegionList));
                v10:dispatch(v5(v8, v9));
                return;
            else
                warn("Player Emulator can't get country region list: HTTP error " .. tostring(v13.responseCode));
                return;
            end;
        end, function(v14) --[[ Line: 25 ]]
            warn("Player Emulator can't get country region list: " .. v14);
        end);
    end;
end;