local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_None_0 = v1.None;
return v2.Util.Action(script.Name, function(v4) --[[ Line: 17 ]]
    -- upvalues: l_None_0 (copy)
    return {
        historyFrame = v4 or l_None_0
    };
end);