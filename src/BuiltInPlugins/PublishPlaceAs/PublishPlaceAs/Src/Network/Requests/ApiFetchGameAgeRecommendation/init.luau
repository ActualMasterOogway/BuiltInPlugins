local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Network.Http);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    local v4 = {
        Url = v1.BuildRobloxUrl("apis", "experience-guidelines-service/v1beta1/multi-age-recommendation"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            universeIds = v3
        })
    };
    return v1.Request(v4):andThen(function(v5) --[[ Line: 13 ]]
        -- upvalues: l_HttpService_0 (ref)
        local v6 = l_HttpService_0:JSONDecode(v5);
        local v7 = {};
        for _, v9 in pairs(v6.ageRecommendationDetailsByUniverse) do
            local v10 = 0;
            local l_ageRecommendation_0 = v9.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
            if l_ageRecommendation_0 then
                v10 = l_ageRecommendation_0.minimumAge;
            end;
            v7[v9.universeId] = v10;
        end;
        return v7;
    end);
end;