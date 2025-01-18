local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.GameMetadata);
local v3 = require(l_Parent_0.Src.Reducers.GameOwnerMetadata);
local v4 = require(l_Parent_0.Src.Reducers.PageLoadState);
local v5 = require(l_Parent_0.Src.Reducers.PageSaveState);
local v6 = require(l_Parent_0.Src.Reducers.Settings);
local v7 = require(l_Parent_0.Src.Reducers.Status);
local v8 = require(l_Parent_0.Src.Reducers.ComponentLoadState);
local v9 = require(l_Parent_0.Src.Reducers.EditAsset);
local v10 = require(l_Parent_0.Pages.PermissionsPage.Reducers.CollaboratorSearch);
local v11 = require(l_Parent_0.Pages.AvatarPage.Reducers.MorpherEditorRoot);
return v1.combineReducers({
    Settings = v6, 
    Status = v7, 
    MorpherEditorRoot = v11, 
    CollaboratorSearch = v10, 
    PageLoadState = v4, 
    PageSaveState = v5, 
    Metadata = v2, 
    GameOwnerMetadata = v3, 
    EditAsset = v9, 
    ComponentLoadState = v8
});