local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.AppStateReducer);
local v3 = require(l_Parent_0.Src.Reducers.MaterialsReducer);
return (v1.combineReducers({
    AppStateReducer = v2, 
    MaterialsReducer = v3
}));