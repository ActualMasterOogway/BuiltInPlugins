local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.Dash);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v18 = require(l_Parent_0.Src.Actions);
local v19 = require(l_Parent_0.Src.Util.GetUniqueGroupName);
local v20 = require(script.Parent.Icon);
local v21 = require(l_Parent_0.Src.TagManager);
local v22 = require(script.Parent.TagSettingRow);
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local v24 = v2.PureComponent:extend("TagSettingsListView");
v24.init = function(v25) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: l_TagEditorShowTextSeparately_0 (copy), v21 (copy)
    if l_TagEditorShowTextSeparately_0 then
        v25.onShowTextRowClicked = function() --[[ Line: 95 ]]
            -- upvalues: v25 (copy), v21 (ref)
            local l_tag_0 = v25.props.tag;
            v21.Get():SetShowText(l_tag_0.Name, not l_tag_0.ShowText);
        end;
    end;
    v25.onAlwaysOntopRowClicked = function() --[[ Line: 101 ]]
        -- upvalues: v25 (copy), v21 (ref)
        local l_tag_1 = v25.props.tag;
        v21.Get():SetAlwaysOnTop(l_tag_1.Name, not l_tag_1.AlwaysOnTop);
    end;
    v25.onColorRowClicked = function() --[[ Line: 106 ]]
        -- upvalues: v25 (copy)
        local l_props_0 = v25.props;
        l_props_0.openColorPicker(l_props_0.tag.Name);
    end;
    v25.onIconRowClicked = function() --[[ Line: 111 ]]
        -- upvalues: v25 (copy)
        local l_props_1 = v25.props;
        l_props_1.openIconPicker(l_props_1.tag.Name);
    end;
    v25.onTaggedInstancesRowClicked = function() --[[ Line: 116 ]]
        -- upvalues: v21 (ref), v25 (copy)
        v21.Get():SelectAll(v25.props.tag.Name);
    end;
    v25.onVisualizeRowClicked = function() --[[ Line: 120 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            VisualizeAsDropdownHidden = false
        });
    end;
    v25.onGroupRowClicked = function() --[[ Line: 126 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            GroupDropdownHidden = false
        });
    end;
    v25.onVisualizeDropdownItemCloseMenu = function() --[[ Line: 132 ]]
        -- upvalues: v25 (copy)
        v25:setState(function(_) --[[ Line: 133 ]]
            return {
                VisualizeAsDropdownHidden = true
            };
        end);
    end;
    v25.onGroupDropdownItemCloseMenu = function() --[[ Line: 140 ]]
        -- upvalues: v25 (copy)
        v25:setState(function(_) --[[ Line: 141 ]]
            return {
                GroupDropdownHidden = true
            };
        end);
    end;
    v25:setState({
        VisualizeAsDropdownHidden = true, 
        GroupDropdownHidden = true
    });
end;
v24.render = function(v32) --[[ Line: 154 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_IconButton_0 (copy), v20 (copy), l_Pane_0 (copy), l_DropdownMenu_0 (copy), v21 (copy), v19 (copy), v5 (copy), l_TagEditorShowTextSeparately_0 (copy), l_Checkbox_0 (copy), l_ScrollingFrame_0 (copy), v22 (copy)
    local l_props_2 = v32.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_TagSettingsListView_0 = l_props_2.Stylizer.TagSettingsListView;
    local v36 = l_LayoutOrderIterator_0.new();
    local l_tag_2 = l_props_2.tag;
    local v38 = l_tag_2 ~= nil;
    local v39 = l_Localization_1:getText("Groups", "None");
    local v40 = l_Localization_1:getText("Groups", "NewGroup");
    local function v41() --[[ Line: 167 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_TagSettingsListView_0 (copy), v32 (copy)
        return v2.createElement(l_IconButton_0, {
            RightIcon = l_TagSettingsListView_0.TaggedInstancesRow.Icon, 
            OnClick = v32.onTaggedInstancesRowClicked
        });
    end;
    local function v42() --[[ Line: 174 ]]
        -- upvalues: v2 (ref), v20 (ref), l_tag_2 (copy), v32 (copy)
        return v2.createElement(v20, {
            Name = l_tag_2.Icon, 
            OnClick = v32.onIconRowClicked
        });
    end;
    local function v46() --[[ Line: 181 ]]
        -- upvalues: v2 (ref), l_Pane_0 (ref), l_TagSettingsListView_0 (copy), l_IconButton_0 (ref), v32 (copy), l_DropdownMenu_0 (ref), l_tag_2 (copy), v21 (ref), v19 (ref), l_Localization_1 (copy), v5 (ref), v39 (copy), v40 (copy), l_props_2 (copy)
        return v2.createElement(l_Pane_0, {
            Size = l_TagSettingsListView_0.GroupRow.Size
        }, {
            Button = v2.createElement(l_IconButton_0, {
                RightIcon = l_TagSettingsListView_0.GroupRow.Icon, 
                OnClick = v32.onGroupRowClicked
            }), 
            DropdownMenu = v2.createElement(l_DropdownMenu_0, {
                Hide = v32.state.GroupDropdownHidden, 
                OnItemActivated = function(v43, v44) --[[ Line: 191 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: l_tag_2 (ref), v21 (ref), v19 (ref), l_Localization_1 (ref), v32 (ref)
                    if v44 == 1 then
                        if l_tag_2.Group then
                            v21.Get():SetGroup(l_tag_2.Name, "");
                        else
                            local v45 = v19(l_Localization_1:getText("Info", "NewGroup"));
                            v21.Get():SetGroup(l_tag_2.Name, v45);
                        end;
                    else
                        v21.Get():SetGroup(l_tag_2.Name, v43);
                    end;
                    v32.onGroupDropdownItemCloseMenu();
                end, 
                OnFocusLost = v32.onGroupDropdownItemCloseMenu, 
                PlaceholderText = l_tag_2.Group, 
                Width = l_TagSettingsListView_0.GroupRow.DropDownWidth, 
                ItemHeight = l_TagSettingsListView_0.GroupRow.ItemHeight, 
                MaxHeight = l_TagSettingsListView_0.GroupRow.MaxHeight, 
                Icons = {
                    if l_tag_2.Group then l_TagSettingsListView_0.GroupRow.UnassignIcon else l_TagSettingsListView_0.GroupRow.NewGroupIcon
                }, 
                Items = v5.append({
                    if l_tag_2.Group then v39 else v40
                }, l_props_2.groups), 
                Priority = 2
            })
        });
    end;
    local function v47() --[[ Line: 218 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_TagSettingsListView_0 (copy), l_tag_2 (copy), v32 (copy)
        return v2.createElement(l_IconButton_0, {
            RightIcon = l_TagSettingsListView_0.ColorRow.Icon, 
            IconColor = l_tag_2.Color, 
            OnClick = v32.onColorRowClicked
        });
    end;
    local v48 = l_TagEditorShowTextSeparately_0 and function() --[[ Line: 227 ]]
        -- upvalues: v2 (ref), l_Checkbox_0 (ref), l_tag_2 (copy), v32 (copy)
        return v2.createElement(l_Checkbox_0, {
            Checked = l_tag_2.ShowText, 
            OnClick = v32.onShowTextRowClicked
        });
    end or nil;
    local function v49() --[[ Line: 235 ]]
        -- upvalues: v2 (ref), l_Checkbox_0 (ref), l_tag_2 (copy), v32 (copy)
        return v2.createElement(l_Checkbox_0, {
            Checked = l_tag_2.AlwaysOnTop, 
            OnClick = v32.onAlwaysOntopRowClicked
        });
    end;
    local function v58() --[[ Line: 242 ]]
        -- upvalues: l_TagEditorShowTextSeparately_0 (ref), l_Localization_1 (copy), l_tag_2 (copy), v5 (ref), v2 (ref), l_Pane_0 (ref), l_TagSettingsListView_0 (copy), l_IconButton_0 (ref), v32 (copy), l_DropdownMenu_0 (ref), v21 (ref)
        local v50 = nil;
        v50 = if l_TagEditorShowTextSeparately_0 then {
            "Box", 
            "Sphere", 
            "Outline", 
            "Icon", 
            "None"
        } else {
            "Box", 
            "Sphere", 
            "Outline", 
            "Text", 
            "Icon"
        };
        local v51 = nil;
        v51 = if l_TagEditorShowTextSeparately_0 then {
            l_Localization_1:getText("VisualizeOptions", "Box"), 
            l_Localization_1:getText("VisualizeOptions", "Sphere"), 
            l_Localization_1:getText("VisualizeOptions", "Outline"), 
            l_Localization_1:getText("VisualizeOptions", "Icon"), 
            l_Localization_1:getText("VisualizeOptions", "None")
        } else {
            l_Localization_1:getText("VisualizeOptions", "Box"), 
            l_Localization_1:getText("VisualizeOptions", "Sphere"), 
            l_Localization_1:getText("VisualizeOptions", "Outline"), 
            l_Localization_1:getText("VisualizeOptions", "Text"), 
            l_Localization_1:getText("VisualizeOptions", "Icon")
        };
        local function v53(v52) --[[ Line: 282 ]]
            -- upvalues: l_tag_2 (ref)
            return v52 == l_tag_2.DrawType;
        end;
        local v54 = v5.findIndex(v50, v53);
        local v55 = if v54 then v51[v54] else "";
        return v2.createElement(l_Pane_0, {
            Size = l_TagSettingsListView_0.VisualizeAsRow.Size, 
            Style = "BorderBox"
        }, {
            Button = v2.createElement(l_IconButton_0, {
                Text = v55, 
                RightIcon = l_TagSettingsListView_0.VisualizeAsRow.Icon, 
                OnClick = v32.onVisualizeRowClicked, 
                Size = l_TagSettingsListView_0.VisualizeAsRow.Size
            }), 
            DropdownMenu = v2.createElement(l_DropdownMenu_0, {
                Hide = v32.state.VisualizeAsDropdownHidden, 
                OnItemActivated = function(_, v57) --[[ Line: 300 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v21 (ref), l_tag_2 (ref), v50 (ref), v32 (ref)
                    v21.Get():SetDrawType(l_tag_2.Name, v50[v57]);
                    v32.onVisualizeDropdownItemCloseMenu();
                end, 
                OnFocusLost = v32.onVisualizeDropdownItemCloseMenu, 
                PlaceholderText = v55, 
                Width = l_TagSettingsListView_0.VisualizeAsRow.DropDownWidth, 
                ItemHeight = l_TagSettingsListView_0.VisualizeAsRow.ItemHeight, 
                MaxHeight = l_TagSettingsListView_0.VisualizeAsRow.MaxHeight, 
                Priority = 2, 
                Items = v51
            })
        });
    end;
    if v38 then
        return (v2.createElement(l_ScrollingFrame_0, {
            CanvasSize = l_TagSettingsListView_0.CanvasSize, 
            Size = l_TagSettingsListView_0.Size, 
            LayoutOrder = l_props_2.LayoutOrder, 
            Layout = Enum.FillDirection.Vertical, 
            AutomaticCanvasSize = Enum.AutomaticSize.None, 
            Padding = l_TagSettingsListView_0.Padding, 
            Spacing = l_TagSettingsListView_0.Spacing
        }, {
            TaggedInstancesRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.TaggedInstancesRow.Size, 
                Text = l_Localization_1:getText("Info", "SelectInExplorer"), 
                TooltipText = l_Localization_1:getText("Tooltip", "SelectInExplorer"), 
                OnClick = v32.onTaggedInstancesRowClicked, 
                Control = v41
            }), 
            IconRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.IconRow.Size, 
                Text = l_Localization_1:getText("Info", "Icon"), 
                TooltipText = l_Localization_1:getText("Tooltip", "IconPicker"), 
                OnClick = v32.onIconRowClicked, 
                Control = v42
            }), 
            GroupRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.GroupRow.Size, 
                Text = l_Localization_1:getText("Info", "Group") .. ": " .. if l_tag_2.Group then l_tag_2.Group else v39, 
                TooltipText = l_Localization_1:getText("Tooltip", "GroupPicker"), 
                OnClick = v32.onGroupRowClicked, 
                Control = v46
            }), 
            ColorRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.ColorRow.Size, 
                Text = l_Localization_1:getText("Info", "Color"), 
                TooltipText = l_Localization_1:getText("Tooltip", "ColorPicker"), 
                OnClick = v32.onColorRowClicked, 
                Control = v47
            }), 
            AlwaysOnTopRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.AlwaysOnTopRow.Size, 
                Text = l_Localization_1:getText("Info", "AlwaysOnTop"), 
                TooltipText = l_Localization_1:getText("Tooltip", "AlwaysOnTop"), 
                OnClick = v32.onAlwaysOntopRowClicked, 
                Control = v49
            }), 
            ShowTextRow = if l_TagEditorShowTextSeparately_0 then v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.ShowTextRow.Size, 
                Text = l_Localization_1:getText("Info", "ShowText"), 
                TooltipText = l_Localization_1:getText("Tooltip", "ShowText"), 
                OnClick = v32.onShowTextRowClicked, 
                Control = v48
            }) else nil, 
            VisualizeAsRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.VisualizeAsRow.Size, 
                Text = l_Localization_1:getText("Info", "VisualizeAs"), 
                TooltipText = l_Localization_1:getText("Tooltip", "VisualizeAs"), 
                OnClick = v32.onVisualizeRowClicked, 
                Control = v58
            })
        }));
    else
        return nil;
    end;
end;
v24 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v24);
return v3.connect(function(v59, _) --[[ Line: 393 ]] --[[ Name: mapStateToProps ]]
    local v61 = nil;
    for _, v63 in pairs(v59.TagData) do
        if v63.Name == v59.TagMenu then
            v61 = v63;
            break;
        end;
    end;
    for _, v65 in pairs(v59.UnknownTags) do
        if v65.Name == v59.TagMenu then
            v61 = v65;
            break;
        end;
    end;
    return {
        groups = v59.GroupData, 
        tag = v61
    };
end, function(v66) --[[ Line: 416 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy)
    return {
        openColorPicker = function(v67) --[[ Line: 418 ]] --[[ Name: openColorPicker ]]
            -- upvalues: v66 (copy), v18 (ref)
            v66(v18.ToggleColorPicker(v67));
        end, 
        openIconPicker = function(v68) --[[ Line: 421 ]] --[[ Name: openIconPicker ]]
            -- upvalues: v66 (copy), v18 (ref)
            v66(v18.ToggleIconPicker(v68));
        end
    };
end)(v24);