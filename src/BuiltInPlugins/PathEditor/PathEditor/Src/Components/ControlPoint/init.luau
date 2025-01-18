local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.DeselectControlPoint);
local v10 = require(l_Actions_0.LockSelectedControlPoint);
local v11 = require(l_Actions_0.SelectTangentSide);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v13 = require(l_Thunks_0.OnControlPointDoubleClicked);
local v14 = require(l_Thunks_0.OnControlPointDragged);
local v15 = require(l_Thunks_0.OpenContextMenu);
local v16 = require(l_Thunks_0.RecordChangeHistory);
local v17 = require(l_Thunks_0.RemoveControlPoint);
local v18 = require(l_Thunks_0.SelectControlPoint);
local _ = require(l_Thunks_0.SetControlPointTangent);
local _ = require(l_Parent_0.Src.Resources.Constants);
local l_Util_0 = l_Parent_0.Src.Util;
local v22 = require(l_Util_0.getAbsolutePosition);
local v23 = require(l_Util_0.getAbsPosFromRelative);
local v24 = require(l_Util_0.getAbsPosFromUDim2);
local v25 = require(l_Util_0.getTangentNameForSide);
local v26 = require(l_Util_0.getVector2FromUDim2Scale);
local v27 = require(l_Util_0.makeNewPath2DControlPoint);
local v28 = require(l_Util_0.rotatePoint);
local l_Components_0 = l_Parent_0.Src.Components;
local v30 = require(l_Components_0.DraggablePoint);
local v31 = require(l_Components_0.Line);
local v32 = require(l_Components_0.TangentPoint);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v34 = v2.Component:extend("ControlPoint");
v34.init = function(v35) --[[ Line: 81 ]] --[[ Name: init ]]
    v35.tangentPoints = {};
end;
v34.renderTangent = function(v36, v37, v38) --[[ Line: 85 ]] --[[ Name: renderTangent ]]
    -- upvalues: v25 (copy), l_PathEditorRotation_0 (copy), v28 (copy), v26 (copy), v2 (copy), v32 (copy), v31 (copy), v27 (copy)
    local l_props_0 = v36.props;
    if v37 ~= "Left" and v37 ~= "Right" then
        error("invalid tangent side: " .. v37);
        return;
    elseif not l_props_0.showTangents and not l_props_0.showTangentsPhantom then
        return nil;
    else
        local l_showTangentsPhantom_0 = l_props_0.showTangentsPhantom;
        local v41 = v25(v37);
        local v42 = nil;
        v42 = if l_PathEditorRotation_0 then v28(v26(l_props_0.point[v41], l_props_0.SelectedObject.Parent), Vector2.new(), l_props_0.ParentAbsRotation) else v26(l_props_0.point[v41], l_props_0.SelectedObject.Parent);
        if v42 == Vector2.zero then
            return nil;
        else
            local _ = #l_props_0.ControlPoints;
            local v44 = v41 .. "Point";
            local v45 = v41 .. "Line";
            return v2.createElement(v2.Fragment, {}, {
                [v44] = v2.createElement(v32, {
                    index = l_props_0.index, 
                    absolutePosition = v38 + v42, 
                    position = v42, 
                    side = v37, 
                    isPhantom = l_showTangentsPhantom_0, 
                    Disabled = l_props_0.Disabled
                }), 
                [v45] = v2.createElement(v31, {
                    ZIndex = -1, 
                    Style = l_showTangentsPhantom_0 and "PhantomTangent" or "Tangent", 
                    Position = UDim2.fromOffset(v38.X, v38.Y), 
                    ControlPoints = {
                        v27(UDim2.new(), UDim2.new(), UDim2.new()), 
                        v27(UDim2.fromOffset(v42.X, v42.Y), UDim2.new(), UDim2.new())
                    }
                })
            });
        end;
    end;
end;
v34.render = function(v46) --[[ Line: 140 ]] --[[ Name: render ]]
    -- upvalues: l_PathEditorRotation_0 (copy), v23 (copy), v24 (copy), v22 (copy), v25 (copy), v2 (copy), v30 (copy)
    local l_props_1 = v46.props;
    local _ = v46.state;
    local v49 = nil;
    v49 = if l_PathEditorRotation_0 then v23(l_props_1.point.Position, l_props_1.SelectedObject.Parent) else v24(l_props_1.point.Position, v22(l_props_1.SelectedObject), l_props_1.ParentAbsSize);
    local v50 = "ControlPoint";
    if l_props_1.Path2DToolMode == "AddPoint" and l_props_1.AddPointSubMode == "Unselected" and l_props_1.index ~= 1 and l_props_1.index ~= #l_props_1.ControlPoints then
        v50 = "PhantomControlPoint";
    end;
    local v51 = l_props_1.LockSelectedControlPoint and 1 or l_props_1.DeselectedControlPointIndex == l_props_1.index and -1 or 0;
    local function v60() --[[ Line: 166 ]]
        -- upvalues: l_props_1 (copy), v25 (ref)
        l_props_1.dispatchRecordChangeHistory("Move Control Point");
        l_props_1.dispatchLockSelectedControlPoint(true);
        if l_props_1.Path2DToolMode == "AddTangent" then
            local l_ControlPoints_0 = l_props_1.ControlPoints;
            local v53 = l_props_1.index == #l_ControlPoints_0 and "Left" or "Right";
            local v54 = v53 == "Right" and "Left" or "Right";
            local v55 = l_ControlPoints_0[l_props_1.index];
            local v56 = v25(v53);
            local v57 = v25(v54);
            local v58 = if v55[v56] ~= nil then v55[v56] else UDim2.new();
            local v59 = if v55[v57] ~= nil then v55[v57] else UDim2.new();
            if v58 == UDim2.new() and v59 == UDim2.new() then
                v53 = v54;
            end;
            l_props_1.dispatchSelectControlPoint(l_props_1.index);
            l_props_1.dispatchSelectTangentSide(v53);
        end;
    end;
    return v2.createElement(v2.Fragment, {}, {
        Point = v2.createElement(v30, {
            ZIndex = v51, 
            AbsolutePosition = v49, 
            Style = v50, 
            IsSelected = l_props_1.isSelected, 
            FollowCursorOnDrag = false, 
            Disabled = l_props_1.Disabled, 
            OnDoubleClicked = function() --[[ Line: 199 ]] --[[ Name: OnDoubleClicked ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchOnControlPointDoubleClicked(l_props_1.index);
            end, 
            OnSelected = function() --[[ Line: 202 ]] --[[ Name: OnSelected ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchSelectControlPoint(l_props_1.index);
            end, 
            OnDeselected = function() --[[ Line: 205 ]] --[[ Name: OnDeselected ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchSelectControlPoint(0);
            end, 
            OnDragStart = v60, 
            OnDragMoved = function(v61, v62) --[[ Line: 209 ]] --[[ Name: OnDragMoved ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchOnControlPointDragged(l_props_1.index, v61, v62);
            end, 
            OnDragEnd = function(_, _) --[[ Line: 212 ]] --[[ Name: OnDragEnd ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchLockSelectedControlPoint(false);
                l_props_1.dispatchRecordChangeHistory();
            end, 
            OnRightClicked = function() --[[ Line: 216 ]] --[[ Name: OnRightClicked ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.dispatchSelectControlPoint(l_props_1.index);
                l_props_1.dispatchOpenContextMenu(l_props_1.PluginContext, l_props_1.Localization);
            end
        }), 
        LeftTangent = v46:renderTangent("Left", v49), 
        RightTangent = v46:renderTangent("Right", v49)
    });
end;
v34 = l_withContext_0({
    PluginContext = l_Plugin_0, 
    Localization = l_Localization_0
})(v34);
return v3.connect(function(v65, _) --[[ Line: 231 ]]
    return {
        Path2DToolMode = v65.PathReducer.Path2DToolMode, 
        AddPointSubMode = v65.PathReducer.AddPointSubMode, 
        ControlPoints = v65.PathReducer.ControlPoints, 
        SelectedObject = v65.PathReducer.SelectedObject, 
        ParentAbsPos = v65.PathReducer.ParentAbsPos, 
        ParentAbsSize = v65.PathReducer.ParentAbsSize, 
        ParentAbsRotation = v65.PathReducer.ParentAbsRotation, 
        LockSelectedControlPoint = v65.PathReducer.LockSelectedControlPoint, 
        DeselectedControlPointIndex = v65.PathReducer.DeselectedControlPointIndex
    };
end, function(v67) --[[ Line: 243 ]]
    -- upvalues: v14 (copy), v13 (copy), v17 (copy), v18 (copy), v11 (copy), v9 (copy), v10 (copy), v15 (copy), v16 (copy)
    return {
        dispatchOnControlPointDragged = function(v68, v69, v70) --[[ Line: 245 ]] --[[ Name: dispatchOnControlPointDragged ]]
            -- upvalues: v67 (copy), v14 (ref)
            v67(v14(v68, v69, v70));
        end, 
        dispatchOnControlPointDoubleClicked = function(v71) --[[ Line: 248 ]] --[[ Name: dispatchOnControlPointDoubleClicked ]]
            -- upvalues: v67 (copy), v13 (ref)
            v67(v13(v71));
        end, 
        dispatchRemoveControlPoint = function(v72) --[[ Line: 251 ]] --[[ Name: dispatchRemoveControlPoint ]]
            -- upvalues: v67 (copy), v17 (ref)
            v67(v17(v72));
        end, 
        dispatchSelectControlPoint = function(v73) --[[ Line: 254 ]] --[[ Name: dispatchSelectControlPoint ]]
            -- upvalues: v67 (copy), v18 (ref), v11 (ref)
            v67(v18(v73));
            v67(v11(nil));
        end, 
        dispatchDeselectControlPoint = function() --[[ Line: 258 ]] --[[ Name: dispatchDeselectControlPoint ]]
            -- upvalues: v67 (copy), v9 (ref)
            v67(v9());
        end, 
        dispatchSelectTangentSide = function(v74) --[[ Line: 261 ]] --[[ Name: dispatchSelectTangentSide ]]
            -- upvalues: v67 (copy), v11 (ref)
            v67(v11(v74));
        end, 
        dispatchLockSelectedControlPoint = function(v75) --[[ Line: 264 ]] --[[ Name: dispatchLockSelectedControlPoint ]]
            -- upvalues: v67 (copy), v10 (ref)
            v67(v10(v75));
        end, 
        dispatchOpenContextMenu = function(v76, v77) --[[ Line: 267 ]] --[[ Name: dispatchOpenContextMenu ]]
            -- upvalues: v67 (copy), v15 (ref)
            v67(v15(v76, v77));
        end, 
        dispatchRecordChangeHistory = function(v78) --[[ Line: 270 ]] --[[ Name: dispatchRecordChangeHistory ]]
            -- upvalues: v67 (copy), v16 (ref)
            v67(v16(v78));
        end
    };
end)(v34);