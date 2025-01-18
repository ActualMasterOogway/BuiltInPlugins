local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.src.reducers.PluginReducer);
local v3 = require(l_Parent_0.src.reducers.ErrorReducer);
return v1.combineReducers({
    plugin = v2, 
    error = v3
});