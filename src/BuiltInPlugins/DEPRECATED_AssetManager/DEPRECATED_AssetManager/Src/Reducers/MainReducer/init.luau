local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.AssetManagerReducer);
local v3 = require(l_Parent_0.Src.Reducers.Screen);
return (v1.combineReducers({
    AssetManagerReducer = v2, 
    Screen = v3
}));