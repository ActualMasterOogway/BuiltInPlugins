local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_ScrollingFrame_0 = v4.UI.ScrollingFrame;
local l_Separator_0 = require(l_Packages_0.Framework).UI.Separator;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v11 = require(l_Permissions_0.PackageOwnerWidget);
local v12 = require(l_Permissions_0.CollaboratorSearchWidget);
local v13 = require(l_Permissions_0.CollaboratorsWidget);
local v14 = require(l_Permissions_0.PermissionsConstants);
local l_Util_0 = l_Parent_0.Core.Util;
local v16 = require(l_Util_0.Constants);
local v17 = require(l_Parent_0.Core.Thunks.SearchCollaborators);
local v18 = require(l_Parent_0.Core.Actions.SetCollaborators);
local v19 = require(l_Parent_0.Core.Actions.SetGroupMetadata);
local v20 = require(l_Parent_0.Core.Actions.AddChange);
local v21 = v2.PureComponent:extend("Permissions");
v21.init = function(v22) --[[ Line: 45 ]] --[[ Name: init ]]
    v22.state = {
        OwnerType = Enum.CreatorType[v22.props.Owner.type]
    };
end;
v21.render = function(v23) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v14 (copy), v16 (copy), v2 (copy), l_ScrollingFrame_0 (copy), v11 (copy), l_Separator_0 (copy), v12 (copy), v13 (copy)
    local l_Stylizer_0 = v23.props.Stylizer;
    local v25 = l_LayoutOrderIterator_0.new();
    local v26 = true;
    if v23.props.CurrentUserPackagePermission ~= v14.OwnKey then
        v26 = v23.props.CurrentUserPackagePermission == v14.EditKey;
    end;
    local v27 = v23.props.CurrentUserPackagePermission == v14.OwnKey;
    local v28 = v23.state.OwnerType == Enum.CreatorType.User;
    local v29 = v16.FONT_SIZE_MEDIUM * 2;
    return v2.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        EnableScrollBarBackground = true, 
        LayoutOrder = v23.props.LayoutOrder, 
        Size = v23.props.Size
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v16.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingBottom = UDim.new(0, v16.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingLeft = UDim.new(0, v16.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingRight = UDim.new(0, v16.PERMISSIONS_UI_EDGE_PADDING)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, v16.PERMISSIONS_TAB_LIST_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        OwnerWidget = v2.createElement(v11, {
            LayoutOrder = v25:getNextOrder(), 
            Enabled = true, 
            OwnerName = v23.props.Owner.username, 
            OwnerId = v23.props.Owner.targetId, 
            OwnerType = v23.state.OwnerType, 
            CanManage = v27, 
            GroupMetadata = v23.props.GroupMetadata, 
            Permissions = v23.props.Permissions, 
            PermissionsChanged = v23.props.PermissionsChanged
        }), 
        Separator = v2.createElement(l_Separator_0, {
            LayoutOrder = v25:getNextOrder()
        }), 
        SearchbarWidget = v27 and v28 and v2.createElement(v12, {
            LayoutOrder = v25:getNextOrder(), 
            Enabled = true, 
            GroupMetadata = v23.props.GroupMetadata, 
            SearchRequested = v23.props.SearchRequested, 
            SearchData = v23.props.SearchData, 
            Permissions = v23.props.Permissions, 
            PermissionsChanged = v23.props.PermissionsChanged
        }), 
        RevokedWarningMessage = v27 and v2.createElement("TextLabel", {
            LayoutOrder = v25:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v29), 
            Text = if v28 then v23.props.Localization:getText("AssetConfigPackagePermissions", "UserOwnedWarningAllVersions") else v23.props.Localization:getText("AssetConfigPackagePermissions", "GroupOwnedWarningAllVersions"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v16.FONT, 
            TextSize = v16.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        }), 
        CollaboratorListWidget = v26 and v28 and v2.createElement(v13, {
            LayoutOrder = v25:getNextOrder(), 
            Enabled = true, 
            OwnerId = v23.props.Owner.targetId, 
            OwnerType = v23.state.OwnerType, 
            CanManage = v27, 
            GroupMetadata = v23.props.GroupMetadata, 
            Permissions = v23.props.Permissions, 
            PermissionsChanged = v23.props.PermissionsChanged, 
            GroupMetadataChanged = v23.props.GroupMetadataChanged
        })
    });
end;
local function v35(v30, v31) --[[ Line: 160 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v14 (copy)
    local v32 = {};
    local v33 = v30.collaborators or {};
    local l_NoAccessKey_0 = v14.NoAccessKey;
    if v30[v31.Owner.targetId] and Enum.CreatorType[v31.Owner.type] == Enum.CreatorType.Group then
        v32 = v30[v31.Owner.targetId].groupMetadata;
    end;
    if v31.AssetId ~= nil and v30.packagePermissions and v30.packagePermissions[v31.AssetId] then
        l_NoAccessKey_0 = v30.packagePermissions[v31.AssetId];
    end;
    return {
        Owner = v30.assetConfigData and v30.assetConfigData.Creator or v31.Owner, 
        GroupMetadata = v32, 
        Permissions = v33, 
        CurrentUserPackagePermission = l_NoAccessKey_0
    };
end;
local function v39(v36) --[[ Line: 187 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy), v18 (copy), v20 (copy), v19 (copy)
    return {
        SearchRequested = function(...) --[[ Line: 189 ]] --[[ Name: SearchRequested ]]
            -- upvalues: v36 (copy), v17 (ref)
            v36(v17(...));
        end, 
        PermissionsChanged = function(v37) --[[ Line: 192 ]] --[[ Name: PermissionsChanged ]]
            -- upvalues: v36 (copy), v18 (ref), v20 (ref)
            v36(v18(v37));
            v36(v20("permissions", v37));
        end, 
        GroupMetadataChanged = function(v38) --[[ Line: 196 ]] --[[ Name: GroupMetadataChanged ]]
            -- upvalues: v36 (copy), v19 (ref), v20 (ref)
            v36(v19(v38));
            v36(v20("groupMetadata", v38));
        end
    };
end;
v21 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21);
return v3.connect(v35, v39)(v21);