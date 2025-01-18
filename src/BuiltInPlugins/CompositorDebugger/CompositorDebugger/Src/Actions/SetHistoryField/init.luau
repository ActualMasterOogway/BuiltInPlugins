local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return l_Action_0(script.Name, function(v3, v4, v5) --[[ Line: 14 ]]
    return {
        id = v3, 
        section = v4, 
        field = v5
    };
end);