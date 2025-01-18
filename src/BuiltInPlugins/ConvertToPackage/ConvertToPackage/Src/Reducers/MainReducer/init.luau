local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.AssetConfigReducer);
local v3 = require(l_Parent_0.Src.Reducers.NetworkReducer);
local v4 = require(l_Parent_0.Src.Reducers.GroupReducer);
return (v1.combineReducers({
    AssetConfigReducer = v2, 
    GroupReducer = v4, 
    NetworkReducer = v3
}));