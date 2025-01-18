local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Constants);
local v2 = require(l_Parent_0.Src.Actions.ChangeControlPointState);
local l_Util_0 = l_Parent_0.Src.Util;
local v4 = require(l_Util_0.constrainToEightDirections);
local v5 = require(l_Util_0.getControlPointState);
local v6 = require(l_Util_0.getTangentNameForSide);
local v7 = require(l_Util_0.getUDim2ScaleFromVector2);
local v8 = require(l_Util_0.getUDim2Inverse);
local v9 = require(l_Util_0.rotatePoint);
local _ = require(l_Parent_0.Src.Types);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local l_PathEditorPathClosedApiUpdate_0 = game:GetFastFlag("PathEditorPathClosedApiUpdate");
return function(v13, v14, v15, v16, v17, v18) --[[ Line: 20 ]]
    -- upvalues: l_PathEditorRotation_0 (copy), v9 (copy), l_PathEditorPathClosedApiUpdate_0 (copy), v1 (copy), v4 (copy), v7 (copy), v6 (copy), v8 (copy), v2 (copy), v5 (copy)
    return function(v19) --[[ Line: 28 ]]
        -- upvalues: v13 (copy), l_PathEditorRotation_0 (ref), v15 (ref), v9 (ref), l_PathEditorPathClosedApiUpdate_0 (ref), v1 (ref), v17 (ref), v18 (copy), v16 (copy), v4 (ref), v14 (copy), v7 (ref), v6 (ref), v8 (ref), v2 (ref), v5 (ref)
        local l_PathReducer_0 = v19:getState().PathReducer;
        local v21 = false;
        if v13 > 0 then
            v21 = v13 <= #l_PathReducer_0.ControlPoints;
        end;
        assert(v21, "Cannot set tangent for invalid control point index.");
        local l_v13_0 = v13;
        v21 = l_PathReducer_0.SelectedObject:GetControlPoints();
        local l_ControlPointStates_0 = l_PathReducer_0.ControlPointStates;
        if l_PathEditorRotation_0 then
            v15 = v9(v15, Vector2.new(), -1 * l_PathReducer_0.ParentAbsRotation);
        end;
        if l_ControlPointStates_0 == nil or #l_ControlPointStates_0 < l_v13_0 then
            return;
        else
            local v24 = not l_PathEditorPathClosedApiUpdate_0 and #l_PathReducer_0.ControlPoints > 1 and (not (l_v13_0 ~= 1) or l_v13_0 == #l_PathReducer_0.ControlPoints) and v21[1].Position == v21[#l_PathReducer_0.ControlPoints].Position;
            local v25 = if v24 and l_v13_0 == 1 then #l_PathReducer_0.ControlPoints else 1;
            if v15.Magnitude < v1.DragTangentToCenterToDeleteZoneSizePixels then
                v15 = Vector2.zero;
            end;
            v17 = not l_ControlPointStates_0[l_v13_0].Mirrored;
            if v18 then
                v17 = false;
            end;
            if v16 then
                v15 = v4(v15);
                v15 = v15;
            end;
            local v26 = v14 == "Left" and "Right" or "Left";
            local v27 = v7(v15, l_PathReducer_0.SelectedObject.Parent);
            v21[l_v13_0][v6(v14)] = v27;
            if not v17 then
                v21[l_v13_0][v6(v26)] = v8(v27);
            end;
            if v24 then
                v21[v25][v6(v14)] = v27;
                if not v17 then
                    v21[v25][v6(v26)] = v8(v27);
                end;
                v19:dispatch(v2(v25, v5(v21[v25])));
            end;
            v19:dispatch(v2(l_v13_0, v5(v21[l_v13_0])));
            if game:GetFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:UpdateControlPoint(l_v13_0, v21[l_v13_0]);
                return;
            else
                l_PathReducer_0.SelectedObject:SetControlPoints(v21);
                return;
            end;
        end;
    end;
end;