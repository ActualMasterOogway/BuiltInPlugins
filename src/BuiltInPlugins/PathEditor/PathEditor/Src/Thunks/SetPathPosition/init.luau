local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.getRelativePosFromAbsPos);
local v4 = require(l_Util_0.getUDim2ScaleFromVector2);
if game:GetFastFlag("PathEditorRotation") then
    return function(v5, v6, v7) --[[ Line: 12 ]]
        -- upvalues: v1 (copy), v3 (copy)
        return function(v8) --[[ Line: 13 ]]
            -- upvalues: v7 (copy), v1 (ref), v6 (copy), v3 (ref), v5 (copy)
            local l_PathReducer_0 = v8:getState().PathReducer;
            if l_PathReducer_0.SelectedObject == nil then
                return;
            else
                if not v7 then
                    v8:dispatch(v1("Setting Path Position"));
                end;
                local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
                local l_Min_0 = l_PathReducer_0.SelectedObject:GetBoundingRect().Min;
                local v12 = v6 - l_Min_0;
                for _, v14 in l_ControlPoints_0 do
                    v14.Position = v14.Position + v3(v5 + v12, l_PathReducer_0.SelectedObject.Parent);
                end;
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
                if v7 then
                    v8:dispatch(v1());
                end;
                return;
            end;
        end;
    end;
else
    return function(v15, v16) --[[ Line: 43 ]]
        -- upvalues: v1 (copy), v4 (copy)
        return function(v17) --[[ Line: 44 ]]
            -- upvalues: v16 (copy), v1 (ref), v15 (copy), v4 (ref)
            local l_PathReducer_1 = v17:getState().PathReducer;
            if l_PathReducer_1.SelectedObject == nil then
                return;
            else
                if not v16 then
                    v17:dispatch(v1("Setting Path Position"));
                end;
                local l_ControlPoints_1 = l_PathReducer_1.SelectedObject:GetControlPoints();
                local l_Min_1 = l_PathReducer_1.SelectedObject:GetBoundingRect().Min;
                for _, v22 in l_ControlPoints_1 do
                    v22.Position = v22.Position + v15 - v4(l_Min_1, l_PathReducer_1.SelectedObject.Parent);
                end;
                l_PathReducer_1.SelectedObject:SetControlPoints(l_ControlPoints_1);
                if v16 then
                    v17:dispatch(v1());
                end;
                return;
            end;
        end;
    end;
end;