local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Src.Schemas.Region);
local v8 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v9 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v10 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v11 = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
local v12 = require(l_script_FirstAncestor_0.Src.Util.getVoxelAlignedRegion);
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v14 = require(l_Hooks_0.useHistory);
local v15 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v16 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v16.BuildSettings;
local l_Category_0 = v16.Category;
local l_OperationSource_0 = v16.OperationSource;
local l_SeaLevelSettings_0 = v16.SeaLevelSettings;
local l_SelectionSettings_0 = v16.SelectionSettings;
local l_Tool_0 = v16.Tool;
local l_TransformMode_0 = v16.TransformMode;
local l_TransformSettings_0 = v16.TransformSettings;
local v25 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local l_StudioService_0 = game:GetService("StudioService");
local v28 = {
    [l_Tool_0.Build] = if v26() then l_Category_0.BuildSettings else nil, 
    [l_Tool_0.Transform] = l_Category_0.TransformSettings, 
    [l_Tool_0.Select] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Generate] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Fill] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Import] = l_Category_0.SelectionSettings, 
    [l_Tool_0.SeaLevel] = l_Category_0.SeaLevelSettings, 
    [l_Tool_0.Mock] = l_Category_0.SelectionSettings
};
local v29 = {
    [l_Tool_0.Build] = if v26() then l_BuildSettings_0 else nil, 
    [l_Tool_0.Transform] = l_TransformSettings_0, 
    [l_Tool_0.Select] = l_SelectionSettings_0, 
    [l_Tool_0.Generate] = l_SelectionSettings_0, 
    [l_Tool_0.Fill] = l_SelectionSettings_0, 
    [l_Tool_0.Import] = l_SelectionSettings_0, 
    [l_Tool_0.SeaLevel] = l_SeaLevelSettings_0, 
    [l_Tool_0.Mock] = l_SelectionSettings_0
};
return function(v30, v31, v32, v33) --[[ Line: 71 ]] --[[ Name: useRegion ]]
    -- upvalues: v25 (copy), l_useState_0 (copy), v28 (copy), v29 (copy), l_useMemo_0 (copy), v7 (copy), l_useCallback_0 (copy), l_Tool_0 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), v14 (copy), l_OperationSource_0 (copy), l_StudioService_0 (copy), v8 (copy), l_script_FirstAncestor_0 (copy), v26 (copy), v11 (copy), v15 (copy), v9 (copy), v10 (copy), l_useEffect_0 (copy), v12 (copy)
    local v34 = v25:use();
    local v35, v36 = l_useState_0({
        Size = v31[v28[v30]][v29[v30].Size], 
        Transform = v31[v28[v30]][v29[v30].Transform]
    });
    local v37, v38 = l_useState_0((Vector3.new(1, 1, 1, 0)));
    local v39 = l_useMemo_0(function() --[[ Line: 80 ]]
        -- upvalues: v7 (ref), v35 (copy)
        return v7.Selection.new(v35.Transform, v35.Size);
    end, {
        v30
    });
    local v40, v41 = l_useState_0(nil);
    local v48 = l_useCallback_0(function(v42, v43) --[[ Line: 86 ]]
        -- upvalues: v28 (ref), v30 (copy), v29 (ref), v32 (copy), v36 (copy), l_Tool_0 (ref), v31 (copy), l_Category_0 (ref), l_SelectionSettings_0 (ref), l_TransformSettings_0 (ref), l_TransformMode_0 (ref), v38 (copy)
        local v44 = {
            [v28[v30]] = {
                [v29[v30].OperationSource] = v43, 
                [v29[v30].Size] = v42.Size, 
                [v29[v30].Transform] = v42.Transform
            }
        };
        v32(v44);
        v36(v42);
        if v30 == l_Tool_0.Transform then
            local v45 = v31[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            local v46 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
            if v46 == l_TransformMode_0.Paste then
                v45 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize];
            elseif v46 == l_TransformMode_0.Import or v46 == l_TransformMode_0.Duplicate then
                v45 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize];
            elseif v46 == l_TransformMode_0.Move then
                v45 = v31[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            end;
            local l_Size_0 = v42.Size;
            v38(l_Size_0 / v45);
            return;
        else
            if v30 == l_Tool_0.Select then
                v38(Vector3.one);
            end;
            return;
        end;
    end, {
        v32, 
        v30, 
        v31
    });
    local v50 = v14(v35, function(v49) --[[ Line: 115 ]]
        -- upvalues: v48 (copy), l_OperationSource_0 (ref), v39 (copy)
        v48(v49, l_OperationSource_0.History);
        v39:SetRegionSignal(v49);
    end, {
        v30
    });
    local v52 = l_useCallback_0(function(v51) --[[ Line: 121 ]]
        -- upvalues: v50 (copy), v35 (copy)
        v50(v51, v35);
    end, {
        v50, 
        v35
    });
    local v56 = l_useCallback_0(function(_, v54) --[[ Line: 125 ]]
        -- upvalues: v31 (copy), v28 (ref), v30 (copy), v29 (ref), l_StudioService_0 (ref)
        if v31[v28[v30]][v29[v30].SnapToVoxels] then
            local v55 = math.round(l_StudioService_0.GridSize / 4) * 4;
            if v55 <= 0 then
                v55 = 4;
            end;
            if math.abs(v55 - 0.01) < 0.001 then
                return v54;
            else
                return math.round(v54 / v55) * v55;
            end;
        else
            return v54;
        end;
    end, {
        v31[v28[v30]][v29[v30].SnapToVoxels]
    });
    local v60 = l_useCallback_0(function(v57, v58) --[[ Line: 142 ]]
        -- upvalues: v39 (copy), v48 (copy), l_OperationSource_0 (ref)
        local v59 = {
            Size = v58, 
            Transform = v57
        };
        v39:SetRegion(v59);
        v48(v59, l_OperationSource_0.Gizmo);
    end, {
        v48
    });
    local v62 = l_useCallback_0(function(v61) --[[ Line: 152 ]]
        -- upvalues: v39 (copy), v48 (copy), l_OperationSource_0 (ref)
        v39:SetRegion(v61);
        v48(v61, l_OperationSource_0.Gizmo);
    end, {
        v48
    });
    local v65 = l_useMemo_0(function() --[[ Line: 157 ]]
        -- upvalues: v34 (copy), v8 (ref), l_script_FirstAncestor_0 (ref), v39 (copy), v56 (copy), v40 (copy), v60 (copy), v62 (copy), v26 (ref), v30 (copy), l_Tool_0 (ref), v52 (copy), v11 (ref), v7 (ref), v15 (ref), v9 (ref), v33 (copy), v10 (ref)
        local v63 = if v34:isMocking() then {
            Mock = true
        } else v8.new(l_script_FirstAncestor_0.Parent, game, settings(), v39);
        v63.snapToGridSize = v56;
        v63.snapToVoxels = v40;
        v63.endSelectionOnDrag = function() --[[ Line: 172 ]]
            -- upvalues: v63 (copy)
            v63.selectionOnDragPoint = nil;
        end;
        v63.updateRegion = v60;
        v63.updateSelectionOnDrag = v62;
        v63.addWaypoint = if not v26() or v30 ~= l_Tool_0.Build then v52 else function() --[[ Line: 185 ]]

        end;
        v63.shouldExtendSelection = function() --[[ Line: 188 ]]
            return true;
        end;
        local v64 = {
            v11.new(v63, {
                ShowBoundingBox = false, 
                Summonable = false
            }, if v26() and v30 == l_Tool_0.Build then v7.ExtrudeHandlesImplementation.new(v63, {
                Max = Vector3.one * v15.MaxBuildRegion, 
                UseVolume = true
            }) else if not (v30 ~= l_Tool_0.Import) or v30 == l_Tool_0.Generate then v7.ExtrudeHandlesImplementation.new(v63, {
                Max = Vector3.new(256 * v15.VoxelResolution, 4096 * v15.VoxelResolution, 4096 * v15.VoxelResolution), 
                UseVolume = true
            }) else v7.ExtrudeHandlesImplementation.new(v63)), 
            v9.new(v63, {
                ShowBoundingBox = false, 
                Summonable = false, 
                Outset = 1
            }, v7.TransformHandlesImplementation.new(v63))
        };
        if v33 then
            table.insert(v64, v10.new(v63, {
                ShowBoundingBox = false, 
                Summonable = false, 
                Outset = 1
            }, v7.TransformHandlesImplementation.new(v63)));
        end;
        return {
            Mouse = l_script_FirstAncestor_0.Parent:GetMouse(), 
            DraggerContext = v63, 
            DraggerSchema = v7, 
            DraggerSettings = {
                AnalyticsName = "TerrainEditorRegion", 
                AllowDragSelect = v30 ~= l_Tool_0.Build, 
                AllowFreeformDrag = false, 
                ShowDragSelect = false, 
                ShowLocalSpaceIndicator = true, 
                ShowPivotIndicator = true, 
                HandlesList = v64
            }
        };
    end, {
        v30
    });
    l_useEffect_0(function() --[[ Line: 255 ]]
        -- upvalues: v65 (copy), v26 (ref), v30 (copy), l_Tool_0 (ref), v52 (copy), v60 (copy), v62 (copy)
        v65.DraggerContext.addWaypoint = if not v26() or v30 ~= l_Tool_0.Build then v52 else function() --[[ Line: 259 ]]

        end;
        v65.DraggerContext.updateRegion = v60;
        v65.DraggerContext.updateSelectionOnDrag = v62;
    end, {
        v35, 
        v48, 
        v50
    });
    l_useEffect_0(function() --[[ Line: 264 ]]
        -- upvalues: v65 (copy), v56 (copy)
        v65.DraggerContext.snapToGridSize = v56;
    end, {
        v56
    });
    l_useEffect_0(function() --[[ Line: 269 ]]
        -- upvalues: v31 (copy), v28 (ref), v30 (copy), v29 (ref), v35 (copy), v39 (copy), v48 (copy), l_OperationSource_0 (ref)
        local v66 = {
            Size = v31[v28[v30]][v29[v30].Size], 
            Transform = v31[v28[v30]][v29[v30].Transform]
        };
        if v66.Size ~= v35.Size or v66.Transform ~= v35.Transform then
            v39:SetRegionSignal(v66);
            v48(v66, l_OperationSource_0.Gizmo);
        end;
    end, {
        v30, 
        v31[v28[v30]][v29[v30].Size], 
        v31[v28[v30]][v29[v30].Transform]
    });
    l_useEffect_0(function() --[[ Line: 285 ]]
        -- upvalues: v31 (copy), v28 (ref), v30 (copy), v29 (ref), v40 (copy), v35 (copy), l_StudioService_0 (ref), v12 (ref), v39 (copy), v48 (copy), l_OperationSource_0 (ref), v41 (copy), v65 (copy)
        local v67 = {
            Size = v31[v28[v30]][v29[v30].Size], 
            Transform = v31[v28[v30]][v29[v30].Transform]
        };
        if v31[v28[v30]][v29[v30].SnapToVoxels] and (v31[v28[v30]][v29[v30].SnapToVoxels] ~= v40 or v67.Size ~= v35.Size or v67.Transform ~= v35.Transform) then
            local v68 = math.floor(l_StudioService_0.GridSize / 4 + 0.5) * 4;
            if v68 <= 0 then
                v68 = 4;
            end;
            local v69, v70 = v12(v31[v28[v30]][v29[v30].Transform], v31[v28[v30]][v29[v30].Size], v68);
            local v71 = {
                Size = v70, 
                Transform = v69
            };
            if v71.Size ~= v67.Size or v71.Transform ~= v67.Transform then
                v39:SetRegionSignal(v71);
                v48(v71, l_OperationSource_0.Gizmo);
            end;
        end;
        v41(v31[v28[v30]][v29[v30].SnapToVoxels]);
        v65.DraggerContext.SnapToVoxels = v31[v28[v30]][v29[v30].SnapToVoxels];
    end, {
        v31[v28[v30]][v29[v30].SnapToVoxels], 
        v31[v28[v30]][v29[v30].Size], 
        v31[v28[v30]][v29[v30].Transform], 
        v65
    });
    l_useEffect_0(function() --[[ Line: 329 ]]
        -- upvalues: v30 (copy), l_Tool_0 (ref), v31 (copy), l_Category_0 (ref), l_SelectionSettings_0 (ref), l_TransformSettings_0 (ref), l_TransformMode_0 (ref), v38 (copy)
        if v30 == l_Tool_0.Transform then
            local v72 = v31[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            local v73 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
            if v73 == l_TransformMode_0.Paste then
                v72 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize];
            elseif v73 == l_TransformMode_0.Import or v73 == l_TransformMode_0.Duplicate then
                v72 = v31[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize];
            elseif v73 == l_TransformMode_0.Move then
                v72 = v31[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            end;
            v38(v31[l_Category_0.TransformSettings][l_TransformSettings_0.Size] / v72);
            return;
        else
            if v30 == l_Tool_0.Select then
                v38(Vector3.one);
            end;
            return;
        end;
    end, {
        v30
    });
    return v65, v35, v37;
end;