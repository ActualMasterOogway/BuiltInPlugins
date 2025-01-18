local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
local v5 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.DetailedDropdownItem);
local l_IconButton_0 = v3.UI.IconButton;
local l_Tooltip_0 = v3.UI.Tooltip;
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Images);
local v10 = require(l_Util_0.Constants);
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v12 = require(l_Permissions_0.CollaboratorThumbnail);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = v2.PureComponent:extend("CollaboratorItem");
local function v18(v17) --[[ Line: 54 ]] --[[ Name: CollaboratorIcon ]]
    -- upvalues: v2 (copy), v12 (copy)
    return v2.createElement(v12, {
        Size = UDim2.new(0, 50, 0, 50), 
        LayoutOrder = v17.LayoutOrder or 0, 
        Image = v17.IsLoadedThumbnail and v17.CollaboratorIcon or v17.DefaultIcon, 
        UseMask = v17.UseMask, 
        IsLoadedThumbnail = v17.IsLoadedThumbnail
    });
end;
v16.init = function(v19) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v5 (copy)
    v19.state = {
        assetFetchStatus = nil, 
        showDropdown = false
    };
    v19.isMounted = false;
    v19.onItemActivated = function(v20) --[[ Line: 72 ]]
        -- upvalues: v19 (copy)
        local l_props_0 = v19.props;
        if l_props_0.Enabled and l_props_0.PermissionChanged then
            l_props_0.PermissionChanged(v20.Key);
        end;
        v19.closeDropdown();
    end;
    v19.onDropdownRenderItem = function(v22, _, v24) --[[ Line: 80 ]]
        -- upvalues: v2 (ref), v5 (ref), v19 (copy)
        return v2.createElement(v5, {
            Key = v22.Key, 
            Description = v22.Description, 
            OnActivated = v24, 
            Selected = v22.Key == v19.props.SelectedItem, 
            Title = v22.Display
        });
    end;
    v19.openDropdown = function() --[[ Line: 90 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showDropdown = true
        });
    end;
    v19.closeDropdown = function() --[[ Line: 95 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showDropdown = false
        });
    end;
    v19.onDelete = function() --[[ Line: 101 ]]
        -- upvalues: v19 (copy)
        local l_props_1 = v19.props;
        if l_props_1.Enabled and l_props_1.Removed then
            l_props_1.Removed();
        end;
    end;
end;
v16.didMount = function(v26) --[[ Line: 109 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContentProvider_0 (copy)
    v26.isMounted = true;
    spawn(function() --[[ Line: 111 ]]
        -- upvalues: v26 (copy), l_ContentProvider_0 (ref)
        local v27 = {
            v26.props.CollaboratorIcon
        };
        l_ContentProvider_0:PreloadAsync(v27, function(_, v29) --[[ Line: 113 ]] --[[ Name: setStatus ]]
            -- upvalues: v26 (ref)
            if v26.isMounted then
                v26:setState({
                    assetFetchStatus = v29
                });
            end;
        end);
    end);
end;
v16.willUnmount = function(v30) --[[ Line: 124 ]] --[[ Name: willUnmount ]]
    v30.isMounted = false;
end;
v16.render = function(v31) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v2 (copy), v18 (copy), v10 (copy), l_DropdownMenu_0 (copy), l_IconButton_0 (copy), l_Tooltip_0 (copy)
    local l_props_2 = v31.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    l_props_2.Items = l_props_2.Items or {};
    local v34 = l_props_2.Removable and #l_props_2.Items > 0 and not l_props_2.IsLoading;
    local v35 = v31.state.assetFetchStatus == Enum.AssetFetchStatus.Success;
    local v36 = nil;
    v36 = if l_props_2.SubjectType == Enum.CreatorType.User then v9.DEFAULT_USER_THUMBNAIL else v9.DEFAULT_GROUP_THUMBNAIL;
    local l_createElement_0 = v2.createElement;
    local v38 = "Frame";
    local v39 = {
        Size = UDim2.new(1, 0, 0, 60), 
        LayoutOrder = l_props_2.LayoutOrder or 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v40 = {};
    local l_createElement_1 = v2.createElement;
    local v42 = "Frame";
    local v43 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.packagePermissions.backgroundColor
    };
    local v44 = {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 6), 
            PaddingRight = UDim.new(0, 6), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        })
    };
    local v45 = false;
    if l_props_2.CollaboratorIcon ~= nil then
        v45 = v2.createElement(v18, {
            LayoutOrder = 0, 
            Enabled = l_props_2.Enabled, 
            UseMask = l_props_2.UseMask, 
            CollaboratorIcon = l_props_2.CollaboratorIcon, 
            DefaultIcon = v36, 
            IsLoadedThumbnail = v35
        });
    end;
    v44.Icon = v45;
    v44.Labels = v2.createElement("Frame", {
        Size = UDim2.new(1, -290, 0, 50), 
        Position = UDim2.new(0, 80, 0, 0), 
        LayoutOrder = l_props_2.LayoutOrder or 0, 
        BackgroundTransparency = 1
    }, {
        PrimaryLabel = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, l_props_2.SecondaryText and 0.5 or 1, 0), 
            Text = l_props_2.CollaboratorName or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v10.FONT, 
            TextSize = v10.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
    v44.DropdownFrame = v2.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(1, -80, 0, 0), 
        Size = UDim2.new(0, 120, 0, 50)
    }, {
        Dropdown = v2.createElement(l_DropdownMenu_0, {
            Hide = not (l_props_2.Enabled and #l_props_2.Items > 0) or not v31.state.showDropdown, 
            OnFocusLost = function() --[[ Line: 200 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v31 (copy)
                v31.closeDropdown();
            end, 
            Items = l_props_2.Items, 
            OnItemActivated = v31.onItemActivated, 
            OnRenderItem = v31.onDropdownRenderItem, 
            Width = 300
        })
    });
    v44.Dropdown = v2.createElement(l_IconButton_0, {
        Disabled = not (l_props_2.Enabled and #l_props_2.Items > 0), 
        RightIcon = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        Text = l_props_2.Action, 
        OnClick = function() --[[ Line: 213 ]] --[[ Name: OnClick ]]
            -- upvalues: v31 (copy)
            v31.openDropdown();
        end, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -80, 0, 0), 
        Size = UDim2.new(0, 120, 0, 50)
    }, {
        TextPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4)
        })
    });
    v44.Delete = v34 and v2.createElement(l_IconButton_0, {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundStyle = "RoundBox", 
        IconColor = l_Stylizer_0.assetConfig.packagePermissions.collaboratorItem.deleteButton, 
        LeftIcon = v9.CLOSE_ICON, 
        OnClick = v31.onDelete, 
        Position = UDim2.new(1, 0, 0, 0), 
        Size = UDim2.new(0, 50, 0, 50)
    });
    v44.Tooltip = l_props_2.TooltipText and v2.createElement(l_Tooltip_0, {
        Text = l_props_2.TooltipText
    });
    v40.Contents = l_createElement_1(v42, v43, v44);
    return l_createElement_0(v38, v39, v40);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16));