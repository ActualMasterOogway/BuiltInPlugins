local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
return {
    Asset = "Asset", 
    Standalone = "Standalone", 
    get = function() --[[ Line: 13 ]] --[[ Name: get ]]
        -- upvalues: v1 (copy)
        if v1.getFFlagLoadInAssetDM() then
            return "Asset";
        else
            return "Standalone";
        end;
    end
};