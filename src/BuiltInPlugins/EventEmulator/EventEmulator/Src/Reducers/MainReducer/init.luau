local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.Status);
local v3 = require(l_Parent_0.Src.Reducers.History);
return v1.combineReducers({
    Status = v2, 
    History = v3
});