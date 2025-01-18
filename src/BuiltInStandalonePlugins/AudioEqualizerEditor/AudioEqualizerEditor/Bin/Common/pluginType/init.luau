local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
return {
    Asset = "Asset", 
    Standalone = "Standalone", 
    get = function() --[[ Line: 12 ]] --[[ Name: get ]]
        -- upvalues: v1 (copy)
        if v1.getFFlagLoadAudioEqualizerEditorInAssetDM() then
            return "Asset";
        else
            return "Standalone";
        end;
    end
};