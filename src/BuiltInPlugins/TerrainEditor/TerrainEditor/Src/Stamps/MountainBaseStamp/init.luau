local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local v7 = Vector2.new(0.5, 0.5);
local v8 = v1:new(l_TerrainType_0.None);
v8.init = function(v9, v10, v11) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateHill = function(v12, v13, v14) --[[ Line: 35 ]] --[[ Name: generateHill ]]
    v12._hillOption = v13;
    local v15 = if v14 then v14.frequency > 0 and v14.amplitude > 0 else false;
    v12._noiseMap = table.create(v12._mapSize, 0);
    v12._hillMacroNoiseMap = if v15 then table.create(v12._mapSize, 0) else nil;
    for v16 = 1, v12._sliceX do
        for v17 = 1, v12._sliceZ do
            local v18 = v12:getGaussianHillHeight(v16, v17);
            local v19 = v12:getIndex(v16, v17);
            v12._noiseMap[v19] = v18;
            if v14 then
                local v20 = v12:getGaussianHillHeight(v16, v17, v14);
                v12._hillMacroNoiseMap[v19] = v20 - v18;
            end;
        end;
    end;
end;
v8.getGaussianHillHeight = function(v21, v22, v23, v24) --[[ Line: 57 ]] --[[ Name: getGaussianHillHeight ]]
    -- upvalues: v7 (copy), l_VoxelResolution_0 (copy)
    local v25 = v21._hillOption.centerPosPercent or v7;
    local l_hillHeight_0 = v21._hillOption.hillHeight;
    local l_hillWidth_0 = v21._hillOption.hillWidth;
    local l_magnitude_0 = (Vector2.new(v22 / v21._sliceX, v23 / v21._sliceZ) - v25).magnitude;
    local v29 = 0;
    if v24 then
        local l_frequency_0 = v24.frequency;
        local l_amplitude_0 = v24.amplitude;
        local l_offset_0 = v24.offset;
        local v33 = v24.seed or 12345;
        local v34, v35 = v21._getRotatedPoint(v22 - 0.5, v23 - 0.5);
        local v36 = v34 * l_VoxelResolution_0 - l_offset_0.X;
        local v37 = v35 * l_VoxelResolution_0 - l_offset_0.Y;
        v29 = l_amplitude_0 * math.noise(l_frequency_0 * v36, l_frequency_0 * v37, v33);
    end;
    local v38 = l_magnitude_0 + v29;
    return l_hillHeight_0 * math.exp(-(v38 * v38) / (2 * l_hillWidth_0 * l_hillWidth_0));
end;
v8.getHeightGradient = function(v39, v40, v41, v42) --[[ Line: 85 ]] --[[ Name: getHeightGradient ]]
    -- upvalues: l_VoxelResolution_0 (copy)
    local v43 = 0;
    local v44 = 0;
    local v45 = 0;
    if v42 then
        local v46 = math.clamp(v40 - 1, 1, v39._sliceX);
        local v47 = math.clamp(v41 - 1, 1, v39._sliceZ);
        v43 = v42[v39:getIndex(v40, v41)];
        v44 = v42[v39:getIndex(v46, v41)];
        v45 = v42[v39:getIndex(v40, v47)];
    else
        v43 = v39:getGaussianHillHeight(v40, v41);
        v44 = v39:getGaussianHillHeight(v40 - 1, v41);
        v45 = v39:getGaussianHillHeight(v40, v41 - 1);
    end;
    return (v43 - v44) / l_VoxelResolution_0, (v43 - v45) / l_VoxelResolution_0;
end;
v8.addErosion = function(v48) --[[ Line: 106 ]] --[[ Name: addErosion ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_VoxelResolution_0 (copy)
    local v49 = v48._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v50 = v48._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v51 = v48._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v52 = v48._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    local v53 = {
        0.003, 
        0.008, 
        0.016, 
        0.04
    };
    local v54 = {
        0.1, 
        0.05, 
        0.02, 
        0.0125
    };
    local v55 = v49 * 10;
    local l_Noise_0 = Instance.new("Noise");
    l_Noise_0.NoiseType = Enum.NoiseType.SimplexGabor;
    l_Noise_0.Seed = v52;
    local v57 = table.create(#v48._noiseMap, 0);
    for v58 = 1, 4 do
        for v59 = 1, #v57 do
            v57[v59] = v48._noiseMap[v59];
        end;
        for v60 = 1, v48._sliceX do
            for v61 = 1, v48._sliceZ do
                local v62, v63 = v48._getRotatedPoint(v60 - 0.5, v61 - 0.5);
                local v64 = Vector3.new(v62 * l_VoxelResolution_0 - v51.X, 0, v63 * l_VoxelResolution_0 - v51.Y) * v53[v58] * v55;
                local v65 = 0;
                local v66 = 0;
                if v58 == 1 then
                    local v67, v68 = v48:getHeightGradient(v62, v63);
                    v65 = v67;
                    v66 = v68;
                else
                    local v69, v70 = v48:getHeightGradient(v60, v61, v57);
                    v65 = v69;
                    v66 = v70;
                end;
                local v71 = l_Noise_0:SampleDirectional(v64, Vector3.new(-v66, 0, v65) * 2000) * (v54[v58] * v50);
                local v72 = v48:getIndex(v60, v61);
                local l__noiseMap_0 = v48._noiseMap;
                l__noiseMap_0[v72] = l__noiseMap_0[v72] + v71;
            end;
        end;
    end;
end;
v8.addMacroNoise = function(v74) --[[ Line: 154 ]] --[[ Name: addMacroNoise ]]
    if not v74._hillMacroNoiseMap then
        return;
    else
        for v75 = 1, #v74._noiseMap do
            local l__noiseMap_1 = v74._noiseMap;
            l__noiseMap_1[v75] = l__noiseMap_1[v75] + v74._hillMacroNoiseMap[v75];
        end;
        return;
    end;
end;
v8.generateHeightMap = function(v77) --[[ Line: 164 ]] --[[ Name: generateHeightMap ]]
    v77._heightMapFromNoise = table.create(v77._mapSize, 0);
    for v78 = 1, v77._mapSize do
        local v79 = math.clamp(v77._noiseMap[v78], -1, 1);
        local v80 = v77._sliceY * v79;
        v77._heightMapFromNoise[v78] = math.clamp(v80, 0, v77._sliceY);
    end;
end;
return v8;