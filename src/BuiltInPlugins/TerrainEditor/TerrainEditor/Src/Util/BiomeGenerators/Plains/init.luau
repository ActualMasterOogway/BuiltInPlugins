local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: Plains ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v8, v9, _) --[[ Line: 11 ]]
        -- upvalues: v7 (copy), v4 (ref), v6 (copy), v2 (ref)
        local l_X_0 = v8.X;
        local l_Y_0 = v8.Y;
        local l_Z_0 = v8.Z;
        local l_WaterLevel_0 = v7.WaterLevel;
        local v15 = Vector3.new(l_X_0 + v4(v6(v8, 17, 40)) * 25, 0, l_Z_0 + v4(v6(v8, 19, 40)) * 25);
        local v16 = v2.RidgeFlipped(v4(v6(v15, 2, 200)));
        local v17 = v2.Threshold(v16, 0.01, 0);
        local v18 = v2.Threshold(v2.RidgeFlipped(v4(v6(Vector3.new(l_X_0, 0, l_Z_0), 101, 7))), 0.3, 0.7) * v2.Threshold(v4(v6(Vector3.new(l_X_0, 0, l_Z_0), 102, 50)), 0.6, 0.05);
        local v19 = 0.5 + v4(v6(v8, 2, 100)) * 0.02 + v16 * 0.05 + v18 * 0.05 + v17 * 0.005;
        local v20 = (1 - (l_Y_0 - 1) / (v7.MapHeight - 1)) * 0.5 + v19 * 0.5;
        local v21 = false;
        if 0.5 - v7.SurfaceThickness * 0.4 < v20 then
            v21 = v20 < 0.5 + v7.SurfaceThickness * 0.4;
        end;
        return v19, if v18 > 0 then Enum.Material.Rock else if v21 then if v21 and v17 <= 0 then Enum.Material.Water else if 1 - v9 < l_WaterLevel_0 - 0.01 then Enum.Material.Sand else Enum.Material.Grass else Enum.Material.Mud, v18 > 0 and Enum.Material.Rock or Enum.Material.Sandstone;
    end;
end;