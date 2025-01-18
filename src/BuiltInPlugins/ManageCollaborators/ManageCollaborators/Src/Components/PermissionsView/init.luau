local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Cryo);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v7.Style.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v7.UI;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Container_0 = l_UI_0.Container;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v17 = require(l_Parent_0.Src.Util.ShowDialog);
local v18 = require(l_Parent_0.Src.Components.CollaboratorsWidget);
local v19 = require(l_Parent_0.Src.Components.CollaboratorSearchWidget);
local v20 = require(l_Parent_0.Src.Components.Footer);
local v21 = require(l_Parent_0.Src.Thunks.SavePermissions);
local v22 = require(l_Parent_0.Src.Thunks.PermissionsLoader);
local v23 = require(l_Parent_0.Src.Util.LoadState);
local v24 = require(l_Parent_0.Src.Util.SaveState);
local v25 = require(l_Parent_0.Src.Selectors.GetHasCollaborators);
local v26 = require(l_Parent_0.Src.Selectors.GetHasCurrentEditCollaborators);
local v27 = require(l_Parent_0.Src.Util.IsTeamCreateEnabled);
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local v29 = require(l_Parent_0.Src.Util.Analytics);
local v30 = v4.PureComponent:extend("PermissionsView");
v30.isGroupGame = function(v31) --[[ Line: 48 ]] --[[ Name: isGroupGame ]]
    return v31.props.OwnerType == Enum.CreatorType.Group;
end;
v30.isLoggedInUserGameOwner = function(v32) --[[ Line: 55 ]] --[[ Name: isLoggedInUserGameOwner ]]
    -- upvalues: l_StudioService_0 (copy)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_props_0 = v32.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_GroupOwnerUserId_0 = l_props_0.GroupOwnerUserId;
    if v32:isGroupGame() then
        return l_l_StudioService_0_UserId_0 == l_GroupOwnerUserId_0;
    else
        return l_l_StudioService_0_UserId_0 == l_OwnerId_0;
    end;
end;
v30.init = function(v37) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v37.scrollingFrameRef = v4.createRef();
    v37.contentHeightChanged = function(v38) --[[ Line: 71 ]]
        -- upvalues: v37 (copy)
        local l_current_0 = v37.scrollingFrameRef.current;
        if l_current_0 then
            local l_Stylizer_1 = v37.props.Stylizer;
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v38.AbsoluteContentSize.Y + l_Stylizer_1.scrollingFrame.yPadding);
        end;
    end;
end;
v30.onSavePressed = function(v41) --[[ Line: 80 ]] --[[ Name: onSavePressed ]]
    -- upvalues: v27 (copy), l_StudioPublishService_0 (copy)
    v41.props.SavePermissions(v41:isGroupGame());
    if not v27() then
        l_StudioPublishService_0:PublishThenTurnOnTeamCreate();
    end;
end;
v30.onCancelPressed = function(v42, v43) --[[ Line: 91 ]] --[[ Name: onCancelPressed ]]
    -- upvalues: v29 (copy), v17 (copy), l_StyledDialog_0 (copy), v4 (copy)
    local l_props_1 = v42.props;
    local l_Plugin_0 = l_props_1.Plugin;
    local l_Localization_1 = l_props_1.Localization;
    local l_Stylizer_2 = l_props_1.Stylizer;
    local l_CloseWidget_0 = l_props_1.CloseWidget;
    v29.reportCancelPressed(v42:isGroupGame());
    if not v43 then
        l_CloseWidget_0();
        return;
    else
        local v49 = {
            {
                Key = "NO", 
                Text = l_Localization_1:getText("Buttons", "No")
            }, 
            {
                Key = "YES", 
                Text = l_Localization_1:getText("Buttons", "Yes"), 
                Style = "RoundPrimary"
            }
        };
        v17(l_Plugin_0, l_Localization_1, l_StyledDialog_0, {
            Buttons = v49, 
            MinContentSize = l_Stylizer_2.cancelDialog.Size, 
            Style = "CancelDialog", 
            OnButtonPressed = function(v50) --[[ Line: 116 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: l_CloseWidget_0 (copy)
                if v50 == "YES" then
                    l_CloseWidget_0();
                end;
            end, 
            OnClose = function() --[[ Line: 121 ]] --[[ Name: OnClose ]]

            end, 
            Title = l_Localization_1:getText("Title", "DiscardChanges"), 
            Modal = true
        }, {
            Contents = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = l_Stylizer_2.cancelDialog.Text.TextSize, 
                Text = l_Localization_1:getText("Description", "DiscardChanges"), 
                TextColor3 = l_Stylizer_2.cancelDialog.Text.TextColor3, 
                Font = l_Stylizer_2.cancelDialog.Text.Font, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = l_Stylizer_2.cancelDialog.Position
            })
        });
        return;
    end;
end;
v30.render = function(v51) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v24 (copy), v23 (copy), v27 (copy), l_LayoutOrderIterator_0 (copy), v4 (copy), l_ScrollingFrame_0 (copy), v19 (copy), v18 (copy), l_COLLAB2850_FixMcTooltips_0 (copy), v6 (copy), l_Container_0 (copy), v20 (copy), l_LoadingIndicator_0 (copy)
    local l_props_2 = v51.props;
    if not l_props_2.Enabled then
        return;
    else
        local l_Stylizer_3 = l_props_2.Stylizer;
        local l_Localization_2 = l_props_2.Localization;
        local l_SaveState_0 = l_props_2.SaveState;
        local l_LoadState_0 = l_props_2.LoadState;
        local l_HasCollaborators_0 = l_props_2.HasCollaborators;
        local l_HasCurrentEditCollaborators_0 = l_props_2.HasCurrentEditCollaborators;
        if l_SaveState_0 == v24.Saved then
            l_props_2.CloseWidget();
            return;
        else
            local v59 = l_LoadState_0 == v23.Loaded;
            local v60 = false;
            local v61 = nil;
            if l_LoadState_0 == v23.Unloaded then
                l_props_2.LoadPermissions();
            end;
            if l_LoadState_0 == v23.LoadFailed or l_SaveState_0 == v24.SaveFailed then
                v60 = true;
                v61 = if l_LoadState_0 == v23.LoadFailed then l_Localization_2:getText("FailureMessage", "LoadFailure") else l_Localization_2:getText("FailureMessage", "SaveFailure");
            end;
            local v62 = v51:isLoggedInUserGameOwner();
            local v63 = v59 and not v60;
            local v64 = v27();
            local v65 = v63 and not v64 and (l_HasCollaborators_0 or l_HasCurrentEditCollaborators_0);
            local v66 = l_Localization_2:getText("Description", l_HasCurrentEditCollaborators_0 and "SaveEnableTcCurrentEditors" or "SaveEnableTC");
            local l_height_0 = l_Stylizer_3.footer.height;
            if v65 then
                l_height_0 = l_height_0 + l_Stylizer_3.saveMessage.boxHeight;
            end;
            local v68 = l_LayoutOrderIterator_0.new();
            local v69 = l_LayoutOrderIterator_0.new();
            return v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_3.backgroundColor
            }, {
                Layout = v63 and v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Stylizer_3.permissionsView.Padding)
                }), 
                ScrollingFrame = v63 and v4.createElement(l_ScrollingFrame_0, {
                    LayoutOrder = v68:getNextOrder(), 
                    Size = UDim2.new(1, 0, 1, -l_height_0), 
                    Layout = Enum.FillDirection.Vertical, 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    Spacing = UDim.new(0, if v62 then l_Stylizer_3.scrollingFrame.yPadding else l_Stylizer_3.scrollingFrame.yPaddingNonOwner)
                }, {
                    SearchBarWidget = v62 and v4.createElement(v19, {
                        LayoutOrder = v69:getNextOrder(), 
                        Writable = true, 
                        IsGroupGame = v51:isGroupGame()
                    }), 
                    Frame = not v62 and v4.createElement("Frame", {
                        BackgroundTransparency = 1
                    }), 
                    CollaboratorsWidget = v4.createElement(v18, {
                        LayoutOrder = v69:getNextOrder(), 
                        Writable = v62, 
                        IsGroupGame = if l_COLLAB2850_FixMcTooltips_0 then v51:isGroupGame() else nil
                    })
                }), 
                TextFrame = if v65 then v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = l_Stylizer_3.backgroundColor, 
                    LayoutOrder = v68:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_3.saveMessage.boxHeight), 
                    BorderSizePixel = 0
                }, {
                    Text = v4.createElement("TextLabel", v6.Dictionary.join(l_Stylizer_3.saveMessage.textStyle, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = l_Stylizer_3.saveMessage.InnerTextPosition, 
                        Text = v66, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BorderSizePixel = 0, 
                        TextWrapped = true, 
                        Size = UDim2.new(0.55, 0, 1, 0), 
                        BackgroundTransparency = 1
                    }))
                }) else nil, 
                FooterContent = v63 and v4.createElement(l_Container_0, {
                    LayoutOrder = v68:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_3.footer.height)
                }, {
                    Footer = v4.createElement(v20, {
                        IsTeamCreateEnabled = v64, 
                        OnSavePressed = function() --[[ Line: 271 ]] --[[ Name: OnSavePressed ]]
                            -- upvalues: v51 (copy)
                            v51:onSavePressed();
                        end, 
                        OnCancelPressed = function(v70) --[[ Line: 274 ]] --[[ Name: OnCancelPressed ]]
                            -- upvalues: v51 (copy)
                            v51:onCancelPressed(v70);
                        end
                    })
                }), 
                LoadingIndicator = not v59 and not v60 and v4.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }), 
                FailureText = v60 and v4.createElement("TextLabel", {
                    Text = v61, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.25), 
                    TextColor3 = l_Stylizer_3.fontStyle.Normal.TextColor3, 
                    TextSize = l_Stylizer_3.fontStyle.Normal.TextSize, 
                    Font = l_Stylizer_3.fontStyle.Normal.Font
                })
            });
        end;
    end;
end;
v30 = l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v30);
return (v5.connect(function(v71, _) --[[ Line: 301 ]]
    -- upvalues: v23 (copy), v24 (copy), v25 (copy), v26 (copy)
    return {
        LoadState = v71.LoadState.CurrentLoadState or v23.Unloaded, 
        SaveState = v71.SaveState.CurrentSaveState or v24.Unsaved, 
        OwnerId = v71.GameOwnerMetadata.creatorId, 
        OwnerType = v71.GameOwnerMetadata.creatorType, 
        GroupOwnerUserId = v71.GameOwnerMetadata.groupOwnerId, 
        HasCollaborators = v25(v71), 
        HasCurrentEditCollaborators = v26(v71), 
        GroupRolePermissions = v71.GroupRolePermissions.PermissionsByRole
    };
end, function(v73) --[[ Line: 312 ]]
    -- upvalues: v22 (copy), v21 (copy)
    return {
        LoadPermissions = function() --[[ Line: 314 ]] --[[ Name: LoadPermissions ]]
            -- upvalues: v73 (copy), v22 (ref)
            v73(v22:LoadPermissions());
        end, 
        SavePermissions = function(v74) --[[ Line: 317 ]] --[[ Name: SavePermissions ]]
            -- upvalues: v73 (copy), v21 (ref)
            v73(v21(v74));
        end
    };
end)(v30));