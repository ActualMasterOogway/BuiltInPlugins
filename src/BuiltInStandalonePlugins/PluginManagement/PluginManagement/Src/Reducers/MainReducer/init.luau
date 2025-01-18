local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.PluginInfo);
local v3 = require(l_Parent_0.Src.Reducers.PluginPermissions);
local v4 = require(l_Parent_0.Src.Reducers.Management);
return (v1.combineReducers({
    PluginInfo = v2, 
    PluginPermissions = v3, 
    Management = v4
}));