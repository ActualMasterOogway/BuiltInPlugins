local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v8 = require(l_Generation_0.GetBlendingFactorMap);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorLakeSnapping)();
local v10 = {
    BOTTOM_AMPLITUDE = 0.2, 
    BOTTOM_FREQUENCY = 0.125, 
    SHAPE_AMPLITUDE = 0.15, 
    SHAPE_FREQUENCY = 0.025, 
    SIDE_AMPLITUDE = 0.03, 
    SIDE_FREQUENCY = 0.25
};
local v11 = Vector2.new(0.5, 0.5);
local v12 = v9 and 25 or 5;
local v13 = {
    Ground = 0, 
    Bank = 1, 
    Bluff = 2, 
    Bottom = 3
};
local v14 = v1:new(l_TerrainType_0.Lake);
v14.init = function(v15, v16, v17) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v15, v16, v17);
    return v15;
end;
v14.getLakeHeight = function(v18, v19, v20, v21, v22) --[[ Line: 63 ]] --[[ Name: getLakeHeight ]]
    -- upvalues: v11 (copy), l_VoxelResolution_0 (copy), v10 (copy), v13 (copy)
    local l_width_0 = v21.width;
    local l_bankSize_0 = v21.bankSize;
    local l_slopeTangent_0 = v21.slopeTangent;
    local l_amplitude_0 = v22.amplitude;
    local l_frequency_0 = v22.frequency;
    local l_offset_0 = v22.offset;
    local v29 = v22.seed or 12345;
    local v30 = v29 * 1.5 + 17;
    local l_magnitude_0 = (Vector2.new(v19 / v18._sliceX, v20 / v18._sliceZ) - v11).magnitude;
    l_width_0 = math.min(l_width_0, 0.45);
    local v32, v33 = v18._getRotatedPoint(v19 - 0.5, v20 - 0.5);
    local v34 = v32 * l_VoxelResolution_0 - l_offset_0.X;
    local v35 = v33 * l_VoxelResolution_0 - l_offset_0.Y;
    local v36 = l_magnitude_0 + math.clamp(math.noise(l_frequency_0 * v10.SHAPE_FREQUENCY * v34, l_frequency_0 * v10.SHAPE_FREQUENCY * v35, v29), -1, 1) * l_amplitude_0 * v10.SHAPE_AMPLITUDE;
    local l_Ground_0 = v13.Ground;
    if v36 > 0.5 then
        return 0, l_Ground_0;
    else
        local v38 = -l_slopeTangent_0 * (v36 - l_width_0);
        local v39 = l_bankSize_0 * l_slopeTangent_0 * l_width_0;
        if v39 < v38 then
            local v40 = -(v39 / l_slopeTangent_0) + l_width_0;
            v38 = -math.max(l_slopeTangent_0, (v39 - 1) / 4 / (l_width_0 - 0.5 - v40)) * 4 * (v36 - v40) + v39;
            if v38 > 1 then
                v38 = 1 - math.noise(l_frequency_0 * v10.BOTTOM_FREQUENCY * v34, l_frequency_0 * v10.BOTTOM_FREQUENCY * v35, v30) * l_amplitude_0 * v10.BOTTOM_AMPLITUDE;
                l_Ground_0 = v13.Bottom;
            else
                v38 = v38 + math.noise(l_frequency_0 * v10.SIDE_FREQUENCY * v34, l_frequency_0 * v10.SIDE_FREQUENCY * v35, v30) * l_amplitude_0 * v10.SIDE_AMPLITUDE;
                l_Ground_0 = v13.Bluff;
            end;
        else
            l_Ground_0 = v13.Bank;
        end;
        return v38, l_Ground_0;
    end;
end;
v14.generateNoiseMap = function(v41) --[[ Line: 142 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v13 (copy)
    local v42 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v43 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v44 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v45 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    local v46 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.BankSize];
    v41._noiseMap = table.create(v41._mapSize, 0);
    v41._fillBottomPositions = table.create(v41._mapSize, false);
    v41._lakeAreaPositions = table.create(v41._mapSize, 0);
    v41._noiseMap = table.create(v41._mapSize, 0);
    local v47 = math.tan(22 * math.sqrt(math.min(v41._region.Size.X, v41._region.Size.Z) / v41._region.Size.Y) * 3.141592653589793 / 180);
    for v48 = 1, v41._sliceX do
        for v49 = 1, v41._sliceZ do
            local v50 = v41:getIndex(v48, v49);
            if v48 == 1 or v48 == v41._sliceX or v49 == 1 or v49 == v41._sliceZ then
                v41._noiseMap[v50] = 0;
            else
                local l__noiseMap_0 = v41._noiseMap;
                local l__lakeAreaPositions_0 = v41._lakeAreaPositions;
                local v53, v54 = v41:getLakeHeight(v48, v49, {
                    bankSize = v46, 
                    slopeTangent = v47, 
                    width = 0.45
                }, {
                    frequency = v42, 
                    amplitude = v43, 
                    offset = v44, 
                    seed = v45
                });
                l__noiseMap_0[v50] = v53;
                l__lakeAreaPositions_0[v50] = v54;
                v41._fillBottomPositions[v50] = v41._lakeAreaPositions[v50] ~= v13.Ground;
            end;
        end;
    end;
end;
v14.generateHeightMap = function(v55) --[[ Line: 189 ]] --[[ Name: generateHeightMap ]]
    -- upvalues: v9 (copy), v12 (copy), v13 (copy)
    v55._heightMapFromNoise = table.create(v55._mapSize, 0);
    v55._heightMapDisabled = if v9 then table.create(v55._mapSize, false) else nil;
    local v56 = math.abs(v55._medianHeightCache - v55._meanHeightCache) < v12 and v55._sliceY - v55._medianHeightCache < v12;
    for v57 = 1, v55._mapSize do
        if v55._lakeAreaPositions[v57] ~= v13.Ground then
            local v58 = (if v56 then v55._heightmapCache[v57] else v55._sliceY) * (1 - math.clamp(v55._noiseMap[v57], 0, 1));
            if v9 then
                v55._heightMapFromNoise[v57] = math.max(v58, 0);
                v55._heightMapDisabled[v57] = v56 and v55._heightmapCache[v57] <= 0;
            else
                v55._heightMapFromNoise[v57] = math.max(v58, 1);
            end;
        end;
    end;
end;
v14.updateBlendingFactorMap = function(v59, v60) --[[ Line: 212 ]] --[[ Name: updateBlendingFactorMap ]]
    -- upvalues: v8 (copy)
    v59._blendingFactorMap = table.create(v59._mapSize, 0);
    if v60 > 0 then
        local v61 = {
            PreserveDistance = 0, 
            PreserveRatio = 0.2, 
            BlendingStrength = v60
        };
        v59._blendingFactorMap = v8(Vector2.new(v59._sliceX, v59._sliceZ), v61);
    end;
end;
v14.blendHeightMap = function(v62) --[[ Line: 224 ]] --[[ Name: blendHeightMap ]]
    -- upvalues: v13 (copy), v9 (copy)
    v62._heightMap = table.clone(v62._heightMapFromNoise);
    v62._minWaterPoint = v62._sliceY;
    v62._maxWaterPoint = v62._sliceY;
    for v63 = 1, v62._mapSize do
        local v64 = v62._heightMapFromNoise[v63];
        local v65 = v62._heightmapCache[v63];
        if v62._addBlending and v62._lakeAreaPositions[v63] == v13.Bank then
            local v66 = v62._blendingFactorMap[v63];
            v62._heightMap[v63] = (1 - v66) * v64 + v66 * v65;
        end;
        if not v9 or not v62._heightMapDisabled[v63] then
            if v62._lakeAreaPositions[v63] == v13.Bank then
                v62._maxWaterPoint = math.min(v62._maxWaterPoint, v62._heightMap[v63]);
            elseif v62._lakeAreaPositions[v63] ~= v13.Ground then
                v62._minWaterPoint = math.min(v62._minWaterPoint, v62._heightMap[v63]);
            end;
        end;
    end;
end;
if v9 then
    v14.postProcessing = function(v67) --[[ Line: 252 ]] --[[ Name: postProcessing ]]
        -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v13 (copy)
        v67._waterMap = table.create(v67._sliceX);
        for v68 = 1, v67._sliceX do
            v67._waterMap[v68] = table.create(v67._sliceY);
            for v69 = 1, v67._sliceY do
                v67._waterMap[v68][v69] = table.clone(v67._waterCache[v68][v69]);
            end;
        end;
        local v70 = v67._payload[l_Category_0.BuildSettings][l_BuildSettings_0.WaterLevel];
        if v70 and v70 > 0 then
            local v71 = math.floor(v67._minWaterPoint * (1 - v70) + v67._maxWaterPoint * v70);
            if v71 < 1 then
                return;
            else
                for v72 = 1, v67._sliceX do
                    for v73 = 1, v67._sliceZ do
                        local v74 = v67:getIndex(v72, v73);
                        if v67._lakeAreaPositions[v74] ~= v13.Ground and v67._lakeAreaPositions[v74] ~= v13.Bank and not v67._heightMapDisabled[v74] then
                            for v75 = math.max(math.ceil(v67._heightMap[v74]), 1), v71 do
                                v67._waterMap[v72][v75][v73] = 1;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
else
    v14.postProcessing = function(v76) --[[ Line: 287 ]] --[[ Name: postProcessing ]]
        -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v13 (copy)
        v76._waterMap = table.create(v76._sliceX);
        for v77 = 1, v76._sliceX do
            v76._waterMap[v77] = table.create(v76._sliceY);
            for v78 = 1, v76._sliceY do
                v76._waterMap[v77][v78] = table.clone(v76._waterCache[v77][v78]);
            end;
        end;
        local v79 = v76._payload[l_Category_0.BuildSettings][l_BuildSettings_0.WaterLevel];
        if v79 and v79 > 0 then
            local v80 = math.floor(v76._minWaterPoint * (1 - v79) + v76._maxWaterPoint * v79);
            if v80 < 1 then
                return;
            else
                for v81 = 1, v76._sliceX do
                    for v82 = 1, v76._sliceZ do
                        local v83 = v76:getIndex(v81, v82);
                        if v76._lakeAreaPositions[v83] ~= v13.Ground and v76._lakeAreaPositions[v83] ~= v13.Bank then
                            for v84 = math.ceil(v76._heightMap[v83]), v80 do
                                v76._waterMap[v81][v84][v82] = 1;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v14.generateHeightMapCacheTopDown = function(v85) --[[ Line: 322 ]] --[[ Name: generateHeightMapCacheTopDown ]]
    v85:_getHeightMapCacheTopDown();
end;
v14.generateHeightMapCacheBottomUp = function(_) --[[ Line: 326 ]] --[[ Name: generateHeightMapCacheBottomUp ]]

end;
v14.generateStamp = function(v87, v88) --[[ Line: 330 ]] --[[ Name: generateStamp ]]
    -- upvalues: v9 (copy), v1 (copy)
    if v88 then
        if v9 then
            v88.heightMap = v88.heightMap or v88.heightMapSnappingUpdate;
        end;
        v88.noiseMap = v88.heightMap or v88.noiseMap;
    end;
    v1.generateStamp(v87, v88);
end;
return v14;