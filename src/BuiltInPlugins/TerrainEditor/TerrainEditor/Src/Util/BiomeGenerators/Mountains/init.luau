local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local v3 = require(l_Generation_0.Fractalize);
local _ = require(l_Generation_0.Perlin);
local v5 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v7, v8) --[[ Line: 11 ]] --[[ Name: Mountains ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy)
    local function v11(v9, v10) --[[ Line: 12 ]] --[[ Name: operation ]]
        -- upvalues: v2 (ref), v5 (ref), v7 (copy)
        return v2.Ridge(v5(v7(v9, 100 + v10, 1 / v10 * 160)));
    end;
    return function(v12, v13, _) --[[ Line: 16 ]]
        -- upvalues: v8 (copy), v5 (ref), v7 (copy), v2 (ref), v3 (ref), v11 (copy)
        local l_X_0 = v12.X;
        local l_Y_0 = v12.Y;
        local l_Z_0 = v12.Z;
        local l_WaterLevel_0 = v8.WaterLevel;
        local v19 = Vector3.new(l_X_0 + v5(v7(v12, 17, 20)) * 20, 0, l_Z_0 + v5(v7(v12, 19, 20)) * 20);
        local v20 = v2.RidgeFlipped(v5(v7(v19, 2, 200)));
        return -0.4 + v3(v11, Vector3.new(l_X_0, l_Y_0 / 20, l_Z_0), {
            Samples = 8, 
            Scale = 0.65
        }) * 1.2 + v20 * 0.2, if v13 < 0.275 then Enum.Material.Snow else if v13 < 0.35 then Enum.Material.Rock else if v13 < 0.4 then Enum.Material.Ground else if 1 - v13 < l_WaterLevel_0 then Enum.Material.Rock else if 1 - v13 < l_WaterLevel_0 + 0.01 then Enum.Material.Mud else if 1 - v13 < l_WaterLevel_0 + 0.015 then Enum.Material.Ground else Enum.Material.Grass, Enum.Material.Rock;
    end;
end;