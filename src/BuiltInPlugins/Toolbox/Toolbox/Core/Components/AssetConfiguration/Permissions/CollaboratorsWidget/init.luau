local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.AssetConfigConstants);
local v5 = require(l_Util_0.Urls);
local v6 = require(l_Util_0.Constants);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v10 = require(l_Permissions_0.PermissionsConstants);
local v11 = require(l_Permissions_0.CollaboratorItem);
local l_Separator_0 = require(l_Packages_0.Framework).UI.Separator;
local l_deepJoin_0 = require(l_Packages_0.Framework).Util.deepJoin;
local _ = function(v14, v15) --[[ Line: 37 ]] --[[ Name: permissionLocked ]]
    for _, v17 in pairs(v15) do
        if v17.Key == v14 then
            return false;
        end;
    end;
    return true;
end;
local v19 = v2.PureComponent:extend("CollaboratorsWidget");
v19.init = function(v20) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_deepJoin_0 (copy), v10 (copy)
    v20.userPermissionChanged = function(v21, v22) --[[ Line: 50 ]]
        -- upvalues: v20 (copy), l_deepJoin_0 (ref), v10 (ref)
        local l_props_0 = v20.props;
        local v24 = l_deepJoin_0(l_props_0.Permissions, {
            [v10.UserSubjectKey] = {
                [v21] = {
                    [v10.ActionKey] = v22
                }
            }
        });
        l_props_0.PermissionsChanged(v24);
    end;
    v20.userRemoved = function(v25) --[[ Line: 62 ]]
        -- upvalues: v20 (copy), l_deepJoin_0 (ref), v10 (ref)
        local l_props_1 = v20.props;
        local v27 = l_deepJoin_0(l_props_1.Permissions, {
            [v10.UserSubjectKey] = {
                [v25] = {
                    [v10.ActionKey] = v10.NoAccessKey
                }
            }
        });
        l_props_1.PermissionsChanged(v27);
    end;
    v20.getUserCollaboratorPermissions = function() --[[ Line: 74 ]]
        -- upvalues: v20 (copy), v10 (ref)
        local l_props_2 = v20.props;
        if not l_props_2.CanManage then
            return {};
        else
            return {
                {
                    Key = v10.UseViewKey, 
                    Display = l_props_2.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel"), 
                    Description = l_props_2.Localization:getText("AssetConfigPackagePermissions", "UseViewDescription")
                }, 
                {
                    Key = v10.EditKey, 
                    Display = l_props_2.Localization:getText("AssetConfigPackagePermissions", "EditLabel"), 
                    Description = l_props_2.Localization:getText("AssetConfigPackagePermissions", "EditDescription")
                }
            };
        end;
    end;
    v20.getLabelForAction = function(v29) --[[ Line: 97 ]]
        -- upvalues: v20 (copy), v10 (ref)
        local l_props_3 = v20.props;
        if v29 == v10.NoAccessKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel");
        elseif v29 == v10.UseViewKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel");
        elseif v29 == v10.EditKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "EditLabel");
        elseif v29 == v10.NoneKey then
            return "";
        else
            error("Unsupported Action: " .. tostring(v29));
            return "";
        end;
    end;
end;
v19.render = function(v31) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v2 (copy), l_Separator_0 (copy), v11 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v32 = false;
    local l_props_4 = v31.props;
    local l_Stylizer_0 = v31.props.Stylizer;
    local v35 = {};
    if l_props_4.Permissions[v10.UserSubjectKey] then
        for v36, v37 in pairs(l_props_4.Permissions[v10.UserSubjectKey]) do
            if l_props_4.OwnerType ~= Enum.CreatorType.User or l_props_4.OwnerId ~= v36 and v37[v10.ActionKey] ~= v10.NoAccessKey then
                table.insert(v35, {
                    Name = v37[v10.SubjectNameKey], 
                    Id = v37[v10.SubjectIdKey], 
                    Action = v37[v10.ActionKey]
                });
            end;
        end;
        table.sort(v35, function(v38, v39) --[[ Line: 137 ]]
            return v38.Name < v39.Name;
        end);
    end;
    local v40 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v41 = v31.getUserCollaboratorPermissions();
    for v42, v43 in pairs(v35) do
        local v44 = v42 ~= #v35;
        local l_Action_0 = v43.Action;
        local v46;
        for _, v48 in pairs(v41) do
            if v48.Key == l_Action_0 then
                v46 = false;
                v32 = true;
            end;
            if v32 then
                break;
            end;
        end;
        if not v32 then
            v46 = true;
        end;
        v32 = false;
        v40["User" .. v42] = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 70), 
            LayoutOrder = v42
        }, {
            FirstSeparator = v2.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0, 0)
            }), 
            CollaboratorItem = v2.createElement(v11, {
                Enabled = l_props_4.Enabled, 
                SubjectType = Enum.CreatorType.User, 
                CollaboratorName = v43.Name, 
                CollaboratorId = v43.Id, 
                CollaboratorIcon = v5.constructRBXThumbUrl(v4.rbxThumbTypes.AvatarHeadShot, v43.Id, v4.rbxThumbSizes.AvatarHeadshotImageSize), 
                UseMask = true, 
                Items = v46 and {} or v41, 
                Action = v31.getLabelForAction(v43.Action), 
                SelectedItem = v43.Action, 
                Removable = true, 
                Removed = function() --[[ Line: 184 ]] --[[ Name: Removed ]]
                    -- upvalues: v31 (copy), v43 (copy)
                    v31.userRemoved(v43.Id);
                end, 
                PermissionChanged = function(v49) --[[ Line: 187 ]] --[[ Name: PermissionChanged ]]
                    -- upvalues: v31 (copy), v43 (copy)
                    v31.userPermissionChanged(v43.Id, v49);
                end, 
                HideLastSeparator = v42 ~= #v35
            }), 
            LastSeparator = not v44 and v2.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 1, -1)
            })
        });
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_props_4.LayoutOrder or 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 32)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v6.PERMISSIONS_UI_EDGE_PADDING)
        }), 
        UsersTitle = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0, 
            Font = v6.FONT, 
            Text = l_props_4.Localization:getText("AssetConfigPackagePermissions", "UsersCollaboratorType"), 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Visible = #v35 > 0, 
            BackgroundTransparency = 1
        }), 
        Users = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        }, v40)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v19));