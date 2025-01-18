local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local v10 = require(l_Parent_0.Src.Actions);
local v11 = require(l_Parent_0.Src.TagManager);
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v20 = require(script.Parent.Icon);
local v21 = require(script.Parent.TagRenameTextInput);
local v22 = v2.PureComponent:extend("TagListRow");
v22.init = function(v23) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy)
    v23.onPress = function() --[[ Line: 87 ]]
        -- upvalues: v23 (copy)
        local l_props_0 = v23.props;
        local v25 = l_props_0.GroupName and l_props_0.GroupName ~= "";
        local v26 = not l_props_0.Disabled;
        if v25 then
            if v26 and l_props_0.groupMenu ~= nil and l_props_0.groupMenu == l_props_0.GroupName then
                local v27 = l_props_0.renamingGroup ~= l_props_0.GroupName;
                l_props_0.setRenamingGroup(l_props_0.GroupName, v27);
                return;
            end;
        elseif l_props_0.tagMenu ~= nil and l_props_0.tagMenu == l_props_0.TagName then
            local v28 = l_props_0.renamingTag ~= l_props_0.TagName;
            l_props_0.setRenaming(l_props_0.TagName, v28);
        end;
    end;
    v23.onClick = function() --[[ Line: 104 ]]
        -- upvalues: v23 (copy)
        local l_props_1 = v23.props;
        local v30 = l_props_1.GroupName and l_props_1.GroupName ~= "";
        local v31 = not l_props_1.Disabled;
        if v30 then
            if v31 and (l_props_1.groupMenu == nil or l_props_1.groupMenu ~= l_props_1.GroupName) then
                l_props_1.openGroupMenu(l_props_1.GroupName);
                return;
            end;
        elseif l_props_1.tagMenu == nil or l_props_1.tagMenu ~= l_props_1.TagName then
            l_props_1.openTagMenu(l_props_1.TagName);
        end;
    end;
    v23.toggleGroupMembership = function() --[[ Line: 119 ]]
        -- upvalues: v23 (copy), v11 (ref)
        local l_props_2 = v23.props;
        local v33 = l_props_2.TagGroup == l_props_2.assigningGroup;
        v11.Get():SetGroup(l_props_2.TagName, v33 and "" or l_props_2.assigningGroup);
    end;
    v23.toggleAssignment = function() --[[ Line: 125 ]]
        -- upvalues: v23 (copy), v11 (ref)
        local l_props_3 = v23.props;
        v11.Get():SetTag(l_props_3.TagName, not l_props_3.IsTagAssignedToAll);
    end;
    v23.toggleVisible = function() --[[ Line: 130 ]]
        -- upvalues: v23 (copy), v11 (ref)
        local l_props_4 = v23.props;
        if l_props_4.GroupName and l_props_4.GroupName ~= "" then
            v11.Get():ToggleGroupVisibility(v23.props.GroupName);
            return;
        else
            v11.Get():SetVisible(l_props_4.TagName, not l_props_4.IsVisibleToggled);
            return;
        end;
    end;
    v23.toggleGroup = function() --[[ Line: 140 ]]
        -- upvalues: v23 (copy)
        local l_props_5 = v23.props;
        l_props_5.ToggleGroup(l_props_5.GroupName);
    end;
    v23.editGroupMembership = function() --[[ Line: 145 ]]
        -- upvalues: v23 (copy)
        local l_props_6 = v23.props;
        local v38 = l_props_6.GroupName == l_props_6.assigningGroup;
        if not v38 then
            l_props_6.openGroupMenu(l_props_6.GroupName);
        end;
        l_props_6.setAssigningGroup(v38 and "" or l_props_6.GroupName);
    end;
end;
v22.render = function(v39) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_HoverArea_0 (copy), l_IconButton_0 (copy), l_Checkbox_0 (copy), l_Tooltip_0 (copy), v20 (copy), l_TextLabel_0 (copy), v21 (copy)
    local l_props_7 = v39.props;
    local l_Localization_1 = l_props_7.Localization;
    local l_TagListRow_0 = l_props_7.Stylizer.TagListRow;
    local v43 = l_LayoutOrderIterator_0.new();
    local l_VisibleIcon_0 = l_props_7.Stylizer.VisibleIcon;
    local l_VisibleOffIcon_0 = l_props_7.Stylizer.VisibleOffIcon;
    local v46 = l_props_7.GroupName and l_props_7.GroupName ~= "";
    local v47 = not l_props_7.Disabled;
    local v48 = false;
    if l_props_7.assigningGroup ~= nil then
        v48 = l_props_7.assigningGroup ~= "";
    end;
    local v49 = l_props_7.TagGroup == l_props_7.assigningGroup;
    local v50 = l_props_7.GroupName == l_props_7.assigningGroup;
    local v51 = v48 and not v50;
    local v52 = not v46;
    local v53 = not v46;
    local v54 = v46 and not v51;
    local v55 = not v48;
    local v56 = false;
    if l_props_7.renamingGroup ~= nil and l_props_7.renamingGroup == l_props_7.GroupName then
        v56 = true;
    elseif l_props_7.renamingTag ~= nil and l_props_7.renamingTag == l_props_7.TagName then
        v56 = true;
    end;
    local v57 = if v49 then l_Localization_1:getText("Tooltip", "UnassignFromGroup") else l_Localization_1:getText("Tooltip", "AssignToGroup");
    local v58 = if l_props_7.IsTagAssignedToAll then l_Localization_1:getText("Tooltip", "RemoveTag") else l_Localization_1:getText("Tooltip", "ApplyTag");
    local v59 = nil;
    local _ = false;
    if if v46 then l_props_7.groupMenu == l_props_7.GroupName else l_props_7.tagMenu == l_props_7.TagName then
        v59 = "SelectedTag";
    elseif v39.state.hovered then
        v59 = "PaneHover";
    end;
    local v61 = v59 or "None";
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_7.LayoutOrder, 
        Size = l_TagListRow_0.Size
    }, {
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            MouseEnter = function() --[[ Line: 215 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v39 (copy)
                v39:setState({
                    hovered = true
                });
            end, 
            MouseLeave = function() --[[ Line: 220 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v39 (copy)
                v39:setState({
                    hovered = false
                });
            end
        }), 
        RootPane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_TagListRow_0.Spacing, 
            Padding = if not not v46 or l_props_7.TagGroup == "" then l_TagListRow_0.PaddingUnindented else l_TagListRow_0.PaddingIndented, 
            Style = v59, 
            OnPress = v39.onPress, 
            OnClick = v39.onClick
        }, {
            ArrowImage = v46 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v61, 
                LeftIcon = if l_props_7.IsGroupCollapsed then l_TagListRow_0.ClosedArrowImage else l_TagListRow_0.OpenArrowImage, 
                OnClick = v39.toggleGroup, 
                LayoutOrder = v43:getNextOrder()
            }), 
            CheckboxPane = v52 and v2.createElement(l_Pane_0, {
                LayoutOrder = v43:getNextOrder(), 
                Size = l_TagListRow_0.CheckboxSize, 
                Layout = Enum.FillDirection.Horizontal
            }, {
                ToggleGroupMembershipButton = v48 and v2.createElement(l_IconButton_0, {
                    BackgroundStyle = v61, 
                    LeftIcon = if v49 then l_TagListRow_0.UnassignIcon else l_TagListRow_0.AssignIcon, 
                    OnClick = v39.toggleGroupMembership, 
                    IconColor = if v49 then l_TagListRow_0.UnassignIconColor else l_TagListRow_0.AssignIconColor, 
                    TooltipText = v57
                }), 
                Checkbox = not v48 and v2.createElement(l_Checkbox_0, {
                    Checked = if l_props_7.IsTagAssignedToSome then l_Checkbox_0.Indeterminate else l_props_7.IsTagAssignedToAll, 
                    OnClick = v39.toggleAssignment
                }, {
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = v58
                    })
                })
            }), 
            TagImage = v53 and v2.createElement(v20, {
                Name = l_props_7.TagIcon, 
                OnClick = v39.OnButtonClicked, 
                LayoutOrder = v43:getNextOrder()
            }), 
            NameText = not v56 and v2.createElement(l_TextLabel_0, {
                LayoutOrder = v43:getNextOrder(), 
                Text = if v46 then l_props_7.GroupName else l_props_7.TagName, 
                Size = if v46 then l_TagListRow_0.GroupTextSize else l_TagListRow_0.TextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            RenameTextInput = v56 and v2.createElement(v21, {
                LayoutOrder = v43:getNextOrder(), 
                Size = if v46 then l_TagListRow_0.GroupTextSize else l_TagListRow_0.TextSize
            }), 
            EditGroupMembership = v54 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v61, 
                LeftIcon = if not v47 or v51 then nil else if v50 then l_TagListRow_0.StopAssigningIcon else l_TagListRow_0.EditAssignmentsIcon, 
                OnClick = v39.editGroupMembership, 
                LayoutOrder = v43:getNextOrder(), 
                TooltipText = if v50 then l_Localization_1:getText("Tooltip", "EndGroupAssignment") else l_Localization_1:getText("Tooltip", "StartGroupAssignment")
            }), 
            VisibleToggleButton = v55 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v61, 
                LeftIcon = if l_props_7.IsVisibleToggled then l_VisibleIcon_0 else l_VisibleOffIcon_0, 
                OnClick = v39.toggleVisible, 
                LayoutOrder = v43:getNextOrder(), 
                TooltipText = l_Localization_1:getText("Tooltip", "ToggleVisibility")
            })
        })
    });
end;
v22 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v22);
return v3.connect(function(v62, _) --[[ Line: 310 ]] --[[ Name: mapStateToProps ]]
    return {
        assigningGroup = v62.AssigningGroup, 
        groupMenu = v62.GroupMenu, 
        renamingGroup = v62.RenamingGroup, 
        tagMenu = v62.TagMenu, 
        renamingTag = v62.RenamingTag
    };
end, function(v64) --[[ Line: 320 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy)
    return {
        openTagMenu = function(v65) --[[ Line: 322 ]] --[[ Name: openTagMenu ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10.OpenTagMenu(v65));
        end, 
        setRenaming = function(v66, v67) --[[ Line: 325 ]] --[[ Name: setRenaming ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10.SetRenaming(v66, v67));
        end, 
        setAssigningGroup = function(v68) --[[ Line: 328 ]] --[[ Name: setAssigningGroup ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10.SetAssigningGroup(v68));
        end, 
        setRenamingGroup = function(v69, v70) --[[ Line: 331 ]] --[[ Name: setRenamingGroup ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10.SetRenamingGroup(v69, v70));
        end, 
        openGroupMenu = function(v71) --[[ Line: 334 ]] --[[ Name: openGroupMenu ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10.OpenGroupMenu(v71));
        end
    };
end)(v22);