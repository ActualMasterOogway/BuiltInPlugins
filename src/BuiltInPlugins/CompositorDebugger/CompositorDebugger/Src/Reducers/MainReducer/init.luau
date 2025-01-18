local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(script.Parent.DebugData);
local v3 = require(script.Parent.Status);
return v1.combineReducers({
    DebugData = v2, 
    Status = v3
});