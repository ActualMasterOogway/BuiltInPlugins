local l_Workspace_0 = game:GetService("Workspace");
local l_DraggerFramework_0 = script.Parent.Parent.DraggerFramework;
local v2 = require(script.Parent.getSelectableWithCache);
local v3 = require(script.Parent.shouldSelectSubPart);
local v4 = require(l_DraggerFramework_0.Utility.DragHelper);
local v5 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v6 = require(l_DraggerFramework_0.Utility.CursorGroupName);
return function(v7, v8, v9, v10, v11) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v6 (copy), l_Workspace_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v12 = v3(v7);
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = RaycastParams.new();
    v16.BruteForceAllSlow = true;
    v16.CollisionGroup = v6;
    local v17 = l_Workspace_0:Raycast(v8.Origin, v8.Direction, v16);
    if v17 then
        v13 = v17.Instance;
        v14 = v17.Distance;
        v15 = v17;
        v16.FilterType = Enum.RaycastFilterType.Whitelist;
        v16.FilterDescendantsInstances = v9;
        local v18 = l_Workspace_0:raycast(v8.Origin, v8.Direction, v16);
        if v18 and (v10 and v12 or v18.Position:FuzzyEq(v17.Position)) then
            v13 = v18.Instance;
            v15 = v18;
        end;
    end;
    if v5() and v11 and not v12 then
        local v19 = v7:getMouseLocation();
        local v20 = 7;
        local v21 = nil;
        local v22 = nil;
        local v23 = nil;
        for v24, v25 in v9 do
            if v25:IsA("PVInstance") then
                local l_v25_Pivot_0 = v25:GetPivot();
                local v27 = v7:worldToViewportPoint(l_v25_Pivot_0.Position);
                local l_Magnitude_0 = (v19 - Vector2.new(v27.X, v27.Y)).Magnitude;
                if l_Magnitude_0 < v20 then
                    v20 = l_Magnitude_0;
                    v21 = v25;
                    v22 = l_v25_Pivot_0;
                    v23 = v24;
                end;
            end;
        end;
        if v21 then
            local v29 = table.freeze({
                RaycastResult = v15, 
                TargetMatrix = v22, 
                TargetSize = Vector3.zero, 
                IsPivot = true, 
                IsActivePivot = v23 == #v9
            });
            return v21, nil, (v22.Position - v8.Origin):Dot(v8.Direction.Unit), v29;
        end;
    end;
    local v30 = v7:gizmoRaycast(v8.Origin, v8.Direction, RaycastParams.new());
    if v30 and (v7:shouldDrawConstraintsOnTop() or not v17 or v17 and v30.Distance < v17.Distance) then
        v13 = v30.Instance;
        v14 = v30.Distance;
        v15 = v30;
    end;
    if v13 then
        local v31 = v2(v13, v12, {});
        local v32 = nil;
        if v5() then
            local v33 = nil;
            local v34 = nil;
            if v15.Instance:IsA("PVInstance") then
                local v35 = if v7:shouldGridSnap() then v7:getGridSize() else nil;
                local v36 = v4.getSurfaceMatrix(v8, v15, v7.PreviousTargetMatrix, v35);
                if v36 then
                    v33 = v36.matrix;
                    v34 = v36.size;
                    v7.PreviousTargetMatrix = v33;
                end;
            end;
            v32 = table.freeze({
                RaycastResult = v15, 
                TargetMatrix = v33, 
                TargetSize = v34, 
                IsPivot = false
            });
        end;
        return v31, v13, v14, v32;
    else
        return nil;
    end;
end;