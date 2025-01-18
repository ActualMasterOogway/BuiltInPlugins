local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.Asset);
local v3 = require(l_Parent_0.Src.Reducers.Clipboard);
local v4 = require(l_Parent_0.Src.Reducers.SessionStats);
local v5 = require(l_Parent_0.Src.Reducers.Window);
return v1.combineReducers({
    Asset = v2, 
    Clipboard = v3, 
    SessionStats = v4, 
    Window = v5
});