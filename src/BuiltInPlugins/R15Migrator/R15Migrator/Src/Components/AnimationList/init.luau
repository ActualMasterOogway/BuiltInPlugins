local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_IconButton_0 = l_UI_0.IconButton;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Util_0 = v2.Util;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.RichTable);
local v16 = require(l_Components_0.RichTable.Cells.CheckboxHeaderCell);
local v17 = require(l_Components_0.RichTable.Cells.CheckboxCell);
local v18 = require(l_Components_0.RichTable.Cells.StatusCell);
local v19 = require(l_Components_0.RichTable.Cells.OriginalAssetCell);
local v20 = require(l_Components_0.RichTable.Cells.ConvertedAnimationCell);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetSelection);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetPreviewSelection);
local v23 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v24 = v3.PureComponent:extend("AnimationList");
v24.init = function(v25) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy)
    v25.state = {
        sortIndex = 4, 
        sortOrder = Enum.SortDirection.Ascending
    };
    v25.areAllSelected = function() --[[ Line: 41 ]]
        -- upvalues: v25 (copy)
        local l_props_0 = v25.props;
        local l_Items_0 = l_props_0.Items;
        local l_selection_0 = l_props_0.selection;
        for v29 in l_Items_0 do
            if not l_selection_0[v29] then
                return false;
            end;
        end;
        return true;
    end;
    v25.onAllSelectedChecked = function() --[[ Line: 54 ]]
        -- upvalues: v25 (copy)
        if v25:areAllSelected() then
            v25:resetSelected();
            return;
        else
            v25:selectAll();
            return;
        end;
    end;
    v25.getRowProps = function(v30, v31, v32, v33) --[[ Line: 62 ]]
        return {
            Key = v31, 
            Position = v32, 
            Row = v30, 
            Size = v33
        };
    end;
    v25._selection = {};
    v25._ctrlDown = false;
    v25._shiftDown = false;
    v25._anchor = nil;
    v25._focus = nil;
    v25.onKeyPressed = function(v34) --[[ Line: 77 ]]
        -- upvalues: v23 (ref), v25 (copy)
        if v23:isShift(v34.KeyCode) then
            v25._shiftDown = true;
        elseif v23:isControl(v34.KeyCode) then
            v25._ctrlDown = true;
        end;
        if v25._ctrlDown and v25._shiftDown and v23:isLetterA(v34.KeyCode) then
            v25:selectAll();
        end;
    end;
    v25.onKeyReleased = function(v35) --[[ Line: 89 ]]
        -- upvalues: v23 (ref), v25 (copy)
        if v23:isShift(v35.KeyCode) then
            v25._shiftDown = false;
            return;
        else
            if v23:isControl(v35.KeyCode) then
                v25._ctrlDown = false;
            end;
            return;
        end;
    end;
end;
v24.selectAll = function(v36) --[[ Line: 98 ]] --[[ Name: selectAll ]]
    -- upvalues: l_deepCopy_0 (copy)
    local l_props_1 = v36.props;
    local l_Items_1 = l_props_1.Items;
    local l_selection_1 = l_props_1.selection;
    local v40 = l_deepCopy_0(l_selection_1);
    for v41, _ in l_Items_1 do
        v40[v41] = true;
    end;
    l_props_1.setSelection(v40);
    v36._focus = nil;
    v36._anchor = nil;
end;
v24.resetSelected = function(v43) --[[ Line: 113 ]] --[[ Name: resetSelected ]]
    v43.props.setSelection({});
    v43._anchor = nil;
    v43._focus = nil;
end;
v24.shiftClick = function(v44, _, v46, v47, v48) --[[ Line: 121 ]] --[[ Name: shiftClick ]]
    -- upvalues: l_deepCopy_0 (copy)
    local l_props_2 = v44.props;
    local l_selection_2 = l_props_2.selection;
    local v51 = l_deepCopy_0(l_selection_2);
    if not v44._anchor then
        v44._anchor = v47;
        l_props_2.setSelection({
            [v46] = true
        });
        return;
    else
        if v44._focus then
            local v52 = v44._anchor < v44._focus and 1 or -1;
            for v53 = v44._anchor, v44._focus, v52 do
                v51[v48[v53].id] = nil;
            end;
        end;
        local v54 = v44._anchor < v47 and 1 or -1;
        for v55 = v44._anchor, v47, v54 do
            v51[v48[v55].id] = true;
        end;
        v44._focus = v47;
        l_props_2.setSelection(v51);
        return;
    end;
end;
v24.click = function(v56, _, v58, v59) --[[ Line: 145 ]] --[[ Name: click ]]
    -- upvalues: l_deepCopy_0 (copy)
    local l_props_3 = v56.props;
    local l_selection_3 = l_props_3.selection;
    local v62 = l_deepCopy_0(l_selection_3);
    if l_selection_3[v58] then
        v62[v58] = nil;
    else
        v62[v58] = true;
    end;
    l_props_3.setSelection(v62);
    v56._anchor = v59;
    v56._focus = nil;
end;
v24.rowClick = function(v63, v64) --[[ Line: 159 ]] --[[ Name: rowClick ]]
    v63.props.setPreviewSelection(v64);
end;
v24.rowRightClick = function(v65, v66) --[[ Line: 164 ]] --[[ Name: rowRightClick ]]
    -- upvalues: l_showContextMenu_0 (copy), l_Selection_0 (copy)
    local l_props_4 = v65.props;
    local l_Plugin_0 = l_props_4.Plugin;
    local l_Localization_0 = l_props_4.Localization;
    l_showContextMenu_0(l_Plugin_0:get(), {
        {
            Id = "ShowInExplorer", 
            Text = l_Localization_0:getText("AnimationList", "ShowInExplorer"), 
            OnItemClicked = function() --[[ Line: 174 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_4 (copy), v66 (copy), l_Selection_0 (ref)
                local v70 = {};
                for v71 in l_props_4.Items[v66].oldRefs do
                    table.insert(v70, v71);
                end;
                l_Selection_0:Set(v70);
            end
        }, 
        {
            ShowSeparator = true
        }, 
        {
            Id = "ResetToAssignedR15Id", 
            Text = l_Localization_0:getText("AnimationList", "ResetToAssignedR15Id"), 
            OnItemClicked = function() --[[ Line: 188 ]] --[[ Name: OnItemClicked ]]

            end
        }, 
        {
            Id = "OpenInKeyframeSequencer", 
            Text = l_Localization_0:getText("AnimationList", "OpenInKeyframeSequencer"), 
            OnItemClicked = function() --[[ Line: 195 ]] --[[ Name: OnItemClicked ]]

            end
        }
    });
end;
v24.render = function(v72) --[[ Line: 202 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v17 (copy), v19 (copy), v20 (copy), v18 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), v15 (copy), l_KeyboardListener_0 (copy)
    local l_state_0 = v72.state;
    local l_props_5 = v72.props;
    local l_Localization_1 = l_props_5.Localization;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Items_2 = l_props_5.Items;
    local l_Tags_0 = l_props_5.Tags;
    local l_Size_0 = l_props_5.Size;
    local l_selection_4 = l_props_5.selection;
    local l_previewSelection_0 = l_props_5.previewSelection;
    local l_OnResetPlugin_0 = l_props_5.OnResetPlugin;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local v84 = {};
    for v85, v86 in l_Items_2 do
        local v87 = l_Tags_0[v85];
        table.insert(v84, {
            id = v85, 
            selected = l_selection_4[v85] ~= nil, 
            name = v86.name, 
            original = v87.id, 
            converted = v87.converted, 
            previewSelected = v85 == l_previewSelection_0, 
            status = v86.status, 
            errCode = v86.errCode
        });
    end;
    local v95 = {
        {
            Key = "selected", 
            Width = UDim.new(0, l_Stylizer_0.SelectedColumnWidth), 
            HeaderCellComponent = v16, 
            HeaderCellComponentProps = {
                Checked = v72:areAllSelected(), 
                OnClick = v72.onAllSelectedChecked
            }, 
            CellComponent = v17, 
            CellComponentProps = {
                OnClick = function(_, v89) --[[ Line: 243 ]] --[[ Name: OnClick ]]
                    -- upvalues: v84 (copy), l_Items_2 (copy), v72 (copy)
                    local l_id_0 = v84[v89].id;
                    local v91 = l_Items_2[l_id_0];
                    if v72._shiftDown then
                        v72:shiftClick(v91, l_id_0, v89, v84);
                        return;
                    else
                        v72:click(v91, l_id_0, v89);
                        return;
                    end;
                end
            }
        }, 
        {
            Key = "name", 
            Name = l_Localization_1:getText("AnimationList", "NameColumn"), 
            Width = UDim.new(1, 0 - l_Stylizer_0.SelectedColumnWidth - l_Stylizer_0.OriginalColumnWidth - l_Stylizer_0.ConvertedColumnWidth - l_Stylizer_0.StatusColumnWidth)
        }, 
        {
            Key = "original", 
            Name = l_Localization_1:getText("AnimationList", "OriginalColumn"), 
            Width = UDim.new(0, l_Stylizer_0.OriginalColumnWidth), 
            CellComponent = v19
        }, 
        {
            Key = "converted", 
            Name = l_Localization_1:getText("AnimationList", "ConvertedColumn"), 
            Width = UDim.new(0, l_Stylizer_0.ConvertedColumnWidth), 
            CellComponent = v20, 
            CellComponentProps = {
                OnContextButtonClick = function(_, v93) --[[ Line: 281 ]] --[[ Name: OnContextButtonClick ]]
                    -- upvalues: v84 (copy), v72 (copy)
                    local v94 = v84[v93];
                    v72:rowRightClick(v94.id);
                end
            }
        }, 
        {
            Key = "status", 
            Name = "", 
            Width = UDim.new(0, l_Stylizer_0.StatusColumnWidth), 
            CellComponent = v18
        }
    };
    table.sort(v84, function(v96, v97) --[[ Line: 295 ]]
        -- upvalues: v95 (copy), l_state_0 (copy)
        local l_Key_0 = v95[l_state_0.sortIndex].Key;
        local v99 = v96[l_Key_0] or "";
        local v100 = v97[l_Key_0] or "";
        if typeof(v99) == "string" then
            v99 = string.upper(v99);
            v100 = string.upper(v100);
        end;
        if l_state_0.sortOrder == Enum.SortDirection.Ascending then
            return v100 < v99;
        else
            return v99 < v100;
        end;
    end);
    local v101 = nil;
    for v102, v103 in v84 do
        if v103.id == l_previewSelection_0 then
            v101 = v102;
        end;
    end;
    local v104 = l_LayoutOrderIterator_0.new();
    return v3.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = {
            Top = 12, 
            Left = 12, 
            Right = 12, 
            Bottom = 12
        }
    }, {
        Controls = v3.createElement(l_Pane_0, {
            LayoutOrder = v104:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 40)
        }, {
            Refresh = v3.createElement(l_IconButton_0, {
                LeftIcon = l_Stylizer_0.RefreshButton.Icon, 
                Cursor = "PointingHand", 
                OnClick = l_OnResetPlugin_0, 
                Size = l_Stylizer_0.RefreshButton.Size, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -16, 0.5, 0), 
                BackgroundStyle = l_Stylizer_0.RefreshButton.BackgroundStyle, 
                TooltipText = l_Localization_1:getText("Summary", "Refresh")
            })
        }), 
        Table = v3.createElement(v15, {
            LayoutOrder = v104:getNextOrder(), 
            Columns = v95, 
            Rows = v84, 
            SelectedRow = v101, 
            SortIndex = l_state_0.sortIndex, 
            SortOrder = l_state_0.sortOrder, 
            OnSelectRow = function(v105) --[[ Line: 354 ]] --[[ Name: OnSelectRow ]]
                -- upvalues: v72 (copy), l_previewSelection_0 (copy)
                v72:rowClick(if v105.id == l_previewSelection_0 then nil else v105.id);
            end, 
            OnRightClickRow = function(v106) --[[ Line: 357 ]] --[[ Name: OnRightClickRow ]]
                -- upvalues: v72 (copy)
                v72:rowRightClick(v106.id);
            end, 
            OnSortChange = function(v107, v108) --[[ Line: 360 ]] --[[ Name: OnSortChange ]]
                -- upvalues: v72 (copy)
                v72:setState({
                    sortIndex = v107, 
                    sortOrder = v108
                });
            end
        }), 
        KeyboardListener = v3.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v72.onKeyPressed, 
            OnKeyReleased = v72.onKeyReleased
        })
    });
end;
v24 = l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v24);
return v4.connect(function(v109) --[[ Line: 380 ]] --[[ Name: mapStateToProps ]]
    return {
        selection = v109.AnimationConversion.selection, 
        previewSelection = v109.AnimationConversion.previewSelection
    };
end, function(v110) --[[ Line: 387 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v22 (copy)
    return {
        setSelection = function(v111) --[[ Line: 389 ]] --[[ Name: setSelection ]]
            -- upvalues: v110 (copy), v21 (ref)
            v110(v21(v111));
        end, 
        setPreviewSelection = function(v112) --[[ Line: 393 ]] --[[ Name: setPreviewSelection ]]
            -- upvalues: v110 (copy), v22 (ref)
            v110(v22(v112));
        end
    };
end)(v24);