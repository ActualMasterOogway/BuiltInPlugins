local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v8 = require(l_Generation_0.FractalNoise);
local v9 = require(l_Generation_0.Filter);
local v10 = v8(1, 1, 1);
local v11 = v1:new(l_TerrainType_0.Desert);
v11.init = function(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v12, v13, v14);
    return v12;
end;
v11.generateNoiseMap = function(v15) --[[ Line: 31 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_VoxelResolution_0 (copy), v10 (copy), v9 (copy)
    local v16 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v17 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v18 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    v15._noiseMap = table.create(v15._mapSize, 0);
    if v16 > 0 then
        local v19 = 50 / v16;
        for v20 = 1, v15._sliceX do
            for v21 = 1, v15._sliceZ do
                local v22 = v15:getIndex(v20, v21);
                local v23, v24 = v15._getRotatedPoint(v20 - 0.5, v21 - 0.5);
                local v25 = v23 * l_VoxelResolution_0 - v17.X;
                local v26 = v24 * l_VoxelResolution_0 - v17.Y;
                local v27 = v10(v25, v26, v18, v19) * 0.5 + 0.5;
                v27 = v9.Ridge(v27);
                v15._noiseMap[v22] = v27;
            end;
        end;
    end;
end;
v11.generateHeightMap = function(v28) --[[ Line: 56 ]] --[[ Name: generateHeightMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v29 = v28._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v30 = v28._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v31 = if v29 > 0 then v30 else 0;
    local v32 = v28._sliceY * (1 - v31);
    v28._heightMapFromNoise = table.create(v28._mapSize, 0);
    for v33 = 1, v28._mapSize do
        local v34 = v28._noiseMap[v33];
        local v35 = v32 + v28._sliceY * v31 * v34;
        v28._heightMapFromNoise[v33] = math.clamp(v35, 1, v28._sliceY);
    end;
end;
return v11;