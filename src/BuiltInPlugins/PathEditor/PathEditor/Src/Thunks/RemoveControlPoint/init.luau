local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v2 = require(l_Parent_0.Src.Actions.SelectControlPoint);
local v3 = require(l_Parent_0.Src.Actions.RemoveControlPointState);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v4 (ref), v1 (ref), v3 (ref), v2 (ref)
        local l_PathReducer_0 = v5:getState().PathReducer;
        if v4 == nil then
            v4 = l_PathReducer_0.SelectedControlPointIndex;
        end;
        local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
        if v4 <= 0 or v4 > #l_ControlPoints_0 then
            return l_PathReducer_0;
        else
            v5:dispatch(v1("Remove Control Point"));
            local l_v4_0 = v4;
            v5:dispatch(v3(l_v4_0));
            if game:GetFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:RemoveControlPoint(l_v4_0);
            else
                table.remove(l_ControlPoints_0, l_v4_0);
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
            end;
            local v9 = if #l_PathReducer_0.SelectedObject:GetControlPoints() < l_v4_0 then l_v4_0 - 1 else l_v4_0;
            v5:dispatch(v2(v9));
            v5:dispatch(v1());
            return;
        end;
    end;
end;