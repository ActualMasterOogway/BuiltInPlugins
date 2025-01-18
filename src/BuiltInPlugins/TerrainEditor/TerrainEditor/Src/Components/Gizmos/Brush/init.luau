local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v6 = require(l_Hooks_0.useRaycast);
local v7 = require(l_Hooks_0.useTerrain);
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.ConvertForPivot);
local v10 = require(script.Box);
local v11 = require(script.Cylinder);
local v12 = require(script.Sphere);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Grid);
local v14 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v14.BrushSettings;
local l_BrushShape_0 = v14.BrushShape;
local l_Category_0 = v14.Category;
local l_FlattenPlane_0 = v14.FlattenPlane;
local l_PlaneLock_0 = v14.PlaneLock;
local l_Tool_0 = v14.Tool;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v23) --[[ Line: 42 ]] --[[ Name: Brush ]]
    -- upvalues: v7 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), v8 (copy), l_BrushShape_0 (copy), v6 (copy), l_PlaneLock_0 (copy), l_Tool_0 (copy), v9 (copy), l_Stylizer_0 (copy), l_FlattenPlane_0 (copy), v2 (copy), v12 (copy), v10 (copy), v11 (copy), v3 (copy), v13 (copy), l_CoreGui_0 (copy)
    local v24 = v7();
    local v25 = v23.Value[l_Category_0.BrushSettings];
    local v26 = v25[l_BrushSettings_0.BrushShape];
    local v27 = v25[l_BrushSettings_0.BrushSize];
    local v28 = v27.Size * v8.VoxelResolution;
    local v29 = if v26 == l_BrushShape_0.Sphere then v28 else v27.Height * v8.VoxelResolution;
    local v30 = v25[l_BrushSettings_0.PlaneLock];
    local v31 = v25[l_BrushSettings_0.PlaneTransform];
    local v32 = v25[l_BrushSettings_0.ManualPlaneLock];
    local v34, v35, v36 = v6(v23.Tool, v23.Value, v32 and v30 == l_PlaneLock_0.Manual and v23.Tool ~= l_Tool_0.Flatten and function(_) --[[ Line: 62 ]]

    end or v23.Save);
    local v37 = v9(v25[l_BrushSettings_0.PivotPosition], v36, v29);
    local v38 = l_Stylizer_0:use("Brush");
    local v39 = v38.CenterRadiusMultiplier * v34.Distance;
    local l_CenterTransparency_0 = v38.CenterTransparency;
    local l_Color_0 = v38.Color;
    local l_MainTransparency_0 = v38.MainTransparency;
    local v43 = if v30 == l_PlaneLock_0.Manual then v31 else CFrame.lookAt(Vector3.new(), v35.Normal);
    local v44 = v9(v25[l_BrushSettings_0.PivotPosition], v35.Position, v29);
    local v45 = true;
    if v30 ~= l_PlaneLock_0.Auto then
        v45 = false;
        if v30 == l_PlaneLock_0.Manual then
            v45 = not v32;
        end;
    end;
    local v46 = if v30 == l_PlaneLock_0.Manual then v31 - v31.Position + v44 else CFrame.lookAt(v44, v44 + v35.Normal);
    if v23.Tool == l_Tool_0.Flatten then
        v45 = true;
        if v25[l_BrushSettings_0.FlattenPlane] == l_FlattenPlane_0.Auto then
            v43 = CFrame.lookAt(Vector3.new(), Vector3.yAxis);
            v46 = CFrame.lookAt(v44, v44 + Vector3.yAxis);
        else
            v43 = CFrame.lookAt(Vector3.new(), Vector3.yAxis);
            v44 = Vector3.new(v44.X, 0, v44.Z) + Vector3.yAxis * v25[l_BrushSettings_0.FixedYPlane];
            v46 = CFrame.lookAt(v44, v44 + Vector3.yAxis);
        end;
    end;
    if v23.Tool ~= l_Tool_0.Flatten and v32 and v30 == l_PlaneLock_0.Manual then
        return nil;
    else
        local v47 = if v26 == l_BrushShape_0.Sphere then v2.createElement(v12, {
            Adornee = v24, 
            CFrame = CFrame.new(v37), 
            Color = l_Color_0, 
            Radius = v28 / 2, 
            Transparency = l_MainTransparency_0
        }) else if v26 == l_BrushShape_0.Cube then v2.createElement(v10, {
            Adornee = v24, 
            CFrame = CFrame.new(v37), 
            Color = l_Color_0, 
            Size = Vector3.new(v28, v29, v28), 
            Transparency = l_MainTransparency_0
        }) else if v26 == l_BrushShape_0.Cylinder then v2.createElement(v11, {
            Adornee = v24, 
            CFrame = CFrame.Angles(1.5707963267948966, 0, 0) + v37, 
            Color = l_Color_0, 
            Height = v29, 
            Radius = v28 / 2, 
            Transparency = l_MainTransparency_0
        }) else nil;
        return v3.createPortal({
            BrushVisual = v2.createElement("Folder", {}, {
                Cursor = v47, 
                Central = v2.createElement("SphereHandleAdornment", {
                    Adornee = v24, 
                    AlwaysOnTop = true, 
                    CFrame = CFrame.new(v37), 
                    Color = l_Color_0, 
                    Radius = v39, 
                    Transparency = l_CenterTransparency_0, 
                    ZIndex = 1
                })
            }), 
            Grid = if v45 then v2.createElement(v13, {
                AlwaysOnTop = true, 
                Center = v43, 
                Size = v25[l_BrushSettings_0.BrushSize].Size, 
                Transform = v46
            }) else nil
        }, l_CoreGui_0);
    end;
end;