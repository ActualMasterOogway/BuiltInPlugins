local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Models.MultiGetCreatorEligibilityResponse);
local v4 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v6 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local v7 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
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
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v13 = v6(v3.validate);
return function(v14, v15, v16, v17, v18) --[[ Line: 40 ]] --[[ Name: DiscoverCreatorEligibilityAndOpenPlace ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v9 (copy), l_HttpService_0 (copy), v10 (copy), v13 (copy), v7 (copy), l_StartPageManager_0 (copy)
    local v19 = l_Url_0.new().composeUrl(v4.MULTI_CREATOR_ELIGIBILITY.Prefix, v4.MULTI_CREATOR_ELIGIBILITY.Url());
    local v20 = v9:post(v19, l_HttpService_0:JSONEncode({
        action = 1, 
        userIds = {
            v14
        }, 
        universeId = v15
    }), v10);
    v9:parseJson(v20):andThen(function(v21) --[[ Line: 61 ]]
        -- upvalues: v13 (ref), v17 (copy), v18 (copy), v7 (ref), l_StartPageManager_0 (ref), v16 (copy), v15 (copy)
        local v22 = v13(v21);
        if not v22.eligibilityByCreator or #v22.eligibilityByCreator == 0 then
            return;
        else
            local v23 = v22.eligibilityByCreator[1];
            if not v23.userIsEligible then
                if v23.displayText and string.find(v23.displayText, "verified") then
                    v17();
                    return;
                else
                    v18();
                    return;
                end;
            elseif v7 then
                l_StartPageManager_0:openPlace(v16, v15, false);
                return;
            else
                l_StartPageManager_0:openPlace(v16, 0, false);
                return;
            end;
        end;
    end):catch(function(v24) --[[ Line: 83 ]]
        warn((("DiscoverCreatorEligibilityAndOpenPlace experienced an error: %*"):format(v24)));
    end);
end;