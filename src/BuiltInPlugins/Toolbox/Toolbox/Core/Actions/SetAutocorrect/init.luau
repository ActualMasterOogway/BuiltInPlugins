local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local v3 = require(l_script_FirstAncestor_0.Core.Types.AutocorrectTypes);
return l_Action_0(script.Name, function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    return {
        correctionState = v4.correctionState or v3.AutocorrectResponseState.NoCorrection, 
        correctedQuery = v4.correctedQuery or "", 
        userQuery = v4.userQuery or ""
    };
end);