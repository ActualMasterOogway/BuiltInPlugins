local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local l_StudioService_0 = game:GetService("StudioService");
return {
    getSocialMediaReferencesAllowed = function() --[[ Line: 8 ]] --[[ Name: getSocialMediaReferencesAllowed ]]
        -- upvalues: v1 (copy)
        if v1.RunningUnderCLI() then
            return true;
        else
            return game:GetService("PluginPolicyService"):getPluginPolicy("PlayerEmulator").SocialMediaReferencesAllowed;
        end;
    end, 
    getStudioLocaleId = function() --[[ Line: 16 ]] --[[ Name: getStudioLocaleId ]]
        -- upvalues: v1 (copy), l_StudioService_0 (copy)
        if v1.RunningUnderCLI() then
            return "en";
        else
            return l_StudioService_0.StudioLocaleId;
        end;
    end
};