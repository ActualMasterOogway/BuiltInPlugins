local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v4 = require(l_script_FirstAncestor_0.Src.Util.getPlaneFromCamera);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v7.BrushSettings;
local l_BrushShape_0 = v7.BrushShape;
local l_Category_0 = v7.Category;
local l_Gizmo_0 = v7.Gizmo;
local l_PivotPosition_0 = v7.PivotPosition;
local l_PlaneLock_0 = v7.PlaneLock;
local l_Snapping_0 = v7.Snapping;
local l_Tab_0 = v7.Tab;
local l_Tool_0 = v7.Tool;
local v17 = {
    {
        Defaults = {
            [l_BrushSettings_0.BrushShape] = l_BrushShape_0.Sphere, 
            [l_BrushSettings_0.BrushSize] = {
                Height = 6, 
                Locked = true, 
                Size = 6
            }, 
            [l_BrushSettings_0.Strength] = 1, 
            [l_BrushSettings_0.PivotPosition] = l_PivotPosition_0.Center, 
            [l_BrushSettings_0.Snapping] = l_Snapping_0.Off, 
            [l_BrushSettings_0.State] = {
                Position = Vector3.new(0, 0, 0, 0)
            }, 
            [l_BrushSettings_0.IgnoreWater] = false, 
            [l_BrushSettings_0.IgnoreParts] = true
        }, 
        Id = l_Category_0.BrushSettings
    }
};
local v18 = {
    {
        Id = l_Gizmo_0.Brush, 
        Schema = {
            Type = l_Gizmo_0.Brush
        }
    }, 
    {
        Id = l_Gizmo_0.Plane, 
        Schema = {
            Type = l_Gizmo_0.Plane
        }
    }
};
local v19 = v2:new(l_Tool_0.Smooth, l_Tab_0.Edit, v17, v18);
v19.init = function(v20, v21, v22) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), v6 (copy), v4 (copy)
    v2.init(v20, v21, v22);
    v20._overrides = {
        [l_Category_0.BrushSettings] = {
            [l_BrushSettings_0.ManualPlaneLock] = {
                Schema = {
                    OnReset = function() --[[ Line: 70 ]] --[[ Name: OnReset ]]
                        -- upvalues: v6 (ref), l_Category_0 (ref), v20 (copy), l_BrushSettings_0 (ref), v4 (ref)
                        v6.Set(l_Category_0.BrushSettings, v20._pluginController, {
                            [l_BrushSettings_0.PlaneTransform] = v4()
                        });
                        task.spawn(function() --[[ Line: 75 ]]
                            -- upvalues: v20 (ref)
                            v20.OnInternalsChanged:Fire();
                        end);
                    end
                }
            }
        }
    };
    v20._brushTime = 0;
    v20._brushUsages = 0;
end;
v19.saveForm = function(v23, v24) --[[ Line: 88 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v23, v24);
    if v23._operation then
        v23._operation:updatePayload(v23:getPayload());
    end;
end;
v19.saveGizmos = function(v25, v26) --[[ Line: 96 ]] --[[ Name: saveGizmos ]]
    -- upvalues: v2 (copy)
    v2.saveGizmos(v25, v26);
    if v25._operation then
        v25._operation:updatePayload(v25:getPayload());
    end;
end;
v19.startOperation = function(v27, v28) --[[ Line: 104 ]] --[[ Name: startOperation ]]
    -- upvalues: v5 (copy), v1 (copy)
    v27._operation = v5("Smooth", v27._services);
    v27._operation:start(v1.join({
        Payload = v27:getPayload()
    }, v28));
end;
v19.activate = function(v29) --[[ Line: 112 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), l_Tool_0 (copy)
    v2.activate(v29);
    local v30 = v29._shortcutController:getMouse();
    v29._mouseDownConnection = v29._shortcutController.MouseDownAction:Connect(function() --[[ Line: 116 ]]
        -- upvalues: v29 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), l_PlaneLock_0 (ref)
        local v31 = v29:getPayload();
        if not v31[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] or v31[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] ~= l_PlaneLock_0.Manual then
            v29:startOperation();
        end;
    end);
    v29._mouseUpConnection = v30.Button1Up:Connect(function() --[[ Line: 126 ]]
        -- upvalues: v29 (copy)
        if v29._operation and v29._operation:isRunning() then
            local l_v29_0 = v29;
            l_v29_0._brushUsages = l_v29_0._brushUsages + 1;
            v29._brushTime = v29._operation:getCurrentTimeTaken() / v29._operation:getStepsTaken();
            l_v29_0 = v29._operation:getTimeStatistic();
            if l_v29_0 then
                v29._brushStatistic = (v29._brushStatistic or 0) + l_v29_0;
            end;
            v29._operation:destroy();
        end;
    end);
    v29._analytics:report("Activated", l_Tool_0.Smooth);
end;
v19.deactivate = function(v33) --[[ Line: 143 ]] --[[ Name: deactivate ]]
    -- upvalues: v2 (copy)
    v33._mouseDownConnection:Disconnect();
    v33._mouseUpConnection:Disconnect();
    if v33._operation and v33._operation:isRunning() then
        v33._brushUsages = v33._brushUsages + 1;
        v33._brushTime = v33._operation:getCurrentTimeTaken() / v33._operation:getStepsTaken();
        local v34 = v33._operation:getTimeStatistic();
        if v34 then
            v33._brushStatistic = (v33._brushStatistic or 0) + v34;
        end;
        v33._operation:destroy();
    end;
    v2.deactivate(v33);
end;
v19.reportAnalytics = function(v35) --[[ Line: 162 ]] --[[ Name: reportAnalytics ]]
    -- upvalues: v3 (copy), l_Tool_0 (copy)
    local v36 = v35:getPayload();
    if v35._brushTime then
        v35._analytics:report("BrushProperties", v3.getBrushPayload(v36, v35._brushTime, l_Tool_0.Smooth));
        v35._analytics:report("Usage", l_Tool_0.Smooth, v35._brushUsages);
        if v35._brushStatistic and v35._brushUsages > 0 then
            v35._analytics:report("Performance", l_Tool_0.Smooth, v35._brushStatistic / v35._brushUsages);
        end;
    end;
    v35._brushUsages = 0;
    v35._brushTime = 0;
    v35._brushStatistic = 0;
end;
return v19;