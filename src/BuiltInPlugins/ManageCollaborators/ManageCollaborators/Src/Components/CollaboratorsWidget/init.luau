local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_COLLAB7167ManageCollabHandleNilOwnerId_0 = game:GetFastFlag("COLLAB7167ManageCollabHandleNilOwnerId");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v7.Style.Stylizer;
local v9 = require(l_Parent_0.Src.Util.CreateFitToContent);
local v10 = require(l_Parent_0.Src.Components.UserCollaboratorItem);
local v11 = require(l_Parent_0.Src.Components.GroupCollaboratorItem);
local v12 = require(l_Parent_0.Src.Selectors.GetUserCollaborators);
local v13 = require(l_Parent_0.Src.Selectors.GetGroupCollaborators);
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local v15 = v9("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    FillDirection = Enum.FillDirection.Vertical, 
    Padding = UDim.new(0, 0), 
    HorizontalAlignment = Enum.HorizontalAlignment.Center
});
local v16 = v3.PureComponent:extend("CollaboratorsWidget");
local v17 = require(l_Parent_0.Src.Util.PermissionsConstants);
v16.render = function(v18) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: l_COLLAB2850_FixMcTooltips_0 (copy), l_COLLAB7167ManageCollabHandleNilOwnerId_0 (copy), v10 (copy), v11 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v17 (copy), v15 (copy)
    local l_props_0 = v18.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Writable_0 = l_props_0.Writable;
    local l_NewUserCollaborators_0 = l_props_0.NewUserCollaborators;
    local l_CurrentUserCollaborators_0 = l_props_0.CurrentUserCollaborators;
    local l_NewGroupCollaborators_0 = l_props_0.NewGroupCollaborators;
    local l_CurrentGroupCollaborators_0 = l_props_0.CurrentGroupCollaborators;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v28 = if l_COLLAB2850_FixMcTooltips_0 then l_props_0.IsGroupGame else nil;
    local v29 = {};
    if l_COLLAB7167ManageCollabHandleNilOwnerId_0 and (not l_OwnerId_0 or not l_OwnerType_0) then
        return nil;
    else
        local v30 = if l_OwnerType_0 == Enum.CreatorType.User then v10 else v11;
        local v31 = l_LayoutOrderIterator_0.new();
        table.insert(v29, (v3.createElement(v30, {
            Id = l_OwnerId_0, 
            Writable = l_Writable_0, 
            LayoutOrder = v31:getNextOrder(), 
            HideSeparator = false, 
            IsGroupGame = v28
        })));
        for _, v33 in pairs(l_NewUserCollaborators_0) do
            table.insert(v29, (v3.createElement(v10, {
                LayoutOrder = v31:getNextOrder(), 
                Writable = l_Writable_0, 
                Id = v33, 
                HideSeparator = false, 
                IsGroupGame = v28
            })));
        end;
        for _, v35 in pairs(l_NewGroupCollaborators_0) do
            table.insert(v29, (v3.createElement(v11, {
                LayoutOrder = v31:getNextOrder(), 
                Writable = l_Writable_0, 
                Id = v35, 
                CurrentPermission = v17.MultipleKey, 
                HideSeparator = false, 
                IsGroupGame = v28
            })));
        end;
        for _, v37 in pairs(l_CurrentUserCollaborators_0) do
            table.insert(v29, (v3.createElement(v10, {
                LayoutOrder = v31:getNextOrder(), 
                Writable = l_Writable_0, 
                Id = v37, 
                HideSeparator = false, 
                IsGroupGame = v28
            })));
        end;
        for _, v39 in pairs(l_CurrentGroupCollaborators_0) do
            table.insert(v29, (v3.createElement(v11, {
                LayoutOrder = v31:getNextOrder(), 
                Writable = l_Writable_0, 
                Id = v39, 
                CurrentPermission = v17.MultipleKey, 
                HideSeparator = false, 
                IsGroupGame = v28
            })));
        end;
        v29[#v29].props.HideSeparator = true;
        return v3.createElement(v15, {
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1
        }, {
            v29
        });
    end;
end;
v16 = l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_ContextServices_0.Localization
})(v16);
return (v4.connect(function(v40, _) --[[ Line: 138 ]]
    -- upvalues: v12 (copy), v13 (copy)
    local v42, v43 = v12(v40);
    local v44, v45 = v13(v40);
    return {
        NewUserCollaborators = v42, 
        CurrentUserCollaborators = v43, 
        NewGroupCollaborators = v44, 
        CurrentGroupCollaborators = v45, 
        OwnerId = v40.GameOwnerMetadata.creatorId, 
        OwnerType = v40.GameOwnerMetadata.creatorType
    };
end)(v16));