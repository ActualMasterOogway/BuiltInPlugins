local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v10 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.ApplyPlaneLock);
local v12 = require(l_script_FirstAncestor_0.Src.Util.ConvertForPivot);
local v13 = require(l_script_FirstAncestor_0.Src.Util.getCameraLookPlane);
local v14 = require(l_script_FirstAncestor_0.Src.Util.getPlaneIntersection);
local v15 = require(l_script_FirstAncestor_0.Src.Util.getSnappedToVoxel);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v20 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v20.BrushSettings;
local l_BrushShape_0 = v20.BrushShape;
local l_Category_0 = v20.Category;
local l_MaterialSettings_0 = v20.MaterialSettings;
local l_PlaneLock_0 = v20.PlaneLock;
local l_RaycastType_0 = v20.RaycastType;
local l_Snapping_0 = v20.Snapping;
local l_Tool_0 = v20.Tool;
local v29 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorPartsInFrontOfCacheFix);
return function(v30, v31, v32) --[[ Line: 42 ]] --[[ Name: useRaycast ]]
    -- upvalues: v7 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v13 (copy), l_useRef_0 (copy), v9 (copy), l_Category_0 (copy), l_useCallback_0 (copy), l_BrushSettings_0 (copy), v10 (copy), l_Tool_0 (copy), l_MaterialSettings_0 (copy), l_PlaneLock_0 (copy), l_BrushShape_0 (copy), v12 (copy), l_CoreGui_0 (copy), l_Workspace_0 (copy), l_Players_0 (copy), v29 (copy), v1 (copy), l_RaycastType_0 (copy), v14 (copy), v11 (copy), l_Snapping_0 (copy), v15 (copy), v8 (copy), l_RunService_0 (copy)
    local v33 = v7:use();
    local v34 = v33:getMouse();
    local v35, v36 = l_useState_0({
        Distance = v34.Origin.Position.Magnitude, 
        Normal = Vector3.yAxis, 
        Position = Vector3.zero
    });
    local v37, v38 = l_useState_0({
        Distance = v34.Origin.Position.Magnitude, 
        Normal = Vector3.yAxis, 
        Position = Vector3.zero
    });
    local v39, v40 = l_useState_0(CFrame.lookAt(v35.Position, v35.Position + Vector3.yAxis));
    l_useEffect_0(function() --[[ Line: 60 ]]
        -- upvalues: v33 (copy), v35 (copy), v13 (ref), v40 (copy)
        if not v33:IsMouseDown() then
            local v41 = CFrame.lookAt(v35.Position, v35.Position + v13());
            v40(v41);
        end;
    end, {
        v30, 
        v35
    });
    local v42, v43 = l_useState_0({
        CacheID = nil, 
        CachePoint = Vector3.zero
    });
    local v44, v45 = l_useState_0(v33:isMouseMoveReserved());
    local v46 = l_useRef_0(nil);
    local v47 = l_useRef_0(Vector3.zero);
    local v48 = v9();
    local v49 = v31[l_Category_0.MaterialSettings];
    local v50 = l_useCallback_0(function() --[[ Line: 75 ]]
        -- upvalues: v31 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), v10 (ref)
        return (math.min(v31[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Size / 2 * v10.VoxelResolution * v10.TerrainCacheMultiplier, v10.TerrainCacheMaxRadius));
    end, {
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize]
    });
    local v51 = l_useCallback_0(function() --[[ Line: 84 ]]
        -- upvalues: v30 (copy), l_Tool_0 (ref), v31 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), v49 (copy), l_MaterialSettings_0 (ref), l_PlaneLock_0 (ref)
        if v30 == l_Tool_0.Draw and not v31[l_Category_0.BrushSettings][l_BrushSettings_0.TemporarySmooth] or v30 == l_Tool_0.Paint and v49 and (v49[l_MaterialSettings_0.TargetMaterial] == Enum.Material.Air or v49[l_MaterialSettings_0.SourceMaterial] == Enum.Material.Air) then
            return v31[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Off;
        else
            return false;
        end;
    end, {
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.TemporarySmooth], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock], 
        not v49 or v49[l_MaterialSettings_0.TargetMaterial], 
        v30
    });
    local v61 = l_useCallback_0(function(_) --[[ Line: 105 ]]
        -- upvalues: v31 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), v10 (ref), l_BrushShape_0 (ref), v12 (ref), v47 (copy), l_CoreGui_0 (ref)
        local v53 = v31[l_Category_0.BrushSettings][l_BrushSettings_0.BrushShape];
        local v54 = v31[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize];
        local v55 = v54.Size * v10.VoxelResolution;
        local v56 = if v53 == l_BrushShape_0.Sphere then v55 else v54.Height * v10.VoxelResolution;
        local v57 = v12(v31[l_Category_0.BrushSettings][l_BrushSettings_0.PivotPosition], v47.current, v56);
        local l_BrushVisual_0 = l_CoreGui_0:FindFirstChild("BrushVisual");
        if not l_BrushVisual_0 then
            return;
        else
            local l_l_BrushVisual_0_FirstChild_0 = l_BrushVisual_0:FindFirstChild("Central", true);
            if l_l_BrushVisual_0_FirstChild_0 then
                local v60 = if v53 == l_BrushShape_0.Cylinder then CFrame.Angles(1.5707963267948966, 0, 0) + v57 else CFrame.new(v57);
                l_l_BrushVisual_0_FirstChild_0.CFrame = v60;
                l_BrushVisual_0:FindFirstChild("OnTop", true).CFrame = v60;
                l_BrushVisual_0:FindFirstChild("Outline", true).CFrame = v60;
            end;
            return;
        end;
    end, {
        v31
    });
    local v64 = l_useCallback_0(function(v62) --[[ Line: 135 ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), v30 (copy), l_Tool_0 (ref), v61 (copy), v36 (copy), v32 (copy)
        local v63 = {
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.State] = v62
            }
        };
        if v30 ~= l_Tool_0.Build then
            v61(v62);
        end;
        v36(v62);
        v32(v63);
    end, {
        v39, 
        v32, 
        v30, 
        v61
    });
    local v86 = l_useCallback_0(function() --[[ Line: 148 ]]
        -- upvalues: v34 (copy), v31 (copy), l_Category_0 (ref), l_BrushSettings_0 (ref), v48 (copy), l_Workspace_0 (ref), l_Players_0 (ref), v29 (ref), v10 (ref), v33 (copy), v51 (copy), v35 (copy), v42 (copy), v50 (copy), v43 (copy), v1 (ref), v46 (copy), l_RaycastType_0 (ref), v13 (ref), v14 (ref), v11 (ref), v39 (copy), v30 (copy), v38 (copy), l_Snapping_0 (ref), v15 (ref), v47 (copy)
        local l_Position_0 = v34.Origin.Position;
        local l_Direction_0 = v34.UnitRay.Direction;
        local v67 = RaycastParams.new();
        if v31[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreParts] then
            local v68 = {
                v48
            };
            local l_Baseplate_0 = l_Workspace_0:FindFirstChild("Baseplate");
            if l_Baseplate_0 then
                table.insert(v68, l_Baseplate_0);
            end;
            v67.FilterType = Enum.RaycastFilterType.Whitelist;
            v67.FilterDescendantsInstances = v68;
        else
            local v70 = {};
            if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character then
                table.insert(v70, l_Players_0.LocalPlayer.Character);
            end;
            if v29() then
                table.insert(v70, l_Workspace_0.Terrain);
            end;
            v67.FilterType = Enum.RaycastFilterType.Blacklist;
            v67.FilterDescendantsInstances = v70;
        end;
        v67.IgnoreWater = v31[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreWater];
        v67.BruteForceAllSlow = true;
        local v71 = l_Workspace_0:Raycast(l_Position_0, l_Direction_0 * v10.RayLength, v67);
        if v33:IsMouseDown() and v51() then
            local v72 = if v71 then v71.Position else v35.Position;
            local l_magnitude_0 = (v72 - v42.CachePoint).magnitude;
            local l_CacheID_0 = v42.CacheID;
            do
                local l_l_CacheID_0_0 = l_CacheID_0;
                if v50() * v10.TerrainCacheUpdateThreshold < l_magnitude_0 or not l_l_CacheID_0_0 then
                    l_l_CacheID_0_0 = l_Workspace_0:CacheCurrentTerrain(v42.CacheID or "", v72, v50());
                    local l_v72_0 = v72 --[[ copy: 4 -> 9 ]];
                    v43(function(v77) --[[ Line: 190 ]]
                        -- upvalues: v1 (ref), l_l_CacheID_0_0 (ref), l_v72_0 (copy)
                        return v1.join(v77, {
                            CacheID = l_l_CacheID_0_0, 
                            CachePoint = l_v72_0
                        });
                    end);
                end;
                if v29() and not v31[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreParts] then
                    local v78 = l_Workspace_0:RaycastCachedTerrain(l_l_CacheID_0_0, l_Position_0, l_Direction_0 * v10.RayLength, true, v67);
                    if v71 and v78 then
                        if v78.Distance < v71.Distance then
                            v71 = v78;
                        end;
                    elseif v78 then
                        v71 = v78;
                    end;
                else
                    v71 = l_Workspace_0:RaycastCachedTerrain(l_l_CacheID_0_0, l_Position_0, l_Direction_0 * v10.RayLength, true, v67);
                end;
            end;
        end;
        if v71 then
            v71 = {
                Distance = (v71.Position - l_Position_0).Magnitude, 
                Instance = v71.Instance, 
                Material = v71.Material, 
                Normal = v71.Normal, 
                Position = v71.Position
            };
            if v46.current == l_RaycastType_0.Pending then
                v46.current = l_RaycastType_0.Active;
            end;
        elseif v46.current == "Active" then
            return {
                Distance = -1, 
                Instance = nil, 
                Material = Enum.Material.Air, 
                Normal = Vector3.yAxis, 
                Position = Vector3.zero
            };
        else
            local v79 = v13();
            local v80, v81 = v14(l_Position_0, l_Direction_0, Vector3.zero, Vector3.yAxis);
            if v80 and v81 and v81 >= 0 then
                v71 = {
                    Distance = (v80 - l_Position_0).Magnitude, 
                    Normal = v79, 
                    Position = v80
                };
            else
                local v82 = l_Position_0 + l_Direction_0 * v10.RayLength;
                v71 = {
                    Distance = (v82 - l_Position_0).Magnitude, 
                    Normal = v79, 
                    Position = v82
                };
            end;
            if v46.current == l_RaycastType_0.Pending then
                v46.current = l_RaycastType_0.Inactive;
            end;
        end;
        local v83 = v11(v31, if v33:IsMouseDown() then v39 else CFrame.lookAt(v71.Position, v71.Position + v13()), v34, v30);
        if v83 then
            v71 = v83;
        end;
        local v84 = v31[l_Category_0.BrushSettings][l_BrushSettings_0.Snapping];
        v38(table.clone(v71));
        if v84 ~= nil and v84 ~= l_Snapping_0.Off then
            local v85 = v15(v71.Position);
            if v31[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlane] then
                v85 = Vector3.new(v85.X, v31[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlanePosition], v85.Z);
            end;
            v71.Distance = (v85 - l_Position_0).Magnitude;
            v71.Position = v85;
        end;
        v47.current = v71.Position;
        return v71;
    end, {
        not v33:IsMouseDown() or v39, 
        v42, 
        v50, 
        v51, 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreParts], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreWater], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.Snapping], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlane], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlanePosition], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform], 
        v31[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock], 
        v30
    });
    v8(v34.Button1Down, function() --[[ Line: 325 ]]
        -- upvalues: v51 (copy), v43 (copy), l_Workspace_0 (ref), v35 (copy), v50 (copy), v46 (copy), l_RaycastType_0 (ref)
        if v51() then
            v43(function(v87) --[[ Line: 327 ]]
                -- upvalues: l_Workspace_0 (ref), v35 (ref), v50 (ref)
                if v87.CacheID then
                    return v87;
                else
                    return {
                        CacheID = l_Workspace_0:CacheCurrentTerrain("", v35.Position, v50()), 
                        CachePoint = v35.Position
                    };
                end;
            end);
            v46.current = l_RaycastType_0.Pending;
        end;
    end, {
        v35
    });
    v8(v34.Button1Up, function() --[[ Line: 341 ]]
        -- upvalues: v42 (copy), l_Workspace_0 (ref), v43 (copy), v46 (copy)
        if v42.CacheID then
            l_Workspace_0:ClearCachedTerrain(v42.CacheID);
        end;
        v43({
            CachePoint = Vector3.zero
        });
        v46.current = nil;
    end, {
        v42
    });
    v8(v33.MouseMoveAction, function() --[[ Line: 350 ]]
        -- upvalues: v44 (copy), v45 (copy)
        if v44 then
            v45(false);
        end;
    end, {
        v44
    });
    l_useEffect_0(function() --[[ Line: 355 ]]
        -- upvalues: l_RunService_0 (ref), v33 (copy), v64 (copy), v86 (copy), v44 (copy), v45 (copy)
        l_RunService_0:BindToRenderStep("TerrainRaycast", 1, function() --[[ Line: 356 ]]
            -- upvalues: v33 (ref), v64 (ref), v86 (ref), v44 (ref), v45 (ref)
            if not v33:isMouseMoveReserved() then
                v64(v86(v33:IsMouseDown()));
                return;
            else
                if not v44 then
                    v45(true);
                end;
                return;
            end;
        end);
        return function() --[[ Line: 364 ]]
            -- upvalues: l_RunService_0 (ref)
            l_RunService_0:UnbindFromRenderStep("TerrainRaycast");
        end;
    end, {
        v64
    });
    return v35, v37, v47.current;
end;