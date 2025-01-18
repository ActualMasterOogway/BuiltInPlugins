local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.Example);
local v3 = require(l_Parent_0.Src.Reducers.DraftsServiceStatus);
local v4 = require(l_Parent_0.Src.Reducers.DraftsReducer);
return (v1.combineReducers({
    Example = v2, 
    DraftsServiceStatus = v3, 
    Drafts = v4
}));