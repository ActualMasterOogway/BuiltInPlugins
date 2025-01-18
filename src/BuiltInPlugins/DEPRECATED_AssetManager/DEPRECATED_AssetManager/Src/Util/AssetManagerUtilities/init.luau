local v0 = game:GetService("PluginPolicyService"):getPluginPolicy("AssetManager");
local v1 = require(script.Parent.hasInternalPermission);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableCustomVideoUploadLua");
local v3 = {
    shouldEnableAudioImport = function() --[[ Line: 21 ]] --[[ Name: shouldEnableAudioImport ]]
        -- upvalues: v0 (copy)
        return v0.EnableAudioImport;
    end
};
v3.enableAudioImport = function() --[[ Line: 25 ]] --[[ Name: enableAudioImport ]]
    -- upvalues: v3 (copy)
    return v3.shouldEnableAudioImport();
end;
v3.shouldEnableVideoImport = function() --[[ Line: 29 ]] --[[ Name: shouldEnableVideoImport ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v1 (copy)
    return l_game_EngineFeature_0 or v1();
end;
v3.enableVideoImport = function() --[[ Line: 33 ]] --[[ Name: enableVideoImport ]]
    -- upvalues: v3 (copy)
    return v3.shouldEnableVideoImport();
end;
v3.enableBadgesCallout = function() --[[ Line: 43 ]] --[[ Name: enableBadgesCallout ]]
    -- upvalues: v0 (copy)
    return v0.ShowBadges;
end;
return v3;