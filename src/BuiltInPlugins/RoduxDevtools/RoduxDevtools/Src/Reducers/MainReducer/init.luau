local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_Parent_1 = script.Parent;
return (v1.combineReducers({
    selectedIndex = require(l_Parent_1.SelectedIndexReducer), 
    searchTerm = require(l_Parent_1.SearchTermReducer), 
    events = require(l_Parent_1.EventsReducer)
}));