local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getBoundingBox);
local l_MaxExtents_0 = game.workspace.Terrain.MaxExtents;
local function _(v3, v4) --[[ Line: 8 ]] --[[ Name: greaterThanOrEqual ]]
    local v5 = false;
    if v3.X >= v4.X then
        v5 = false;
        if v4.Y >= v4.Y then
            v5 = v3.Z >= v4.Z;
        end;
    end;
    return v5;
end;
return function(v7, v8) --[[ Line: 12 ]] --[[ Name: getWithinTerrainBounds ]]
    -- upvalues: v1 (copy), l_MaxExtents_0 (copy)
    local v9, v10 = v1(v7, v8);
    local v11 = Vector3.new(l_MaxExtents_0.Min.X, l_MaxExtents_0.Min.Y, l_MaxExtents_0.Min.Z);
    local v12 = Vector3.new(l_MaxExtents_0.Max.X, l_MaxExtents_0.Max.Y, l_MaxExtents_0.Max.Z);
    local v13 = false;
    if v9.X >= v11.X then
        v13 = false;
        if v11.Y >= v11.Y then
            v13 = v9.Z >= v11.Z;
        end;
    end;
    if v13 then
        v13 = false;
        if v12.X >= v10.X then
            v13 = false;
            if v10.Y >= v10.Y then
                v13 = v12.Z >= v10.Z;
            end;
        end;
    end;
    return v13;
end;