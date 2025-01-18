local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_None_0 = v1.None;
local l_Action_0 = v2.Util.Action;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return l_Action_0(script.Name, function(v6) --[[ Line: 17 ]]
    -- upvalues: l_None_0 (copy)
    return {
        overrides = v6 or l_None_0
    };
end);