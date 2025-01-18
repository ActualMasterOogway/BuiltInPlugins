local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: ClampVoxelBoundaries ]]
    -- upvalues: v1 (copy)
    local v5 = Vector3.new(v3, v4 * 0.5, v3);
    local v6 = v2 - v5;
    local v7 = v2 + v5;
    return Vector3.new(math.floor(v6.X / v1.VoxelResolution), math.floor(v6.Y / v1.VoxelResolution), (math.floor(v6.Z / v1.VoxelResolution))) * v1.VoxelResolution, Vector3.new(math.ceil(v7.X / v1.VoxelResolution), math.ceil(v7.Y / v1.VoxelResolution), (math.ceil(v7.Z / v1.VoxelResolution))) * v1.VoxelResolution;
end;