local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v4 = require(l_script_FirstAncestor_0.Src.Util.getPlaneFromCamera);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Operations.SculptOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v7.BrushMode;
local l_BrushSettings_0 = v7.BrushSettings;
local l_BrushShape_0 = v7.BrushShape;
local l_Category_0 = v7.Category;
local l_Gizmo_0 = v7.Gizmo;
local l_PivotPosition_0 = v7.PivotPosition;
local l_PlaneLock_0 = v7.PlaneLock;
local l_MaterialSettings_0 = v7.MaterialSettings;
local l_Tab_0 = v7.Tab;
local l_Tool_0 = v7.Tool;
local v18 = {
    {
        Defaults = {
            [l_BrushSettings_0.BrushMode] = l_BrushMode_0.Add, 
            [l_BrushSettings_0.BrushShape] = l_BrushShape_0.Sphere, 
            [l_BrushSettings_0.BrushSize] = {
                Height = 6, 
                Locked = true, 
                Size = 6
            }, 
            [l_BrushSettings_0.PivotPosition] = l_PivotPosition_0.Center, 
            [l_BrushSettings_0.Strength] = 1, 
            [l_BrushSettings_0.State] = {
                Position = Vector3.new(0, 0, 0, 0)
            }, 
            [l_BrushSettings_0.IgnoreWater] = false, 
            [l_BrushSettings_0.IgnoreParts] = true, 
            [l_BrushSettings_0.TemporarySmooth] = false, 
            [l_BrushSettings_0.WaterAutofill] = false
        }, 
        Id = l_Category_0.BrushSettings
    }, 
    {
        Defaults = {
            [l_MaterialSettings_0.AutoMaterial] = false, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Grass
        }, 
        Id = l_Category_0.MaterialSettings
    }
};
local v19 = {
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
local v20 = v2:new(l_Tool_0.Sculpt, l_Tab_0.Edit, v18, v19);
v20.init = function(v21, v22, v23) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), v6 (copy), v4 (copy)
    v2.init(v21, v22, v23);
    v21._overrides = {
        [l_Category_0.BrushSettings] = {
            [l_BrushSettings_0.ManualPlaneLock] = {
                Schema = {
                    OnReset = function() --[[ Line: 79 ]] --[[ Name: OnReset ]]
                        -- upvalues: v6 (ref), l_Category_0 (ref), v21 (copy), l_BrushSettings_0 (ref), v4 (ref)
                        v6.Set(l_Category_0.BrushSettings, v21._pluginController, {
                            [l_BrushSettings_0.PlaneTransform] = v4()
                        });
                        task.spawn(function() --[[ Line: 84 ]]
                            -- upvalues: v21 (ref)
                            v21.OnInternalsChanged:Fire();
                        end);
                    end
                }
            }
        }
    };
    v21._brushTime = 0;
    v21._brushUsages = 0;
end;
v20.saveForm = function(v24, v25) --[[ Line: 97 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v24, v25);
    if v24._operation then
        v24._operation:updatePayload(v24:getPayload());
    end;
end;
v20.saveGizmos = function(v26, v27) --[[ Line: 105 ]] --[[ Name: saveGizmos ]]
    -- upvalues: v2 (copy)
    v2.saveGizmos(v26, v27);
    if v26._operation then
        v26._operation:updatePayload(v26:getPayload());
    end;
end;
v20.startOperation = function(v28, v29) --[[ Line: 113 ]] --[[ Name: startOperation ]]
    -- upvalues: v5 (copy), v1 (copy)
    v28._operation = v5("Sculpt", v28._services);
    v28._operation:start(v1.join({
        Payload = v28:getPayload()
    }, v29));
end;
v20.activate = function(v30) --[[ Line: 121 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), l_Tool_0 (copy)
    v2.activate(v30);
    local v31 = v30._shortcutController:getMouse();
    v30._mouseDownConnection = v30._shortcutController.MouseDownAction:Connect(function() --[[ Line: 125 ]]
        -- upvalues: v30 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), l_PlaneLock_0 (ref)
        local v32 = v30:getPayload();
        if not v32[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] or v32[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] ~= l_PlaneLock_0.Manual then
            v30:startOperation();
        end;
    end);
    v30._mouseUpConnection = v31.Button1Up:Connect(function() --[[ Line: 135 ]]
        -- upvalues: v30 (copy)
        if v30._operation and v30._operation:isRunning() then
            local l_v30_0 = v30;
            l_v30_0._brushUsages = l_v30_0._brushUsages + 1;
            v30._brushTime = v30._operation:getCurrentTimeTaken() / v30._operation:getStepsTaken();
            l_v30_0 = v30._operation:getTimeStatistic();
            if l_v30_0 then
                v30._brushStatistic = (v30._brushStatistic or 0) + l_v30_0;
            end;
            v30._operation:destroy();
        end;
    end);
    v30._analytics:report("Activated", l_Tool_0.Sculpt);
end;
v20.deactivate = function(v34) --[[ Line: 152 ]] --[[ Name: deactivate ]]
    -- upvalues: v2 (copy)
    v34._mouseDownConnection:Disconnect();
    v34._mouseUpConnection:Disconnect();
    if v34._operation and v34._operation:isRunning() then
        v34._brushUsages = v34._brushUsages + 1;
        v34._brushTime = v34._operation:getCurrentTimeTaken() / v34._operation:getStepsTaken();
        local v35 = v34._operation:getTimeStatistic();
        if v35 then
            v34._brushStatistic = (v34._brushStatistic or 0) + v35;
        end;
        v34._operation:destroy();
    end;
    v2.deactivate(v34);
end;
v20.reportAnalytics = function(v36) --[[ Line: 171 ]] --[[ Name: reportAnalytics ]]
    -- upvalues: v3 (copy), l_Tool_0 (copy)
    local v37 = v36:getPayload();
    if v36._brushTime and v36._brushTime > 0 then
        v36._analytics:report("BrushProperties", v3.getBrushPayload(v37, v36._brushTime, l_Tool_0.Sculpt));
        v36._analytics:report("MaterialProperties", v3.getMaterialPayload(v37, l_Tool_0.Sculpt));
        v36._analytics:report("Usage", l_Tool_0.Sculpt, v36._brushUsages);
        if v36._brushStatistic and v36._brushUsages > 0 then
            v36._analytics:report("Performance", l_Tool_0.Sculpt, v36._brushStatistic / v36._brushUsages);
        end;
    end;
    v36._brushUsages = 0;
    v36._brushTime = 0;
    v36._brushStatistic = 0;
end;
return v20;