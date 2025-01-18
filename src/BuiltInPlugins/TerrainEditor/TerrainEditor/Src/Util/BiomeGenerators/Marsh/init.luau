local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: Marsh ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v8, v9, _) --[[ Line: 11 ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (ref), v2 (ref)
        local l_X_0 = v8.X;
        local _ = v8.Y;
        local l_Z_0 = v8.Z;
        local v14 = Vector3.new(l_X_0, 0, l_Z_0);
        local l_WaterLevel_0 = v7.WaterLevel;
        local v16 = Vector3.new(l_X_0 + v6(v14, 5, 7) * 10 + v6(v14, 6, 30) * 50, 0, l_Z_0 + v6(v14, 9, 7) * 10 + v6(v14, 10, 30) * 50);
        local v17 = v4(v6(v16, 2, 70));
        local v18 = v2.Threshold(v17, 0.65, 0);
        local v19 = v4(v6(v8, 4, 100));
        local v20 = v4(v6(v8, 3, 20));
        return l_WaterLevel_0 - 0.04 + v17 * v18 * 0.025 + v19 * 0.035 + v20 * 0.025, if v18 >= 1 then Enum.Material.Grass else if 1 - v9 < l_WaterLevel_0 - 0.01 then Enum.Material.Mud else if 1 - v9 < l_WaterLevel_0 + 0.01 then Enum.Material.Ground else Enum.Material.Grass, Enum.Material.Slate;
    end;
end;