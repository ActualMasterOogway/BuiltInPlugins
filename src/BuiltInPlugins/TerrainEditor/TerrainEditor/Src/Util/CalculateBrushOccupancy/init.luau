local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: CalculateBrushOccupancy ]]
    -- upvalues: l_VoxelResolution_0 (copy)
    return (math.clamp((v3 - v2) / l_VoxelResolution_0, 0, 1));
end;