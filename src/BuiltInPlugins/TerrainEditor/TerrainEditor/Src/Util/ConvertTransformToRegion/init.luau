local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getBoundingBox);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: ConvertTransformToRegion ]]
    -- upvalues: v1 (copy)
    local v5, v6 = v1(v2, v3, v4);
    return (Region3int16.new(Vector3int16.new(math.floor(v5.X / 4), math.floor(v5.Y / 4), (math.floor(v5.Z / 4))), Vector3int16.new(math.ceil(v6.X / 4), math.ceil(v6.Y / 4), (math.ceil(v6.Z / 4)))));
end;