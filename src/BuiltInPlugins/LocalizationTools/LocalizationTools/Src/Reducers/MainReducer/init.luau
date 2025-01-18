local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.PluginMetadata);
local v3 = require(l_Parent_0.Src.Reducers.Message);
local v4 = require(l_Parent_0.Src.Reducers.CloudTable);
return v1.combineReducers({
    PluginMetadata = v2, 
    Message = v3, 
    CloudTable = v4
});