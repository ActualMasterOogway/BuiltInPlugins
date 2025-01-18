local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v9 = require(l_script_FirstAncestor_0.Src.Schemas.Plane);
local v10 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v11 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v12 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v13.BrushSettings;
local l_Category_0 = v13.Category;
return function(v16, v17, v18, v19) --[[ Line: 23 ]] --[[ Name: usePlane ]]
    -- upvalues: v7 (copy), v8 (copy), l_useMemo_0 (copy), v9 (copy), l_Category_0 (copy), l_BrushSettings_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v10 (copy), l_script_FirstAncestor_0 (copy), v11 (copy), v12 (copy), l_useEffect_0 (copy)
    local v20 = v7:use();
    local v21 = v8:use();
    local v22 = l_useMemo_0(function() --[[ Line: 26 ]]
        -- upvalues: v9 (ref), v17 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref)
        return v9.Selection.new(v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]);
    end, {
        v16
    });
    local v23, v24 = l_useState_0(v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]);
    local v27 = l_useCallback_0(function(v25) --[[ Line: 30 ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), v18 (copy), v24 (copy)
        local v26 = {
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.PlaneTransform] = v25
            }
        };
        v18(v26);
        v24(v25);
    end, {
        v17
    });
    local v29 = l_useCallback_0(function(v28) --[[ Line: 40 ]]
        -- upvalues: v22 (copy), v27 (copy)
        v22:SetTransform(v28);
        v27(v28);
    end, {
        v22, 
        v27
    });
    local v31 = l_useMemo_0(function() --[[ Line: 44 ]]
        -- upvalues: v20 (copy), v10 (ref), l_script_FirstAncestor_0 (ref), v22 (copy), v29 (copy), v21 (copy), v9 (ref), v11 (ref), v12 (ref)
        if v20:isMocking() then
            return {
                DraggerContext = {}, 
                Mock = true
            };
        else
            local v30 = v10.new(l_script_FirstAncestor_0.Parent, game, settings(), v22);
            v30.updatePlane = v29;
            v30.Mock = false;
            v30.shouldExtendSelection = function() --[[ Line: 59 ]]
                return true;
            end;
            return {
                Mouse = v21:getMouse(), 
                DraggerContext = v30, 
                DraggerSchema = v9, 
                DraggerSettings = {
                    AnalyticsName = "AdjustablePlaneLock", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v11.new(v30, {
                            ShowBoundingBox = false, 
                            Summonable = false, 
                            Outset = 1
                        }, v9.TransformHandlesImplementation.new(v30)), 
                        v12.new(v30, {
                            ShowBoundingBox = false, 
                            Summonable = false, 
                            Outset = 1
                        }, v9.TransformHandlesImplementation.new(v30))
                    }
                }
            };
        end;
    end, {
        v16
    });
    l_useEffect_0(function() --[[ Line: 88 ]]
        -- upvalues: v31 (copy), v29 (copy)
        v31.DraggerContext.updatePlane = v29;
    end, {
        v29
    });
    l_useEffect_0(function() --[[ Line: 91 ]]
        -- upvalues: v17 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), v19 (copy), v22 (copy), v24 (copy)
        local v32 = v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform];
        if not v19 then
            v22:SetTransformSignal(v32);
            v24(v32);
        end;
    end, {
        v16, 
        v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]
    });
    return v31, v23;
end;