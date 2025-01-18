local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v2 = require(l_Parent_0.Src.Actions.ToggleSharp);
local v3 = require(l_Parent_0.Src.Resources.Constants);
local v4 = require(l_Parent_0.Src.Util.getAbsPosFromUDim2);
local v5 = require(l_Parent_0.Src.Util.getAbsolutePosition);
local v6 = require(l_Parent_0.Src.Util.getControlPointState);
local v7 = require(l_Parent_0.Src.Util.getUDim2ScaleFromVector2);
local v8 = game:DefineFastFlag("PathEditorAddTangentUndoFix", false);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local l_PathEditorPathClosedApiUpdate_0 = game:GetFastFlag("PathEditorPathClosedApiUpdate");
return function(v11) --[[ Line: 17 ]]
    -- upvalues: v8 (copy), v6 (copy), l_PathEditorPathClosedApiUpdate_0 (copy), v1 (copy), v5 (copy), l_PathEditorRotation_0 (copy), v7 (copy), v3 (copy), v4 (copy), v2 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: v11 (copy), v8 (ref), v6 (ref), l_PathEditorPathClosedApiUpdate_0 (ref), v1 (ref), v5 (ref), l_PathEditorRotation_0 (ref), v7 (ref), v3 (ref), v4 (ref), v2 (ref)
        local l_PathReducer_0 = v12:getState().PathReducer;
        local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
        if v11 <= 0 or v11 > #l_ControlPoints_0 then
            return;
        else
            local l_v11_0 = v11;
            local l_ControlPointStates_0 = l_PathReducer_0.ControlPointStates;
            if v8 then
                if not v6(l_ControlPoints_0[l_v11_0]).Sharp then
                    return;
                end;
            elseif not l_ControlPointStates_0[l_v11_0].Sharp then
                return;
            end;
            local v17 = not l_PathEditorPathClosedApiUpdate_0 and #l_PathReducer_0.ControlPoints > 1 and (not (l_v11_0 ~= 1) or l_v11_0 == #l_PathReducer_0.ControlPoints) and l_ControlPoints_0[1].Position == l_ControlPoints_0[#l_PathReducer_0.ControlPoints].Position;
            local v18 = if v17 and l_v11_0 == 1 then #l_PathReducer_0.ControlPoints else 1;
            if v8 then
                v12:dispatch(v1("Add Control Point Tangents"));
            else
                v1("Add Control Point Tangents");
            end;
            local v19 = v5(l_PathReducer_0.SelectedObject.Parent);
            local l_AbsoluteSize_0 = l_PathReducer_0.SelectedObject.Parent.AbsoluteSize;
            local v21 = if l_PathEditorRotation_0 then l_PathReducer_0.ParentAbsRotation else nil;
            if #l_PathReducer_0.ControlPoints == 1 then
                local l_one_0 = Vector2.one;
                l_ControlPoints_0[v11].LeftTangent = v7(l_one_0.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v11].RightTangent = v7(l_one_0.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            elseif v11 > 1 and v11 < #l_PathReducer_0.ControlPoints then
                local v23 = l_ControlPoints_0[v11 - 1];
                local v24 = l_ControlPoints_0[v11 + 1];
                local v25 = v4(v24.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil) - v4(v23.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil);
                if v25.Y == 0 and v25.X == 0 then
                    v25 = Vector2.one;
                end;
                l_ControlPoints_0[v11].LeftTangent = v7(v25.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v11].RightTangent = v7(v25.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            elseif v17 then
                local v26 = l_ControlPoints_0[#l_PathReducer_0.ControlPoints];
                local v27 = l_ControlPoints_0[2];
                local v28 = v4(v27.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil) - v4(v26.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil);
                if v28.Y == 0 and v28.X == 0 then
                    v28 = Vector2.one;
                end;
                l_ControlPoints_0[v11].LeftTangent = v7(v28.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v11].RightTangent = v7(v28.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v18].LeftTangent = l_ControlPoints_0[v11].LeftTangent;
                l_ControlPoints_0[v18].RightTangent = l_ControlPoints_0[v11].RightTangent;
            elseif v11 == 1 then
                local v29 = l_ControlPoints_0[v11];
                local v30 = l_ControlPoints_0[v11 + 1];
                local v31 = v4(v30.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil) - v4(v29.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil);
                if v31.Y == 0 and v31.X == 0 then
                    v31 = Vector2.one;
                end;
                l_ControlPoints_0[v11].LeftTangent = v7(v31.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v11].RightTangent = v7(v31.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            elseif v11 == #l_PathReducer_0.ControlPoints then
                local v32 = l_ControlPoints_0[v11 - 1];
                local v33 = l_ControlPoints_0[v11];
                local v34 = v4(v33.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil) - v4(v32.Position, v19, l_AbsoluteSize_0, if l_PathEditorRotation_0 then v21 else nil);
                if v34.Y == 0 and v34.X == 0 then
                    v34 = Vector2.one;
                end;
                l_ControlPoints_0[v11].LeftTangent = v7(v34.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v11].RightTangent = v7(v34.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            end;
            if l_ControlPointStates_0[v11].Sharp then
                v12:dispatch(v2(v11));
            end;
            if v17 and l_ControlPointStates_0[v18].Sharp then
                v12:dispatch(v2(v18));
            end;
            if game:GetFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:UpdateControlPoint(v11, l_ControlPoints_0[v11]);
            else
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
            end;
            v12:dispatch(v1());
            return;
        end;
    end;
end;