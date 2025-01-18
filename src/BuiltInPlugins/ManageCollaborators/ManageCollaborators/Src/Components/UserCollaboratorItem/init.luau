local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v7 = require(l_Parent_0.Src.Components.Thumbnails.UserHeadshotThumbnail);
local v8 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v9 = require(l_Parent_0.Src.Selectors.IsUserOwner);
local v10 = require(l_Parent_0.Src.Selectors.IsUserCreatorFriend);
local v11 = require(l_Parent_0.Src.Selectors.GetUserName);
local v12 = require(l_Parent_0.Src.Selectors.GetUserPermission);
local v13 = require(l_Parent_0.Src.Thunks.SetUserPermission);
local v14 = require(l_Parent_0.Src.Thunks.RemoveUserCollaborator);
local v15 = v2.PureComponent:extend("UserCollaboratorItem");
local v16 = {
    [v6.OwnerKey] = "Owner", 
    [v6.PlayKey] = "Play", 
    [v6.EditKey] = "Edit", 
    [v6.NoAccessKey] = "NoAccess", 
    [v6.AdminKey] = "Admin"
};
v15.DEPRECATED_getPermissionForKey = function(v17, v18) --[[ Line: 36 ]] --[[ Name: DEPRECATED_getPermissionForKey ]]
    -- upvalues: v16 (copy)
    local l_Localization_0 = v17.props.Localization;
    if not v16[v18] then
        return {
            Key = v18, 
            Display = tostring(v18), 
            Description = "Error: This permission is not recognized."
        };
    else
        return {
            Key = v18, 
            Display = l_Localization_0:getText("PermissionLabels", v16[v18]), 
            Description = l_Localization_0:getText("PermissionDescriptions", v16[v18])
        };
    end;
end;
v15.getAvailablePermissions = function(v20) --[[ Line: 52 ]] --[[ Name: getAvailablePermissions ]]
    -- upvalues: v6 (copy)
    local l_props_0 = v20.props;
    local l_IsOwner_0 = l_props_0.IsOwner;
    local l_IsOwnerFriend_0 = l_props_0.IsOwnerFriend;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local l_Writable_0 = l_props_0.Writable;
    if l_IsOwner_0 then
        return {
            v20:DEPRECATED_getPermissionForKey(v6.OwnerKey)
        };
    elseif not l_Writable_0 then
        return {
            v20:DEPRECATED_getPermissionForKey(v20:getCurrentPermission())
        };
    else
        local v26 = {
            v20:DEPRECATED_getPermissionForKey(v6.PlayKey)
        };
        if l_OwnerType_0 == Enum.CreatorType.User and l_IsOwnerFriend_0 then
            table.insert(v26, v20:DEPRECATED_getPermissionForKey(v6.EditKey));
        end;
        return v26;
    end;
end;
v15.getCurrentPermission = function(v27) --[[ Line: 77 ]] --[[ Name: getCurrentPermission ]]
    -- upvalues: v6 (copy)
    local l_props_1 = v27.props;
    local l_IsOwner_1 = l_props_1.IsOwner;
    local l_CurrentPermission_0 = l_props_1.CurrentPermission;
    if l_IsOwner_1 then
        return v6.OwnerKey;
    else
        return l_CurrentPermission_0;
    end;
end;
v15.render = function(v31) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: l_COLLAB2850_FixMcTooltips_0 (copy), v2 (copy), v8 (copy), v7 (copy)
    local l_props_2 = v31.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local v34 = if l_COLLAB2850_FixMcTooltips_0 then l_props_2.Localization else nil;
    local l_Id_0 = l_props_2.Id;
    local l_Writable_1 = l_props_2.Writable;
    local l_UserName_0 = l_props_2.UserName;
    local l_IsOwner_2 = l_props_2.IsOwner;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local l_SetUserPermission_0 = l_props_2.SetUserPermission;
    local l_RemoveUserCollaborator_0 = l_props_2.RemoveUserCollaborator;
    local v42 = if l_COLLAB2850_FixMcTooltips_0 then l_props_2.IsGroupGame else nil;
    local v43 = v31:getAvailablePermissions();
    local v44 = nil;
    if l_COLLAB2850_FixMcTooltips_0 and not l_IsOwner_2 then
        if v42 then
            v44 = if not l_Writable_1 then v34:getText("PermissionDescriptions", "GroupOwnerToEdit") else v34:getText("PermissionDescriptions", "UsersOnlyPlayLevel");
        elseif not l_Writable_1 then
            v44 = v34:getText("PermissionDescriptions", "GameOwnerToEdit");
        elseif #v43 <= 1 then
            v44 = v34:getText("PermissionDescriptions", "FriendToEdit");
        end;
    end;
    local v45 = if l_COLLAB2850_FixMcTooltips_0 then l_Writable_1 and not l_IsOwner_2 and #v43 > 1 else l_Writable_1 and not l_IsOwner_2;
    local v46 = if l_COLLAB2850_FixMcTooltips_0 then l_Writable_1 and not l_IsOwner_2 else not l_IsOwner_2;
    return v2.createElement(v8, {
        LayoutOrder = l_LayoutOrder_0, 
        Name = l_UserName_0, 
        Icon = v2.createElement(v7, {
            Id = l_Id_0, 
            Size = UDim2.fromScale(1, 1)
        }), 
        Writable = v45, 
        Loading = false, 
        IsOwner = if l_COLLAB2850_FixMcTooltips_0 then l_IsOwner_2 else nil, 
        HideSeparator = l_HideSeparator_0, 
        Removable = v46, 
        OnRemoved = function() --[[ Line: 154 ]] --[[ Name: OnRemoved ]]
            -- upvalues: l_RemoveUserCollaborator_0 (copy), l_Id_0 (copy)
            l_RemoveUserCollaborator_0(l_Id_0);
        end, 
        TooltipText = v44, 
        CurrentPermission = v31:getCurrentPermission(), 
        AvailablePermissions = v43, 
        OnPermissionChanged = function(v47) --[[ Line: 162 ]] --[[ Name: OnPermissionChanged ]]
            -- upvalues: l_SetUserPermission_0 (copy), l_Id_0 (copy)
            l_SetUserPermission_0(l_Id_0, v47);
        end
    });
end;
v15 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v15);
return (v3.connect(function(v48, v49) --[[ Line: 172 ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    return {
        OwnerType = v48.GameOwnerMetadata.creatorType, 
        IsOwner = v9(v48, v49.Id), 
        IsOwnerFriend = v10(v48, v49.Id), 
        UserName = v11(v48, v49.Id), 
        CurrentPermission = v12(v48, v49.Id)
    };
end, function(v50) --[[ Line: 181 ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        SetUserPermission = function(...) --[[ Line: 183 ]] --[[ Name: SetUserPermission ]]
            -- upvalues: v50 (copy), v13 (ref)
            v50(v13(...));
        end, 
        RemoveUserCollaborator = function(...) --[[ Line: 186 ]] --[[ Name: RemoveUserCollaborator ]]
            -- upvalues: v50 (copy), v14 (ref)
            v50(v14(...));
        end
    };
end)(v15));