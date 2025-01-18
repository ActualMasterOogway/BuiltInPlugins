local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.Operations.BaseOperation);
local v5 = require(l_Util_0.CalculateBrushOccupancy);
local v6 = require(l_Util_0.CalculateMagnitudePercent);
local v7 = require(l_Util_0.ClampVoxelBoundaries);
local v8 = require(l_Util_0.ConvertForPivot);
local v9 = require(l_Util_0.DebugFlags);
local v10 = require(l_Util_0.getDraggedPositions);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v11.BrushShape;
local l_BrushSettings_0 = v11.BrushSettings;
local l_Category_0 = v11.Category;
local l_FlattenMode_0 = v11.FlattenMode;
local l_FlattenPlane_0 = v11.FlattenPlane;
local l_VoxelResolution_0 = v1.VoxelResolution;
return function(v18, v19) --[[ Line: 38 ]] --[[ Name: FlattenOperation ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_BrushShape_0 (copy), v1 (copy), l_FlattenPlane_0 (copy), v8 (copy), v9 (copy), l_FlattenMode_0 (copy), v10 (copy), v7 (copy), l_VoxelResolution_0 (copy), v6 (copy), v5 (copy), v3 (copy), v4 (copy)
    local function v32(v20, _) --[[ Line: 39 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), v1 (ref), l_FlattenPlane_0 (ref), v8 (ref)
        local v22 = v20.Payload[l_Category_0.BrushSettings];
        local v23 = v22[l_BrushSettings_0.BrushSize];
        local l_Height_0 = v23.Height;
        local l_Size_0 = v23.Size;
        local v26 = v22[l_BrushSettings_0.BrushShape];
        local v27 = v22[l_BrushSettings_0.FixedYPlane];
        local v28 = v22[l_BrushSettings_0.FlattenPlane];
        local v29 = v22[l_BrushSettings_0.State];
        local v30 = (if v26 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0) * v1.VoxelResolution;
        local v31 = if v28 == l_FlattenPlane_0.Auto then v8(v22[l_BrushSettings_0.PivotPosition], v29.Position, v30) else Vector3.new(0, v27, 0);
        v20.State = {
            Plane = Vector3.yAxis, 
            PlanePosition = v31, 
            Position = v31
        };
    end;
    local function v99(v33, v34) --[[ Line: 62 ]] --[[ Name: onStep ]]
        -- upvalues: v9 (ref), l_Category_0 (ref), l_BrushSettings_0 (ref), l_FlattenMode_0 (ref), l_BrushShape_0 (ref), v1 (ref), v8 (ref), v10 (ref), v7 (ref), v19 (copy), l_VoxelResolution_0 (ref), v6 (ref), v5 (ref), v3 (ref)
        assert(v33.State, "Tried to step without starting first.");
        if v9.ProfileTools() then
            debug.profilebegin("Flatten");
        end;
        local l_State_0 = v33.State;
        local v36 = v33.Payload[l_Category_0.BrushSettings];
        local v37 = v36[l_BrushSettings_0.BrushSize];
        local l_Height_1 = v37.Height;
        local l_Size_1 = v37.Size;
        local v40 = v36[l_BrushSettings_0.BrushShape];
        local v41 = v36[l_BrushSettings_0.FlattenMode];
        local v42 = v36[l_BrushSettings_0.IgnoreWater];
        local v43 = v36[l_BrushSettings_0.Strength];
        local v44 = v36[l_BrushSettings_0.State];
        local v45 = true;
        if v41 ~= l_FlattenMode_0.Grow then
            v45 = v41 == l_FlattenMode_0.Both;
        end;
        local v46 = true;
        if v41 ~= l_FlattenMode_0.Erode then
            v46 = v41 == l_FlattenMode_0.Both;
        end;
        local v47 = (if v40 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1) * v1.VoxelResolution;
        local v48 = l_Size_1 * v1.VoxelResolution * 0.5;
        local l_PlanePosition_0 = l_State_0.PlanePosition;
        local v50 = v8(v36[l_BrushSettings_0.PivotPosition], v44.Position, v47);
        local v51 = v10(l_State_0.Position, v50, v48);
        l_State_0.Position = v51[#v51];
        local v52, v53 = v7(v50, v48, v47);
        for _, v55 in v51 do
            local v56 = Region3.new(v52, v53);
            local v57 = (v53.X - v52.X) * 0.5;
            local v58, v59 = v19.Terrain:ReadVoxels(v56, v1.VoxelResolution);
            v59.Size = nil;
            v58.Size = nil;
            local v60, v61 = v19.Terrain:ReadVoxels(v56, v1.VoxelResolution);
            local v62 = #v58;
            local v63 = #v58[1];
            local v64 = #v58[1][1];
            local v65 = math.clamp(math.floor((l_PlanePosition_0.Y - v52.Y) / v1.VoxelResolution) + 1, 1, v63);
            local v66 = math.floor((math.floor(l_PlanePosition_0.Y / v1.VoxelResolution) - l_PlanePosition_0.Y / v1.VoxelResolution) * 256) / 256;
            local v67 = false;
            if v40 == l_BrushShape_0.Sphere then
                v67 = l_Size_1 > 2;
            end;
            local v68 = v40 == l_BrushShape_0.Cylinder and l_Size_1 > 2 or v67;
            local v69 = v52.X - l_VoxelResolution_0 * 0.5 - v55.X;
            local v70 = v52.Y - l_VoxelResolution_0 * 0.5 - v55.Y;
            local v71 = v52.Z - l_VoxelResolution_0 * 0.5 - v55.Z;
            local v72 = nil;
            local v73 = nil;
            local v74 = nil;
            local v75 = os.clock();
            for v76 = 1, v62 do
                if v68 then
                    v72 = (v76 * v1.VoxelResolution + v69) ^ 2;
                end;
                local v77 = v59[v76];
                local v78 = v58[v76];
                local v79 = v61[v76];
                local v80 = v60[v76];
                for v81 = 1, v64 do
                    local v82 = 1;
                    if v68 then
                        v73 = (v81 * v1.VoxelResolution + v71) ^ 2;
                        v74 = math.sqrt(v72 + v73);
                        v82 = v6(v74, v57);
                    end;
                    local v83 = math.max(v82 * v43 * 0.25 * (math.log(l_Size_1) / 8), v1.MinimumOccupancy);
                    local v84 = math.max(v82 * v43 * 0.25 * (math.log(l_Size_1) / 8), v1.MinimumOccupancy);
                    local v85 = false;
                    if v45 then
                        for v86 = 1, v65 do
                            local v87 = v77[v86][v81];
                            local v88 = v78[v86][v81];
                            local v89 = 1;
                            if v68 then
                                local v90 = if v67 then math.sqrt(v72 + v73 + (v86 * v1.VoxelResolution + v70) ^ 2) else v74;
                                v89 = v5(v90, v57);
                            end;
                            if v89 > 0 and (v87 ~= 0 or v85) then
                                v85 = true;
                                if v87 ~= 1 then
                                    local v91 = v87 + v83;
                                    if v91 > 1 then
                                        v83 = v91 - 1;
                                        v91 = 1;
                                    else
                                        v83 = 0;
                                    end;
                                    if v86 == v65 and v66 < v91 then
                                        v91 = v66;
                                    end;
                                    if v87 == 0 and v86 > 1 then
                                        v88 = v58[v76][v86 - 1][v81];
                                    end;
                                    if (not v42 or v88 ~= Enum.Material.Water) and v88 and v87 ~= v91 then
                                        v79[v86][v81] = v91;
                                        v80[v86][v81] = v88;
                                        if v83 == 0 then
                                            break;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v92 = false;
                    if v46 then
                        for v93 = v63, v65, -1 do
                            local v94 = v77[v93][v81];
                            local v95 = v78[v93][v81];
                            local v96 = 1;
                            if v68 then
                                local v97 = if v67 then math.sqrt(v72 + v73 + (v93 * v1.VoxelResolution + v70) ^ 2) else v74;
                                v96 = v5(v97, v57);
                            end;
                            if v96 > 0 and (v94 ~= 1 or v92) then
                                v92 = true;
                                if v94 ~= 0 then
                                    local v98 = v94 - v84;
                                    if v98 < 0 then
                                        v84 = -v98;
                                        v98 = 0;
                                    else
                                        v84 = 0;
                                    end;
                                    if v93 == v65 and v98 < v66 then
                                        v98 = v66;
                                    end;
                                    if v98 == 0 then
                                        v95 = Enum.Material.Air;
                                    end;
                                    if not v42 or v95 ~= Enum.Material.Water then
                                        v79[v93][v81] = v98;
                                        v80[v93][v81] = v95;
                                        if v84 == 0 then
                                            break;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v34:addTimeStatistic(v3.NormalizeBrushTimer(v75, l_Size_1, l_Height_1));
            v19.Terrain:WriteVoxels(v56, v1.VoxelResolution, v60, v61);
        end;
        if v9.ProfileTools() then
            debug.profileend();
        end;
        return true, 0;
    end;
    return v4.new({
        Budget = 5.0E-4, 
        Name = v18, 
        OnFinish = function() --[[ Line: 293 ]] --[[ Name: onFinish ]]
            -- upvalues: v19 (copy)
            v19.ChangeHistoryService:SetWaypoint("Flatten");
        end, 
        OnStart = v32, 
        OnStep = v99
    });
end;