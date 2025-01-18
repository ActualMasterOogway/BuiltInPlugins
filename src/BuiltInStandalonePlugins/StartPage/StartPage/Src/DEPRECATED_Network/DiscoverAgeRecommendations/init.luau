local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Models.MultiGetAgeRecommendationResponse);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v2.RobloxAPI.Url;
local v9 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1, 
    retryAmount = 3
});
local v10 = {
    ["Content-Type"] = "application/json"
};
local l_HttpService_0 = game:GetService("HttpService");
return function(v12) --[[ Line: 38 ]] --[[ Name: DiscoverAgeRecommendations ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v9 (copy), l_HttpService_0 (copy), v10 (copy), v7 (copy), v4 (copy)
    local v13 = {
        universeIds = v12.gameIds
    };
    local v14 = l_Url_0.new().composeUrl(v5.MULTI_AGE_RECOMMENDATION.Prefix, v5.MULTI_AGE_RECOMMENDATION.Url());
    local v15 = v9:post(v14, l_HttpService_0:JSONEncode(v13), v10);
    v9:parseJson(v15):andThen(v7(v4.validate)):andThen(function(v16) --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        if not v16.ageRecommendationDetailsByUniverse then
            return;
        else
            local v17 = {};
            for _, v19 in v16.ageRecommendationDetailsByUniverse do
                if v19.universeId and v19.ageRecommendationDetails and v19.ageRecommendationDetails.ageRecommendationSummary and v19.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation and v19.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation.minimumAge then
                    v17[v19.universeId] = v19.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation.minimumAge;
                end;
            end;
            v12.setter(function(v20) --[[ Line: 70 ]]
                -- upvalues: v17 (copy)
                for _, v22 in v20 do
                    assert(not v22.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                    if v22.Id then
                        v22.AgeRecommendation = v17[v22.Id];
                    end;
                end;
            end);
            return;
        end;
    end):catch(function(v23) --[[ Line: 83 ]]
        warn((("DiscoverAgeRecommendations experienced an error: %*"):format(v23)));
    end);
    return v12;
end;