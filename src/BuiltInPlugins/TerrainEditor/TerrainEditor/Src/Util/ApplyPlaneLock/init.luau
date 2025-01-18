local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getPlaneIntersection);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v2.BrushSettings;
local l_Category_0 = v2.Category;
local l_PlaneLock_0 = v2.PlaneLock;
local l_Tool_0 = v2.Tool;
return function(v7, v8, v9, v10) --[[ Line: 26 ]] --[[ Name: ApplyPlaneLock ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_Tool_0 (copy), l_PlaneLock_0 (copy), v1 (copy)
    local l_Position_0 = v9.Origin.Position;
    local v12 = v7[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform];
    local l_Direction_0 = v9.UnitRay.Direction;
    if v10 == l_Tool_0.Flatten then
        return nil;
    elseif v7[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Auto then
        local l_LookVector_0 = v8.LookVector;
        local v15 = v1(l_Position_0, l_Direction_0, v8.Position, l_LookVector_0);
        return {
            Distance = (v15 - l_Position_0).Magnitude, 
            Normal = l_LookVector_0, 
            Position = v15
        };
    elseif v7[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
        local v16 = v1(l_Position_0, l_Direction_0, v12.Position, v12.LookVector);
        return {
            Distance = (v16 - l_Position_0).Magnitude, 
            Normal = v12.LookVector, 
            Position = v16
        };
    else
        return nil;
    end;
end;