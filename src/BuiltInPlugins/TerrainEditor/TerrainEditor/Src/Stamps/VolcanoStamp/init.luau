local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v7 = require(l_Generation_0.GetBlendingFactorMap);
local v8 = v1:new(l_TerrainType_0.Volcano);
v8.init = function(v9, v10, v11) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateNoiseMap = function(v12) --[[ Line: 21 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v13 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v14 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v15 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CraterDepth];
    local v16 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CraterRadius];
    if not v15 or not v16 then
        warn("Missing parameters!");
        return;
    else
        v12:generateHill({
            hillWidth = 0.2, 
            hillHeight = 1 + v16 * 0.5
        });
        if v13 > 0 and v14 > 0 then
            v12:addErosion();
        end;
        v12._fillBottomPositions = table.create(v12._mapSize, false);
        if v16 <= 0 then
            return;
        else
            local v17 = 0;
            for v18 = 1, v12._sliceX do
                for v19 = 1, v12._sliceZ do
                    local v20 = v12:getIndex(v18, v19);
                    if v12._noiseMap[v20] > 1 then
                        local l_magnitude_0 = (Vector3.new(v18 / v12._sliceX, 0, v19 / v12._sliceZ) - Vector3.new(0.5, 0, 0.5, 0)).magnitude;
                        if v17 < l_magnitude_0 then
                            v17 = l_magnitude_0;
                        end;
                    end;
                end;
            end;
            for v22 = 1, v12._sliceX do
                for v23 = 1, v12._sliceZ do
                    local l_magnitude_1 = (Vector3.new(v22 / v12._sliceX, 0, v23 / v12._sliceZ) - Vector3.new(0.5, 0, 0.5, 0)).magnitude;
                    if l_magnitude_1 < v17 then
                        local v25 = 1 - (1 - (1 - (v17 - l_magnitude_1) / v17) ^ 4) * v15 / 2;
                        local v26 = v12:getIndex(v22, v23);
                        local v27 = v12._noiseMap[v26];
                        if v27 > 1 or v25 < v27 then
                            v12._noiseMap[v26] = v25;
                            v12._fillBottomPositions[v26] = true;
                        else
                            v12._noiseMap[v26] = (v27 + v25) / 2;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v8.updateBlendingFactorMap = function(v28, v29) --[[ Line: 99 ]] --[[ Name: updateBlendingFactorMap ]]
    -- upvalues: v7 (copy)
    v28._blendingFactorMap = table.create(v28._mapSize, 0);
    if v29 > 0 then
        local v30 = {
            PreserveDistance = 1, 
            PreserveRatio = 0.2, 
            BlendingStrength = v29
        };
        v28._blendingFactorMap = v7(Vector2.new(v28._sliceX, v28._sliceZ), v30);
    end;
end;
return v8;