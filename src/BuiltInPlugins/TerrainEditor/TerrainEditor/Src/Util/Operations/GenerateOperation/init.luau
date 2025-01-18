local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.ComputeMasterSeed);
local v3 = require(l_Generation_0.NoisySeed);
local v4 = require(l_Generation_0.Perlin);
local v5 = require(l_Generation_0.ProcessVoxel);
local v6 = require(l_Generation_0.ProcessPerlin);
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v7.VoxelResolution;
local l_RegionNormalization_0 = v7.RegionNormalization;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.AnalyticsHelper);
local v12 = require(l_Util_0.Operations.BaseOperation);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_Biome_0 = v13.Biome;
local l_BiomeSettings_0 = v13.BiomeSettings;
local l_Category_0 = v13.Category;
local l_SelectionSettings_0 = v13.SelectionSettings;
return function(v18, v19, v20) --[[ Line: 63 ]] --[[ Name: GenerateOperation ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_BiomeSettings_0 (copy), v4 (copy), v3 (copy), l_SelectionSettings_0 (copy), l_VoxelResolution_0 (copy), v5 (copy), v6 (copy), l_Biome_0 (copy), l_RegionNormalization_0 (copy), v11 (copy), v12 (copy)
    local v21 = 0;
    local v22 = 0;
    local function v51(v23, _) --[[ Line: 66 ]] --[[ Name: onStart ]]
        -- upvalues: v2 (ref), l_Category_0 (ref), l_BiomeSettings_0 (ref), v4 (ref), v3 (ref), l_SelectionSettings_0 (ref), l_VoxelResolution_0 (ref), v5 (ref)
        local v25 = v2((tostring(v23.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Seed])));
        local v26 = v4(v25);
        local v27 = v3(v25);
        local l_Position_0 = v23.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform].Position;
        local v29 = v23.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        local v30 = v29 / 2;
        local v31 = Region3.new(l_Position_0 - v30, l_Position_0 + v30):ExpandToGrid(l_VoxelResolution_0);
        l_Position_0 = v31.CFrame.Position;
        local v32 = v31.Size / l_VoxelResolution_0;
        local v33 = v32 / 2;
        local v34 = l_Position_0 / l_VoxelResolution_0;
        local v35 = (-v33 + Vector3.new(-1, 0, 0, 0)) * l_VoxelResolution_0 + l_Position_0;
        local v36 = v33 * Vector3.new(-1, 1, 1, 0) * l_VoxelResolution_0 + l_Position_0;
        local v37 = Region3.new(v35, v36):ExpandToGrid(l_VoxelResolution_0);
        local v38 = v37.Size.Y / l_VoxelResolution_0;
        local v39 = v37.Size.Z / l_VoxelResolution_0;
        local v40 = math.floor(65536 / v38);
        local v41 = {
            table.create(v38)
        };
        local v42 = {
            table.create(v38)
        };
        for v43 = 1, v38 do
            local v44 = if v39 < v40 then v39 else v40;
            v41[1][v43] = table.create(v44, 0);
            v42[1][v43] = table.create(v44, Enum.Material.Air);
        end;
        local v45 = table.create(9);
        for v46 = 1, 9 do
            v45[v46] = {
                DistSquared = 0, 
                BiomeNoise = 0
            };
        end;
        local v47 = v23.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.BiomeBlending];
        local v48 = {};
        for v49, v50 in v23.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Biomes] do
            if v50 then
                table.insert(v48, v49);
            end;
        end;
        v23.State = {
            Biomes = v48, 
            BiomePoints = v45, 
            BiomeBlending = v47, 
            BiomeBlendingInverse = 1 - v47, 
            BiomeSize = v23.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.BiomeSize], 
            GetPerlin = v26, 
            GetNoise = v27, 
            MaterialMap = v42, 
            MaxWidth = v40, 
            OccupancyMap = v41, 
            Position = l_Position_0, 
            PreviousColumnHeights = {}, 
            ProcessVoxel = v5(v26, v27, {
                Biomes = v48, 
                DefaultBiomeFill = Enum.Material.Rock, 
                DefaultBiomeSurface = Enum.Material.Grass, 
                DefaultBiomeValue = 0.5, 
                HasCaves = v23.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Caves], 
                MapHeight = 0.5 / (v29.Y / l_VoxelResolution_0), 
                SurfaceThickness = 0.018, 
                WaterLevel = 0.48
            }), 
            SliceY = v38, 
            SliceZ = v39, 
            StartTime = os.clock(), 
            VoxelCorner = v34 - v32 / 2, 
            VoxelExtents = v33, 
            VoxelSize = v32, 
            X = 1
        };
    end;
    local function v118(v52, _) --[[ Line: 148 ]] --[[ Name: onStep ]]
        -- upvalues: l_VoxelResolution_0 (ref), v20 (copy), v6 (ref), l_Biome_0 (ref), v21 (ref), v22 (ref)
        local l_State_0 = v52.State;
        local l_Biomes_0 = l_State_0.Biomes;
        local l_BiomePoints_0 = l_State_0.BiomePoints;
        local l_BiomeSize_0 = l_State_0.BiomeSize;
        local l_BiomeBlending_0 = l_State_0.BiomeBlending;
        local l_BiomeBlendingInverse_0 = l_State_0.BiomeBlendingInverse;
        local l_GetPerlin_0 = l_State_0.GetPerlin;
        local l_GetNoise_0 = l_State_0.GetNoise;
        local l_MaterialMap_0 = l_State_0.MaterialMap;
        local l_MaxWidth_0 = l_State_0.MaxWidth;
        local l_OccupancyMap_0 = l_State_0.OccupancyMap;
        local l_Position_1 = l_State_0.Position;
        local l_PreviousColumnHeights_0 = l_State_0.PreviousColumnHeights;
        local l_ProcessVoxel_0 = l_State_0.ProcessVoxel;
        local l_SliceY_0 = l_State_0.SliceY;
        local l_SliceZ_0 = l_State_0.SliceZ;
        local l_VoxelCorner_0 = l_State_0.VoxelCorner;
        local l_VoxelExtents_0 = l_State_0.VoxelExtents;
        local l_VoxelSize_0 = l_State_0.VoxelSize;
        local l_X_0 = l_State_0.X;
        local v74 = l_X_0 - l_VoxelExtents_0.X;
        local l_l_SliceZ_0_0 = l_SliceZ_0;
        local v76 = -l_VoxelExtents_0.Z;
        local v77 = {};
        while l_l_SliceZ_0_0 > 0 do
            local v78 = if l_l_SliceZ_0_0 < l_MaxWidth_0 then l_l_SliceZ_0_0 else l_MaxWidth_0;
            local v79 = Vector3.new(v74 - 1, -l_VoxelExtents_0.Y, v76) * l_VoxelResolution_0 + l_Position_1;
            local v80 = Vector3.new(v74, l_VoxelExtents_0.Y, v76 + v78) * l_VoxelResolution_0 + l_Position_1;
            table.insert(v77, Region3.new(v79, v80):ExpandToGrid(l_VoxelResolution_0));
            l_l_SliceZ_0_0 = l_l_SliceZ_0_0 - l_MaxWidth_0;
            v76 = v76 + l_MaxWidth_0;
        end;
        if #v77 == 0 then
            return false, 1;
        else
            local v81 = 1;
            for v82 = 1, l_SliceZ_0 do
                local v83 = math.floor((v82 - 1) / l_MaxWidth_0) + 1;
                if v83 ~= v81 then
                    v20.Terrain:WriteVoxels(v77[v81], l_VoxelResolution_0, l_MaterialMap_0, l_OccupancyMap_0);
                    if v83 == #v77 then
                        local v84 = v77[v83].Size.Z / l_VoxelResolution_0;
                        l_OccupancyMap_0 = {
                            table.create(l_SliceY_0)
                        };
                        l_MaterialMap_0 = {
                            table.create(l_SliceY_0)
                        };
                        for v85 = 1, l_SliceY_0 do
                            l_OccupancyMap_0[1][v85] = table.create(v84, 0);
                            l_MaterialMap_0[1][v85] = table.create(v84, Enum.Material.Air);
                        end;
                    end;
                    v81 = v83;
                end;
                local v86 = v82 - (v81 - 1) * l_MaxWidth_0;
                local v87 = l_VoxelCorner_0 * Vector3.new(1, 0, 1, 0) + Vector3.new(l_X_0 - 1, 0, 0) + Vector3.new(0, 0, v82 - 1);
                local v88 = v87.X / l_BiomeSize_0 + v6(l_GetPerlin_0(v87, 233, l_BiomeSize_0 * 0.3)) * 0.25 + v6(l_GetPerlin_0(v87, 235, l_BiomeSize_0 * 0.05)) * 0.075;
                local v89 = v87.Z / l_BiomeSize_0 + v6(l_GetPerlin_0(v87, 234, l_BiomeSize_0 * 0.3)) * 0.25 + v6(l_GetPerlin_0(v87, 236, l_BiomeSize_0 * 0.05)) * 0.075;
                local v90 = 10000000;
                local v91 = false;
                local v92 = 0;
                for v93 = -1, 1 do
                    for v94 = -1, 1 do
                        local v95 = math.floor(v88 + v93 + 0.5);
                        local v96 = math.floor(v89 + v94 + 0.5);
                        local v97 = v95 + (l_GetNoise_0((Vector3.new(v95, v96, 53))) - 0.5) * 0.75;
                        local v98 = v96 + (l_GetNoise_0((Vector3.new(v95, v96, 73))) - 0.5) * 0.75;
                        local v99 = (v97 - v88) ^ 2 + (v98 - v89) ^ 2;
                        if v99 < v90 then
                            v90 = v99;
                        end;
                        local v100 = l_BiomePoints_0[v93 + 1 + 3 * (v94 + 1) + 1];
                        v100.DistSquared = v99;
                        v100.BiomeNoise = l_GetNoise_0((Vector3.new(v95, v96, 0)));
                    end;
                end;
                local v101 = table.create(#l_Biomes_0);
                for _, v103 in l_BiomePoints_0 do
                    local v104 = v103.DistSquared == v90 and 1 or (math.sqrt(v90) / math.sqrt(v103.DistSquared) - l_BiomeBlendingInverse_0) / l_BiomeBlending_0;
                    if v104 > 0 then
                        v104 = v104 ^ 2.1;
                        v92 = v92 + v104;
                        local v105 = l_Biomes_0[math.ceil(#l_Biomes_0 * (1 - v103.BiomeNoise))];
                        local v106 = v101[v105] or {
                            Weight = 0
                        };
                        v106.Weight = v106.Weight + v104;
                        v101[v105] = v106;
                    end;
                end;
                for v107, v108 in pairs(v101) do
                    v108.Weight = v108.Weight / v92;
                    if v107 == l_Biome_0.Arctic then
                        v91 = true;
                    end;
                end;
                local v109 = l_PreviousColumnHeights_0[v82] or l_SliceY_0;
                local v110 = false;
                local v111 = 0;
                for v112 = 1, l_SliceY_0 do
                    if not v110 then
                        local v113 = Vector3.new(v87.X, l_SliceY_0, v87.Z);
                        local v114, v115, v116 = l_ProcessVoxel_0(Vector3.new(l_X_0, v112, v82), v113, {
                            WeightPoints = v101, 
                            HasCaves = not v91
                        });
                        v21 = v21 + 1;
                        l_MaterialMap_0[1][v112][v86] = v114;
                        l_OccupancyMap_0[1][v112][v86] = v115;
                        v111 = v112;
                        v110 = v116;
                    end;
                    if v110 then
                        v22 = v22 + 1;
                        l_OccupancyMap_0[1][v112][v86] = 0;
                        l_MaterialMap_0[1][v112][v86] = Enum.Material.Air;
                        if v109 < v112 then
                            break;
                        end;
                    end;
                end;
                l_PreviousColumnHeights_0[v82] = v111;
            end;
            v20.Terrain.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.Generate;
            v20.Terrain:WriteVoxels(v77[v81], l_VoxelResolution_0, l_MaterialMap_0, l_OccupancyMap_0);
            local l_State_1 = v52.State;
            l_State_1.X = l_State_1.X + 1;
            l_State_1 = l_X_0 / l_VoxelSize_0.x;
            return l_State_1 < 1, l_State_1;
        end;
    end;
    local function v122(v119, v120) --[[ Line: 331 ]] --[[ Name: onFinish ]]
        -- upvalues: l_Category_0 (ref), l_SelectionSettings_0 (ref), l_RegionNormalization_0 (ref), v11 (ref), v20 (copy)
        local v121 = v119.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        if v121.X >= l_RegionNormalization_0 and v121.Y >= l_RegionNormalization_0 and v121.Z >= l_RegionNormalization_0 then
            v120:addTimeStatistic(v11.NormalizeRegionTimer(v119.State.StartTime, v121));
        end;
        v20.ChangeHistoryService:SetWaypoint("GenerateAction");
    end;
    return v12.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v19, 
        Name = v18, 
        OnFinish = v122, 
        OnStart = v51, 
        OnStep = v118
    });
end;