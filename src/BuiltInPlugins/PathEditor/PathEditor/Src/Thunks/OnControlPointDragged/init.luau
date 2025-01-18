local l_Parent_0 = script.Parent.Parent.Parent;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v2 = require(l_Thunks_0.ModifyControlPoint);
local v3 = require(l_Thunks_0.SetControlPointTangent);
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.getUDim2ScaleFromVector2);
local v6 = require(l_Util_0.getAbsolutePosition);
local v7 = require(l_Util_0.getVector2FromUDim2Scale);
local v8 = require(l_Parent_0.Src.Resources.Constants);
local l_PathEditorPathClosedApiUpdate_0 = game:GetFastFlag("PathEditorPathClosedApiUpdate");
return function(v10, v11, v12) --[[ Line: 16 ]]
    -- upvalues: v6 (copy), v5 (copy), l_PathEditorPathClosedApiUpdate_0 (copy), v7 (copy), v8 (copy), v2 (copy), v3 (copy)
    return function(v13) --[[ Line: 17 ]]
        -- upvalues: v12 (copy), v11 (copy), v6 (ref), v5 (ref), l_PathEditorPathClosedApiUpdate_0 (ref), v10 (copy), v7 (ref), v8 (ref), v2 (ref), v3 (ref)
        local l_PathReducer_0 = v13:getState().PathReducer;
        local v15 = v12 - v11;
        if l_PathReducer_0.Path2DToolMode == "Move" then
            local v16 = v12 - v6(l_PathReducer_0.SelectedObject);
            local v17 = v5(v16, l_PathReducer_0.SelectedObject.Parent);
            if not l_PathEditorPathClosedApiUpdate_0 and (v10 == 1 or v10 == #l_PathReducer_0.ControlPoints) then
                local v18 = if v10 == 1 then #l_PathReducer_0.ControlPoints else 1;
                local l_Position_0 = l_PathReducer_0.ControlPoints[v18].Position;
                if math.abs((v16 - v7(l_Position_0, l_PathReducer_0.SelectedObject.Parent)).Magnitude) < v8.SnapToPointEpsilon then
                    v17 = l_Position_0;
                end;
            end;
            v13:dispatch(v2(v10, v17));
            return;
        else
            if l_PathReducer_0.Path2DToolMode == "AddTangent" then
                local _ = l_PathReducer_0.ControlPoints;
                local v21 = if l_PathReducer_0.SelectedTangentSide ~= nil then l_PathReducer_0.SelectedTangentSide else "Left";
                v13:dispatch(v3(v10, v21, v15, false, false));
            end;
            return;
        end;
    end;
end;