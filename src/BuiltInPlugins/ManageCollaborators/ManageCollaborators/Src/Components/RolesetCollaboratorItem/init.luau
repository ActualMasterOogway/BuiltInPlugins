local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_COLLAB4802_FixManageCollabLanguageBug_0 = game:GetFastFlag("COLLAB4802_FixManageCollabLanguageBug");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v8 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v9 = require(l_Parent_0.Src.Selectors.IsRolesetOwner);
local v10 = require(l_Parent_0.Src.Selectors.GetRolesetName);
local v11 = require(l_Parent_0.Src.Selectors.GetRolesetPermission);
local v12 = require(l_Parent_0.Src.Thunks.SetRolesetPermission);
local v13 = v3.PureComponent:extend("RolesetCollaboratorItem");
v13.getAvailablePermissions = function(v14) --[[ Line: 25 ]] --[[ Name: getAvailablePermissions ]]
    -- upvalues: v7 (copy)
    local l_props_0 = v14.props;
    local l_IsRolesetOwner_0 = l_props_0.IsRolesetOwner;
    local l_IsGroupOwner_0 = l_props_0.IsGroupOwner;
    local l_RolePermissions_0 = l_props_0.RolePermissions;
    local l_Localization_0 = l_props_0.Localization;
    if l_IsRolesetOwner_0 then
        return {
            {
                Key = v7.OwnerKey, 
                Display = l_Localization_0:getText("PermissionLabels", "Owner"), 
                Description = l_Localization_0:getText("PermissionDescriptions", "Owner")
            }
        };
    elseif l_IsGroupOwner_0 then
        if l_RolePermissions_0 ~= nil and l_RolePermissions_0.groupEconomyPermissions.manageGroupGames then
            return {
                {
                    Key = v7.EditKey, 
                    Display = l_Localization_0:getText("PermissionLabels", "Edit"), 
                    Description = l_Localization_0:getText("PermissionDescriptions", "Edit")
                }
            };
        else
            return {
                {
                    Key = v7.NoAccessKey, 
                    Display = l_Localization_0:getText("PermissionLabels", "NoAccess"), 
                    Description = l_Localization_0:getText("PermissionDescriptions", "NoAccess")
                }, 
                {
                    Key = v7.PlayKey, 
                    Display = l_Localization_0:getText("PermissionLabels", "Play"), 
                    Description = l_Localization_0:getText("PermissionDescriptions", "Play")
                }, 
                {
                    Key = v7.EditKey, 
                    Display = l_Localization_0:getText("PermissionLabels", "Edit"), 
                    Description = l_Localization_0:getText("PermissionDescriptions", "Edit")
                }
            };
        end;
    else
        return {
            {
                Key = v7.NoAccessKey, 
                Display = l_Localization_0:getText("PermissionLabels", "NoAccess"), 
                Description = l_Localization_0:getText("PermissionDescriptions", "NoAccess")
            }, 
            {
                Key = v7.PlayKey, 
                Display = l_Localization_0:getText("PermissionLabels", "Play"), 
                Description = l_Localization_0:getText("PermissionDescriptions", "Play")
            }
        };
    end;
end;
v13.getCurrentPermission = function(v20) --[[ Line: 87 ]] --[[ Name: getCurrentPermission ]]
    -- upvalues: v7 (copy)
    local l_props_1 = v20.props;
    local l_IsRolesetOwner_1 = l_props_1.IsRolesetOwner;
    local l_RolePermissions_1 = l_props_1.RolePermissions;
    local l_CurrentPermission_0 = l_props_1.CurrentPermission;
    if l_IsRolesetOwner_1 then
        return v7.OwnerKey;
    elseif l_RolePermissions_1 ~= nil and l_RolePermissions_1.groupEconomyPermissions.manageGroupGames then
        return v7.EditKey;
    else
        return l_CurrentPermission_0;
    end;
end;
v13.render = function(v25) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: l_COLLAB2850_FixMcTooltips_0 (copy), l_COLLAB4802_FixManageCollabLanguageBug_0 (copy), v3 (copy), v8 (copy)
    local l_props_2 = v25.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local _ = if l_COLLAB2850_FixMcTooltips_0 then l_props_2.Localization else nil;
    local l_Id_0 = l_props_2.Id;
    local l_Writable_0 = l_props_2.Writable;
    local l_RolesetName_0 = l_props_2.RolesetName;
    local l_IsRolesetOwner_2 = l_props_2.IsRolesetOwner;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local l_SetRolesetPermission_0 = l_props_2.SetRolesetPermission;
    local v35 = v25:getAvailablePermissions();
    local v36 = nil;
    local v37 = nil;
    local l_Localization_1 = l_props_2.Localization;
    if l_COLLAB2850_FixMcTooltips_0 then
        v36 = l_props_2.IsGroupGame;
        if not l_IsRolesetOwner_2 then
            if v36 then
                if not l_Writable_0 then
                    v37 = l_Localization_1:getText("PermissionDescriptions", "GroupOwnerToEdit");
                elseif #v35 <= 1 then
                    if l_COLLAB4802_FixManageCollabLanguageBug_0 then
                        assert(v35[1].Display == l_Localization_1:getText("PermissionLabels", "Edit"));
                    else
                        assert(v35[1].Display == "Edit");
                    end;
                    v37 = l_Localization_1:getText("PermissionDescriptions", "RoleHasEditPerms");
                end;
            elseif not l_Writable_0 then
                v37 = l_Localization_1:getText("PermissionDescriptions", "GameOwnerToEdit");
            end;
        end;
    end;
    local v39 = if l_COLLAB2850_FixMcTooltips_0 then l_Writable_0 and not l_IsRolesetOwner_2 and #v35 > 1 else l_Writable_0 and not l_IsRolesetOwner_2;
    return v3.createElement(v8, {
        LayoutOrder = l_LayoutOrder_0, 
        Name = l_RolesetName_0, 
        Writable = v39, 
        Loading = false, 
        Removable = false, 
        IsRolesetCollaborator = true, 
        HideSeparator = l_HideSeparator_0, 
        TooltipText = v37, 
        HidePermissions = if not l_COLLAB2850_FixMcTooltips_0 then not l_Writable_0 and not l_IsRolesetOwner_2 else nil, 
        CurrentPermission = v25:getCurrentPermission(), 
        AvailablePermissions = v35, 
        OnPermissionChanged = function(v40) --[[ Line: 176 ]] --[[ Name: OnPermissionChanged ]]
            -- upvalues: l_SetRolesetPermission_0 (copy), l_Id_0 (copy)
            l_SetRolesetPermission_0(l_Id_0, v40);
        end
    });
end;
v13 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v13);
return (v4.connect(function(v41, v42) --[[ Line: 186 ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy)
    return {
        IsRolesetOwner = v9(v41, v42.Id), 
        RolesetName = v10(v41, v42.Id), 
        CurrentPermission = v11(v41, v42.Id)
    };
end, function(v43) --[[ Line: 192 ]]
    -- upvalues: v12 (copy)
    return {
        SetRolesetPermission = function(...) --[[ Line: 194 ]] --[[ Name: SetRolesetPermission ]]
            -- upvalues: v43 (copy), v12 (ref)
            v43(v12(...));
        end
    };
end)(v13));