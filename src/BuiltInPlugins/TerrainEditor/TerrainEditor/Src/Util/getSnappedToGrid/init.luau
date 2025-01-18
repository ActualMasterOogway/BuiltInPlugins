local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: getSnappedToGrid ]]
    -- upvalues: v1 (copy)
    local v4 = v2 / (v3 * v1.VoxelResolution);
    return Vector3.new(math.round(v4.X), math.round(v4.Y), (math.round(v4.Z))) * v3 * v1.VoxelResolution;
end;