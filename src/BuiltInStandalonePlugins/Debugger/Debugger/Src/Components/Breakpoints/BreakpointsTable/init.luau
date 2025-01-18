local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_UI_0 = v3.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local v19 = require(l_Parent_0.Src.Models.BreakpointRow);
local v20 = require(l_Parent_0.Src.Util.Constants);
local v21 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsTreeTableCell);
local v22 = v1.PureComponent:extend("BreakpointsTable");
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.BreakpointHelperFunctions);
local v25 = require(l_Util_0.WatchHelperFunctions);
local v26 = require(l_Util_0.ColumnResizeHelperFunctions);
local v27 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v29 = require(l_Thunks_0.Breakpoints.ToggleAllBreakpoints);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v31 = require(l_Actions_0.BreakpointsWindow.SetBreakpointSortState);
local v32 = require(l_Actions_0.BreakpointsWindow.BreakpointColumnFilter);
local v33 = require(script.Parent.BreakpointsDropdownField);
local v34 = require(script.Parent.DeleteAllBreakpointsDialog);
local v35 = require(l_Util_0.MakePluginActions);
local v36 = {
    [1] = "isEnabled", 
    [2] = "scriptName", 
    [3] = "lineNumber"
};
local v37 = {
    SourceLineColumn = "scriptLine", 
    ConditionColumn = "condition", 
    LogMessageColumn = "logMessage", 
    ContinueExecutionColumn = "continueExecution", 
    RemoveOnHitColumn = "removeOnHit"
};
local function _(v38) --[[ Line: 67 ]] --[[ Name: fetchContextIcon ]]
    -- upvalues: v20 (copy)
    if v38 == v20.GameStateTypes.Client then
        return v20.DebugpointIconTable.client;
    elseif v38 == v20.GameStateTypes.Server then
        return v20.DebugpointIconTable.server;
    else
        return nil;
    end;
end;
v22.init = function(v40) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v36 (copy), v20 (copy), v27 (copy), v24 (copy), v35 (copy), l_showContextMenu_0 (copy), v4 (copy)
    local v41 = {};
    local v42 = #v36 + #v40.props.ColumnFilter;
    for v43 = 1, v42 do
        if v43 == 2 then
            table.insert(v41, UDim.new(2 / (v42 + 0.5), 0));
        elseif v43 == 3 then
            table.insert(v41, UDim.new(0.5 / (v42 + 0.5), 0));
        else
            table.insert(v41, UDim.new(1 / (v42 + 0.5), 0));
        end;
    end;
    v40.state = {
        selectedBreakpoints = {}, 
        breakpointIdToExpansionState = {}, 
        sizes = v41, 
        deleteAllPopup = false
    };
    v40.OnDoubleClick = function(_) --[[ Line: 98 ]]
        -- upvalues: v40 (copy)
        v40.goToScript();
    end;
    v40.OnColumnSizesChange = function(v45) --[[ Line: 102 ]]
        -- upvalues: v40 (copy)
        v40:setState(function(_) --[[ Line: 103 ]]
            -- upvalues: v45 (copy)
            return {
                sizes = v45
            };
        end);
    end;
    v40.onSelectionChange = function(v47) --[[ Line: 110 ]]
        -- upvalues: v40 (copy)
        local v48 = {};
        for v49 in pairs(v47) do
            table.insert(v48, v49);
        end;
        v40:setState(function(_) --[[ Line: 116 ]]
            -- upvalues: v48 (copy)
            return {
                selectedBreakpoints = v48
            };
        end);
    end;
    v40.onMenuActionSelected = function(v51) --[[ Line: 123 ]]
        -- upvalues: v20 (ref), v40 (copy), v27 (ref), v24 (ref)
        local l_Id_0 = v51.Id;
        local l_Data_0 = v51.Data;
        if l_Id_0 == v20.BreakpointActions.DeleteBreakpoint or l_Id_0 == v20.LogpointActions.DeleteLogpoint then
            game:GetService("MetaBreakpointManager"):RemoveBreakpointById(l_Data_0.item.id);
            v40.props.Analytics:report(v27.RemoveMetaBreakpoint, "LuaBreakpointsTable.ContextMenu");
            return;
        elseif l_Id_0 == v20.BreakpointActions.EditBreakpoint or l_Id_0 == v20.LogpointActions.EditLogpoint then
            game:GetService("DebuggerUIService"):EditBreakpoint(l_Data_0.item.id);
            return;
        elseif l_Id_0 == v20.BreakpointActions.EnableBreakpoint or l_Id_0 == v20.LogpointActions.EnableLogpoint or l_Id_0 == v20.BreakpointActions.DisableBreakpoint or l_Id_0 == v20.LogpointActions.DisableLogpoint then
            local l_BreakpointById_0 = game:GetService("MetaBreakpointManager"):GetBreakpointById(l_Data_0.item.id);
            v24.setBreakpointRowEnabled(l_BreakpointById_0, l_Data_0, v40.props.Analytics, "LuaBreakpointsTable.ContextMenu", v40.props.CurrentDebuggerConnectionId);
            return;
        else
            if l_Id_0 == v20.CommonActions.GoToScript then
                v40.goToScript();
            end;
            return;
        end;
    end;
    v40.OnSortChange = function(v55, v56) --[[ Line: 161 ]]
        -- upvalues: v40 (copy)
        local l_props_0 = v40.props;
        local v58 = l_props_0.SortOrder or v56;
        l_props_0.onSetBreakpointSortState(l_props_0.SortIndex == v55 and v56 or v58, v55);
    end;
    v40.onRightClick = function(v59) --[[ Line: 167 ]]
        -- upvalues: v40 (copy), v20 (ref), v35 (ref), l_showContextMenu_0 (ref)
        v40:setState(function(_) --[[ Line: 168 ]]
            -- upvalues: v59 (copy)
            return {
                selectedBreakpoints = {
                    v59.item
                }
            };
        end);
        local l_props_1 = v40.props;
        local l_Localization_1 = l_props_1.Localization;
        local v63 = l_props_1.Plugin:get();
        local v64 = v59.item.debugpointType == v20.DebugpointType.Logpoint;
        local v65 = v35.getBreakpointActions(l_Localization_1, v59.item.isEnabled, v64, v59, v40.onMenuActionSelected);
        local v66 = v35.getBreakpointActionsOrder(v59.item.isEnabled, v64);
        l_showContextMenu_0(v63, v65, v66);
    end;
    v40.displayDeleteAllBreakpointsPopup = function() --[[ Line: 192 ]]
        -- upvalues: v40 (copy)
        v40:setState(function(_) --[[ Line: 193 ]]
            return {
                deleteAllPopup = true
            };
        end);
    end;
    v40.closeDeleteAllBreakpointsPopup = function() --[[ Line: 200 ]]
        -- upvalues: v40 (copy)
        v40:setState(function(_) --[[ Line: 201 ]]
            return {
                deleteAllPopup = false
            };
        end);
    end;
    v40.deleteAllBreakpoints = function() --[[ Line: 208 ]]
        -- upvalues: v40 (copy), v27 (ref)
        local l_MetaBreakpointManager_0 = game:GetService("MetaBreakpointManager");
        for _, v71 in ipairs(v40.props.Breakpoints) do
            l_MetaBreakpointManager_0:RemoveBreakpointById(v71.id);
        end;
        v40.props.Analytics:report(v27.RemoveAllMetaBreakpoints, "LuaBreakpointsTable");
    end;
    v40.toggleEnabledAll = function() --[[ Line: 217 ]]
        -- upvalues: v40 (copy), v27 (ref)
        local l_MetaBreakpointManager_1 = game:GetService("MetaBreakpointManager");
        local l_hasDisabledBreakpoints_0 = v40.props.hasDisabledBreakpoints;
        v40.props.onToggleEnabledAll(l_MetaBreakpointManager_1, l_hasDisabledBreakpoints_0);
        if l_hasDisabledBreakpoints_0 then
            v40.props.Analytics:report(v27.EnableAllMetaBreakpoints, "LuaBreakpointsTable");
            return;
        else
            v40.props.Analytics:report(v27.DisableAllMetaBreakpoints, "LuaBreakpointsTable");
            return;
        end;
    end;
    v40.goToScript = function() --[[ Line: 230 ]]
        -- upvalues: v40 (copy)
        if #v40.state.selectedBreakpoints ~= 0 then
            local v74 = v40.state.selectedBreakpoints[1];
            local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
            local v76 = if v74.hiddenConnectionId then v74.hiddenConnectionId else v40.props.CurrentDebuggerConnectionId;
            local v77 = if v74.hiddenLineNumber then v74.hiddenLineNumber else v74.lineNumber;
            l_DebuggerUIService_0:OpenScriptAtLine(v74.scriptGUID, v76, v77, true);
        end;
    end;
    v40.onExpansionChange = function(v78) --[[ Line: 244 ]]
        -- upvalues: v40 (copy), v4 (ref)
        v40:setState(function(v79) --[[ Line: 245 ]]
            -- upvalues: v78 (copy), v4 (ref)
            local v80 = {};
            for v81, v82 in pairs(v78) do
                v80[v81.id] = v82;
            end;
            return {
                breakpointIdToExpansionState = v4.Dictionary.join(v79.breakpointIdToExpansionState, v80)
            };
        end);
    end;
    v40.getTreeChildren = function(v83) --[[ Line: 259 ]]
        return v83.children or {};
    end;
    v40.OnFocusLost = function(_, v85, v86, v87) --[[ Line: 263 ]]
        -- upvalues: v40 (copy), v27 (ref)
        local l_BreakpointById_1 = game:GetService("MetaBreakpointManager"):GetBreakpointById(v86.item.id);
        if not l_BreakpointById_1 then
            return;
        else
            if v40.props.CurrentKeys[v87] == "condition" then
                local l_Text_0 = v85.Text;
                if l_Text_0 ~= l_BreakpointById_1.Condition then
                    l_BreakpointById_1.Condition = l_Text_0;
                    v40.props.Analytics:report(v27.MetaBreakpointConditionChanged, "LuaBreakpointsTable");
                    return;
                end;
            elseif v40.props.CurrentKeys[v87] == "logMessage" then
                local l_Text_1 = v85.Text;
                if l_Text_1 ~= l_BreakpointById_1.LogMessage then
                    l_BreakpointById_1.LogMessage = l_Text_1;
                    v40.props.Analytics:report(v27.MetaBreakpointLogMessageChanged, "LuaBreakpointsTable");
                end;
            end;
            return;
        end;
    end;
end;
v22.didMount = function(v91) --[[ Line: 291 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy), v26 (copy)
    local l_props_2 = v91.props;
    local l_Setting_0 = l_props_2.Plugin:get():GetSetting("breakpointsWindowConfigs");
    if l_Setting_0 and l_Setting_0[v20.ColumnSize] and l_Setting_0[v20.ColumnFilter] then
        l_props_2.onColumnFilterChange(l_Setting_0[v20.ColumnFilter]);
        v91:setState(function(_) --[[ Line: 297 ]]
            -- upvalues: v26 (ref), l_Setting_0 (copy), v20 (ref)
            return {
                sizes = v26.fetchSizesFromColumnScales(l_Setting_0[v20.ColumnSize])
            };
        end);
    end;
    if v91.props.IsPaused and v91.props.CurrentBreakpoint then
        v91:setState(function(_) --[[ Line: 305 ]]
            -- upvalues: v91 (copy)
            return {
                selectedBreakpoints = {
                    v91.props.CurrentBreakpoint
                }
            };
        end);
    end;
end;
v22.willUnmount = function(v96) --[[ Line: 313 ]] --[[ Name: willUnmount ]]
    -- upvalues: v20 (copy), v26 (copy)
    local l_props_3 = v96.props;
    l_props_3.Plugin:get():SetSetting("breakpointsWindowConfigs", {
        [v20.ColumnFilter] = l_props_3.ColumnFilter, 
        [v20.ColumnSize] = v26.fetchScaleFromColumnSizes(v96.state.sizes)
    });
end;
v22.didUpdate = function(v98, v99) --[[ Line: 322 ]] --[[ Name: didUpdate ]]
    -- upvalues: v36 (copy), v4 (copy), v26 (copy)
    local l_props_4 = v98.props;
    local v101 = #l_props_4.ColumnFilter + #v36;
    if #l_props_4.ColumnFilter ~= #v99.ColumnFilter and #v98.state.sizes ~= v101 then
        local v102 = {};
        local v103 = #v99.ColumnFilter + #v36;
        local v104 = v4.List.toSet(l_props_4.ColumnFilter);
        local v105 = v26.fetchOldColumnSizes(v103, v99.ColumnFilter, v36, v98.state.sizes);
        if v101 < v103 then
            local v106 = v26.fetchDeletedColumnsSize(#v36, v103, v99.ColumnFilter, v105, v104);
            v102 = v26.updatedSizesAfterRemovingColumns(v101, v106, v105, v36, l_props_4.ColumnFilter);
        else
            v102 = v26.updatedSizesAfterAddingColumns(v101, v103, v105, l_props_4.ColumnFilter, v36);
        end;
        do
            local l_v102_0 = v102;
            v98:setState(function(_) --[[ Line: 369 ]]
                -- upvalues: l_v102_0 (ref)
                return {
                    sizes = l_v102_0
                };
            end);
        end;
    end;
    if v98.props.IsPaused ~= v99.IsPaused and v98.props.IsPaused and v98.props.CurrentBreakpoint then
        v98:setState(function(_) --[[ Line: 378 ]]
            -- upvalues: v98 (copy)
            return {
                selectedBreakpoints = {
                    v98.props.CurrentBreakpoint
                }
            };
        end);
        return;
    else
        if v98.props.Breakpoints ~= v99.Breakpoints and #v98.state.selectedBreakpoints ~= 0 then
            local v110 = {};
            local v111 = {};
            local v112 = {};
            for _, v114 in ipairs(v98.state.selectedBreakpoints) do
                if v114.context then
                    v112[v114.id] = v114.context .. v114.scriptGUID;
                else
                    v111[v114.id] = true;
                end;
            end;
            for _, v116 in ipairs(v98.props.Breakpoints) do
                if v111[v116.id] then
                    table.insert(v110, v116);
                end;
                if v112[v116.id] then
                    for _, v118 in ipairs(v116.children) do
                        if v118.context .. v118.scriptGUID == v112[v116.id] then
                            table.insert(v110, v118);
                        end;
                    end;
                end;
            end;
            v98:setState(function(_) --[[ Line: 421 ]]
                -- upvalues: v110 (copy)
                return {
                    selectedBreakpoints = v110
                };
            end);
        end;
        return;
    end;
end;
v22.render = function(v120) --[[ Line: 430 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), v37 (copy), l_map_0 (copy), l_join_0 (copy), v20 (copy), v1 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), v33 (copy), l_TreeTable_0 (copy), v21 (copy), v34 (copy)
    local l_props_5 = v120.props;
    local l_Localization_2 = l_props_5.Localization;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local v124 = l_props_5.IsPaused and l_props_5.CurrentBreakpoint and v120.state.selectedBreakpoints[1] and l_props_5.CurrentBreakpoint.id == v120.state.selectedBreakpoints[1].id;
    local v125 = {
        {
            Name = "", 
            Key = v36[1]
        }, 
        {
            Name = l_Localization_2:getText("BreakpointsWindow", "ScriptColumn"), 
            Key = v36[2], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", "ScriptColumnTooltip") or nil
        }, 
        {
            Name = l_Localization_2:getText("BreakpointsWindow", "LineColumn"), 
            Key = v36[3], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", "LineColumnTooltip") or nil
        }
    };
    for _, v127 in ipairs(l_props_5.ColumnFilter) do
        table.insert(v125, {
            Name = l_Localization_2:getText("BreakpointsWindow", v127), 
            Key = v37[v127], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", v127 .. "Tooltip") or nil
        });
    end;
    local v130 = l_map_0(v125, function(v128, v129) --[[ Line: 465 ]]
        -- upvalues: l_join_0 (ref), v120 (copy)
        return l_join_0(v128, {
            Width = v120.state.sizes[v129]
        });
    end);
    local v131 = {};
    for _, v133 in pairs(l_props_5.Breakpoints) do
        if v120.state.breakpointIdToExpansionState[v133.id] == nil then
            v120.state.breakpointIdToExpansionState[v133.id] = false;
        end;
        v131[v133] = v120.state.breakpointIdToExpansionState[v133.id];
    end;
    local v134 = nil;
    v134 = if l_props_5.hasDisabledBreakpoints then l_Localization_2:getText("BreakpointsWindow", "EnableAll") else l_Localization_2:getText("BreakpointsWindow", "DisableAll");
    local v135 = v20.HEADER_HEIGHT + v20.BUTTON_PADDING * 2;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundColor3 = l_Stylizer_1.MainBackground
    }, {
        HeaderPane = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v135), 
            Spacing = v20.BUTTON_PADDING, 
            Padding = v20.BUTTON_PADDING, 
            Style = "Box", 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            ButtonsContainer = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0.5, 0, 0, v20.HEADER_HEIGHT), 
                LayoutOrder = 1, 
                Style = "Box", 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                DisableAllBreakpointButton = v1.createElement(l_IconButton_0, {
                    Size = UDim2.new(0, v20.BUTTON_SIZE, 0, v20.BUTTON_SIZE), 
                    LayoutOrder = 1, 
                    LeftIcon = "rbxasset://textures/Debugger/Breakpoints/disable_all@2x.png", 
                    TooltipText = v134, 
                    OnClick = v120.toggleEnabledAll, 
                    Disabled = #l_props_5.Breakpoints == 0
                }), 
                DeleteAllBreakpointButton = v1.createElement(l_IconButton_0, {
                    Size = UDim2.new(0, v20.BUTTON_SIZE, 0, v20.BUTTON_SIZE), 
                    LayoutOrder = 2, 
                    LeftIcon = "rbxasset://textures/Debugger/Breakpoints/delete_all@2x.png", 
                    TooltipText = l_Localization_2:getText("BreakpointsWindow", "DeleteAll"), 
                    OnClick = v120.displayDeleteAllBreakpointsPopup, 
                    Disabled = #l_props_5.Breakpoints == 0
                })
            }), 
            DropdownContainer = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0.5, 0, 0, v20.HEADER_HEIGHT), 
                LayoutOrder = 2, 
                Style = "Box", 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }, {
                ColumnDropdown = v1.createElement(v33, {
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }), 
        TablePane = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -v135), 
            Style = "Box", 
            LayoutOrder = 2
        }, {
            BreakpointsTable = v1.createElement(l_TreeTable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Columns = v130, 
                RootItems = l_props_5.Breakpoints or {}, 
                OnExpansionChange = v120.onExpansionChange, 
                RightClick = v120.onRightClick, 
                CellComponent = v21, 
                LayoutOrder = 2, 
                OnSelectionChange = v120.onSelectionChange, 
                HighlightedRows = v120.state.selectedBreakpoints, 
                Scroll = true, 
                ScrollFocusIndex = v124 and v120.props.CurrentBreakpointIndex, 
                Expansion = v131, 
                GetChildren = v120.getTreeChildren, 
                TextInputCols = l_props_5.TextInputCols, 
                OnFocusLost = v120.OnFocusLost, 
                OnDoubleClick = v120.OnDoubleClick, 
                SortIndex = l_props_5.SortIndex, 
                SortOrder = l_props_5.SortOrder, 
                OnSortChange = v120.OnSortChange, 
                OnColumnSizesChange = v120.OnColumnSizesChange, 
                UseDeficit = false, 
                UseScale = true, 
                ClampSize = true, 
                ColumnHeaderHeight = v20.COLUMN_HEADER_HEIGHT, 
                RowHeight = v20.ROW_HEIGHT, 
                ExpandOnDoubleClick = true
            })
        }), 
        DeleteAllDialog = v1.createElement(v34, {
            Enabled = v120.state.deleteAllPopup, 
            CloseDialog = v120.closeDeleteAllBreakpointsPopup, 
            DeleteAllBreakpoints = v120.deleteAllBreakpoints
        })
    });
end;
v22 = l_ContextServices_0.withContext({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v22);
return (v2.connect(function(v136, _) --[[ Line: 593 ]]
    -- upvalues: l_deepCopy_0 (copy), v19 (copy), v20 (copy), v36 (copy), v37 (copy), v25 (copy)
    local v138 = {};
    local v139 = nil;
    local v140 = nil;
    local v141 = false;
    for _, v143 in pairs(v136.Breakpoint.MetaBreakpoints) do
        local v144 = l_deepCopy_0(v143);
        v144.scriptGUID = v143.scriptName;
        v144.scriptName = v136.ScriptInfo.ScriptInfo[v144.scriptName];
        v144.scriptLine = v136.ScriptInfo.ScriptLineContents[v144.scriptGUID] and v136.ScriptInfo.ScriptLineContents[v144.scriptGUID][v144.lineNumber];
        table.insert(v138, v144);
        if v143.isEnabled == false then
            v141 = true;
        end;
    end;
    local v145 = 1;
    for _, v147 in ipairs(v138) do
        if v147.id == v136.Common.currentBreakpointId then
            v139 = v147;
            v140 = v145;
        end;
        v145 = v145 + 1;
        v147.children = {};
        for v148, v149 in pairs(v147.contextBreakpoints) do
            for _, v151 in ipairs(v149.breakpoints) do
                local v152 = v19.extractNonChildData(v147, v148, v151.Script);
                v152.hiddenConnectionId = v149.connectionId;
                v152.hiddenLineNumber = v152.lineNumber;
                v152.lineNumber = "";
                v152.isEnabled = v151.Enabled;
                v152.isValid = v151.Valid;
                v152.scriptName = {
                    Value = v136.ScriptInfo.ScriptInfo[v151.Script], 
                    LeftIcon = {
                        Image = if v148 == v20.GameStateTypes.Client then v20.DebugpointIconTable.client else if v148 == v20.GameStateTypes.Server then v20.DebugpointIconTable.server else nil, 
                        Size = UDim2.new(0, v20.ICON_SIZE, 0, v20.ICON_SIZE)
                    }
                };
                table.insert(v147.children, v152);
            end;
        end;
    end;
    local v153 = {};
    local v154 = {};
    for _, v156 in ipairs(v36) do
        table.insert(v153, v156);
    end;
    for v157, v158 in ipairs(v136.Breakpoint.listOfEnabledColumns) do
        table.insert(v153, v37[v158]);
        if v158 == "ConditionColumn" or v158 == "LogMessageColumn" then
            v154[v157 + #v36] = true;
        end;
    end;
    v25.sortTableByColumnAndOrder(v138, v136.Breakpoint.ColumnIndex, v136.Breakpoint.SortDirection, v153, false, {
        "scriptGUID", 
        "lineNumber"
    });
    return {
        Breakpoints = v138, 
        IsPaused = v136.Common.isPaused, 
        CurrentBreakpoint = v139, 
        CurrentBreakpointIndex = v140, 
        CurrentDebuggerConnectionId = v136.Common.currentDebuggerConnectionId, 
        SortIndex = v136.Breakpoint.ColumnIndex, 
        SortOrder = v136.Breakpoint.SortDirection, 
        hasDisabledBreakpoints = v141, 
        ColumnFilter = v136.Breakpoint.listOfEnabledColumns, 
        TextInputCols = v154, 
        CurrentKeys = v153
    };
end, function(v159) --[[ Line: 673 ]]
    -- upvalues: v29 (copy), v31 (copy), v32 (copy)
    return {
        onToggleEnabledAll = function(v160, v161) --[[ Line: 675 ]] --[[ Name: onToggleEnabledAll ]]
            -- upvalues: v159 (copy), v29 (ref)
            return v159(v29(v160, v161));
        end, 
        onSetBreakpointSortState = function(v162, v163) --[[ Line: 678 ]] --[[ Name: onSetBreakpointSortState ]]
            -- upvalues: v159 (copy), v31 (ref)
            return v159(v31(v162, v163));
        end, 
        onColumnFilterChange = function(v164) --[[ Line: 681 ]] --[[ Name: onColumnFilterChange ]]
            -- upvalues: v159 (copy), v32 (ref)
            return v159(v32(v164));
        end
    };
end)(v22));