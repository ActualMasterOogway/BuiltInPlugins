local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Urls);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Util_0.AssetConfigConstants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v12 = require(l_Permissions_0.CollaboratorItem);
local v13 = require(l_Permissions_0.PermissionsConstants);
local l_ExpandablePane_0 = require(l_Packages_0.Framework).UI.ExpandablePane;
local v15 = require(l_Packages_0.Framework).Util.Spritesheet(v7.ARROW_SPRITESHEET, {
    SpriteSize = 12, 
    NumSprites = 4
});
local v16 = v15[2];
local v17 = v15[3];
local function _(v18, v19) --[[ Line: 57 ]] --[[ Name: getLevelForRoleset ]]
    -- upvalues: v13 (copy)
    if not v18.Permissions[v13.RoleSubjectKey] then
        return v13.AssetPermissionLevel;
    else
        local v20 = v18.Permissions[v13.RoleSubjectKey];
        if not v20[v19.Id] then
            return v13.AssetPermissionLevel;
        else
            return v20[v19.Id][v13.PermissionLevelKey] or v13.AssetPermissionLevel;
        end;
    end;
end;
local function _(v22, v23) --[[ Line: 74 ]] --[[ Name: getActionForRoleset ]]
    -- upvalues: v13 (copy)
    if not v22.Permissions[v13.RoleSubjectKey] then
        return v13.NoneKey;
    elseif not v22.Permissions[v13.RoleSubjectKey][v23.Id] then
        return v13.NoAccessKey;
    else
        return v22.Permissions[v13.RoleSubjectKey][v23.Id][v13.ActionKey];
    end;
end;
local _ = function(v25, v26) --[[ Line: 86 ]] --[[ Name: permissionLocked ]]
    for _, v28 in pairs(v26) do
        if v28.Key == v25 then
            return false;
        end;
    end;
    return true;
end;
local v30 = v2.PureComponent:extend("GroupCollaboratorItem");
v30.init = function(v31) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v3 (copy)
    v31.state = {
        expanded = false, 
        hovered = false
    };
    v31.onClick = function() --[[ Line: 104 ]]
        -- upvalues: v31 (copy)
        if not v31.props.Enabled then
            return;
        else
            v31:setState({
                expanded = not v31.state.expanded
            });
            return;
        end;
    end;
    v31.getLabelForAction = function(v32) --[[ Line: 113 ]]
        -- upvalues: v31 (copy), v13 (ref)
        local l_props_0 = v31.props;
        if v32 == v13.NoAccessKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel");
        elseif v32 == v13.UseViewKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel");
        elseif v32 == v13.EditKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "EditLabel");
        elseif v32 == v13.NoneKey then
            return "";
        else
            error("Unsupported Action: " .. tostring(v32));
            return "";
        end;
    end;
    v31.getRolesetItems = function() --[[ Line: 130 ]]
        -- upvalues: v31 (copy), v3 (ref), v13 (ref)
        local l_props_1 = v31.props;
        if next(l_props_1.Items) == nil then
            return {};
        else
            return (v3.List.join({
                v3.Dictionary.join({
                    Key = v13.NoAccessKey, 
                    Display = l_props_1.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel"), 
                    Description = l_props_1.Localization:getText("AssetConfigPackagePermissions", "NoAccessDescription")
                })
            }, l_props_1.Items));
        end;
    end;
end;
v30.render = function(v35) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy), v12 (copy), v17 (copy), v16 (copy), l_ExpandablePane_0 (copy), v6 (copy), v8 (copy)
    local v36 = false;
    local l_props_2 = v35.props;
    local v38 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v39 = false;
    local v40 = false;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local v42 = v35.props.GroupData and v35.props.GroupData.Roles or {};
    table.sort(v42, function(v43, v44) --[[ Line: 163 ]]
        return v44.Rank < v43.Rank;
    end);
    local v45 = v35.getRolesetItems();
    local v46 = l_props_2.Enabled and 16 or 0;
    for v47, v48 in pairs(v42) do
        local v49 = if not l_props_2.Permissions[v13.RoleSubjectKey] then v13.NoneKey else if l_props_2.Permissions[v13.RoleSubjectKey][v48.Id] then l_props_2.Permissions[v13.RoleSubjectKey][v48.Id][v13.ActionKey] else v13.NoAccessKey;
        if v47 == 1 then
            v40 = v49;
        end;
        local l_Enabled_0 = l_props_2.Enabled;
        if v48.Name == "Owner" then
            l_Enabled_0 = false;
        end;
        local v51 = nil;
        local l_l_Enabled_0_0 = l_Enabled_0;
        if l_l_Enabled_0_0 then
            local v53;
            if not l_props_2.Permissions[v13.RoleSubjectKey] then
                v53 = v13.AssetPermissionLevel;
            else
                local v54 = l_props_2.Permissions[v13.RoleSubjectKey];
                v53 = if not v54[v48.Id] then v13.AssetPermissionLevel else v54[v48.Id][v13.PermissionLevelKey] or v13.AssetPermissionLevel;
            end;
            l_l_Enabled_0_0 = v53 == v13.AssetPermissionLevel;
        end;
        l_Enabled_0 = l_l_Enabled_0_0;
        v51 = if not l_Enabled_0 then l_props_2.Localization:getText("AssetConfigPackagePermissions", "LockedGroup", {
            roleName = v48.Name
        }) else nil;
        for _, v56 in pairs(v45) do
            if v56.Key == v49 then
                l_l_Enabled_0_0 = false;
                v36 = true;
            end;
            if v36 then
                break;
            end;
        end;
        if not v36 then
            l_l_Enabled_0_0 = true;
        end;
        v36 = false;
        v40 = v40 == v49 and (v40 or false);
        v39 = not not l_l_Enabled_0_0 or v48.LockedTo and true or v39;
        local v58 = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v47, 
            Size = UDim2.new(1, 0, 0, 60)
        }, {
            v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v46, 0, 0), 
                Size = UDim2.new(1, -v46, 0, 1)
            }, {
                v2.createElement(v12, {
                    Enabled = l_Enabled_0, 
                    CollaboratorName = v48.Name, 
                    CollaboratorId = v48.Id, 
                    CollaboratorIcon = nil, 
                    Action = v48.LockedTo or v35.getLabelForAction(v49), 
                    Items = (not not l_l_Enabled_0_0 or v48.LockedTo) and {} or v45, 
                    SelectedItem = v49, 
                    HideLastSeparator = v47 ~= #v42, 
                    Removable = false, 
                    PermissionChanged = function(v57) --[[ Line: 217 ]] --[[ Name: PermissionChanged ]]
                        -- upvalues: l_props_2 (copy), v48 (copy)
                        if l_props_2.RolePermissionChanged then
                            l_props_2.RolePermissionChanged(v48.Id, v57);
                        end;
                    end, 
                    TooltipText = v51
                })
            })
        });
        v38["Roleset" .. v47] = v58;
    end;
    if not v35.state.expanded or not v17 then
        local _ = v16;
    end;
    local v60 = l_props_2.Localization:getText("AssetConfigPackagePermissions", "GroupOwnedTooltip") .. " " .. if not v40 then l_props_2.Localization:getText("AssetConfigPackagePermissions", "MultipleLabelTooltip") else "";
    return v2.createElement(l_ExpandablePane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Expanded = l_props_2.Enabled and v35.state.expanded, 
        LayoutOrder = l_LayoutOrder_0, 
        OnExpandedChanged = v35.onClick, 
        HeaderComponent = l_props_2.GroupData and v12 or nil, 
        HeaderComponentProps = {
            Enabled = false, 
            SubjectType = Enum.CreatorType.Group, 
            CollaboratorName = l_props_2.GroupData.Name, 
            CollaboratorId = l_props_2.GroupData.Id, 
            CollaboratorIcon = v6.constructRBXThumbUrl(v8.rbxThumbTypes.GroupIcon, l_props_2.GroupData.Id, v8.rbxThumbSizes.GroupIconImageSize), 
            UseMask = false, 
            Action = if v40 then v35.getLabelForAction(v40) else l_props_2.Localization:getText("AssetConfigPackagePermissions", "MultipleLabel"), 
            Items = v39 and {} or l_props_2.Items, 
            SecondaryText = l_props_2.SecondaryText, 
            Removable = l_props_2.Removable or false, 
            Removed = l_props_2.Removed, 
            IsLoading = #v42 == 0, 
            TooltipText = v60
        }
    }, v38);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v30));