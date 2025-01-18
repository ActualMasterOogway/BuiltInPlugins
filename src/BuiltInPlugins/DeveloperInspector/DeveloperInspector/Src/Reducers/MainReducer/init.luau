local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(script.Parent.TargetReducer);
local v3 = require(script.Parent.RoactInspectorReducer);
return v1.combineReducers({
    Targets = v2, 
    RoactInspector = v3
});