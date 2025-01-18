local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v4 = {
        Url = v2.BuildRobloxUrl("apis", "resource-settings/v1/universes"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            configurations = {
                {
                    universeId = v3, 
                    dataSharingLicenseTypes = {
                        "RobloxGlobal"
                    }
                }
            }
        })
    };
    return v2.Request(v4):catch(function(v5) --[[ Line: 23 ]]
        warn("Error setting universe data sharing configuration", v5);
        return nil;
    end);
end;