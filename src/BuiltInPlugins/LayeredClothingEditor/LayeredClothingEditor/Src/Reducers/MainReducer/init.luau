local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.Status);
local v3 = require(l_Parent_0.Src.Reducers.PreviewStatus);
local v4 = require(l_Parent_0.Src.Reducers.SelectItem);
local v5 = require(l_Parent_0.Src.Reducers.ControlsPanelBlocker);
local v6 = require(l_Parent_0.Src.Reducers.PreviewAssets);
local v7 = require(l_Parent_0.Src.Reducers.Animation);
return (v1.combineReducers({
    status = v2, 
    previewStatus = v3, 
    selectItem = v4, 
    controlsPanelBlocker = v5, 
    previewAssets = v6, 
    animation = v7
}));