local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v7 = require(l_Generation_0.GetBlendingFactorMap);
local v8 = v1:new(l_TerrainType_0.Mountain);
v8.init = function(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateNoiseMap = function(v12) --[[ Line: 24 ]] --[[ Name: generateNoiseMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v13 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v14 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v15 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v16 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
    local v17 = {
        hillWidth = 0.2, 
        hillHeight = 0.85
    };
    local v18 = v13 > 0 and v14 > 0;
    v12:generateHill(v17, if v18 then {
        frequency = v13 * 0.05, 
        amplitude = v14 * 0.16 * 2, 
        offset = v15, 
        seed = v16
    } else nil);
    if v18 then
        v12:addErosion();
        v12:addMacroNoise();
    end;
end;
v8.updateBlendingFactorMap = function(v19, v20) --[[ Line: 55 ]] --[[ Name: updateBlendingFactorMap ]]
    -- upvalues: v7 (copy)
    v19._blendingFactorMap = table.create(v19._mapSize, 0);
    if v20 > 0 then
        local v21 = {
            PreserveDistance = 1, 
            PreserveRatio = 0.2, 
            BlendingStrength = v20
        };
        v19._blendingFactorMap = v7(Vector2.new(v19._sliceX, v19._sliceZ), v21);
    end;
end;
return v8;