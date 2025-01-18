local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v7 = require(l_Generation_0.SmoothMinMax);
local v8 = v1:new(l_TerrainType_0.Crater);
v8.init = function(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateNoiseMap = function(v12) --[[ Line: 22 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v7 (copy)
    local v13 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v14 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v15 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.FillBottom];
    local v16 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.RimHeight];
    v12:generateHill({
        center2d = Vector2.new(0.5, 0.5), 
        hillWidth = 0.2, 
        hillHeight = 1.7
    });
    v12._fillBottomPositions = table.create(v12._mapSize, false);
    local v17 = 1 - ((1 - v16) * 0.25 + 0.5);
    local v18 = 1 - v15;
    for v19 = 1, v12._mapSize do
        local v20 = v12._noiseMap[v19];
        if v17 < v7.Max(v20, v17, 0.1) then
            local v21 = 1 - (1 - math.clamp(if v18 > 0 then (v20 - v17) / v18 else 0, 0, 1)) ^ 4;
            v12._noiseMap[v19] = v17 - v21 * v18;
            v12._fillBottomPositions[v19] = true;
        end;
    end;
    if v13 > 0 and v14 > 0 then
        v12:addErosion();
    end;
end;
v8.blendHeightMap = function(v22) --[[ Line: 62 ]] --[[ Name: blendHeightMap ]]
    v22._heightMap = table.clone(v22._heightMapFromNoise);
    if not v22._addBlending then
        return;
    else
        local l__sliceY_0 = v22._sliceY;
        for v24 = 1, v22._mapSize do
            local v25 = v22._heightMapFromNoise[v24];
            local v26 = v22._heightmapCache[v24];
            local v27 = v22._blendingFactorMap[v24];
            v22._heightMap[v24] = (1 - v27) * v25 + v27 * v26;
            if v22._rimPositions[v24] then
                l__sliceY_0 = math.min(v22._heightMap[v24], l__sliceY_0);
            end;
        end;
        for v28 = 1, v22._mapSize do
            if v22._fillBottomPositions[v28] then
                v22._heightMap[v28] = math.min(v22._heightMap[v28], l__sliceY_0);
            end;
        end;
        return;
    end;
end;
v8.generateHeightMap = function(v29) --[[ Line: 90 ]] --[[ Name: generateHeightMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v30 = v29._payload[l_Category_0.BuildSettings][l_BuildSettings_0.RimHeight] or 0;
    local v31 = (1 + v30) * 0.25;
    local v32 = (1 - v30) * 0.25 + 0.5;
    local v33 = math.abs(v29._medianHeightCache - v29._meanHeightCache) < 5 and v29._sliceY - v29._medianHeightCache < 5;
    v29._heightMapFromNoise = table.create(v29._mapSize, 0);
    v29._rimPositions = table.create(v29._mapSize, false);
    for v34 = 1, v29._mapSize do
        local v35 = math.clamp(v29._noiseMap[v34], -1, v31);
        v29._rimPositions[v34] = v31 <= v35;
        local v36 = (if v33 then v29._heightmapCache[v34] else v29._sliceY) * (v32 + v35);
        v29._heightMapFromNoise[v34] = math.clamp(v36, 1, v29._sliceY);
    end;
end;
v8.generateHeightMapCacheTopDown = function(v37) --[[ Line: 109 ]] --[[ Name: generateHeightMapCacheTopDown ]]
    v37:_getHeightMapCacheTopDown();
end;
v8.generateHeightMapCacheBottomUp = function(_) --[[ Line: 113 ]] --[[ Name: generateHeightMapCacheBottomUp ]]

end;
return v8;