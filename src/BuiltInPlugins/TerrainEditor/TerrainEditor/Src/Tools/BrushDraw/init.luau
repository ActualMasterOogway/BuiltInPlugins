local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Operations.DrawOperation);
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v4.BrushMode;
local l_BrushSettings_0 = v4.BrushSettings;
local l_BrushShape_0 = v4.BrushShape;
local l_Category_0 = v4.Category;
local l_Gizmo_0 = v4.Gizmo;
local l_MaterialSettings_0 = v4.MaterialSettings;
local l_PivotPosition_0 = v4.PivotPosition;
local l_PlaneLock_0 = v4.PlaneLock;
local l_Snapping_0 = v4.Snapping;
local l_Tab_0 = v4.Tab;
local l_Tool_0 = v4.Tool;
local v16 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v17 = require(l_script_FirstAncestor_0.Src.Util.getPlaneFromCamera);
local v18 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local v19 = {
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
            [l_BrushSettings_0.Snapping] = l_Snapping_0.Off, 
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
local v20 = {
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
local v21 = v2:new(l_Tool_0.Draw, l_Tab_0.Edit, v19, v20);
v21.init = function(v22, v23, v24) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), v18 (copy), v17 (copy)
    v2.init(v22, v23, v24);
    v22._overrides = {
        [l_Category_0.BrushSettings] = {
            [l_BrushSettings_0.ManualPlaneLock] = {
                Schema = {
                    OnReset = function() --[[ Line: 82 ]] --[[ Name: OnReset ]]
                        -- upvalues: v18 (ref), l_Category_0 (ref), v22 (copy), l_BrushSettings_0 (ref), v17 (ref)
                        v18.Set(l_Category_0.BrushSettings, v22._pluginController, {
                            [l_BrushSettings_0.PlaneTransform] = v17()
                        });
                        task.spawn(function() --[[ Line: 87 ]]
                            -- upvalues: v22 (ref)
                            v22.OnInternalsChanged:Fire();
                        end);
                    end
                }
            }
        }
    };
    v22._brushTime = 0;
    v22._brushUsages = 0;
end;
v21.saveForm = function(v25, v26) --[[ Line: 99 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v25, v26);
    if v25._operation then
        v25._operation:updatePayload(v25:getPayload());
    end;
end;
v21.saveGizmos = function(v27, v28) --[[ Line: 107 ]] --[[ Name: saveGizmos ]]
    -- upvalues: v2 (copy)
    v2.saveGizmos(v27, v28);
    if v27._operation then
        v27._operation:updatePayload(v27:getPayload());
    end;
end;
v21.startOperation = function(v29, v30) --[[ Line: 115 ]] --[[ Name: startOperation ]]
    -- upvalues: v3 (copy), v1 (copy)
    v29._operation = v3("Draw", v29._services);
    v29._operation:start(v1.join({
        Payload = v29:getPayload()
    }, v30));
end;
v21.activate = function(v31) --[[ Line: 123 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), l_Tool_0 (copy)
    v2.activate(v31);
    local v32 = v31._shortcutController:getMouse();
    v31._mouseDownConnection = v31._shortcutController.MouseDownAction:Connect(function() --[[ Line: 127 ]]
        -- upvalues: v31 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), l_PlaneLock_0 (ref)
        local v33 = v31:getPayload();
        if not v33[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] or v33[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] ~= l_PlaneLock_0.Manual then
            v31:startOperation();
        end;
    end);
    v31._mouseUpConnection = v32.Button1Up:Connect(function() --[[ Line: 137 ]]
        -- upvalues: v31 (copy)
        if v31._operation and v31._operation:isRunning() then
            local l_v31_0 = v31;
            l_v31_0._brushUsages = l_v31_0._brushUsages + 1;
            v31._brushTime = v31._operation:getCurrentTimeTaken() / v31._operation:getStepsTaken();
            l_v31_0 = v31._operation:getTimeStatistic();
            if l_v31_0 then
                v31._brushStatistic = (v31._brushStatistic or 0) + l_v31_0;
            end;
            v31._operation:destroy();
        end;
    end);
    v31._analytics:report("Activated", l_Tool_0.Draw);
end;
v21.deactivate = function(v35) --[[ Line: 154 ]] --[[ Name: deactivate ]]
    -- upvalues: v2 (copy)
    v35._mouseDownConnection:Disconnect();
    v35._mouseUpConnection:Disconnect();
    if v35._operation and v35._operation:isRunning() then
        v35._brushUsages = v35._brushUsages + 1;
        v35._brushTime = v35._operation:getCurrentTimeTaken() / v35._operation:getStepsTaken();
        local v36 = v35._operation:getTimeStatistic();
        if v36 then
            v35._brushStatistic = (v35._brushStatistic or 0) + v36;
        end;
        v35._operation:destroy();
    end;
    v2.deactivate(v35);
end;
v21.reportAnalytics = function(v37) --[[ Line: 173 ]] --[[ Name: reportAnalytics ]]
    -- upvalues: v16 (copy), l_Tool_0 (copy)
    local v38 = v37:getPayload();
    if v37._brushTime and v37._brushTime > 0 then
        v37._analytics:report("BrushProperties", v16.getBrushPayload(v38, v37._brushTime, l_Tool_0.Draw));
        v37._analytics:report("MaterialProperties", v16.getMaterialPayload(v38, l_Tool_0.Draw));
        v37._analytics:report("Usage", l_Tool_0.Draw, v37._brushUsages);
        if v37._brushStatistic and v37._brushUsages > 0 then
            v37._analytics:report("Performance", l_Tool_0.Draw, v37._brushStatistic / v37._brushUsages);
        end;
    end;
    v37._brushUsages = 0;
    v37._brushTime = 0;
    v37._brushStatistic = 0;
end;
return v21;