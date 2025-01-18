local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v1.VoxelResolution;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.AnalyticsHelper);
local v5 = require(l_Util_0.Operations.BaseOperation);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.ClampVoxelBoundaries);
local v8 = require(l_Util_0.ConvertForPivot);
local v9 = require(l_Util_0.getDraggedPositions);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v10.BrushShape;
local l_BrushSettings_0 = v10.BrushSettings;
local l_Category_0 = v10.Category;
local l_MaterialMode_0 = v10.MaterialMode;
local l_MaterialSettings_0 = v10.MaterialSettings;
local v16 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
return function(v17, v18) --[[ Line: 36 ]] --[[ Name: PaintOperation ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_BrushShape_0 (copy), v1 (copy), v8 (copy), v16 (copy), l_MaterialSettings_0 (copy), l_VoxelResolution_0 (copy), v9 (copy), l_MaterialMode_0 (copy), v7 (copy), v6 (copy), v4 (copy), v5 (copy)
    local function v28(v19, _) --[[ Line: 37 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), v1 (ref), v8 (ref)
        local v21 = v19.Payload[l_Category_0.BrushSettings];
        local v22 = v21[l_BrushSettings_0.BrushSize];
        local l_Height_0 = v22.Height;
        local l_Size_0 = v22.Size;
        local v25 = v21[l_BrushSettings_0.BrushShape];
        local v26 = v21[l_BrushSettings_0.State];
        local v27 = (if v25 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0) * v1.VoxelResolution;
        v19.State = {
            Position = v8(v21[l_BrushSettings_0.PivotPosition], v26.Position, v27)
        };
    end;
    local function v79(v29, v30) --[[ Line: 53 ]] --[[ Name: onStep ]]
        -- upvalues: v16 (ref), l_Category_0 (ref), l_BrushSettings_0 (ref), l_MaterialSettings_0 (ref), l_BrushShape_0 (ref), l_VoxelResolution_0 (ref), v8 (ref), v9 (ref), l_MaterialMode_0 (ref), v7 (ref), v18 (copy), v6 (ref), v4 (ref), v1 (ref)
        assert(v29.State, "Tried to step without starting first.");
        if v16.ProfileTools() then
            debug.profilebegin("Paint Operation");
        end;
        local l_State_0 = v29.State;
        local v32 = v29.Payload[l_Category_0.BrushSettings];
        local v33 = v32[l_BrushSettings_0.BrushSize];
        local l_Height_1 = v33.Height;
        local l_Size_1 = v33.Size;
        local v36 = v32[l_BrushSettings_0.BrushShape];
        local v37 = v32[l_BrushSettings_0.State];
        local v38 = v32[l_BrushSettings_0.IgnoreWater];
        local v39 = v29.Payload[l_Category_0.MaterialSettings];
        local v40 = v39[l_MaterialSettings_0.MaterialMode];
        local v41 = v39[l_MaterialSettings_0.SourceMaterial];
        local v42 = v39[l_MaterialSettings_0.TargetMaterial];
        if v37.Material == Enum.Material.Air then
            v30:skipBudget();
            return true, 0;
        else
            local v43 = (if v36 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1) * l_VoxelResolution_0;
            local v44 = l_Size_1 * l_VoxelResolution_0 * 0.5;
            local v45 = v8(v32[l_BrushSettings_0.PivotPosition], v37.Position, v43);
            local v46 = v9(l_State_0.Position, v45, v44);
            l_State_0.Position = v46[#v46];
            local v47 = v40 == l_MaterialMode_0.Paint;
            local v48 = v40 == l_MaterialMode_0.Replace;
            for _, v50 in v46 do
                if v50 == l_State_0.LastPosition then
                    v30:skipBudget();
                    if v16.ProfileTools() then
                        debug.profileend();
                    end;
                    return true, 0;
                else
                    l_State_0.LastPosition = v50;
                    local v51, v52 = v7(v50, v44, v43);
                    local v53 = Region3.new(v51, v52);
                    if v36 == l_BrushShape_0.Cube and v48 then
                        v18.Terrain:ReplaceMaterial(v53, l_VoxelResolution_0, v41, v42);
                    else
                        local v54 = (v52.X - v51.X) * 0.5;
                        local v55, v56 = v18.Terrain:ReadVoxels(v53, l_VoxelResolution_0);
                        v55.Size = nil;
                        v56.Size = nil;
                        local l_l_VoxelResolution_0_0 = l_VoxelResolution_0;
                        local v58 = v41 == Enum.Material.Air;
                        local v59 = false;
                        if v36 == l_BrushShape_0.Sphere then
                            v59 = l_Size_1 > 2;
                        end;
                        local v60 = v36 == l_BrushShape_0.Cylinder and l_Size_1 > 2 or v59;
                        local v61 = v51.X - l_l_VoxelResolution_0_0 * 0.5 - v50.X;
                        local v62 = v51.Y - l_l_VoxelResolution_0_0 * 0.5 - v50.Y;
                        local v63 = v51.Z - l_l_VoxelResolution_0_0 * 0.5 - v50.Z;
                        local v64 = nil;
                        local v65 = nil;
                        local v66 = os.clock();
                        for v67, v68 in v56 do
                            v64 = if v60 then (v67 * l_l_VoxelResolution_0_0 + v61) ^ 2 else nil;
                            local v69 = v55[v67];
                            for v70, v71 in v68 do
                                v65 = if v59 then v64 + (v70 * l_l_VoxelResolution_0_0 + v62) ^ 2 else nil;
                                local v72 = v69[v70];
                                for v73, v74 in v71 do
                                    local v75 = v72[v73];
                                    local v76 = 1;
                                    if v60 then
                                        local v77 = (v73 * l_l_VoxelResolution_0_0 + v63) ^ 2;
                                        local v78 = if v59 then math.sqrt(v65 + v77) else math.sqrt(v64 + v77);
                                        v76 = v6(v78, v54);
                                    end;
                                    if v76 > 0 and (not v38 or v75 ~= Enum.Material.Water) then
                                        if v47 then
                                            v71[v73] = v74;
                                            v72[v73] = v41;
                                        elseif v48 then
                                            v71[v73] = v58 and 1 or v74;
                                            v72[v73] = if v41 == v75 then v42 else v75;
                                        end;
                                    else
                                        v71[v73] = v74;
                                        v72[v73] = v75;
                                    end;
                                end;
                            end;
                        end;
                        v30:addTimeStatistic(v4.NormalizeBrushTimer(v66, l_Size_1, l_Height_1));
                        if v41 == Enum.Material.Water or v42 == Enum.Material.Water then
                            v18.Terrain:FillRegion(v53, v1.VoxelResolution, Enum.Material.Air);
                        end;
                        v18.Terrain:WriteVoxels(v53, v1.VoxelResolution, v55, v56);
                    end;
                end;
            end;
            if v16.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        end;
    end;
    return v5.new({
        Budget = 0.005, 
        OnFinish = function(_, _) --[[ Line: 187 ]] --[[ Name: onFinish ]]
            -- upvalues: v18 (copy)
            v18.ChangeHistoryService:SetWaypoint("Paint");
        end, 
        OnStart = v28, 
        OnStep = v79, 
        Name = v17
    });
end;