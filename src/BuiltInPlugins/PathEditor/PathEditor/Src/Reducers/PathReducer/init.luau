local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Dash);
local v4 = require(l_Parent_0.Src.Resources.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.ChangeControlPointState);
local v7 = require(l_Actions_0.ClearPathSelection);
local v8 = require(l_Actions_0.DeselectControlPoint);
local v9 = require(l_Actions_0.LockSelectedControlPoint);
local v10 = require(l_Actions_0.PathChanged);
local v11 = require(l_Actions_0.SelectControlPoint);
local v12 = require(l_Actions_0.SelectPath);
local v13 = require(l_Actions_0.SelectTangentSide);
local v14 = require(l_Actions_0.SetAddPointSubMode);
local v15 = require(l_Actions_0.SetIsDraggingPoint);
local v16 = require(l_Actions_0.SetRecording);
local v17 = require(l_Actions_0.ToggleAddPointTool);
local v18 = require(l_Actions_0.ToggleAddTangentTool);
local v19 = require(l_Actions_0.ToggleDone);
local v20 = require(l_Actions_0.ToggleMirrored);
local v21 = require(l_Actions_0.ToggleMoveTool);
local v22 = require(l_Actions_0.ToggleSharp);
local v23 = require(l_Actions_0.ToolbarHovered);
local l_Util_0 = l_Parent_0.Src.Util;
local v25 = require(l_Util_0.findTopLevelGui);
local v26 = require(l_Util_0.getControlPointStates);
local v27 = require(l_Util_0.getAbsolutePosition);
local v28 = require(l_Util_0.isHierarchyValidForPath2D);
local v29 = require(l_Util_0.hasProperty);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return (v2.createReducer({
    AddPointSubMode = "Unselected", 
    ChangeHistoryServiceRecording = nil, 
    ControlPoints = {}, 
    ControlPointStates = {}, 
    DeselectedControlPointIndex = 0, 
    IsDraggingPoint = false, 
    LockedPoint = nil, 
    LockSelectedControlPoint = false, 
    ParentAbsPos = Vector2.zero, 
    ParentAbsSize = Vector2.zero, 
    ParentAbsRotation = 0, 
    Path2DToolMode = "DoneEditing", 
    Refreshed = 0, 
    ScalePositionMode = true, 
    SelectedControlPointIndex = 0, 
    SelectedObject = nil, 
    SelectedObjectGui = nil, 
    SelectedTangentSide = nil, 
    ToolbarHovered = false
}, {
    [v16.name] = function(v31, v32) --[[ Line: 80 ]]
        -- upvalues: v3 (copy)
        return v3.join(v31, {
            ChangeHistoryServiceRecording = if v32.Recording then v32.Recording else v3.None
        });
    end, 
    [v14.name] = function(v33, v34) --[[ Line: 85 ]]
        -- upvalues: v3 (copy)
        return v3.join(v33, {
            AddPointSubMode = v34.SubMode
        });
    end, 
    [v15.name] = function(v35, v36) --[[ Line: 90 ]]
        -- upvalues: v3 (copy)
        return v3.join(v35, {
            IsDraggingPoint = v36.Dragging
        });
    end, 
    [v23.name] = function(v37, v38) --[[ Line: 95 ]]
        -- upvalues: v3 (copy)
        return v3.join(v37, {
            IsDraggingPoint = not v38.Hovered and nil, 
            ToolbarHovered = v38.Hovered
        });
    end, 
    [v19.name] = function(v39) --[[ Line: 101 ]]
        -- upvalues: v3 (copy)
        local v40 = v39.Path2DToolMode == "DoneEditing" and "Move" or "DoneEditing";
        return v3.join(v39, {
            Path2DToolMode = v40
        });
    end, 
    [v21.name] = function(v41) --[[ Line: 107 ]]
        -- upvalues: v3 (copy)
        return v3.join(v41, {
            SelectedTangentSide = nil, 
            Path2DToolMode = "Move"
        });
    end, 
    [v17.name] = function(v42) --[[ Line: 113 ]]
        -- upvalues: v3 (copy)
        local v43 = #v42.ControlPoints < 2 and "Append" or "Unselected";
        return v3.join(v42, {
            Path2DToolMode = "AddPoint", 
            AddPointSubMode = v43, 
            SelectedControlPointIndex = 0, 
            SelectedTangentSide = nil
        });
    end, 
    [v18.name] = function(v44) --[[ Line: 122 ]]
        -- upvalues: v3 (copy)
        return v3.join(v44, {
            Path2DToolMode = "AddTangent", 
            SelectedTangentSide = nil
        });
    end, 
    [v10.name] = function(v45, v46) --[[ Line: 128 ]]
        -- upvalues: v28 (copy), v26 (copy), v27 (copy), l_PathEditorRotation_0 (copy), v29 (copy), v3 (copy), v4 (copy), v25 (copy)
        local _ = v46.PropChanged;
        local l_SelectedObject_0 = v45.SelectedObject;
        if l_SelectedObject_0 == nil then
            return v45;
        else
            if game:GetFastFlag("PathEditorSurfaceGui") then
                if v46.PropChanged == "Parent" and not v28(l_SelectedObject_0) then
                    return v45;
                end;
            elseif v46.PropChanged == "Parent" and not l_SelectedObject_0.Parent:IsA("GuiBase2d") then
                return v45;
            end;
            local l_l_SelectedObject_0_ControlPoints_0 = l_SelectedObject_0:GetControlPoints();
            local v50 = nil;
            if #l_SelectedObject_0:GetControlPoints() ~= #v45.ControlPointStates then
                v50 = v26(l_l_SelectedObject_0_ControlPoints_0);
            end;
            local v51 = v27(l_SelectedObject_0.Parent);
            local l_AbsoluteSize_0 = l_SelectedObject_0.Parent.AbsoluteSize;
            local v53 = if l_PathEditorRotation_0 and v29(l_SelectedObject_0.Parent, "AbsoluteRotation") then l_SelectedObject_0.Parent.AbsoluteRotation else 0;
            return v3.join(v45, {
                Refreshed = tick(), 
                ControlPoints = l_l_SelectedObject_0_ControlPoints_0, 
                ControlPointStates = v50, 
                ParentAbsPos = v51, 
                ParentAbsSize = l_AbsoluteSize_0, 
                Path2DToolMode = #l_l_SelectedObject_0_ControlPoints_0 >= v4.MaxControlPoints and v45.Path2DToolMode == "AddPoint" and "Move" or nil, 
                ParentAbsRotation = if l_PathEditorRotation_0 then v53 else nil, 
                SelectedObjectGui = if game:GetFastFlag("PathEditorSurfaceGui") then v25(l_SelectedObject_0) else nil
            });
        end;
    end, 
    [v12.name] = function(v54, v55) --[[ Line: 176 ]]
        -- upvalues: v27 (copy), l_PathEditorRotation_0 (copy), v29 (copy), v3 (copy), v25 (copy), v26 (copy)
        if v55.object == v54.SelectedObject then
            return v54;
        else
            local l_object_0 = v55.object;
            if l_object_0 == nil then
                return v54;
            else
                local l_l_object_0_ControlPoints_0 = l_object_0:GetControlPoints();
                local v58 = v27(l_object_0.Parent);
                local l_AbsoluteSize_1 = l_object_0.Parent.AbsoluteSize;
                local v60 = if l_PathEditorRotation_0 and v29(l_object_0.Parent, "AbsoluteRotation") then l_object_0.Parent.AbsoluteRotation else 0;
                local v61 = #l_l_object_0_ControlPoints_0 > 1 and "DoneEditing" or "AddPoint";
                local v62 = #l_l_object_0_ControlPoints_0 > 1 and "Unselected" or "Append";
                return v3.join(v54, {
                    SelectedObject = l_object_0, 
                    SelectedObjectGui = if game:GetFastFlag("PathEditorSurfaceGui") then v25(l_object_0) else nil, 
                    ControlPoints = l_l_object_0_ControlPoints_0, 
                    ControlPointStates = v26(l_l_object_0_ControlPoints_0), 
                    SelectedControlPointIndex = 0, 
                    SelectedTangentSide = nil, 
                    ParentAbsPos = v58, 
                    ParentAbsSize = l_AbsoluteSize_1, 
                    ParentAbsRotation = if l_PathEditorRotation_0 then v60 else nil, 
                    Path2DToolMode = v61, 
                    AddPointSubMode = v62
                });
            end;
        end;
    end, 
    [v7.name] = function(v63, _) --[[ Line: 211 ]]
        -- upvalues: v3 (copy)
        return v3.join(v63, {
            SelectedObject = v3.None, 
            SelectedObjectGui = nil, 
            ControlPoints = {}, 
            ControlPointStates = {}, 
            SelectedControlPointIndex = 0, 
            SelectedTangentSide = nil, 
            LockSelectedControlPoint = false, 
            Path2DToolMode = "DoneEditing"
        });
    end, 
    [v11.name] = function(v65, v66) --[[ Line: 223 ]]
        -- upvalues: v3 (copy)
        local l_DeselectedControlPointIndex_0 = v65.DeselectedControlPointIndex;
        if l_DeselectedControlPointIndex_0 == v66.Index then
            l_DeselectedControlPointIndex_0 = 0;
        end;
        return v3.join(v65, {
            SelectedTangentSide = nil, 
            SelectedControlPointIndex = v66.Index, 
            DeselectedControlPointIndex = l_DeselectedControlPointIndex_0
        });
    end, 
    [v13.name] = function(v68, v69) --[[ Line: 236 ]]
        -- upvalues: v3 (copy)
        return v3.join(v68, {
            SelectedTangentSide = if v69.Side then v69.Side else v3.None
        });
    end, 
    [v8.name] = function(v70, _) --[[ Line: 241 ]]
        -- upvalues: v3 (copy)
        return v3.join(v70, {
            SelectedControlPointIndex = 0, 
            DeselectedControlPointIndex = v70.SelectedControlPointIndex
        });
    end, 
    [v9.name] = function(v72, v73) --[[ Line: 248 ]]
        -- upvalues: v3 (copy)
        local l_SelectedControlPointIndex_0 = v72.SelectedControlPointIndex;
        local l_ControlPoints_0 = v72.ControlPoints;
        if v72.SelectedControlPointIndex <= 0 or v72.SelectedControlPointIndex > #v72.ControlPoints then
            v73.Locked = false;
        end;
        return v3.join(v72, {
            LockSelectedControlPoint = v73.Locked, 
            LockedPoint = if v73.Locked then l_ControlPoints_0[l_SelectedControlPointIndex_0] else nil
        });
    end, 
    [v20.name] = function(v76, v77) --[[ Line: 262 ]]
        -- upvalues: v3 (copy)
        local l_Index_0 = v77.Index;
        local v79 = table.clone(v76.ControlPointStates);
        v79[l_Index_0] = table.clone(v79[l_Index_0]);
        v79[l_Index_0].Mirrored = not v79[l_Index_0].Mirrored;
        return v3.join(v76, {
            ControlPointStates = v79
        });
    end, 
    [v22.name] = function(v80, v81) --[[ Line: 273 ]]
        -- upvalues: v3 (copy)
        local l_Index_1 = v81.Index;
        local v83 = table.clone(v80.ControlPointStates);
        v83[l_Index_1] = table.clone(v83[l_Index_1]);
        v83[l_Index_1].Sharp = not v83[l_Index_1].Sharp;
        return v3.join(v80, {
            ControlPointStates = v83
        });
    end, 
    [v6.name] = function(v84, v85) --[[ Line: 284 ]]
        -- upvalues: v3 (copy)
        local l_Index_2 = v85.Index;
        local v87 = table.clone(v84.ControlPointStates);
        v87[l_Index_2] = v85.State;
        return v3.join(v84, {
            ControlPointStates = v87
        });
    end
}));