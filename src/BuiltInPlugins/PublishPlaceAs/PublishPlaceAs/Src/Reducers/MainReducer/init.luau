local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.ExistingGame);
local v3 = require(l_Parent_0.Src.Reducers.NewGameSettings);
local v4 = require(l_Parent_0.Src.Reducers.Policy);
local v5 = require(l_Parent_0.Src.Reducers.PublishInProgress);
local v6 = require(l_Parent_0.Src.Reducers.PublishedPlace);
local v7 = require(l_Parent_0.Src.Reducers.Screen);
local v8 = require(l_Parent_0.Src.Reducers.GroupsHavePermission);
local v9 = require(l_Parent_0.Src.Reducers.SelectedGroup);
return (v1.combineReducers({
    Screen = v7, 
    ExistingGame = v2, 
    NewGameSettings = v3, 
    PublishedPlace = v6, 
    PublishInProgress = v5, 
    GroupsHavePermission = v8, 
    Policy = v4, 
    SelectedGroup = v9
}));