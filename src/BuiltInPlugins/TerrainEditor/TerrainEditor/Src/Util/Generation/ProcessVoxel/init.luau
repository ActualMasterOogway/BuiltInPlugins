local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.BiomeGenerators);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Generation.FindBiomeTransitionValue);
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v4 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.NoisySeed);
local _ = require(l_Generation_0.Perlin);
local v7 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v9, v10, v11) --[[ Line: 14 ]] --[[ Name: ProcessVoxel ]]
    -- upvalues: v1 (copy), v7 (copy), v2 (copy), v4 (copy)
    local v12 = v1(v9, v10, v11);
    return function(v13, v14, v15) --[[ Line: 21 ]]
        -- upvalues: v11 (copy), v7 (ref), v9 (copy), v12 (copy), v2 (ref), v4 (ref)
        local l_Y_0 = v13.Y;
        local l_X_0 = v14.X;
        local l_Y_1 = v14.Y;
        local l_Z_0 = v14.Z;
        local l_Biomes_0 = v11.Biomes;
        local l_DefaultBiomeFill_0 = v11.DefaultBiomeFill;
        local l_DefaultBiomeSurface_0 = v11.DefaultBiomeSurface;
        local l_DefaultBiomeValue_0 = v11.DefaultBiomeValue;
        local l_HasCaves_0 = v11.HasCaves;
        local l_MapHeight_0 = v11.MapHeight;
        local l_SurfaceThickness_0 = v11.SurfaceThickness;
        local l_WaterLevel_0 = v11.WaterLevel;
        local v28 = Vector3.new(l_X_0, l_Y_0, l_Z_0);
        local v29 = 1 - (l_Y_0 - 1) / (l_Y_1 - 1);
        local v30 = v29 * 0.9 + 0.1 * v7(v9(v28, 107, 15));
        local v31 = 0;
        local l_CrackedLava_0 = Enum.Material.CrackedLava;
        local l_Rock_0 = Enum.Material.Rock;
        if v29 > 0.65 or v29 < 0.1 then
            v31 = 0.5;
        elseif #l_Biomes_0 == 1 then
            local v34 = v12[l_Biomes_0[1]];
            if v34 then
                local v35, v36, v37 = v34(v28, v30);
                v31 = v35;
                l_CrackedLava_0 = v36;
                l_Rock_0 = v37;
            else
                v31 = l_DefaultBiomeValue_0;
                l_CrackedLava_0 = l_DefaultBiomeSurface_0;
                l_Rock_0 = l_DefaultBiomeFill_0;
            end;
        else
            local v38 = 0;
            for v39, v40 in v15.WeightPoints do
                local v41 = v12[v39];
                if v41 then
                    local v42, v43, v44 = v41(v28, v30);
                    v40.BiomeValue = v42;
                    v40.BiomeSurface = v43;
                    v40.BiomeFill = v44;
                else
                    v40.BiomeValue = l_DefaultBiomeValue_0;
                    v40.BiomeSurface = l_DefaultBiomeSurface_0;
                    v40.BiomeFill = l_DefaultBiomeFill_0;
                end;
                v38 = v38 + v40.BiomeValue * v40.Weight;
            end;
            for v45, v46 in v15.WeightPoints do
                local v47 = v2(v45, v46.Weight, v46.BiomeValue, v38);
                if v31 < v47 then
                    v31 = v47;
                    l_CrackedLava_0 = v46.BiomeSurface;
                    l_Rock_0 = v46.BiomeFill;
                end;
            end;
        end;
        local v48 = v29 * 0.5 + v31 * 0.5;
        local v49 = false;
        if 0.5 - l_SurfaceThickness_0 < v48 then
            v49 = v48 < 0.5 + l_SurfaceThickness_0;
        end;
        local v50 = 0;
        local v51 = v15.HasCaves or v29 > 0.65;
        local v52 = not (v49 and 1 - v29 < l_WaterLevel_0 + 0.005);
        local v53 = not (v49 and 1 - v29 > l_WaterLevel_0 + 0.58);
        if l_HasCaves_0 and v51 and v52 and v53 then
            local v54 = v4.Ridge(v7(v9(v28, 4, 30)));
            local v55 = v4.Threshold(v54, 0.84, 0.01);
            local v56 = v4.Ridge(v7(v9(v28, 5, 30)));
            local v57 = v4.Threshold(v56, 0.84, 0.01);
            local v58 = v4.Ridge(v7(v9(v28, 6, 30)));
            local v59 = v4.Threshold(v58, 0.84, 0.01);
            local v60 = not v49 and 0 or v4.Threshold(v7(v9(v28 * Vector3.new(1, 0, 1, 0), 143, 62)), 0.35, 0);
            v50 = math.clamp(v55 * v57 * v59 - v60, 0, 1);
        end;
        local v61 = v48 - v50;
        local v62 = v4.Threshold(v61, 0.5, l_MapHeight_0);
        local v63 = 1 - v29 < l_WaterLevel_0;
        local v64 = v48 <= 0.5;
        local v65 = v62 <= 0;
        if v63 and v64 and v65 then
            v62 = 1;
            l_CrackedLava_0 = Enum.Material.Water;
            l_Rock_0 = Enum.Material.Water;
            v49 = true;
        end;
        local v66 = l_Y_0 == 1 and 1 or v62;
        local v67 = if l_Y_0 == 1 then Enum.Material.CrackedLava else if v62 <= 0 then Enum.Material.Air else if v49 then l_CrackedLava_0 else l_Rock_0;
        return v67, v66, v49 and (v66 <= 0 or v67 == Enum.Material.Air);
    end;
end;