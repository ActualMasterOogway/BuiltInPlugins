local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.MaterialBrowserReducer);
return (v1.combineReducers({
    MaterialBrowserReducer = v2
}));