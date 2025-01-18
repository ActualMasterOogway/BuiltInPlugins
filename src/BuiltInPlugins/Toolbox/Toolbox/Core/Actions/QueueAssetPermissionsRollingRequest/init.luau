local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local v3 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
return l_Action_0(script.Name, function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy)
    assert(v3());
    return {
        id = v4
    };
end);