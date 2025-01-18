local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Models.MultiGetAgeRecommendationResponse);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local l_Url_0 = v2.RobloxAPI.Url;
local v10 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1, 
    retryAmount = 3
});
local v11 = {
    ["Content-Type"] = "application/json"
};
local l_HttpService_0 = game:GetService("HttpService");
local v13 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local v14 = v7(v4.validate);
return function(v15) --[[ Line: 39 ]] --[[ Name: DiscoverAgeRecommendations ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), v10 (copy), l_HttpService_0 (copy), v11 (copy), v14 (copy), l_collectArray_0 (copy), v13 (copy)
    local v16 = {
        universeIds = v15
    };
    local v17 = l_Url_0.new().composeUrl(v5.MULTI_AGE_RECOMMENDATION.Prefix, v5.MULTI_AGE_RECOMMENDATION.Url());
    local v18 = v10:post(v17, l_HttpService_0:JSONEncode(v16), v11);
    v10:parseJson(v18):andThen(function(v19) --[[ Line: 49 ]]
        -- upvalues: v14 (ref), l_collectArray_0 (ref), v13 (ref)
        local v20 = v14(v19);
        if not v20.ageRecommendationDetailsByUniverse then
            return;
        else
            local v23 = l_collectArray_0(v20.ageRecommendationDetailsByUniverse, function(_, v22) --[[ Line: 56 ]]
                if not v22.universeId or not v22.ageRecommendationDetails or not v22.ageRecommendationDetails.ageRecommendationSummary or not v22.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation or not v22.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation.minimumAge then
                    return;
                else
                    return {
                        Id = v22.universeId, 
                        AgeRecommendation = v22.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation.minimumAge
                    };
                end;
            end);
            v13:upsertItems(v23);
            return;
        end;
    end):catch(function(v24) --[[ Line: 73 ]]
        warn((("DiscoverAgeRecommendations experienced an error: %*"):format(v24)));
    end);
end;