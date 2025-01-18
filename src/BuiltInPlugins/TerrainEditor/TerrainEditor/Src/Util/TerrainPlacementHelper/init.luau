local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local v3 = {};
v3.Place = function(v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: Place ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v7 == v2.TerrainType.Volcano or v7 == v2.TerrainType.Mountain or v7 == v2.TerrainType.Mesa then
        return v3.EmptyThreshold(v4, v5);
    elseif v7 == v2.TerrainType.Crater or v7 == v2.TerrainType.Lake then
        return v3.OccupiedThreshold(v4, v5);
    else
        return v3.SurfaceThreshold(v4, v5, v6);
    end;
end;
v3.EmptyThreshold = function(v8, v9) --[[ Line: 28 ]] --[[ Name: EmptyThreshold ]]
    -- upvalues: v1 (copy)
    local v10 = v8.Position - v9 / 2 - Vector3.new(0, v1.PlacementSnap * v1.VoxelResolution, 0);
    local v11 = v8.Position + Vector3.new(v9.X, -v9.Y, v9.Z) / 2;
    local v12 = Region3.new(v10, v11);
    local l_Terrain_0 = game:GetService("Workspace").Terrain;
    assert(l_Terrain_0, "Terrain should exist");
    local v14, v15 = l_Terrain_0:ReadVoxels(v12, 4);
    local v16 = #v14;
    local v17 = #v14[1];
    local v18 = #v14[1][1];
    for v19 = v17, 1, -1 do
        local v20 = false;
        for v21 = 1, v16 do
            for v22 = 1, v18 do
                if v15[v21][v19][v22] == 0 and v14[v21][v19][v22] == Enum.Material.Air then
                    v20 = true;
                end;
            end;
        end;
        if not v20 then
            return v8 + Vector3.new(0, v17 - v19, 0) * v1.VoxelResolution;
        end;
    end;
    return v8;
end;
v3.OccupiedThreshold = function(v23, v24) --[[ Line: 63 ]] --[[ Name: OccupiedThreshold ]]
    -- upvalues: v1 (copy)
    local v25 = v23.Position + Vector3.new(-v24.X, v24.Y, -v24.Z) / 2;
    local v26 = v23.Position + v24 / 2 + Vector3.new(0, v1.PlacementSnap * v1.VoxelResolution, 0);
    local v27 = Region3.new(v25, v26);
    local l_Terrain_1 = game:GetService("Workspace").Terrain;
    assert(l_Terrain_1, "Terrain should exist");
    local v29, v30 = l_Terrain_1:ReadVoxels(v27, 4);
    local v31 = #v29;
    local v32 = #v29[1];
    local v33 = #v29[1][1];
    for v34 = 1, v32 do
        local v35 = false;
        for v36 = 1, v31 do
            for v37 = 1, v33 do
                if v30[v36][v34][v37] ~= 0 and v29[v36][v34][v37] ~= Enum.Material.Air then
                    v35 = true;
                end;
            end;
        end;
        if not v35 then
            return v23 + Vector3.new(0, v34 - 1, 0) * v1.VoxelResolution;
        end;
    end;
    return v23;
end;
v3.SurfaceThreshold = function(v38, v39, v40) --[[ Line: 97 ]] --[[ Name: SurfaceThreshold ]]
    -- upvalues: v1 (copy)
    local v41 = math.floor(v39.Y * v40 * 0.5 / v1.VoxelResolution) * v1.VoxelResolution;
    return v38 + Vector3.new(0, -(v39.Y / 2) + v41, 0);
end;
return v3;