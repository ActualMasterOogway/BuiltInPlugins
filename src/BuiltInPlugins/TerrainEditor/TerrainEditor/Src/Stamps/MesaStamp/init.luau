local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v7 = require(l_Generation_0.GetBlendingFactorMap);
local v8 = v1:new(l_TerrainType_0.Mesa);
v8.init = function(v9, v10, v11) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateNoiseMap = function(v12) --[[ Line: 21 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v13 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v14 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v15 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v16 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    local v17 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CliffSlope];
    local v18 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.TopRadius];
    local v19 = 1 - v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.TalusHeight];
    local v20 = {
        center2d = Vector2.new(0.5, 0.5), 
        hillWidth = 0.2, 
        hillHeight = 1 + v18 * 1.2
    };
    local v21 = v13 > 0 and v14 > 0;
    v12:generateHill(v20, if v21 then {
        frequency = v13 * 0.05, 
        amplitude = v14 * 0.16 * 3, 
        offset = v15, 
        seed = v16
    } else nil);
    if v21 then
        v12:addErosion();
        v12:addMacroNoise();
    end;
    local v22 = math.clamp(math.tan(v17 * 3.141592653589793 / 180), 0.001, 1000);
    local v23 = 1 - v19 * (1 - math.max(1 - v22, 0));
    local v24 = (v23 - 1) / v22 + 1;
    for v25 = 1, v12._mapSize do
        if v12._noiseMap[v25] < 1 then
            local v26 = v22 * (v12._noiseMap[v25] - 1) + 1;
            if v23 <= v26 then
                v12._noiseMap[v25] = v26;
            else
                local v27 = v23 / v24 * v12._noiseMap[v25];
                v12._noiseMap[v25] = v27;
            end;
        end;
    end;
end;
v8.addMacroNoise = function(v28) --[[ Line: 79 ]] --[[ Name: addMacroNoise ]]
    for v29 = 1, #v28._noiseMap do
        local l__noiseMap_0 = v28._noiseMap;
        l__noiseMap_0[v29] = l__noiseMap_0[v29] + v28._hillMacroNoiseMap[v29] * v28._noiseMap[v29];
    end;
end;
v8.updateBlendingFactorMap = function(v31, v32) --[[ Line: 85 ]] --[[ Name: updateBlendingFactorMap ]]
    -- upvalues: v7 (copy)
    v31._blendingFactorMap = table.create(v31._mapSize, 0);
    if v32 > 0 then
        local v33 = {
            PreserveDistance = 1.15, 
            PreserveRatio = 0.5, 
            BlendingStrength = v32
        };
        v31._blendingFactorMap = v7(Vector2.new(v31._sliceX, v31._sliceZ), v33);
    end;
end;
return v8;