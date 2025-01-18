local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Operations.FlattenOperation);
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v5.BrushSettings;
local l_BrushShape_0 = v5.BrushShape;
local l_Category_0 = v5.Category;
local l_FlattenMode_0 = v5.FlattenMode;
local l_FlattenPlane_0 = v5.FlattenPlane;
local l_Gizmo_0 = v5.Gizmo;
local l_PivotPosition_0 = v5.PivotPosition;
local l_Snapping_0 = v5.Snapping;
local l_Tab_0 = v5.Tab;
local l_Tool_0 = v5.Tool;
local v16 = {
    {
        Defaults = {
            [l_BrushSettings_0.BrushShape] = l_BrushShape_0.Sphere, 
            [l_BrushSettings_0.BrushSize] = {
                Height = 6, 
                Locked = true, 
                Size = 6
            }, 
            [l_BrushSettings_0.Strength] = 1, 
            [l_BrushSettings_0.FixedYPlane] = 0, 
            [l_BrushSettings_0.FlattenMode] = l_FlattenMode_0.Both, 
            [l_BrushSettings_0.FlattenPlane] = l_FlattenPlane_0.Auto, 
            [l_BrushSettings_0.PivotPosition] = l_PivotPosition_0.Center, 
            [l_BrushSettings_0.Snapping] = l_Snapping_0.Off, 
            [l_BrushSettings_0.State] = {
                Position = Vector3.new(0, 0, 0, 0)
            }, 
            [l_BrushSettings_0.IgnoreWater] = false, 
            [l_BrushSettings_0.IgnoreParts] = true, 
            [l_BrushSettings_0.PullTerrain] = true, 
            [l_BrushSettings_0.WaterAutofill] = false
        }, 
        Id = l_Category_0.BrushSettings
    }
};
local v17 = {
    {
        Id = l_Gizmo_0.Plane, 
        Schema = {
            Type = l_Gizmo_0.Plane
        }
    }, 
    {
        Id = l_Gizmo_0.Brush, 
        Schema = {
            Type = l_Gizmo_0.Brush
        }
    }
};
local v18 = v2:new(l_Tool_0.Flatten, l_Tab_0.Edit, v16, v17);
v18.init = function(v19, v20, v21) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy)
    v2.init(v19, v20, v21);
    v19._overrides = {
        [l_Category_0.BrushSettings] = {
            [l_BrushSettings_0.PlaneLock] = {
                Hidden = true
            }, 
            [l_BrushSettings_0.ManualPlaneLock] = {
                Hidden = true
            }
        }
    };
    v19._brushUsages = 0;
    v19._brushTime = 0;
end;
v18.saveForm = function(v22, v23) --[[ Line: 85 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v22, v23);
    if v22._operation then
        v22._operation:updatePayload(v22:getPayload());
    end;
end;
v18.saveGizmos = function(v24, v25) --[[ Line: 93 ]] --[[ Name: saveGizmos ]]
    -- upvalues: v2 (copy)
    v2.saveGizmos(v24, v25);
    if v24._operation then
        v24._operation:updatePayload(v24:getPayload());
    end;
end;
v18.startOperation = function(v26, v27) --[[ Line: 101 ]] --[[ Name: startOperation ]]
    -- upvalues: v4 (copy), v1 (copy)
    v26._operation = v4("Flatten", v26._services);
    v26._operation:start(v1.join({
        Payload = v26:getPayload()
    }, v27));
end;
v18.activate = function(v28) --[[ Line: 109 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Tool_0 (copy)
    v2.activate(v28);
    local v29 = v28._shortcutController:getMouse();
    v28._mouseDownConnection = v28._shortcutController.MouseDownAction:Connect(function() --[[ Line: 113 ]]
        -- upvalues: v28 (copy)
        v28:startOperation();
    end);
    v28._mouseUpConnection = v29.Button1Up:Connect(function() --[[ Line: 117 ]]
        -- upvalues: v28 (copy)
        if v28._operation and v28._operation:isRunning() then
            local l_v28_0 = v28;
            l_v28_0._brushUsages = l_v28_0._brushUsages + 1;
            v28._brushTime = v28._operation:getCurrentTimeTaken() / v28._operation:getStepsTaken();
            l_v28_0 = v28._operation:getTimeStatistic();
            if l_v28_0 then
                v28._brushStatistic = (v28._brushStatistic or 0) + l_v28_0;
            end;
            v28._operation:destroy();
        end;
    end);
    v28._analytics:report("Activated", l_Tool_0.Flatten);
end;
v18.deactivate = function(v31) --[[ Line: 134 ]] --[[ Name: deactivate ]]
    -- upvalues: v2 (copy)
    v31._mouseDownConnection:Disconnect();
    v31._mouseUpConnection:Disconnect();
    if v31._operation and v31._operation:isRunning() then
        v31._brushUsages = v31._brushUsages + 1;
        v31._brushTime = v31._brushTime + v31._operation:getCurrentTimeTaken() / v31._operation:getStepsTaken();
        local v32 = v31._operation:getTimeStatistic();
        if v32 then
            v31._brushStatistic = (v31._brushStatistic or 0) + v32;
        end;
        v31._operation:destroy();
    end;
    v2.deactivate(v31);
end;
v18.reportAnalytics = function(v33) --[[ Line: 153 ]] --[[ Name: reportAnalytics ]]
    -- upvalues: v3 (copy), l_Tool_0 (copy)
    local v34 = v33:getPayload();
    if v33._brushTime and v33._brushTime > 0 then
        v33._analytics:report("BrushProperties", v3.getBrushPayload(v34, v33._brushTime, l_Tool_0.Flatten));
        v33._analytics:report("Usage", l_Tool_0.Flatten, v33._brushUsages);
        if v33._brushStatistic and v33._brushUsages > 0 then
            v33._analytics:report("Performance", l_Tool_0.Flatten, v33._brushStatistic / v33._brushUsages);
        end;
    end;
    v33._brushStatistic = 0;
    v33._brushUsages = 0;
    v33._brushTime = 0;
end;
return v18;