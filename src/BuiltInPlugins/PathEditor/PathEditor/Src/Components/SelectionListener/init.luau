local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Selection_0 = game:GetService("Selection");
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.SelectPath);
local v10 = require(l_Actions_0.ClearPathSelection);
local v11 = require(l_Actions_0.PathChanged);
local v12 = require(l_Actions_0.ToggleAddPointTool);
local v13 = require(l_Actions_0.ToggleMoveTool);
local v14 = require(l_Actions_0.ToggleAddTangentTool);
local v15 = require(l_Actions_0.ToggleDone);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v17 = require(l_Thunks_0.RemoveControlPoint);
local l_Util_0 = l_Parent_0.Src.Util;
local v19 = require(l_Util_0.TelemetryGlobals);
local v20 = require(l_Util_0.isHierarchyValidForPath2D);
local v21 = game:DefineFastFlag("PathEditorFixActionBindings", false);
local l_PathEditorHierarchyValidCheckFixes_0 = game:GetFastFlag("PathEditorHierarchyValidCheckFixes");
local l_PathEditorRBXTelemetryFixes_0 = game:GetFastFlag("PathEditorRBXTelemetryFixes");
local v24 = v2.PureComponent:extend("SelectionListener");
v24.addAction = function(v25, v26, v27) --[[ Line: 51 ]] --[[ Name: addAction ]]
    if v26 then
        v26.Enabled = false;
        table.insert(v25.Actions, v26);
        table.insert(v25.Connections, v26.Triggered:Connect(v27));
        return v26;
    else
        return nil;
    end;
end;
v24.enableActions = function(_, v29) --[[ Line: 62 ]] --[[ Name: enableActions ]]
    if v29 then
        for _, v31 in ipairs(v29) do
            v31.Enabled = true;
        end;
    end;
end;
v24.disableActions = function(_, v33) --[[ Line: 70 ]] --[[ Name: disableActions ]]
    if v33 then
        for _, v35 in ipairs(v33) do
            v35.Enabled = false;
        end;
    end;
end;
v24.init = function(v36) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: l_PathEditorRBXTelemetryFixes_0 (copy), v21 (copy), v20 (copy), l_Selection_0 (copy), l_PathEditorHierarchyValidCheckFixes_0 (copy)
    local l_props_0 = v36.props;
    v36.delete = function() --[[ Line: 81 ]]
        -- upvalues: v36 (copy)
        if v36.props.Path2DToolMode == "AddTangent" then
            if v36.props.SelectedControlPointIndex ~= 0 and v36.props.SelectedTangentSide ~= nil then
                v36.props.dispatchClearControlPointTangent(v36.props.SelectedControlPointIndex, v36.props.SelectedTangentSide);
                return;
            end;
        else
            v36.props.dispatchRemoveControlPoint();
        end;
    end;
    local function v39(v38) --[[ Line: 94 ]] --[[ Name: parentChanged ]]
        -- upvalues: l_props_0 (copy)
        if v38 == "AbsolutePosition" or v38 == "AbsoluteSize" then
            l_props_0.dispatchPathChanged("Position");
        end;
    end;
    local function v40() --[[ Line: 100 ]] --[[ Name: clearPathSelection ]]
        -- upvalues: l_PathEditorRBXTelemetryFixes_0 (ref), l_props_0 (copy), v21 (ref), v36 (copy)
        if l_PathEditorRBXTelemetryFixes_0 then
            l_props_0.LogUsageReport();
        end;
        l_props_0.dispatchSelectPathCleared();
        if v21 then
            v36:disableActions(v36.Actions);
        else
            v36:disableActions();
        end;
        if v36.state.selectedObjectChangedConn ~= nil then
            v36.state.selectedObjectChangedConn:Disconnect();
        end;
        if v36.state.selectedObjectParentChangedConn ~= nil then
            v36.state.selectedObjectParentChangedConn:Disconnect();
        end;
        v36.selectedObject = nil;
    end;
    local function v43(v41) --[[ Line: 120 ]] --[[ Name: pathChanged ]]
        -- upvalues: v36 (copy), l_props_0 (copy), v39 (copy), v20 (ref)
        if v36.selectedObject == nil then
            return;
        elseif v41 ~= "Parent" then
            l_props_0.dispatchPathChanged(v41);
            return;
        else
            if v36.state.selectedObjectParentChangedConn ~= nil then
                v36.state.selectedObjectParentChangedConn:Disconnect();
            end;
            v36:setState({
                selectedObjectParentChangedConn = v36.selectedObject.Parent.Changed:Connect(v39)
            });
            local v42 = if game:GetFastFlag("PathEditorSurfaceGui") then v20(v36.selectedObject) else v36.selectedObject.Parent:IsA("GuiBase2d");
            if v36.props.SelectedObject ~= nil and not v42 then
                l_props_0.dispatchSelectPathCleared();
                v36:disableActions();
                return;
            elseif v36.props.SelectedObject == nil and v42 then
                l_props_0.dispatchSelectPath(v36.selectedObject);
                v36:enableActions(v36.UniversalActions);
                return;
            else
                l_props_0.dispatchPathChanged(v41);
                return;
            end;
        end;
    end;
    v36:setState({
        selectionChangedConn = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 154 ]]
            -- upvalues: l_Selection_0 (ref), l_PathEditorHierarchyValidCheckFixes_0 (ref), v20 (ref), l_props_0 (copy), v36 (copy), v43 (copy), v39 (copy), v40 (copy)
            local v44 = l_Selection_0:Get();
            if #v44 == 1 then
                for _, v46 in pairs(v44) do
                    if v46:IsA("Path2D") and v46.Parent ~= nil then
                        if if l_PathEditorHierarchyValidCheckFixes_0 then v20(v46) else v46.Parent:IsA("GuiBase2d") then
                            l_props_0.dispatchSelectPath(v46);
                            v36:enableActions(v36.UniversalActions);
                        end;
                        v36.selectedObject = v46;
                        v36:setState({
                            selectedObjectChangedConn = v46.Changed:Connect(v43), 
                            selectedObjectParentChangedConn = v46.Parent.Changed:Connect(v39)
                        });
                    else
                        v40();
                    end;
                end;
                return;
            else
                v40();
                return;
            end;
        end)
    });
end;
v24.didMount = function(v47) --[[ Line: 188 ]] --[[ Name: didMount ]]
    local l_PluginActions_0 = v47.props.PluginActions;
    v47.Connections = {};
    v47.Actions = {};
    v47.EditingActions = {};
    v47.UniversalActions = {};
    table.insert(v47.EditingActions, v47:addAction(l_PluginActions_0:get("DoneEditing"), v47.props.dispatchToggleDone));
    table.insert(v47.UniversalActions, v47:addAction(l_PluginActions_0:get("MoveTool"), v47.props.dispatchToggleMoveTool));
    table.insert(v47.UniversalActions, v47:addAction(l_PluginActions_0:get("AddPointMode"), v47.props.dispatchToggleAddPointTool));
    table.insert(v47.UniversalActions, v47:addAction(l_PluginActions_0:get("AddTangentMode"), v47.props.dispatchToggleAddTangentTool));
end;
v24.willUnmount = function(v49) --[[ Line: 208 ]] --[[ Name: willUnmount ]]
    if v49.state.selectionChangedConn ~= nil then
        v49.state.selectionChangedConn:Disconnect();
    end;
    if v49.state.selectedObjectChangedConn ~= nil then
        v49.state.selectedObjectChangedConn:Disconnect();
    end;
    if v49.state.selectedObjectParentChangedConn ~= nil then
        v49.state.selectedObjectParentChangedConn:Disconnect();
    end;
    if v49.Connections then
        for _, v51 in ipairs(v49.Connections) do
            v51:Disconnect();
        end;
        v49.Connections = {};
    end;
    if v49.Actions then
        for _, v53 in ipairs(v49.Actions) do
            v53.Enabled = false;
        end;
    end;
end;
v24.render = function(v54) --[[ Line: 232 ]] --[[ Name: render ]]
    local l_props_1 = v54.props;
    if v54.lastToolingMode ~= l_props_1.Path2DToolMode then
        v54.lastToolingMode = l_props_1.Path2DToolMode;
        if v54.lastToolingMode == "DoneEditing" then
            v54:disableActions(v54.EditingActions);
        else
            v54:enableActions(v54.EditingActions);
        end;
    end;
    return nil;
end;
v24 = l_withContext_0({
    PluginActions = l_ContextServices_0.PluginActions, 
    Mouse = l_ContextServices_0.Mouse
})(v24);
return v3.connect(function(v56, _) --[[ Line: 252 ]]
    return {
        SelectedObject = v56.PathReducer.SelectedObject, 
        SelectedControlPointIndex = v56.PathReducer.SelectedControlPointIndex, 
        SelectedTangentSide = v56.PathReducer.SelectedTangentSide, 
        Path2DToolMode = v56.PathReducer.Path2DToolMode
    };
end, function(v58) --[[ Line: 259 ]]
    -- upvalues: v15 (copy), v19 (copy), v12 (copy), v14 (copy), v13 (copy), v11 (copy), v9 (copy), v10 (copy), v17 (copy)
    return {
        dispatchToggleDone = function() --[[ Line: 261 ]] --[[ Name: dispatchToggleDone ]]
            -- upvalues: v58 (copy), v15 (ref)
            v58(v15());
        end, 
        dispatchToggleAddPointTool = function() --[[ Line: 264 ]] --[[ Name: dispatchToggleAddPointTool ]]
            -- upvalues: v19 (ref), v58 (copy), v12 (ref)
            local l_v19_0 = v19;
            l_v19_0.addPointModeCount = l_v19_0.addPointModeCount + 1;
            v58(v12());
        end, 
        dispatchToggleAddTangentTool = function() --[[ Line: 268 ]] --[[ Name: dispatchToggleAddTangentTool ]]
            -- upvalues: v19 (ref), v58 (copy), v14 (ref)
            local l_v19_1 = v19;
            l_v19_1.addTangentModeCount = l_v19_1.addTangentModeCount + 1;
            v58(v14());
        end, 
        dispatchToggleMoveTool = function() --[[ Line: 272 ]] --[[ Name: dispatchToggleMoveTool ]]
            -- upvalues: v19 (ref), v58 (copy), v13 (ref)
            local l_v19_2 = v19;
            l_v19_2.selectModeCount = l_v19_2.selectModeCount + 1;
            v58(v13());
        end, 
        dispatchPathChanged = function(v62) --[[ Line: 276 ]] --[[ Name: dispatchPathChanged ]]
            -- upvalues: v58 (copy), v11 (ref)
            v58(v11(v62));
        end, 
        dispatchSelectPath = function(v63) --[[ Line: 279 ]] --[[ Name: dispatchSelectPath ]]
            -- upvalues: v58 (copy), v9 (ref)
            v58(v9(v63));
        end, 
        dispatchSelectPathCleared = function() --[[ Line: 282 ]] --[[ Name: dispatchSelectPathCleared ]]
            -- upvalues: v58 (copy), v10 (ref)
            v58(v10());
        end, 
        dispatchRemoveControlPoint = function() --[[ Line: 285 ]] --[[ Name: dispatchRemoveControlPoint ]]
            -- upvalues: v58 (copy), v17 (ref)
            v58(v17());
        end
    };
end)(v24);