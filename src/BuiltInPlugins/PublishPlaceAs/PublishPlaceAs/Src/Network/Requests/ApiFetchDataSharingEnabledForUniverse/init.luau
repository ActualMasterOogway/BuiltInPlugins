local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
local v3 = require(l_Parent_0.Packages.Cryo);
return function(v4) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), v3 (copy)
    assert(v4 ~= 0, "The universe must exist to fetch its data sharing setting");
    local v5 = {
        Url = v2.BuildRobloxUrl("apis", "resource-settings/v1/universes:batchGet?universeIds=%d", v4), 
        Method = "GET"
    };
    return v2.RequestInternal(v5):andThen(function(v6) --[[ Line: 28 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (copy), v3 (ref)
        local v7 = l_HttpService_0:JSONDecode(v6);
        if not v7.configurations or #v7.configurations == 0 then
            return false;
        else
            assert(#v7.configurations == 1, "Expected exactly one configuration for universe " .. v4);
            local v8 = v7.configurations[1];
            return v3.List.find(v8.dataSharingLicenseTypes, "RobloxGlobal") ~= nil;
        end;
    end);
end;