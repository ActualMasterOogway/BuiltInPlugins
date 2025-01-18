local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(script.Parent.PathReducer);
return (v1.combineReducers({
    ChangeHistoryServiceRecording = nil, 
    PathReducer = v2
}));