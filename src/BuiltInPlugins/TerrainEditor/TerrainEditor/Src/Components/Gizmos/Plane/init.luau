local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = v2.UI.Pane;
local v5 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v7 = require(l_Hooks_0.usePlane);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Grid);
local v9 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v9.BrushSettings;
local l_Category_0 = v9.Category;
local l_PlaneLock_0 = v9.PlaneLock;
local l_Tool_0 = v9.Tool;
return function(v14) --[[ Line: 41 ]] --[[ Name: Plane ]]
    -- upvalues: v7 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), l_Tool_0 (copy), v3 (copy), l_Pane_0 (copy), v5 (copy), v8 (copy)
    local v15, v16 = v7(v14.Tool, v14.Value, v14.Save, v14.FromSelf);
    local v17 = v14.Value[l_Category_0.BrushSettings];
    if v17[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual and v17[l_BrushSettings_0.ManualPlaneLock] and v14.Tool ~= l_Tool_0.Flatten then
        return (v3.createElement(l_Pane_0, {}, {
            Dragger = if not v15.Mock then v3.createElement(v5, v15) else nil, 
            Grid = v3.createElement(v8, {
                AlwaysOnTop = v17[l_BrushSettings_0.ManualPlaneLock], 
                Size = v17[l_BrushSettings_0.BrushSize].Size, 
                Transform = v16
            })
        }));
    else
        return nil;
    end;
end;