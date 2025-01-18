local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
return function() --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v3 = {
        Url = v2.BuildRobloxUrl("apis", "resource-settings/v1/preferences:batchGet?preferenceTypes=Universes"), 
        Method = "GET"
    };
    return v2.RequestInternal(v3):andThen(function(v4) --[[ Line: 26 ]]
        -- upvalues: l_HttpService_0 (ref)
        local v5 = l_HttpService_0:JSONDecode(v4);
        return v5.configurations, v5.isEligible;
    end);
end;