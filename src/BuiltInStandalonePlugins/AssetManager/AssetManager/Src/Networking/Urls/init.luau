local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Networking_0 = v1.Http.Networking;
local l_RobloxAPI_0 = v1.RobloxAPI;
local v4 = game:DefineFastFlag("StudioPlat37699UnmoveCreatorInventoryItems", false);
local v5 = {
    _FrameworkAPI = l_RobloxAPI_0.new(l_Networking_0.new())
};
v5.CreateFetchGroupsRequest = v5._FrameworkAPI.Develop.V1.User.Groups.canManage;
if v4 then
    v5.CreateFetchAssetsForUserRequest = v5._FrameworkAPI.APIS.CreatorInventoryApi.V1.Users.creatorInventoryItems;
    v5.CreateFetchAssetsForGroupRequest = v5._FrameworkAPI.APIS.CreatorInventoryApi.V1.Groups.creatorInventoryItems;
    v5.CreateFetchAssetsForUniverseRequest = v5._FrameworkAPI.APIS.CreatorInventoryApi.V1.Universe.creatorInventoryItems;
    v5.CreateSearchAssetsRequest = v5._FrameworkAPI.APIS.CreatorInventoryApi.V1.search;
else
    v5.CreateFetchAssetsForUserRequest = v5._FrameworkAPI.API.CreatorInventory.userItems;
    v5.CreateFetchAssetsForGroupRequest = v5._FrameworkAPI.API.CreatorInventory.groupItems;
    v5.CreateFetchAssetsForUniverseRequest = v5._FrameworkAPI.API.CreatorInventory.universeItems;
    v5.CreateSearchAssetsRequest = v5._FrameworkAPI.API.CreatorInventory.search;
end;
v5.PatchAssetsPermissionsRequest = v5._FrameworkAPI.APIS.AssetPermissionsApi.V1.Assets.permissions;
return v5;