local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_useState_0 = require(l_script_FirstAncestor_0.Packages.React).useState;
return function() --[[ Line: 7 ]] --[[ Name: useSelection ]]
    -- upvalues: l_useState_0 (copy)
    local v2, v3 = l_useState_0(Region3.new(Vector3.new(-64, -64, -64, 0), (Vector3.new(64, 64, 64, 0))));
    return v2, v3;
end;