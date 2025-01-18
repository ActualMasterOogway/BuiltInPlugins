local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
return function(v2) --[[ Line: 5 ]] --[[ Name: getSnappedToVoxel ]]
    -- upvalues: v1 (copy)
    local v3 = v2 / v1.VoxelResolution;
    return Vector3.new(math.round(v3.X), math.round(v3.Y), (math.round(v3.Z))) * v1.VoxelResolution;
end;