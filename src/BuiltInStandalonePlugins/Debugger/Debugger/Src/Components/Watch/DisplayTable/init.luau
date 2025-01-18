local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v10 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_UI_0 = v3.UI;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_Models_0 = l_Parent_0.Src.Models;
local v20 = require(l_Models_0.Watch.TableTab);
local v21 = require(l_Models_0.Watch.WatchRow);
local v22 = require(l_Models_0.StepStateBundle);
local v23 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v25 = require(l_Actions_0.Watch.SetVariableExpanded);
local v26 = require(l_Actions_0.Watch.SetExpressionExpanded);
local v27 = require(l_Actions_0.Watch.ChangeExpression);
local v28 = require(l_Actions_0.Watch.AddExpression);
local v29 = require(l_Actions_0.Watch.RemoveExpression);
local v30 = require(l_Actions_0.Watch.ClearAllExpressions);
local v31 = require(l_Actions_0.Watch.SetWatchSortState);
local v32 = require(l_Actions_0.Watch.SetTab);
local v33 = require(l_Actions_0.Watch.MyWatchesFilterChange);
local v34 = require(l_Actions_0.Watch.VariablesFilterChange);
local v35 = require(l_Parent_0.Src.Thunks.Common.AddChildRowsToVars);
local v36 = require(l_Parent_0.Src.Thunks.Watch.ExecuteExpressionForAllFrames);
local v37 = require(l_Parent_0.Src.Thunks.Watch.FilterScopeWatchThunk);
local l_Util_0 = l_Parent_0.Src.Util;
local v39 = require(l_Util_0.Constants);
local v40 = require(l_Util_0.ColumnResizeHelperFunctions);
local v41 = require(l_Util_0.MakePluginActions);
local v42 = v1.PureComponent:extend("DisplayTable");
local v43 = {
    [1] = "nameColumn"
};
local v44 = {
    [1] = "expressionColumn"
};
local v45 = {
    nameColumn = "NameColumn", 
    expressionColumn = "ExpressionColumn"
};
local v46 = {
    ScopeColumn = "scopeColumn", 
    ValueColumn = "valueColumn", 
    DataTypeColumn = "dataTypeColumn"
};
local v47 = {
    [1] = "nameColumn", 
    [2] = "scopeColumn", 
    [3] = "valueColumn", 
    [4] = "dataTypeColumn"
};
local v48 = {
    [1] = "expressionColumn", 
    [2] = "valueColumn", 
    [3] = "dataTypeColumn"
};
local function v49(v50, v51) --[[ Line: 96 ]] --[[ Name: populateRootItems ]]
    -- upvalues: l_deepCopy_0 (copy), v49 (copy), v21 (copy)
    if #v50 == 0 then
        return {};
    else
        local v52 = {};
        for _, v54 in ipairs(v50) do
            local v55 = nil;
            if v51[v54] then
                v55 = l_deepCopy_0(v51[v54]);
                v55.children = v49(v55.childPaths, v51);
            else
                v55 = v21.fromExpression(v54);
                v55.children = {};
            end;
            table.insert(v52, v55);
        end;
        return v52;
    end;
end;
local function v56(v57, v58, v59) --[[ Line: 118 ]] --[[ Name: populateExpansionTable ]]
    -- upvalues: v56 (copy)
    if #v57 == 0 then
        return;
    else
        for _, v61 in ipairs(v57) do
            v58[v61] = v59[v61.pathColumn];
            v56(v61.children, v58, v59);
        end;
        return;
    end;
end;
local function v69(v62, v63, v64) --[[ Line: 129 ]] --[[ Name: applyFilters ]]
    local v65 = {};
    for _, v67 in ipairs(v62) do
        local v68 = v63[v67.pathColumn];
        if not v68 or not v68.textFilteredOut and (not v64 or not v68.scopeFilteredOut) then
            table.insert(v65, v67);
        end;
    end;
    return v65;
end;
local function v78(v70, v71, v72) --[[ Line: 143 ]] --[[ Name: useListOfExpressionsAsSOT ]]
    -- upvalues: l_deepCopy_0 (copy)
    local v73 = l_deepCopy_0(v70);
    for v74, v75 in ipairs(v70) do
        for _, v77 in ipairs(v71) do
            if v72[v77] == nil then
                warn("debug variable id not found in store when constructing DisplayTable");
                return;
            elseif v75 == v72[v77].expressionColumn then
                v73[v74] = v77;
                break;
            end;
        end;
    end;
    return v73;
end;
v42.init = function(v79) --[[ Line: 167 ]] --[[ Name: init ]]
    -- upvalues: v45 (copy), v46 (copy), v47 (copy), v48 (copy), v20 (copy), v10 (copy), v39 (copy), v41 (copy), l_showContextMenu_0 (copy), v23 (copy)
    v79.getTreeChildren = function(v80) --[[ Line: 168 ]]
        return v80.children or {};
    end;
    v79.getTableColumns = function(v81, v82) --[[ Line: 172 ]]
        -- upvalues: v79 (copy), v45 (ref), v46 (ref)
        local l_Localization_1 = v79.props.Localization;
        local v84 = {};
        for _, v86 in ipairs(v82) do
            table.insert(v84, {
                Name = l_Localization_1:getText("Watch", v45[v86]), 
                Key = v86, 
                Tooltip = l_Localization_1:getText("Watch", v45[v86] .. "Tooltip") or nil
            });
        end;
        for _, v88 in ipairs(v81) do
            table.insert(v84, {
                Name = l_Localization_1:getText("Watch", v88), 
                Key = v46[v88], 
                Tooltip = l_Localization_1:getText("Watch", v88 .. "Tooltip") or nil
            });
        end;
        return v84;
    end;
    v79.getVariableTableColumns = function() --[[ Line: 196 ]]
        -- upvalues: v79 (copy), v47 (ref)
        local l_Localization_2 = v79.props.Localization;
        return {
            {
                Name = l_Localization_2:getText("Watch", "NameColumn"), 
                Key = v47[1], 
                Tooltip = l_Localization_2:getText("Watch", "NameColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "ScopeColumn"), 
                Key = v47[2], 
                Tooltip = l_Localization_2:getText("Watch", "ScopeColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "ValueColumn"), 
                Key = v47[3], 
                Tooltip = l_Localization_2:getText("Watch", "ValueColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "DataTypeColumn"), 
                Key = v47[4], 
                Tooltip = l_Localization_2:getText("Watch", "DataTypeColumnTooltip") or nil
            }
        };
    end;
    v79.getWatchTableColumns = function() --[[ Line: 222 ]]
        -- upvalues: v79 (copy), v48 (ref)
        local l_Localization_3 = v79.props.Localization;
        return {
            {
                Name = l_Localization_3:getText("Watch", "ExpressionColumn"), 
                Key = v48[1]
            }, 
            {
                Name = l_Localization_3:getText("Watch", "ValueColumn"), 
                Key = v48[2], 
                Tooltip = l_Localization_3:getText("Watch", "ValueColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_3:getText("Watch", "DataTypeColumn"), 
                Key = v48[3], 
                Tooltip = l_Localization_3:getText("Watch", "DataTypeColumnTooltip") or nil
            }
        };
    end;
    local v91 = {};
    for _ = 1, 4 do
        table.insert(v91, UDim.new(0.25, 0));
    end;
    local v93 = {};
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    v79.state = {
        VariableColumnSizes = v91, 
        MyWatchColumnSizes = v93
    };
    v79.OnColumnSizesChange = function(v94) --[[ Line: 259 ]]
        -- upvalues: v79 (copy), v20 (ref)
        if v79.props.SelectedTab == v20.Variables then
            v79:setState(function(_) --[[ Line: 263 ]]
                -- upvalues: v94 (copy)
                return {
                    VariableColumnSizes = v94
                };
            end);
            return;
        else
            v79:setState(function(_) --[[ Line: 269 ]]
                -- upvalues: v94 (copy)
                return {
                    MyWatchColumnSizes = v94
                };
            end);
            return;
        end;
    end;
    v79.onExpansionChange = function(v97) --[[ Line: 277 ]]
        -- upvalues: v79 (copy), v20 (ref)
        local l_props_0 = v79.props;
        local l_CurrentStepStateBundle_0 = l_props_0.CurrentStepStateBundle;
        local l_DebuggerConnectionManager_0 = game:GetService("DebuggerConnectionManager");
        if not l_CurrentStepStateBundle_0 then
            assert(false);
            return;
        else
            local l_l_DebuggerConnectionManager_0_ConnectionById_0 = l_DebuggerConnectionManager_0:GetConnectionById(l_CurrentStepStateBundle_0.debuggerStateToken.debuggerConnectionId);
            for v102, v103 in pairs(v97) do
                local v104 = l_props_0.SelectedTab == v20.Variables;
                if v104 then
                    v79.props.OnVariableExpansionDispatch(v102.pathColumn, v103);
                else
                    v79.props.OnExpressionExpansionDispatch(v102.pathColumn, v103);
                end;
                if v103 then
                    v79.props.OnLazyLoadChildren(v102.pathColumn, v102.idColumn, l_CurrentStepStateBundle_0, v104, l_l_DebuggerConnectionManager_0_ConnectionById_0);
                end;
            end;
            return;
        end;
    end;
    v79.IsDuplicateWatchEntry = function(v105) --[[ Line: 307 ]]
        -- upvalues: v79 (copy)
        for _, v107 in ipairs(v79.props.RootItems) do
            if v107.expressionColumn == v105 then
                return true;
            end;
        end;
        return false;
    end;
    v79.OnFocusLost = function(_, v109, v110, v111) --[[ Line: 316 ]]
        -- upvalues: v79 (copy), v10 (ref)
        local l_expressionColumn_0 = v110.item.expressionColumn;
        local l_Text_0 = v109.Text;
        local l_CurrentStepStateBundle_1 = v79.props.CurrentStepStateBundle;
        local l_DebuggerConnectionManager_1 = game:GetService("DebuggerConnectionManager");
        if v111 == 1 then
            local v116 = false;
            if v79.IsDuplicateWatchEntry(l_Text_0) then
                if l_expressionColumn_0 == "" then
                    v109.Text = "";
                    return;
                else
                    if l_expressionColumn_0 ~= l_Text_0 then
                        v79.props.OnRemoveExpression(l_expressionColumn_0);
                    end;
                    return;
                end;
            else
                if l_expressionColumn_0 == "" and l_Text_0 ~= "" then
                    v79.props.OnAddExpression(l_Text_0);
                    v116 = true;
                    if l_CurrentStepStateBundle_1 ~= nil then
                        local l_debuggerStateToken_0 = l_CurrentStepStateBundle_1.debuggerStateToken;
                        if l_debuggerStateToken_0 then
                            local l_l_DebuggerConnectionManager_1_ConnectionById_0 = l_DebuggerConnectionManager_1:GetConnectionById(l_debuggerStateToken_0.debuggerConnectionId);
                            v79.props.OnExecuteExpressionForAllFrames(l_Text_0, l_l_DebuggerConnectionManager_1_ConnectionById_0, l_debuggerStateToken_0, l_CurrentStepStateBundle_1.threadId);
                        end;
                    end;
                elseif l_Text_0 == "" then
                    v79.props.OnRemoveExpression(l_expressionColumn_0);
                elseif l_expressionColumn_0 ~= l_Text_0 then
                    v79.props.OnChangeExpression(l_expressionColumn_0, l_Text_0);
                    v116 = true;
                    if l_CurrentStepStateBundle_1 ~= nil then
                        local l_debuggerStateToken_1 = l_CurrentStepStateBundle_1.debuggerStateToken;
                        if l_debuggerStateToken_1 then
                            local l_l_DebuggerConnectionManager_1_ConnectionById_1 = l_DebuggerConnectionManager_1:GetConnectionById(l_debuggerStateToken_1.debuggerConnectionId);
                            v79.props.OnExecuteExpressionForAllFrames(l_Text_0, l_l_DebuggerConnectionManager_1_ConnectionById_1, l_debuggerStateToken_1, l_CurrentStepStateBundle_1.threadId);
                        end;
                    end;
                end;
                if v116 then
                    v79.props.Analytics:report(v10.WatchAdded, "WatchWindow");
                end;
            end;
        end;
    end;
    v79.onMenuActionSelected = function(v121) --[[ Line: 377 ]]
        -- upvalues: v79 (copy), v39 (ref)
        local l_Id_0 = v121.Id;
        local l_Data_0 = v121.Data;
        local l_props_1 = v79.props;
        if l_Id_0 == v39.WatchActionIds.DeleteWatch then
            if l_Data_0.item.expressionColumn ~= "" then
                l_props_1.OnRemoveExpression(l_Data_0.item.expressionColumn);
                return;
            end;
        elseif l_Id_0 == v39.WatchActionIds.DeleteAllWatches then
            l_props_1.OnClearAllExpressions();
        end;
    end;
    v79.onRightClick = function(v125) --[[ Line: 391 ]]
        -- upvalues: v79 (copy), v20 (ref), v41 (ref), l_showContextMenu_0 (ref), v39 (ref)
        if v79.props.SelectedTab == v20.Watches then
            local l_props_2 = v79.props;
            local l_Localization_4 = l_props_2.Localization;
            local v128 = l_props_2.Plugin:get();
            local v129 = v41.getWatchActions(l_Localization_4, v125, v79.onMenuActionSelected);
            l_showContextMenu_0(v128, v129, v39.WatchActionsOrder);
        end;
    end;
    v79.OnDoubleClick = function(v130) --[[ Line: 402 ]]
        -- upvalues: v79 (copy), v20 (ref)
        if v79.props.SelectedTab == v20.Watches then
            game:GetService("DebuggerUIService"):EditWatch(v130.item.expressionColumn);
        end;
    end;
    v79.OnSortChange = function(v131, v132) --[[ Line: 409 ]]
        -- upvalues: v79 (copy)
        local l_props_3 = v79.props;
        local v134 = l_props_3.SortOrder or v132;
        l_props_3.OnSetWatchSortState(l_props_3.SortIndex == v131 and v132 or v134, v131);
    end;
    v79.childSort = function(v135, v136) --[[ Line: 415 ]]
        -- upvalues: v79 (copy), v20 (ref), v23 (ref), v47 (ref), v48 (ref)
        local v137 = {
            v135, 
            v136
        };
        local l_props_4 = v79.props;
        local v139 = l_props_4.SelectedTab == v20.Variables;
        if v135 == v136 then
            return false;
        else
            v23.sortTableByColumnAndOrder(v137, l_props_4.SortIndex, l_props_4.SortOrder, v139 and v47 or v48, false);
            return v137[1] == v135;
        end;
    end;
end;
v42.didMount = function(v140) --[[ Line: 435 ]] --[[ Name: didMount ]]
    -- upvalues: v39 (copy), v40 (copy)
    local l_props_5 = v140.props;
    local l_Setting_0 = l_props_5.Plugin:get():GetSetting("watchWindowConfigs");
    if l_Setting_0 and l_Setting_0[v39.ColumnSizeVariables] and l_Setting_0[v39.ColumnSizeMyWatches] and l_Setting_0[v39.Tab] and l_Setting_0[v39.ScopeFilter] and l_Setting_0[v39.VariablesColumnFilter] and l_Setting_0[v39.MyWatchesColumnFilter] then
        l_props_5.onScopeFilterChange(l_Setting_0[v39.ScopeFilter]);
        l_props_5.onTabSelected(l_Setting_0[v39.Tab]);
        l_props_5.onVariablesFilterChange(l_Setting_0[v39.VariablesColumnFilter]);
        l_props_5.onMyWatchesFilterChange(l_Setting_0[v39.MyWatchesColumnFilter]);
        v140:setState(function(_) --[[ Line: 452 ]]
            -- upvalues: v40 (ref), l_Setting_0 (copy), v39 (ref)
            return {
                VariableColumnSizes = v40.fetchSizesFromColumnScales(l_Setting_0[v39.ColumnSizeVariables]), 
                MyWatchColumnSizes = v40.fetchSizesFromColumnScales(l_Setting_0[v39.ColumnSizeMyWatches])
            };
        end);
    end;
end;
v42.willUnmount = function(v144) --[[ Line: 465 ]] --[[ Name: willUnmount ]]
    -- upvalues: v39 (copy), v40 (copy)
    local l_props_6 = v144.props;
    l_props_6.Plugin:get():SetSetting("watchWindowConfigs", {
        [v39.ScopeFilter] = l_props_6.EnabledScopes, 
        [v39.Tab] = l_props_6.SelectedTab, 
        [v39.ColumnSizeVariables] = v40.fetchScaleFromColumnSizes(v144.state.VariableColumnSizes), 
        [v39.ColumnSizeMyWatches] = v40.fetchScaleFromColumnSizes(v144.state.MyWatchColumnSizes), 
        [v39.VariablesColumnFilter] = l_props_6.VariablesColumnFilter, 
        [v39.MyWatchesColumnFilter] = l_props_6.MyWatchesColumnFilter
    });
end;
v42.didUpdate = function(v146, v147) --[[ Line: 480 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy), v43 (copy), v44 (copy), v4 (copy), v40 (copy)
    local l_props_7 = v146.props;
    if l_props_7.Expressions ~= v147.Expressions then
        local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
        if l_DebuggerUIService_0 then
            l_DebuggerUIService_0:SetWatchExpressions(l_props_7.Expressions);
        end;
    end;
    local v150 = l_props_7.SelectedTab == v20.Variables;
    local v151 = if v150 then v43 else v44;
    local v152 = if v150 then l_props_7.VariablesColumnFilter else l_props_7.MyWatchesColumnFilter;
    local v153 = if v150 then v147.VariablesColumnFilter else v147.MyWatchesColumnFilter;
    local v154 = #v152 + #v151;
    local v155 = if v150 then v146.state.VariableColumnSizes else v146.state.MyWatchColumnSizes;
    if #v152 ~= #v153 and #v155 ~= v154 then
        local v156 = {};
        local v157 = #v153 + #v151;
        local v158 = v4.List.toSet(v152);
        local v159 = v40.fetchOldColumnSizes(v157, v153, v151, v155);
        if v154 < v157 then
            local v160 = v40.fetchDeletedColumnsSize(#v151, v157, v153, v159, v158);
            v156 = v40.updatedSizesAfterRemovingColumns(v154, v160, v159, v151, v152);
        else
            v156 = v40.updatedSizesAfterAddingColumns(v154, v157, v159, v152, v151);
        end;
        do
            local l_v156_0 = v156;
            if v150 then
                v146:setState(function(_) --[[ Line: 537 ]]
                    -- upvalues: l_v156_0 (ref)
                    return {
                        VariableColumnSizes = l_v156_0
                    };
                end);
            else
                v146:setState(function(_) --[[ Line: 543 ]]
                    -- upvalues: l_v156_0 (ref)
                    return {
                        MyWatchColumnSizes = l_v156_0
                    };
                end);
            end;
        end;
    end;
end;
v42.render = function(v164) --[[ Line: 552 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v43 (copy), v44 (copy), l_map_0 (copy), l_join_0 (copy), v1 (copy), l_TreeTable_0 (copy), v39 (copy)
    local l_props_8 = v164.props;
    local l_Stylizer_1 = l_props_8.Stylizer;
    local v167 = l_props_8.SelectedTab == v20.Variables;
    local v168 = nil;
    local v169 = if v167 then v164.props.VariablesColumnFilter else v164.props.MyWatchesColumnFilter;
    local v170 = if v167 then v43 else v44;
    v168 = v164.getTableColumns(v169, v170);
    local v173 = l_map_0(v168, function(v171, v172) --[[ Line: 562 ]]
        -- upvalues: v167 (copy), l_join_0 (ref), v164 (copy)
        if v167 then
            return l_join_0(v171, {
                Width = v164.state.VariableColumnSizes[v172]
            });
        else
            return l_join_0(v171, {
                Width = v164.state.MyWatchColumnSizes[v172]
            });
        end;
    end);
    local v174 = not v167 and {
        [1] = true
    } or nil;
    return v1.createElement(l_TreeTable_0, {
        Scroll = true, 
        Size = UDim2.fromScale(1, 1), 
        Columns = v173, 
        RootItems = l_props_8.RootItems, 
        Stylizer = l_Stylizer_1, 
        OnExpansionChange = v164.onExpansionChange, 
        GetChildren = v164.getTreeChildren, 
        Expansion = l_props_8.ExpansionTable, 
        OnFocusLost = v164.OnFocusLost, 
        TextInputCols = v174, 
        RightClick = v164.onRightClick, 
        OnDoubleClick = v164.OnDoubleClick, 
        DisableTooltip = false, 
        SortIndex = l_props_8.SortIndex, 
        SortOrder = l_props_8.SortOrder, 
        OnSortChange = v164.OnSortChange, 
        SortChildren = v164.childSort, 
        OnColumnSizesChange = v164.OnColumnSizesChange, 
        UseDeficit = false, 
        UseScale = true, 
        ClampSize = true, 
        ColumnHeaderHeight = v39.COLUMN_HEADER_HEIGHT, 
        RowHeight = v39.ROW_HEIGHT, 
        ExpandOnDoubleClick = true
    });
end;
v42 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v42);
return (v2.connect(function(v175, _) --[[ Line: 611 ]]
    -- upvalues: v20 (copy), l_deepCopy_0 (copy), v78 (copy), v49 (copy), v69 (copy), v56 (copy), v21 (copy), v47 (copy), v48 (copy), v23 (copy), v22 (copy)
    local l_Common_0 = v175.Common;
    local l_Watch_0 = v175.Watch;
    local l_currentTab_0 = l_Watch_0.currentTab;
    local v180 = l_currentTab_0 == v20.Variables;
    local v181 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    local v182 = v181 and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId] and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v181] or 1;
    local v183 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
    local v184 = v183 and l_Watch_0.stateTokenToRoots[v183] or nil;
    local v185 = v184 and v184[v181] and v184[v181][v182];
    local v186 = v180 and "Variables" or "Watches";
    local v187 = v185 and (v185[v186] and l_deepCopy_0(v185[v186]) or {}) or {};
    local v188 = l_Watch_0.stateTokenToFlattenedTree[v183];
    local v189 = v188 and v188[v181] and v188[v181][v182];
    local v190 = v189 and (v189[v186] and l_deepCopy_0(v189[v186]) or {}) or {};
    if not v180 then
        v187 = v78(l_Watch_0.listOfExpressions, v187, v190);
    end;
    local v191 = v49(v187, v190);
    v191 = v69(v191, v190, v180);
    local v192 = {};
    local v193 = v180 and l_Watch_0.pathToExpansionState or l_Watch_0.expressionToExpansionState;
    v56(v191, v192, v193);
    if not v180 then
        table.insert(v191, v21.fromExpression(""));
    end;
    local v194 = v180 and v47 or v48;
    local v195 = nil;
    local v196 = nil;
    v195 = if v180 then l_Watch_0.variablesColumnIndex else l_Watch_0.watchesColumnIndex;
    v196 = if v180 then l_Watch_0.variablesSortDirection else l_Watch_0.watchesSortDirection;
    v23.sortTableByColumnAndOrder(v191 or {}, v195, v196, v194, not v180);
    return {
        SelectedTab = l_currentTab_0, 
        RootItems = v191 or {}, 
        ExpansionTable = v192, 
        CurrentStepStateBundle = v22.ctor(v183, v181, v182), 
        SortIndex = v195, 
        SortOrder = v196, 
        EnabledScopes = l_Watch_0.listOfEnabledScopes, 
        Expressions = l_Watch_0.listOfExpressions, 
        VariablesColumnFilter = l_Watch_0.listOfVariablesColumns, 
        MyWatchesColumnFilter = l_Watch_0.listOfMyWatchesColumns
    };
end, function(v197) --[[ Line: 677 ]]
    -- upvalues: v25 (copy), v26 (copy), v27 (copy), v28 (copy), v35 (copy), v36 (copy), v29 (copy), v30 (copy), v31 (copy), v37 (copy), v32 (copy), v34 (copy), v33 (copy)
    return {
        OnVariableExpansionDispatch = function(v198, v199) --[[ Line: 679 ]] --[[ Name: OnVariableExpansionDispatch ]]
            -- upvalues: v197 (copy), v25 (ref)
            return v197(v25(v198, v199));
        end, 
        OnExpressionExpansionDispatch = function(v200, v201) --[[ Line: 682 ]] --[[ Name: OnExpressionExpansionDispatch ]]
            -- upvalues: v197 (copy), v26 (ref)
            return v197(v26(v200, v201));
        end, 
        OnChangeExpression = function(v202, v203) --[[ Line: 685 ]] --[[ Name: OnChangeExpression ]]
            -- upvalues: v197 (copy), v27 (ref)
            return v197(v27(v202, v203));
        end, 
        OnAddExpression = function(v204) --[[ Line: 688 ]] --[[ Name: OnAddExpression ]]
            -- upvalues: v197 (copy), v28 (ref)
            return v197(v28(v204));
        end, 
        OnLazyLoadChildren = function(v205, v206, v207, v208, v209) --[[ Line: 691 ]] --[[ Name: OnLazyLoadChildren ]]
            -- upvalues: v197 (copy), v35 (ref)
            local l_v209_VariableById_0 = v209:GetVariableById(v206);
            if not l_v209_VariableById_0 then
                return;
            else
                local v211 = v205:sub(1, -1 * (string.len(l_v209_VariableById_0.Name) + 2));
                return v197(v35(v211, {
                    l_v209_VariableById_0
                }, v207, v208, v209));
            end;
        end, 
        OnExecuteExpressionForAllFrames = function(v212, v213, v214, v215) --[[ Line: 703 ]] --[[ Name: OnExecuteExpressionForAllFrames ]]
            -- upvalues: v197 (copy), v36 (ref)
            return v197(v36(v212, v213, v214, v215));
        end, 
        OnRemoveExpression = function(v216) --[[ Line: 706 ]] --[[ Name: OnRemoveExpression ]]
            -- upvalues: v197 (copy), v29 (ref)
            return v197(v29(v216));
        end, 
        OnClearAllExpressions = function() --[[ Line: 709 ]] --[[ Name: OnClearAllExpressions ]]
            -- upvalues: v197 (copy), v30 (ref)
            return v197(v30());
        end, 
        OnSetWatchSortState = function(v217, v218) --[[ Line: 712 ]] --[[ Name: OnSetWatchSortState ]]
            -- upvalues: v197 (copy), v31 (ref)
            return v197(v31(v217, v218));
        end, 
        onScopeFilterChange = function(v219) --[[ Line: 715 ]] --[[ Name: onScopeFilterChange ]]
            -- upvalues: v197 (copy), v37 (ref)
            return v197(v37(v219));
        end, 
        onTabSelected = function(v220) --[[ Line: 718 ]] --[[ Name: onTabSelected ]]
            -- upvalues: v197 (copy), v32 (ref)
            return v197(v32(v220));
        end, 
        onVariablesFilterChange = function(v221) --[[ Line: 721 ]] --[[ Name: onVariablesFilterChange ]]
            -- upvalues: v197 (copy), v34 (ref)
            return v197(v34(v221));
        end, 
        onMyWatchesFilterChange = function(v222) --[[ Line: 724 ]] --[[ Name: onMyWatchesFilterChange ]]
            -- upvalues: v197 (copy), v33 (ref)
            return v197(v33(v222));
        end
    };
end)(v42));