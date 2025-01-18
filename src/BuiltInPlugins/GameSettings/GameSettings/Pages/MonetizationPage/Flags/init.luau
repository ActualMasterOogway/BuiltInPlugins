game:DefineFastFlag("ADS6764EnableRewardedVideoAdsStudioSettings", false);
game:DefineFastString("RewardedVideoAdsUniverseIdAllowlist", "");
local _ = function(v0) --[[ Line: 4 ]] --[[ Name: isUniverseInAllowlist ]]
    local v1 = game:GetFastString("RewardedVideoAdsUniverseIdAllowlist"):split(",");
    for _, v3 in ipairs(v1) do
        if v3 == v0 then
            return true;
        end;
    end;
    return false;
end;
return {
    GetFFlagEnableRewardedVideoAdsStudioSettings = function(v5) --[[ Line: 16 ]] --[[ Name: GetFFlagEnableRewardedVideoAdsStudioSettings ]]
        local l_ADS6764EnableRewardedVideoAdsStudioSettings_0 = game:GetFastFlag("ADS6764EnableRewardedVideoAdsStudioSettings");
        if not l_ADS6764EnableRewardedVideoAdsStudioSettings_0 then
            local v7 = tostring(v5);
            local v8 = game:GetFastString("RewardedVideoAdsUniverseIdAllowlist"):split(",");
            for _, v10 in ipairs(v8) do
                if v10 == v7 then
                    return true;
                end;
            end;
            return false;
        else
            return l_ADS6764EnableRewardedVideoAdsStudioSettings_0;
        end;
    end
};