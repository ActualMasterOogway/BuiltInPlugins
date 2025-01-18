local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Models.MultiGetCreatorEligibilityResponse);
local v4 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v6 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local l_Url_0 = v2.RobloxAPI.Url;
local v8 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1, 
    retryAmount = 3
});
local v9 = {
    ["Content-Type"] = "application/json"
};
local l_HttpService_0 = game:GetService("HttpService");
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v12 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
return function(v13, v14, v15, v16, v17) --[[ Line: 39 ]] --[[ Name: DiscoverCreatorEligibilityAndOpenPlace ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), v8 (copy), l_HttpService_0 (copy), v9 (copy), v6 (copy), v3 (copy), v12 (copy), l_StartPageManager_0 (copy)
    local v18 = l_Url_0.new().composeUrl(v4.MULTI_CREATOR_ELIGIBILITY.Prefix, v4.MULTI_CREATOR_ELIGIBILITY.Url());
    local v19 = v8:post(v18, l_HttpService_0:JSONEncode({
        action = 1, 
        userIds = {
            v13
        }, 
        universeId = v14
    }), v9);
    v8:parseJson(v19):andThen(v6(v3.validate)):andThen(function(v20) --[[ Line: 61 ]]
        -- upvalues: v16 (copy), v17 (copy), v12 (ref), l_StartPageManager_0 (ref), v15 (copy), v14 (copy)
        if not v20.eligibilityByCreator or #v20.eligibilityByCreator == 0 then
            return;
        else
            local v21 = v20.eligibilityByCreator[1];
            if not v21.userIsEligible then
                if v21.displayText and string.find(v21.displayText, "verified") then
                    v16();
                    return;
                else
                    v17();
                    return;
                end;
            elseif v12 then
                l_StartPageManager_0:openPlace(v15, v14, false);
                return;
            else
                l_StartPageManager_0:openPlace(v15, 0, false);
                return;
            end;
        end;
    end):catch(function(v22) --[[ Line: 81 ]]
        warn((("DiscoverCreatorEligibilityAndOpenPlace experienced an error: %*"):format(v22)));
    end);
end;