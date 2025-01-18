local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: Hills ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v8, v9, _) --[[ Line: 11 ]]
        -- upvalues: v7 (copy), v4 (ref), v6 (copy), v2 (ref)
        local _ = v8.X;
        local _ = v8.Y;
        local l_Z_0 = v8.Z;
        local l_WaterLevel_0 = v7.WaterLevel;
        local v15 = Vector3.new(v4(v6(v8, 17, 20)) * 20, 0, l_Z_0 + v4(v6(v8, 19, 20)) * 20);
        local v16 = v2.RidgeFlipped(v4(v6(v15, 2, 200))) ^ 0.5;
        local v17 = v4(v6(v8, 3, 60));
        local v18 = 0.48 + v17 * 0.05 + (0.05 + v17 * 0.1 + v4(v6(v8, 4, 25)) * 0.125) * v16;
        local v19 = (1 - v9) * 0.9 + v16 * 0.1;
        return v18, if v19 < l_WaterLevel_0 - 0.015 then Enum.Material.Mud else if v19 < l_WaterLevel_0 then Enum.Material.Ground else Enum.Material.Grass, Enum.Material.Slate;
    end;
end;