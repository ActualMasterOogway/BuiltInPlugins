local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
return {
    asset = "Asset", 
    standalone = "Standalone", 
    get = function() --[[ Line: 12 ]] --[[ Name: get ]]
        -- upvalues: v1 (copy)
        if v1.getFFlagLoadAttenuationCurveEditorInAssetDM() then
            return "Asset";
        else
            return "Standalone";
        end;
    end
};