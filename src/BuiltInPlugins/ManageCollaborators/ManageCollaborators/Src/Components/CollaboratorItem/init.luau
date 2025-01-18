local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Util_0 = v4.Util;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LoadingIndicator_0 = v4.UI.LoadingIndicator;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v18 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v19 = v2.PureComponent:extend("DeleteButton");
v19.init = function(v20) --[[ Line: 26 ]] --[[ Name: init ]]
    v20.state = {
        isHovered = false
    };
end;
v19.render = function(v21) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v21.props;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_OnClicked_0 = l_props_0.OnClicked;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v26 = v21.state.isHovered and 0 or 1;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(0, l_Stylizer_1.collaboratorItem.deleteButton.size, 0, l_Stylizer_1.collaboratorItem.deleteButton.size), 
        Position = UDim2.new(1, l_Stylizer_1.collaboratorItem.xOffset, 0.5, 0), 
        AnchorPoint = Vector2.new(1, 0.5), 
        Image = l_Stylizer_1.deleteIcon, 
        BackgroundTransparency = v26, 
        BackgroundColor3 = l_Stylizer_1.collaboratorItem.deleteButton.hovered, 
        [v2.Event.Activated] = function() --[[ Line: 49 ]]
            -- upvalues: l_Enabled_0 (copy), l_OnClicked_0 (copy)
            if l_Enabled_0 and l_OnClicked_0 then
                l_OnClicked_0();
            end;
        end, 
        [v2.Event.MouseEnter] = function() --[[ Line: 54 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                isHovered = true
            });
        end, 
        [v2.Event.MouseLeave] = function() --[[ Line: 59 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                isHovered = false
            });
        end
    });
end;
v19 = l_withContext_0({
    Stylizer = l_Stylizer_0
})(v19);
local v27 = v2.PureComponent:extend("CollaboratorItem");
v27.defaultProps = {
    Writable = true, 
    Loading = false
};
v27.getCurrentPermissionLabel = function(v28) --[[ Line: 78 ]] --[[ Name: getCurrentPermissionLabel ]]
    -- upvalues: v18 (copy)
    local l_props_1 = v28.props;
    local l_CurrentPermission_0 = l_props_1.CurrentPermission;
    local l_AvailablePermissions_0 = l_props_1.AvailablePermissions;
    local l_Localization_1 = l_props_1.Localization;
    if l_CurrentPermission_0 == v18.MultipleKey then
        return l_Localization_1:getText("PermissionLabels", "Multiple");
    else
        for _, v34 in ipairs(l_AvailablePermissions_0) do
            if v34.Key == l_CurrentPermission_0 then
                return v34.Display;
            end;
        end;
        assert(false);
        return;
    end;
end;
createTextLabel = function(v35, v36, v37, v38, v39) --[[ Line: 99 ]] --[[ Name: createTextLabel ]]
    -- upvalues: v2 (copy), l_TextLabel_0 (copy)
    return v2.createElement(l_TextLabel_0, {
        LayoutOrder = v39, 
        Size = UDim2.new(1, 0, 0, v37), 
        Style = v36, 
        Text = v35, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v38), 
            PaddingLeft = UDim.new(0, v38)
        })
    });
end;
v27.init = function(v40) --[[ Line: 116 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Button_0 (copy)
    v40.onItemActivated = function(v41) --[[ Line: 117 ]]
        -- upvalues: v40 (copy)
        if v40.props.Writable and v41.Key ~= v40.props.CurrentPermission then
            v40.props.OnPermissionChanged(v41.Key);
        end;
    end;
    v40.onRenderItem = function(v42, v43, v44) --[[ Line: 123 ]]
        -- upvalues: v40 (copy), v2 (ref), l_Button_0 (ref)
        local l_Stylizer_2 = v40.props.Stylizer;
        local l_Display_0 = v42.Display;
        local l_Description_0 = v42.Description;
        return v2.createElement(l_Button_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_2.selectInput.button.height), 
            LayoutOrder = v43, 
            OnClick = v44
        }, {
            UILayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 0), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            MainTextLabel = createTextLabel(l_Display_0, "Normal", l_Stylizer_2.fontStyle.Normal.TextSize, l_Stylizer_2.selectInput.padding, 0), 
            DescriptionTextLabel = createTextLabel(l_Description_0, "SubText", l_Stylizer_2.fontStyle.Subtext.TextSize, l_Stylizer_2.selectInput.padding, 1)
        });
    end;
end;
v27.render = function(v48) --[[ Line: 160 ]] --[[ Name: render ]]
    -- upvalues: l_COLLAB2850_FixMcTooltips_0 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), v3 (copy), l_LoadingIndicator_0 (copy), l_SelectInput_0 (copy), l_Tooltip_0 (copy), v19 (ref), l_Separator_0 (copy)
    local l_props_2 = v48.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Name_0 = l_props_2.Name;
    local l_Icon_0 = l_props_2.Icon;
    local l_Writable_0 = l_props_2.Writable;
    local l_Loading_0 = l_props_2.Loading;
    local l_Removable_0 = l_props_2.Removable;
    local l_OnRemoved_0 = l_props_2.OnRemoved;
    local l_AvailablePermissions_1 = l_props_2.AvailablePermissions;
    local l_IsRolesetCollaborator_0 = l_props_2.IsRolesetCollaborator;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local v60 = if not l_COLLAB2850_FixMcTooltips_0 then l_props_2.hidePermissionsForNonGroupOwner else nil;
    local v61 = if l_COLLAB2850_FixMcTooltips_0 then l_props_2.TooltipText else nil;
    local v62 = if l_COLLAB2850_FixMcTooltips_0 then l_props_2.IsOwner else nil;
    local l_Localization_2 = l_props_2.Localization;
    local l_Stylizer_3 = l_props_2.Stylizer;
    local v65 = if l_COLLAB2850_FixMcTooltips_0 then l_Writable_0 else l_Writable_0 and #l_AvailablePermissions_1 > 1;
    local v66 = if l_COLLAB2850_FixMcTooltips_0 then l_Removable_0 else l_Writable_0 and l_Removable_0;
    local v67 = if l_IsRolesetCollaborator_0 then l_Stylizer_3.collaboratorItem.rolesetFrame else l_Stylizer_3.collaboratorItem.nonRolesetFrame;
    local v68 = not l_IsRolesetCollaborator_0 and v66 and -40 or 0;
    local v69 = if l_Icon_0 then l_Stylizer_3.collaboratorItem.collaboratorName.withIcon.xOffset else l_Stylizer_3.collaboratorItem.collaboratorName.withoutIcon.xOffset;
    local v70 = l_LayoutOrderIterator_0.new();
    local v71 = nil;
    local v72 = nil;
    if not l_COLLAB2850_FixMcTooltips_0 then
        v71 = v60 or not v65;
        v72 = if v60 then l_Localization_2:getText("PermissionDescriptions", "CannotViewGroupRoles") else l_Localization_2:getText("PermissionDescriptions", "FriendToEdit");
    end;
    local v73 = if l_COLLAB2850_FixMcTooltips_0 then v62 else not l_Removable_0 and not l_IsRolesetCollaborator_0;
    local v74 = if l_COLLAB2850_FixMcTooltips_0 then not v62 else l_Removable_0 or l_IsRolesetCollaborator_0;
    local v75 = if l_COLLAB2850_FixMcTooltips_0 then v48:getCurrentPermissionLabel() else v60 and "" or v48:getCurrentPermissionLabel();
    local v76 = if l_COLLAB2850_FixMcTooltips_0 then v61 else v71;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v67.width, 0, v67.height), 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Position = v67.position, 
        AnchorPoint = v67.anchorPoint, 
        BorderSizePixel = 0
    }, {
        IconContainer = l_Icon_0 and v2.createElement("Frame", {
            LayoutOrder = v70:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_3.collaboratorItem.iconContainerSize, 0, l_Stylizer_3.collaboratorItem.iconContainerSize), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1
        }, {
            Icon = l_Icon_0
        }), 
        CollaboratorName = v2.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_3.fontStyle.Normal, {
            LayoutOrder = v70:getNextOrder(), 
            Size = if l_Icon_0 then l_Stylizer_3.collaboratorItem.collaboratorName.withIcon.size else l_Stylizer_3.collaboratorItem.collaboratorName.withoutIcon.size, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v69, 0.5, 0), 
            BackgroundTransparency = 1, 
            Text = l_Name_0, 
            TextXAlignment = Enum.TextXAlignment.Left
        })), 
        OwnerLabel = if v73 then v2.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_3.fontStyle.Normal, {
            LayoutOrder = v70:getNextOrder(), 
            Size = if l_Icon_0 then l_Stylizer_3.collaboratorItem.ownerLabel.withIconSize else l_Stylizer_3.collaboratorItem.ownerLabel.withoutIconSize, 
            Position = l_Stylizer_3.collaboratorItem.ownerLabel.position, 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Text = l_Localization_2:getText("CollaboratorTypes", "Owner"), 
            TextXAlignment = Enum.TextXAlignment.Right
        })) else nil, 
        PermissionEditor = if v74 then v2.createElement("Frame", {
            LayoutOrder = v70:getNextOrder(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_Stylizer_3.selectInput.width, 0, l_Stylizer_3.collaboratorItem.permissionEditor.heightOffset), 
            Position = UDim2.new(1, v68, 0.5, l_Stylizer_3.collaboratorItem.permissionEditor.yOffset), 
            AnchorPoint = Vector2.new(1, 0.5)
        }, {
            LoadingIndicator = l_Loading_0 and v2.createElement(l_LoadingIndicator_0, {
                Size = UDim2.fromScale(1, 1)
            }), 
            PermissionsDropdown = not l_Loading_0 and v2.createElement(l_SelectInput_0, {
                Enabled = if l_COLLAB2850_FixMcTooltips_0 then v65 else not v60 and v65, 
                Items = l_AvailablePermissions_1, 
                OnItemActivated = v48.onItemActivated, 
                OnRenderItem = v48.onRenderItem, 
                PlaceholderText = v75, 
                Width = l_Stylizer_3.selectInput.width, 
                Style = v65 and "Editable" or "NonEditable"
            }) or nil, 
            Tooltip = if v76 then v2.createElement(l_Tooltip_0, {
                Text = if l_COLLAB2850_FixMcTooltips_0 then v61 else v72
            }) else nil
        }) else nil, 
        Delete = v66 and v2.createElement(v19, {
            LayoutOrder = v70:getNextOrder(), 
            Enabled = if l_COLLAB2850_FixMcTooltips_0 then not l_Loading_0 else l_Writable_0 and not l_Loading_0, 
            OnClicked = l_OnRemoved_0
        }), 
        Separator = not l_HideSeparator_0 and v2.createElement(l_Separator_0, {
            Position = UDim2.new(0.5, 0, 1, 0), 
            LayoutOrder = v70:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v27));