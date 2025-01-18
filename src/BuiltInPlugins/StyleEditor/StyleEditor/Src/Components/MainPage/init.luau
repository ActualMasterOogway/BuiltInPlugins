local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = v5.SharedFlags.getFFlagDevFrameworkBetterInit();
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v10 = require(l_Actions_0.Window.SelectItem);
local v11 = require(l_Actions_0.Window.SetItemsExpanded);
local v12 = require(l_Actions_0.Window.SetSearch);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v14 = require(l_Thunks_0.ContextMenu.ShowDesignSheetMenu);
local v15 = require(l_Thunks_0.ContextMenu.ShowNilDesignSheetMenu);
local v16 = require(l_Thunks_0.ContextMenu.ShowNewStyleRuleMenu);
local v17 = require(l_Thunks_0.ContextMenu.ShowStyleRuleMenu);
local v18 = require(l_Thunks_0.ContextMenu.ShowStyleSheetMenu);
local v19 = require(l_Thunks_0.ContextMenu.ShowThemeCategoryMenu);
local v20 = require(l_Thunks_0.ContextMenu.ShowThemeFolderMenu);
local v21 = require(l_Thunks_0.ContextMenu.ShowThemeOtherMenu);
local v22 = require(l_Thunks_0.ContextMenu.ShowTokenCategoryMenu);
local v23 = require(l_Thunks_0.ContextMenu.ShowUiElementsMenu);
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local v26 = if v6 then l_UI_0.SearchBar else v5.StudioUI.SearchBar;
local l_SplitPane_0 = l_UI_0.SplitPane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local v29 = require(l_Parent_0.Src.Util.DesignHelpers);
local v30 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v31 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v32 = require(l_Parent_0.Src.Components.DesignSheetView);
local v33 = require(l_Parent_0.Src.Components.StyleRuleView);
local v34 = require(l_Parent_0.Src.Components.StyleSheetView);
local v35 = require(l_Parent_0.Src.Components.ThemesView);
local v36 = require(l_Parent_0.Src.Util.isEmptyTable);
local v37 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Util.StyleSchema);
local v41 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v41.copy;
local l_collectArray_0 = v41.collectArray;
local l_join_0 = v41.join;
local l_mapOne_0 = v41.mapOne;
local l_shallowEqual_0 = v41.shallowEqual;
local v47 = require(l_Parent_0.Src.Resources.PluginStyles);
local l_v47_Attribute_0 = v47:GetAttribute("BorderSize");
local l_v47_Attribute_1 = v47:GetAttribute("PaddingSm");
local l_v47_Attribute_2 = v47:GetAttribute("SearchBarHeight");
local v51 = require(script.buildTree);
local v52 = {
    {
        Name = "Name", 
        Key = "Name", 
        Width = UDim.new(1, 0)
    }
};
local v55 = l_TreeTable_0.EditTree.new({
    getChildren = function(v53) --[[ Line: 95 ]] --[[ Name: getChildren ]]
        return v53.Children or {};
    end, 
    getId = function(v54) --[[ Line: 98 ]] --[[ Name: getId ]]
        return v54.Id;
    end
});
local v56 = v3.PureComponent:extend("MainPage");
v56.init = function(v57) --[[ Line: 132 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy), v52 (copy), v55 (copy), v17 (copy), v14 (copy), v18 (copy), v20 (copy), v23 (copy), v15 (copy), v19 (copy), v22 (copy), v16 (copy), v21 (copy), v12 (copy), v10 (copy), l_join_0 (copy), v37 (copy), v11 (copy), l_mapOne_0 (copy)
    v57.state = {
        DesignSheet = nil, 
        PaneSizes = {
            UDim.new(0, 200), 
            UDim.new(1, -200)
        }, 
        SearchTerm = "", 
        table = {
            Columns = l_copy_0(v52), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    v57.onAction = function(v58, v59) --[[ Line: 148 ]]
        -- upvalues: v57 (copy), v55 (ref), v17 (ref), v14 (ref), v18 (ref), v20 (ref), v23 (ref), v15 (ref), v19 (ref), v22 (ref), v16 (ref), v21 (ref)
        local l_props_0 = v57.props;
        if v58 == "Menu" then
            local v61 = v55:getChild(v57.state.table.Items, v59);
            local l_Value_0 = v61.Name.Value;
            local function v63() --[[ Line: 155 ]] --[[ Name: onRename ]]
                -- upvalues: v57 (ref), v59 (copy)
                v57.onDoubleClick(v59);
            end;
            if v61.Instance then
                if v61.Instance:IsA("StyleRule") then
                    l_props_0.dispatch(v17(v61.Instance, v63, true));
                    return;
                elseif v61.Instance == v57.props.DesignSheet then
                    l_props_0.dispatch(v14(v57.props.DesignSheet, v63));
                    return;
                elseif v61.Instance:IsA("StyleSheet") then
                    l_props_0.dispatch(v18(v61.Instance, v63));
                    return;
                elseif v61.Instance:IsA("Folder") then
                    l_props_0.dispatch(v20(v61.Instance, v63));
                    return;
                end;
            else
                local v64 = v55:getParent(v57.state.table.Items, v61);
                if l_Value_0 == "UI Elements" then
                    l_props_0.dispatch(v23(v64.Instance));
                    return;
                elseif l_Value_0 == "Design" then
                    l_props_0.dispatch(v15());
                    return;
                elseif l_Value_0 == "Themes" then
                    l_props_0.dispatch(v19());
                    return;
                elseif l_Value_0 == "Tokens" then
                    l_props_0.dispatch(v22());
                    return;
                elseif v64.Instance and v64.Instance:IsA("StyleSheet") then
                    if v61.Name.Value == "Tags" then
                        l_props_0.dispatch(v16(v64.Instance, ".Tag"));
                        return;
                    else
                        l_props_0.dispatch(v16(v64.Instance, "#Name"));
                        return;
                    end;
                else
                    l_props_0.dispatch(v21());
                end;
            end;
        end;
    end;
    v57.onRightClick = function() --[[ Line: 193 ]]

    end;
    v57.onSearch = function(v65) --[[ Line: 195 ]]
        -- upvalues: v57 (copy), v12 (ref)
        v57.props.dispatch(v12(v65));
    end;
    v57.onPaneSizesChanged = function(v66) --[[ Line: 200 ]]
        -- upvalues: v57 (copy)
        v57:setState({
            PaneSizes = v66
        });
    end;
    v57.adaptor = v55:getStateAdaptor(v57, "table");
    v57.tableCallbacks = v55:getCallbacks(v57.adaptor);
    v57.selectItem = function(v67) --[[ Line: 209 ]]
        -- upvalues: v57 (copy), v10 (ref)
        v57.props.dispatch(v10(v67));
    end;
    v57.onCellPressed = function(v68) --[[ Line: 215 ]]
        -- upvalues: v57 (copy), v55 (ref)
        local l_state_0 = v57.state;
        local v70 = v55:getChild(l_state_0.table.Items, v68);
        v57.selectItem(v70.Id);
    end;
    v57.onDoubleClick = function(v71) --[[ Line: 221 ]]
        -- upvalues: v57 (copy), v55 (ref), l_join_0 (ref)
        v57.adaptor(function(v72) --[[ Line: 222 ]]
            -- upvalues: v55 (ref), v71 (copy), l_join_0 (ref)
            local v73 = v55:getChild(v72.Items, v71);
            if not v73 or not v73.Instance then
                return nil;
            else
                local v74 = {
                    Schema = l_join_0(v73.Name.Schema, {
                        Editing = true
                    }), 
                    Value = if v73.Instance:IsA("StyleRule") then v73.Instance.Selector else v73.Instance.Name
                };
                return (v55:updateCell(v72, v74, v71, 1));
            end;
        end);
    end;
    v57.onEdited = function(v75, v76) --[[ Line: 236 ]]
        -- upvalues: v57 (copy), v55 (ref), l_join_0 (ref), v37 (ref)
        v57.adaptor(function(v77) --[[ Line: 237 ]]
            -- upvalues: v55 (ref), v76 (copy), l_join_0 (ref), v75 (copy), v37 (ref)
            local v78 = v55:getChild(v77.Items, v76);
            local v79 = {
                Schema = l_join_0(v78.Name.Schema, {
                    Editing = false
                }), 
                Value = v75
            };
            local l_Instance_0 = v78.Instance;
            if not l_Instance_0 then
                warn("Edited row does not have a valid Instance associated");
            elseif l_Instance_0 then
                if l_Instance_0.Name ~= v75 then
                    v37({
                        Name = "StyleEditor.EditInstanceName", 
                        DisplayName = "Style Editor - Edit Instance Name", 
                        DoChange = function() --[[ Line: 252 ]] --[[ Name: DoChange ]]
                            -- upvalues: l_Instance_0 (copy), v75 (ref), v79 (copy)
                            l_Instance_0.Name = v75;
                            if l_Instance_0:IsA("StyleRule") then
                                l_Instance_0.Selector = v75;
                                v79.ErrorMessage = l_Instance_0.SelectorError;
                            end;
                            return Enum.FinishRecordingOperation.Commit;
                        end
                    });
                elseif l_Instance_0:IsA("StyleSheet") and l_Instance_0:GetAttribute("StyleCategory") == "Designs" and not l_Instance_0.Name:match("StyleSheet") then
                    v79.Value = v75 .. " StyleSheet";
                end;
            end;
            return v55:updateCell(v77, v79, v76, 1);
        end);
    end;
    v57.tableCallbacks.OnExpansionChange = function(v81) --[[ Line: 271 ]]
        -- upvalues: v57 (copy), v11 (ref)
        v57.props.dispatch(v11(v81));
    end;
    v57.tableCallbacks.OnSelectionChange = function(v82) --[[ Line: 276 ]]
        -- upvalues: l_mapOne_0 (ref), v57 (copy)
        local v85 = l_mapOne_0(v82, function(_, v84) --[[ Line: 277 ]]
            return v84;
        end);
        if v85 then
            v57.selectItem(v85);
        end;
    end;
end;
v56.applySearch = function(v86, v87) --[[ Line: 289 ]] --[[ Name: applySearch ]]
    -- upvalues: l_collectArray_0 (copy), l_copy_0 (copy), v56 (ref), v55 (copy)
    local v94 = l_collectArray_0(v86, function(_, v89) --[[ Line: 290 ]]
        -- upvalues: l_copy_0 (ref), v56 (ref), v87 (copy)
        local v90 = l_copy_0(v89);
        v90.Children = v56.applySearch(v90.Children, v87);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 294 ]]
            -- upvalues: v90 (copy), v87 (ref)
            local v91 = true;
            if #v90.Children <= 0 then
                v91 = v90.Name.Value:lower():match(v87:lower());
            end;
            return v91;
        end);
        if l_status_0 and l_result_0 then
            return v90;
        else
            return nil;
        end;
    end);
    return v55:updatePaths(v94);
end;
v56.getDerivedStateFromProps = function(v95, v96) --[[ Line: 307 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v36 (copy), l_ReplicatedStorage_0 (copy), v51 (copy), v55 (copy), l_join_0 (copy)
    local l_Expansion_0 = v96.table.Expansion;
    local l_Items_0 = v96.table.Items;
    local l_Selection_0 = v96.table.Selection;
    local v100 = false;
    if v95.SearchTerm ~= v96.SearchTerm then
        v100 = v95.SearchTerm == "";
    end;
    if v95.IsDirty or v100 or v95.DesignSheet ~= v96.DesignSheet or v36(v96.table.Items) then
        l_Items_0 = v51({
            l_ReplicatedStorage_0
        }, v95.DesignSheet);
        l_Items_0 = v55:updatePaths(l_Items_0);
    end;
    return l_join_0(v96, {
        DesignSheet = v95.DesignSheet, 
        SearchTerm = v95.SearchTerm, 
        table = l_join_0(v96.table, {
            Items = l_Items_0, 
            Expansion = l_Expansion_0, 
            Selection = l_Selection_0
        })
    });
end;
v56.render = function(v101) --[[ Line: 335 ]] --[[ Name: render ]]
    -- upvalues: v55 (copy), l_join_0 (copy), v56 (ref), l_v47_Attribute_2 (copy), l_v47_Attribute_1 (copy), l_v47_Attribute_0 (copy), v3 (copy), l_Pane_0 (copy), v26 (copy), l_TreeTable_0 (copy), v30 (copy), l_shallowEqual_0 (copy), v29 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), l_SplitPane_0 (copy)
    local l_props_1 = v101.props;
    local l_state_1 = v101.state;
    local l_Items_1 = l_state_1.table.Items;
    local v105 = if l_props_1.SelectedItemId then v55:findItemById(l_Items_1, l_props_1.SelectedItemId) else nil;
    local l_ExpandedItems_0 = l_props_1.ExpandedItems;
    if v105 then
        local v107 = v55:expandAncestors(l_Items_1, v105.Path);
        l_ExpandedItems_0 = l_join_0(l_ExpandedItems_0, v107);
    end;
    if l_props_1.SearchTerm and #l_props_1.SearchTerm > 0 then
        l_Items_1 = v56.applySearch(l_Items_1, l_props_1.SearchTerm);
        v55:expandAll(l_Items_1, l_ExpandedItems_0);
    end;
    local v108 = if l_props_1.SelectedItemId then {
        [l_props_1.SelectedItemId] = true
    } else {};
    local v109 = l_v47_Attribute_2 + l_v47_Attribute_1 + 2 * l_v47_Attribute_0;
    local v110 = v3.createElement(l_Pane_0, {
        [v3.Tag] = "X-ColumnS"
    }, {
        SearchInput = v3.createElement(v26, {
            LayoutOrder = 1, 
            OnTextChanged = v101.onSearch, 
            PlaceholderText = l_props_1.Localization:getText("Control", "SearchPlaceholder"), 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            Width = l_state_1.PaneSizes[1], 
            [v3.Tag] = "SearchInput"
        }), 
        LeftItems = v3.createElement(l_TreeTable_0, l_join_0({
            Columns = l_state_1.table.Columns, 
            ClampSize = true, 
            Expansion = l_ExpandedItems_0, 
            FullSpanEmphasis = true, 
            GetItemId = v30.getTableRowId, 
            GetChildren = v30.getRowChildren, 
            OnCellAction = v101.onAction, 
            OnCellEdited = v101.onEdited, 
            OnCellDoubleClick = v101.onDoubleClick, 
            OnCellPressed = v101.onCellPressed, 
            LayoutOrder = 2, 
            RightClick = v101.onRightClick, 
            RootItems = l_Items_1, 
            RowHeight = 32, 
            Scroll = true, 
            ScrollProps = {
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            }, 
            Selection = v108, 
            ShowHeader = false, 
            Size = UDim2.new(1, 0, 1, -v109), 
            UseScale = true, 
            [v3.Tag] = "LeftItems"
        }, v101.tableCallbacks))
    });
    local v111 = nil;
    if v105 then
        local l_Instance_1 = v105.Instance;
        if l_shallowEqual_0(v105.Path, v29.PATHS.DESIGN) then
            v111 = v3.createElement(v32);
        elseif l_Instance_1 and l_Instance_1:IsA("StyleRule") then
            v111 = v3.createElement(v33, {
                StyleRule = v105.Instance
            });
        elseif l_Instance_1 and l_Instance_1:IsA("StyleSheet") then
            v111 = v3.createElement(v34, {
                StyleSheet = v105.Instance
            });
        elseif v105.Name.Value ~= "Themes" and v29.isUnderPath(v105.Path, v29.PATHS.THEMES) then
            v111 = v3.createElement(v35, {
                RootItem = v105
            });
        end;
    end;
    return v3.createElement(l_Pane_0, {}, {
        Divider = v3.createElement(l_SplitPane_0, {
            ClampSize = true, 
            UseDeficit = true, 
            MinSizes = {
                UDim.new(0, 100), 
                UDim.new(0, 100)
            }, 
            OnSizesChange = v101.onPaneSizesChanged, 
            Sizes = l_state_1.PaneSizes
        }, {
            v110, 
            v111
        })
    });
end;
v56 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v56);
return v4.connect(function(v113) --[[ Line: 444 ]]
    return {
        DesignSheet = v113.Window.DesignSheet, 
        IsDirty = v113.Window.IsDirty, 
        SearchTerm = v113.Window.SearchTerm, 
        SelectedItemId = v113.Window.SelectedItemId, 
        ExpandedItems = v113.Window.ExpandedItems
    };
end, v31)(v56);