local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(script.Parent.CallstackDropdownField);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v12 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Stylizer_0 = v3.Style.Stylizer;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_IconButton_0 = l_UI_0.IconButton;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.ColumnResizeHelperFunctions);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v26 = require(l_Actions_0.Callstack.SetCurrentFrameNumber);
local v27 = require(l_Actions_0.Callstack.ColumnFilterChange);
local v28 = require(l_Parent_0.Src.Thunks.Watch.LoadAllVariablesForThreadAndFrame);
local v29 = require(l_Parent_0.Src.Thunks.Callstack.PopulateCallstackThreadThunk);
local v30 = require(l_Util_0.MakePluginActions);
local l_Models_0 = l_Parent_0.Src.Models;
local v32 = require(l_Models_0.Callstack.CallstackRow);
local v33 = v1.PureComponent:extend("CallstackComponent");
local v34 = require(l_Parent_0.Src.Util.Constants);
local v35 = require(l_Parent_0.Src.Thunks.Callstack.StepHandlers);
local l_StudioService_0 = game:GetService("StudioService");
local v37 = {
    [1] = "arrowColumn"
};
local v38 = {
    FrameColumn = "frameColumn", 
    SourceColumn = "sourceColumn", 
    FunctionColumn = "functionColumn", 
    LineColumn = "lineColumn"
};
local v39 = {
    ArrowColumn = 0.5, 
    FrameColumn = 0.5, 
    SourceColumn = 1.5, 
    FunctionColumn = 1, 
    LineColumn = 0.5
};
local function _(v40, v41, v42, v43) --[[ Line: 79 ]] --[[ Name: setArrowIcon ]]
    -- upvalues: v32 (copy)
    if v40 == 1 then
        v42[v40].arrowColumn = v32.ICON_FRAME_TOP;
        return;
    elseif v41.frameColumn == v43 then
        v42[v40].arrowColumn = v32.ICON_CURRENT_FRAME;
        return;
    else
        v42[v40].arrowColumn = "";
        return;
    end;
end;
local function _(v45, v46) --[[ Line: 89 ]] --[[ Name: convertGUIDToFileName ]]
    return v46.ScriptInfo[v45];
end;
local _ = function(v48, _, v50, v51) --[[ Line: 93 ]] --[[ Name: convertSourceCol ]]
    v50[v48].scriptGUID = v50[v48].sourceColumn;
    local l_sourceColumn_0 = v50[v48].sourceColumn;
    local v53 = v51.ScriptInfo[l_sourceColumn_0];
    v50[v48].sourceColumn = v53;
end;
local function v70(v55, v56, v57, v58) --[[ Line: 99 ]] --[[ Name: makeCallstackRootItem ]]
    -- upvalues: l_deepCopy_0 (copy), v32 (copy)
    local l_displayString_0 = v55.displayString;
    local l_threadId_0 = v55.threadId;
    local v61 = v57.currentFrameMap[v57.currentDebuggerConnectionId][l_threadId_0];
    local v62 = v56.threadIdToFrameList and v56.threadIdToFrameList[l_threadId_0];
    local v63 = nil;
    local v64 = {
        [1] = {
            frameColumn = 1, 
            functionColumn = "", 
            lineColumn = -1, 
            sourceColumn = l_displayString_0
        }
    };
    v63 = if v62 then l_deepCopy_0(v62) else v64;
    for v65, v66 in ipairs(v63) do
        local l_v63_0 = v63;
        if v65 == 1 then
            l_v63_0[v65].arrowColumn = v32.ICON_FRAME_TOP;
        elseif v66.frameColumn == v61 then
            l_v63_0[v65].arrowColumn = v32.ICON_CURRENT_FRAME;
        else
            l_v63_0[v65].arrowColumn = "";
        end;
        l_v63_0 = v63;
        l_v63_0[v65].scriptGUID = l_v63_0[v65].sourceColumn;
        local l_sourceColumn_1 = l_v63_0[v65].sourceColumn;
        local v69 = v58.ScriptInfo[l_sourceColumn_1];
        l_v63_0[v65].sourceColumn = v69;
    end;
    return {
        arrowColumn = l_displayString_0, 
        threadId = l_threadId_0, 
        children = v63
    };
end;
v33.addAction = function(v71, v72, v73) --[[ Line: 129 ]] --[[ Name: addAction ]]
    if v72 then
        v72.Enabled = true;
        table.insert(v71.shortcuts, v72);
        table.insert(v71.connections, v72.Triggered:Connect(v73));
    end;
end;
v33.didMount = function(v74) --[[ Line: 137 ]] --[[ Name: didMount ]]
    -- upvalues: v34 (copy), v24 (copy)
    local l_props_0 = v74.props;
    local l_Setting_0 = l_props_0.Plugin:get():GetSetting("callstackWindowConfigs");
    if l_Setting_0 and l_Setting_0[v34.ColumnSize] and l_Setting_0[v34.ColumnFilter] then
        l_props_0.onColumnFilterChange(l_Setting_0[v34.ColumnFilter]);
        v74:setState(function(_) --[[ Line: 143 ]]
            -- upvalues: v24 (ref), l_Setting_0 (copy), v34 (ref)
            return {
                sizes = v24.fetchSizesFromColumnScales(l_Setting_0[v34.ColumnSize])
            };
        end);
    end;
    local l_PluginActions_1 = v74.props.PluginActions;
    v74.connections = {};
    v74.shortcuts = {};
    v74:addAction(l_PluginActions_1:get(v34.CallstackActionIds.CopySelected), v74.copySelectedRows);
    v74:addAction(l_PluginActions_1:get(v34.CallstackActionIds.SelectAll), v74.selectAllRows);
end;
v33.willUnmount = function(v79) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    -- upvalues: v34 (copy), v24 (copy)
    local l_props_1 = v79.props;
    l_props_1.Plugin:get():SetSetting("callstackWindowConfigs", {
        [v34.ColumnFilter] = l_props_1.ColumnFilter, 
        [v34.ColumnSize] = v24.fetchScaleFromColumnSizes(v79.state.sizes)
    });
    if v79.connections then
        for _, v82 in ipairs(v79.connections) do
            v82:Disconnect();
        end;
        v79.connections = {};
    end;
    if v79.shortcuts then
        for _, v84 in ipairs(v79.shortcuts) do
            v84.Enabled = false;
        end;
        v79.shortcuts = {};
    end;
end;
v33.init = function(v85) --[[ Line: 180 ]] --[[ Name: init ]]
    -- upvalues: v39 (copy), v32 (copy), v12 (copy), v38 (copy), l_StudioService_0 (copy), v34 (copy), v30 (copy), l_showContextMenu_0 (copy)
    local v86 = {};
    local l_ArrowColumn_0 = v39.ArrowColumn;
    for v88 = 1, #v85.props.ColumnFilter do
        l_ArrowColumn_0 = l_ArrowColumn_0 + v39[v85.props.ColumnFilter[v88]];
    end;
    table.insert(v86, UDim.new(v39.ArrowColumn / l_ArrowColumn_0, 0));
    for v89 = 1, #v85.props.ColumnFilter do
        table.insert(v86, UDim.new(v39[v85.props.ColumnFilter[v89]] / l_ArrowColumn_0, 0));
    end;
    v85.state = {
        selectedRows = {}, 
        selectAll = false, 
        sizes = v86
    };
    v85.OnColumnSizesChange = function(v90) --[[ Line: 202 ]]
        -- upvalues: v85 (copy)
        v85:setState(function(_) --[[ Line: 203 ]]
            -- upvalues: v90 (copy)
            return {
                sizes = v90
            };
        end);
    end;
    v85.getTreeChildren = function(v92) --[[ Line: 210 ]]
        return v92.children or {};
    end;
    v85.onSelectionChange = function(v93) --[[ Line: 214 ]]
        -- upvalues: v85 (copy), v32 (ref), v12 (ref)
        local l_props_2 = v85.props;
        for v95 in pairs(v93) do
            if v95.arrowColumn == "" then
                v95.arrowColumn = v32.ICON_CURRENT_FRAME;
            end;
            v85:setState(function(_) --[[ Line: 221 ]]
                -- upvalues: v95 (copy)
                return {
                    selectedRows = {
                        v95
                    }, 
                    selectAll = false
                };
            end);
            local l_CurrentThreadId_0 = l_props_2.CurrentThreadId;
            local l_frameColumn_0 = v95.frameColumn;
            l_props_2.setCurrentFrameNumber(l_CurrentThreadId_0, l_frameColumn_0);
            local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
            v85.props.Analytics:report(v12.CallstackChangeFrame, "CallstackComponent");
            if v95.scriptGUID ~= "" and v95.sourceColumn ~= "" and v95.lineColumn ~= "" and l_frameColumn_0 then
                if l_frameColumn_0 > 1 then
                    l_DebuggerUIService_0:SetScriptLineMarker(v95.scriptGUID, l_props_2.CurrentDebuggerConnectionId, v95.lineColumn, false);
                else
                    l_DebuggerUIService_0:RemoveScriptLineMarkers(l_props_2.CurrentDebuggerConnectionId, false);
                end;
                l_DebuggerUIService_0:OpenScriptAtLine(v95.scriptGUID, l_props_2.CurrentDebuggerConnectionId, v95.lineColumn, false);
                l_props_2.onCurrentFrameChanged(l_props_2.CurrentDebuggerConnectionId, l_CurrentThreadId_0, l_frameColumn_0);
            end;
        end;
    end;
    v85.rowToString = function(v100) --[[ Line: 259 ]]
        -- upvalues: v85 (copy), v38 (ref)
        local v101 = "";
        for _, v103 in pairs(v85.props.ColumnFilter) do
            if typeof(v100[v38[v103]]) == "EnumItem" then
                v101 = v101 .. v100[v38[v103]].Name .. "\t";
            else
                v101 = v101 .. v100[v38[v103]] .. "\t";
            end;
        end;
        return v101;
    end;
    v85.copySelectedRows = function() --[[ Line: 271 ]]
        -- upvalues: v85 (copy), l_StudioService_0 (ref)
        local l_selectedRows_0 = v85.state.selectedRows;
        if #l_selectedRows_0 == 0 then
            return;
        else
            local v105 = "";
            for _, v107 in ipairs(l_selectedRows_0) do
                if #v85.getTreeChildren(v107) == 0 then
                    v105 = v105 .. v85.rowToString(v107) .. "\n";
                else
                    v105 = v105 .. v107.arrowColumn .. "\n";
                    for _, v109 in ipairs(v107.children) do
                        v105 = v105 .. v85.rowToString(v109) .. "\n";
                    end;
                end;
            end;
            l_StudioService_0:CopyToClipboard(v105);
            return;
        end;
    end;
    v85.selectAllRows = function() --[[ Line: 296 ]]
        -- upvalues: v85 (copy)
        local l_props_3 = v85.props;
        local v111 = {};
        if #v85.state.selectedRows == 1 then
            local v112 = v85.state.selectedRows[1];
            if v112.threadId and v112.threadId ~= l_props_3.CurrentThreadId then
                return;
            end;
        end;
        for _, v114 in ipairs(l_props_3.RootItems) do
            if l_props_3.CurrentThreadId == v114.threadId then
                for _, v116 in ipairs(v85.getTreeChildren(v114)) do
                    table.insert(v111, v116);
                end;
            end;
        end;
        v85:setState(function(_) --[[ Line: 314 ]]
            -- upvalues: v111 (copy)
            return {
                selectedRows = v111, 
                selectAll = true
            };
        end);
    end;
    v85.onMenuActionSelected = function(v118) --[[ Line: 322 ]]
        -- upvalues: v34 (ref), v85 (copy)
        local l_Id_0 = v118.Id;
        if l_Id_0 == v34.CallstackActionIds.CopySelected then
            v85.copySelectedRows();
            return;
        else
            if l_Id_0 == v34.CallstackActionIds.SelectAll then
                v85.selectAllRows();
            end;
            return;
        end;
    end;
    v85.onRightClick = function(v120) --[[ Line: 331 ]]
        -- upvalues: v85 (copy), v30 (ref), l_showContextMenu_0 (ref), v34 (ref)
        if not v85.state.selectAll or v120.item.threadId and v120.item.threadId ~= v85.props.CurrentThreadId then
            v85:setState(function(_) --[[ Line: 335 ]]
                -- upvalues: v120 (copy)
                return {
                    selectedRows = {
                        v120.item
                    }, 
                    selectAll = false
                };
            end);
        end;
        local l_props_4 = v85.props;
        local l_Localization_1 = l_props_4.Localization;
        local v124 = l_props_4.Plugin:get();
        local v125 = v30.getCallstackActions(l_Localization_1, v85.onMenuActionSelected);
        l_showContextMenu_0(v124, v125, v34.CallstackActionsOrder);
    end;
    v85.onExpansionChange = function(v126) --[[ Line: 350 ]]
        -- upvalues: v85 (copy)
        for v127, _ in pairs(v126) do
            local l_CurrentDebuggerConnectionId_0 = v85.props.CurrentDebuggerConnectionId;
            local l_CurrentDST_0 = v85.props.CurrentDST;
            local l_ConnectionById_0 = game:GetService("DebuggerConnectionManager"):GetConnectionById(l_CurrentDebuggerConnectionId_0);
            local v132 = v127.children[1];
            local v133 = v132.lineColumn ~= -1;
            local l_threadId_1 = v127.threadId;
            if v133 then
                local l_DebuggerUIService_1 = game:GetService("DebuggerUIService");
                l_DebuggerUIService_1:OpenScriptAtLine(v132.scriptGUID, l_CurrentDebuggerConnectionId_0, v132.lineColumn, false);
                l_DebuggerUIService_1:SetScriptLineMarker(v132.scriptGUID, l_CurrentDebuggerConnectionId_0, v132.lineColumn, true);
                v85.props.onLoadAllVariablesForThreadAndFrame(l_threadId_1, l_ConnectionById_0, 0, l_DebuggerUIService_1);
            else
                local l_CrossDMScriptChangeListener_0 = game:GetService("CrossDMScriptChangeListener");
                local l_l_ConnectionById_0_ThreadById_0 = l_ConnectionById_0:GetThreadById(l_threadId_1);
                v85.props.onPopulateCallstackThreadThunk(l_l_ConnectionById_0_ThreadById_0, l_ConnectionById_0, l_CurrentDST_0, l_CrossDMScriptChangeListener_0, function() --[[ Line: 382 ]]
                    -- upvalues: l_CurrentDST_0 (copy), v85 (ref), l_l_ConnectionById_0_ThreadById_0 (copy), l_CurrentDebuggerConnectionId_0 (copy)
                    if l_CurrentDST_0 == v85.props.CurrentDST then
                        v85.loadThreadData(l_l_ConnectionById_0_ThreadById_0, l_CurrentDebuggerConnectionId_0, v85);
                    end;
                end);
            end;
        end;
    end;
    v85.getTreeChildren = function(v138) --[[ Line: 392 ]]
        return v138.children or {};
    end;
    v85.loadThreadData = function(v139, v140) --[[ Line: 396 ]]
        -- upvalues: v85 (copy)
        local l_DebuggerUIService_2 = game:GetService("DebuggerUIService");
        v85.props.setCurrentFrameNumber(v139.ThreadId, 1);
        v85.props.onCurrentFrameChanged(v140, v139.ThreadId, 1);
        local l_v139_Frame_0 = v139:GetFrame(0);
        l_DebuggerUIService_2:SetScriptLineMarker(l_v139_Frame_0.Script, v140, l_v139_Frame_0.Line, true);
        l_DebuggerUIService_2:OpenScriptAtLine(l_v139_Frame_0.Script, v140, l_v139_Frame_0.Line, false);
    end;
    v85.onStepOver = function() --[[ Line: 406 ]]
        -- upvalues: v85 (copy), v34 (ref)
        v85.props.onStepAction(v34.StepActionIds.stepOverActionV2, v85.props.CurrentDebuggerConnectionId, v85.props.CurrentThreadId);
    end;
    v85.onStepInto = function() --[[ Line: 414 ]]
        -- upvalues: v85 (copy), v34 (ref)
        v85.props.onStepAction(v34.StepActionIds.stepIntoActionV2, v85.props.CurrentDebuggerConnectionId, v85.props.CurrentThreadId);
    end;
    v85.onStepOut = function() --[[ Line: 422 ]]
        -- upvalues: v85 (copy), v34 (ref)
        v85.props.onStepAction(v34.StepActionIds.stepOutActionV2, v85.props.CurrentDebuggerConnectionId, v85.props.CurrentThreadId);
    end;
end;
v33.didUpdate = function(v143, v144) --[[ Line: 431 ]] --[[ Name: didUpdate ]]
    -- upvalues: v37 (copy), v4 (copy), v24 (copy)
    local l_props_5 = v143.props;
    local v146 = #l_props_5.ColumnFilter + #v37;
    if #l_props_5.ColumnFilter ~= #v144.ColumnFilter and #v143.state.sizes ~= v146 then
        local v147 = {};
        local v148 = #v144.ColumnFilter + #v37;
        local v149 = v4.List.toSet(l_props_5.ColumnFilter);
        local v150 = v24.fetchOldColumnSizes(v148, v144.ColumnFilter, v37, v143.state.sizes);
        if v146 < v148 then
            local v151 = v24.fetchDeletedColumnsSize(#v37, v148, v144.ColumnFilter, v150, v149);
            v147 = v24.updatedSizesAfterRemovingColumns(v146, v151, v150, v37, l_props_5.ColumnFilter);
        else
            v147 = v24.updatedSizesAfterAddingColumns(v146, v148, v150, l_props_5.ColumnFilter, v37);
        end;
        do
            local l_v147_0 = v147;
            v143:setState(function(_) --[[ Line: 478 ]]
                -- upvalues: l_v147_0 (ref)
                return {
                    sizes = l_v147_0
                };
            end);
        end;
    end;
end;
v33.render = function(v154) --[[ Line: 486 ]] --[[ Name: render ]]
    -- upvalues: v37 (copy), v38 (copy), l_map_0 (copy), l_join_0 (copy), v34 (copy), v1 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), v5 (copy), l_TreeTable_0 (copy)
    local l_props_6 = v154.props;
    local l_Localization_2 = l_props_6.Localization;
    local l_Stylizer_1 = v154.props.Stylizer;
    local v158 = l_props_6.ColumnFilter or {};
    local v159 = {
        {
            Name = "", 
            Key = v37[1]
        }
    };
    for _, v161 in ipairs(v158) do
        table.insert(v159, {
            Name = l_Localization_2:getText("Callstack", v161), 
            Key = v38[v161], 
            Tooltip = l_Localization_2:getText("Callstack", v161 .. "Tooltip") or nil
        });
    end;
    local l_sizes_0 = v154.state.sizes;
    local v165 = l_map_0(v159, function(v163, v164) --[[ Line: 509 ]]
        -- upvalues: l_join_0 (ref), l_sizes_0 (copy)
        return l_join_0(v163, {
            Width = l_sizes_0[v164]
        });
    end);
    local v166 = v34.HEADER_HEIGHT + v34.BUTTON_PADDING * 2;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v169 = {
        Size = UDim2.fromScale(1, 1), 
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical
    };
    local v170 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v173 = {
        Size = UDim2.new(1, 0, 0, v166), 
        Spacing = v34.BUTTON_PADDING, 
        Padding = v34.BUTTON_PADDING, 
        LayoutOrder = 1, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    };
    local v174 = {};
    local l_createElement_2 = v1.createElement;
    local l_l_Pane_0_2 = l_Pane_0;
    local v177 = {
        Size = UDim2.new(0.5, 0, 0, v34.HEADER_HEIGHT), 
        LayoutOrder = 1, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    };
    local v178 = {};
    local l_createElement_3 = v1.createElement;
    local l_l_IconButton_0_0 = l_IconButton_0;
    local v181 = {
        Size = UDim2.new(0, v34.BUTTON_SIZE, 0, v34.BUTTON_SIZE), 
        LayoutOrder = 1, 
        LeftIcon = "rbxasset://textures/Debugger/Step-In.png", 
        TooltipText = l_Localization_2:getText("Common", "stepIntoActionV2"), 
        OnClick = v154.onStepInto
    };
    local v182 = true;
    if v154.props.CurrentThreadId ~= nil then
        v182 = v154.props.HitException;
    end;
    v181.Disabled = v182;
    v178.StepIntoButton = l_createElement_3(l_l_IconButton_0_0, v181);
    l_createElement_3 = v1.createElement;
    l_l_IconButton_0_0 = l_IconButton_0;
    v181 = {
        Size = UDim2.new(0, v34.BUTTON_SIZE, 0, v34.BUTTON_SIZE), 
        LayoutOrder = 2, 
        LeftIcon = "rbxasset://textures/Debugger/Step-Over.png", 
        TooltipText = l_Localization_2:getText("Common", "stepOverActionV2"), 
        OnClick = v154.onStepOver
    };
    v182 = true;
    if v154.props.CurrentThreadId ~= nil then
        v182 = v154.props.HitException;
    end;
    v181.Disabled = v182;
    v178.StepOverButton = l_createElement_3(l_l_IconButton_0_0, v181);
    l_createElement_3 = v1.createElement;
    l_l_IconButton_0_0 = l_IconButton_0;
    v181 = {
        Size = UDim2.new(0, v34.BUTTON_SIZE, 0, v34.BUTTON_SIZE), 
        LayoutOrder = 3, 
        LeftIcon = "rbxasset://textures/Debugger/Step-Out.png", 
        TooltipText = l_Localization_2:getText("Common", "stepOutActionV2"), 
        OnClick = v154.onStepOut
    };
    v182 = true;
    if v154.props.CurrentThreadId ~= nil then
        v182 = v154.props.HitException;
    end;
    v181.Disabled = v182;
    v178.StepOutButton = l_createElement_3(l_l_IconButton_0_0, v181);
    v174.ButtonContainer = l_createElement_2(l_l_Pane_0_2, v177, v178);
    v174.ColContainer = v1.createElement(l_Pane_0, {
        Size = UDim2.new(0.5, 0, 0, v34.HEADER_HEIGHT), 
        LayoutOrder = 2, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right
    }, {
        ColumnDropdown = v1.createElement(v5, {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        })
    });
    v170.HeaderView = l_createElement_1(l_l_Pane_0_1, v173, v174);
    v170.BodyView = v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, -v166), 
        LayoutOrder = 2, 
        Style = "Box"
    }, {
        TableView = v1.createElement(l_TreeTable_0, {
            Scroll = true, 
            Size = UDim2.fromScale(1, 1), 
            Columns = v165, 
            RootItems = l_props_6.RootItems, 
            Stylizer = l_Stylizer_1, 
            Expansion = l_props_6.ExpansionTable, 
            GetChildren = v154.getTreeChildren, 
            DisableTooltip = false, 
            OnSelectionChange = v154.onSelectionChange, 
            RightClick = v154.onRightClick, 
            OnExpansionChange = v154.onExpansionChange, 
            FullSpan = true, 
            HighlightedRows = v154.state.selectedRows, 
            OnColumnSizesChange = v154.OnColumnSizesChange, 
            UseDeficit = false, 
            UseScale = true, 
            ClampSize = true, 
            Padding = 1, 
            ColumnHeaderHeight = v34.COLUMN_HEADER_HEIGHT, 
            RowHeight = v34.ROW_HEIGHT, 
            ExpandOnDoubleClick = true
        })
    });
    return l_createElement_0(l_l_Pane_0_0, v169, v170);
end;
v33 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PluginActions = l_PluginActions_0, 
    Plugin = l_Plugin_0
})(v33);
return (v2.connect(function(v183, _) --[[ Line: 620 ]]
    -- upvalues: v70 (copy), l_deepCopy_0 (copy)
    local l_Common_0 = v183.Common;
    local v186 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    local l_Callstack_0 = v183.Callstack;
    if v186 == nil then
        return {
            RootItems = {}, 
            ExpansionTable = {}, 
            CurrentThreadId = nil, 
            ColumnFilter = l_Callstack_0.listOfEnabledColumns
        };
    else
        local v188 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
        local v189 = l_Callstack_0.stateTokenToCallstackVars[v188];
        assert(v189);
        local l_threadList_0 = v189.threadList;
        local v191 = {};
        local v192 = {};
        for _, v194 in ipairs(l_threadList_0) do
            local v195 = v70(v194, v189, l_Common_0, v183.ScriptInfo);
            assert(v195 ~= nil);
            table.insert(v191, v195);
            if v194.threadId == v186 then
                v192[v195] = true;
            end;
        end;
        return {
            RootItems = v191, 
            CurrentThreadId = v186, 
            ExpansionTable = v192, 
            ColumnFilter = l_deepCopy_0(l_Callstack_0.listOfEnabledColumns), 
            CurrentDebuggerConnectionId = l_Common_0.currentDebuggerConnectionId, 
            CurrentDST = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId], 
            HitException = if v186 then l_Common_0.hitException[v186] else false
        };
    end;
end, function(v196) --[[ Line: 657 ]]
    -- upvalues: v26 (copy), v28 (copy), v29 (copy), v27 (copy), v35 (copy)
    return {
        setCurrentFrameNumber = function(v197, v198) --[[ Line: 659 ]] --[[ Name: setCurrentFrameNumber ]]
            -- upvalues: v196 (copy), v26 (ref)
            return v196(v26(v197, v198));
        end, 
        onCurrentFrameChanged = function(v199, v200, v201) --[[ Line: 662 ]] --[[ Name: onCurrentFrameChanged ]]
            -- upvalues: v196 (copy), v28 (ref)
            local l_DebuggerUIService_3 = game:GetService("DebuggerUIService");
            local l_ConnectionById_1 = game:GetService("DebuggerConnectionManager"):GetConnectionById(v199);
            return v196(v28(v200, l_ConnectionById_1, v201 - 1, l_DebuggerUIService_3));
        end, 
        onPopulateCallstackThreadThunk = function(v204, v205, v206, v207, v208) --[[ Line: 668 ]] --[[ Name: onPopulateCallstackThreadThunk ]]
            -- upvalues: v196 (copy), v29 (ref)
            return v196(v29(v204, v205, v206, v207, v208));
        end, 
        onLoadAllVariablesForThreadAndFrame = function(v209, v210, v211, v212) --[[ Line: 673 ]] --[[ Name: onLoadAllVariablesForThreadAndFrame ]]
            -- upvalues: v196 (copy), v28 (ref)
            return v196(v28(v209, v210, v211, v212));
        end, 
        onColumnFilterChange = function(v213) --[[ Line: 676 ]] --[[ Name: onColumnFilterChange ]]
            -- upvalues: v196 (copy), v27 (ref)
            return v196(v27(v213));
        end, 
        onStepAction = function(v214, v215, v216) --[[ Line: 679 ]] --[[ Name: onStepAction ]]
            -- upvalues: v196 (copy), v35 (ref)
            return v196(v35(v214, "CallstackComponent", v215, v216));
        end
    };
end)(v33));