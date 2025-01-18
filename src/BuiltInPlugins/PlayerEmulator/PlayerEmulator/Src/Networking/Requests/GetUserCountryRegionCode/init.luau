local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local v4 = v1.BuildUrl("users", "v1/users/authenticated/country-code");
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v2 (copy), l_PlayerEmulatorService_0 (copy)
    return function(_) --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v4 (ref), v2 (ref), l_PlayerEmulatorService_0 (ref)
        local v7 = v5:get(v4);
        local v8 = v5:handleRetry(v7);
        v5.parseJson(v8):andThen(function(v9) --[[ Line: 15 ]]
            -- upvalues: v2 (ref), l_PlayerEmulatorService_0 (ref)
            if v9.responseCode == v2.StatusCodes.OK then
                l_PlayerEmulatorService_0.EmulatedCountryCode = v9.responseBody.countryCode;
                return;
            else
                warn("Player Emulator can't get country region list: HTTP error " .. tostring(v9.responseCode));
                return;
            end;
        end, function(v10) --[[ Line: 22 ]]
            warn("Player Emulator can't get country region list: " .. v10);
        end);
    end;
end;