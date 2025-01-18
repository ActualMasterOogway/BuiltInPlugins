local l_game_FastString_0 = game:GetFastString("DevPublishChinaRequirementsLink");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local v3 = game:GetService("PluginPolicyService"):getPluginPolicy("GameSettings");
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Packages.Cryo);
local v6 = require(l_Parent_0.Src.Util.KeyProvider);
local v7 = v6.getContextKeyName();
local v8 = v6.getPluginKeyName();
local v9 = v6.getGameSettingsKeyName();
local v12 = {
    getAutoTranslationAllowed = function() --[[ Line: 18 ]] --[[ Name: getAutoTranslationAllowed ]]
        -- upvalues: v3 (copy)
        return v3.AutoTranslationAllowed;
    end, 
    getAutoTranslatedLanguages = function() --[[ Line: 22 ]] --[[ Name: getAutoTranslatedLanguages ]]
        -- upvalues: v3 (copy)
        return v3.AutoTranslationTargetLanguages;
    end, 
    getSocialMediaReferencesAllowed = function() --[[ Line: 26 ]] --[[ Name: getSocialMediaReferencesAllowed ]]
        -- upvalues: v3 (copy)
        return v3.SocialMediaReferencesAllowed;
    end, 
    shouldDisablePrivateServersAndPaidAccess = function() --[[ Line: 30 ]] --[[ Name: shouldDisablePrivateServersAndPaidAccess ]]
        -- upvalues: v3 (copy)
        return v3.DisablePrivateServersAndPaidAccess;
    end, 
    shouldAllowBadges = function() --[[ Line: 34 ]] --[[ Name: shouldAllowBadges ]]
        -- upvalues: v3 (copy)
        return v3.ShowBadges;
    end, 
    shouldShowDevPublishLocations = function() --[[ Line: 38 ]] --[[ Name: shouldShowDevPublishLocations ]]
        -- upvalues: v3 (copy)
        return v3.ShowOptInLocations;
    end, 
    getPlayerAppDownloadLink = function(v10) --[[ Line: 42 ]] --[[ Name: getPlayerAppDownloadLink ]]
        -- upvalues: v3 (copy)
        return v3.PlayerAppDownloadLink[v10];
    end, 
    getOptInLocationsRequirementsLink = function(_) --[[ Line: 46 ]] --[[ Name: getOptInLocationsRequirementsLink ]]
        -- upvalues: l_game_FastString_0 (copy)
        return l_game_FastString_0;
    end
};
local function _(v13, v14) --[[ Line: 50 ]] --[[ Name: getDevPublishKibanaPoints ]]
    -- upvalues: v8 (copy), v7 (copy)
    return {
        [v8] = v13, 
        [v7] = v14
    };
end;
v12.sendAnalyticsToKibana = function(v16, v17, v18, v19) --[[ Line: 57 ]] --[[ Name: sendAnalyticsToKibana ]]
    -- upvalues: v9 (copy), v8 (copy), v7 (copy), v5 (copy), l_RbxAnalyticsService_0 (copy)
    local v20 = {
        [v8] = v9, 
        [v7] = v18
    };
    v20 = v5.Dictionary.join(v20, v19);
    l_RbxAnalyticsService_0:reportInfluxSeries(v16, v20, v17);
end;
v12.isTeamCreateEnabled = function() --[[ Line: 63 ]] --[[ Name: isTeamCreateEnabled ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsEdit() and not l_RunService_0:IsServer();
end;
v12.calculateTextSize = function(v21, v22, v23) --[[ Line: 70 ]] --[[ Name: calculateTextSize ]]
    local v24 = Vector2.new(5000, 5000);
    return game:GetService("TextService"):GetTextSize(v21, v22, v23, v24);
end;
return v12;