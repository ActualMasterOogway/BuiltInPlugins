local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(script.Parent.Permissions);
local v3 = require(script.Parent.GroupMetadata);
local v4 = require(script.Parent.GroupRolePermissions);
local v5 = require(script.Parent.GameOwnerMetadata);
local v6 = require(script.Parent.CollaboratorSearch);
local v7 = require(script.Parent.LoadState);
local v8 = require(script.Parent.SaveState);
return (v1.combineReducers({
    GameOwnerMetadata = v5, 
    Permissions = v2, 
    GroupMetadata = v3, 
    GroupRolePermissions = v4, 
    CollaboratorSearch = v6, 
    LoadState = v7, 
    SaveState = v8
}));