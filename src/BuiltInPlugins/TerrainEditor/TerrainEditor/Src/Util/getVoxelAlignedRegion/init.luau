return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: getVoxelAlignedRegion ]]
    local function _(v3) --[[ Line: 2 ]] --[[ Name: getVoxelFloored ]]
        -- upvalues: v2 (copy)
        return math.floor(v3 / v2) * v2;
    end;
    local v5 = math.floor((v0.Position.X - v1.X / 2) / v2) * v2;
    local v6 = math.floor((v0.Position.X + v1.X / 2) / v2) * v2;
    local v7 = math.floor((v0.Position.Y - v1.Y / 2) / v2) * v2;
    local v8 = math.floor((v0.Position.Y + v1.Y / 2) / v2) * v2;
    local v9 = math.floor((v0.Position.Z - v1.Z / 2) / v2) * v2;
    local v10 = math.floor((v0.Position.Z + v1.Z / 2) / v2) * v2;
    local v11 = Vector3.new(v6 - v5, v8 - v7, v10 - v9);
    return CFrame.new((Vector3.new((v5 + v6) / 2, (v7 + v8) / 2, (v9 + v10) / 2))), v11;
end;