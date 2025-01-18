local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v8 = require(l_Generation_0.FractalNoise)(3, 2, 0.35);
local v9 = v1:new(l_TerrainType_0.Plain);
v9.init = function(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v10, v11, v12);
    return v10;
end;
v9.generateNoiseMap = function(v13) --[[ Line: 30 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_VoxelResolution_0 (copy), v8 (copy)
    local v14 = v13._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v15 = v13._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v16 = v13._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    v13._noiseMap = table.create(v13._mapSize, 0);
    if v14 > 0 then
        local v17 = 50 / v14;
        for v18 = 1, v13._sliceX do
            for v19 = 1, v13._sliceZ do
                local v20 = v13:getIndex(v18, v19);
                local v21, v22 = v13._getRotatedPoint(v18 - 0.5, v19 - 0.5);
                local v23 = v21 * l_VoxelResolution_0 - v15.X;
                local v24 = v22 * l_VoxelResolution_0 - v15.Y;
                local v25 = v8(v23, v24, v16, v17);
                v13._noiseMap[v20] = v25;
            end;
        end;
    end;
end;
return v9;