local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
return {
    getAreCustomIconsAndEmojiAllowed = function() --[[ Line: 6 ]] --[[ Name: getAreCustomIconsAndEmojiAllowed ]]
        -- upvalues: v1 (copy)
        if v1.RunningUnderCLI() then
            return true;
        else
            return game:GetService("PluginPolicyService"):getPluginPolicy("TagEditor").AreCustomIconsAndEmojiAllowed;
        end;
    end
};