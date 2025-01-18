local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Src.Networking.Requests.GetUserCountryRegionCode);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_PlayerEmulatorService_0 (copy), v3 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v5 (copy), v2 (ref), l_PlayerEmulatorService_0 (ref), v3 (ref), v4 (copy)
        local l_countryRegionTable_0 = v6:getState().CountryRegion.countryRegionTable;
        local l_v5_Setting_0 = v5:GetSetting(v2.COUNTRY_REGION_SETTING_KEY);
        if l_v5_Setting_0 and l_countryRegionTable_0[l_v5_Setting_0] then
            l_PlayerEmulatorService_0.EmulatedCountryCode = l_v5_Setting_0;
            return;
        else
            v6:dispatch(v3(v4));
            return;
        end;
    end;
end;