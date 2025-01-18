local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Biome_0 = require(l_script_FirstAncestor_0.Src.Types).Biome;
return function(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: FindBiomeTransitionValue ]]
    -- upvalues: l_Biome_0 (copy)
    if v2 == l_Biome_0.Arctic then
        return (v3 > 0.2 and 1 or 0) * v4;
    elseif v2 == l_Biome_0.Canyons then
        return (v3 > 0.7 and 1 or 0) * v4;
    elseif v2 == l_Biome_0.Mountains then
        local v6 = v3 ^ 3;
        return v5 * (1 - v6) + v4 * v6;
    else
        return v5 * (1 - v3) + v4 * v3;
    end;
end;