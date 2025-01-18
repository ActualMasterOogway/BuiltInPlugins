local v0 = {};
local l_Stats_0 = game:GetService("Stats");
local function v7(v2, v3) --[[ Line: 7 ]] --[[ Name: assignMaxTextureSize ]]
    local _, v5 = string.find(v3.TextureId, "?id=");
    if v5 then
        local v6 = v3.TextureId:match("%d+[^%d]*$");
        v2[v6] = v2[v6] and math.max(v2[v6], v3.MemoryInBytes) or v3.MemoryInBytes;
        return;
    else
        v2[v3.TextureId] = v2[v3.TextureId] and math.max(v2[v3.TextureId], v3.MemoryInBytes) or v3.MemoryInBytes;
        return;
    end;
end;
v0.fetchTextureSizes = function() --[[ Line: 24 ]] --[[ Name: fetchTextureSizes ]]
    -- upvalues: l_Stats_0 (copy), v7 (copy)
    local v8 = {};
    local l_l_Stats_0_PaginatedMemoryByTexture_0 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 10000);
    local l_l_Stats_0_PaginatedMemoryByTexture_1 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 10000);
    for _, v12 in ipairs(l_l_Stats_0_PaginatedMemoryByTexture_0.Results) do
        v7(v8, v12);
    end;
    for _, v14 in ipairs(l_l_Stats_0_PaginatedMemoryByTexture_1.Results) do
        v7(v8, v14);
    end;
    return v8;
end;
v0.calculateAggregateStats = function(v15) --[[ Line: 42 ]] --[[ Name: calculateAggregateStats ]]
    local v16 = #v15;
    local v17 = 0;
    for _, v19 in ipairs(v15) do
        v17 = v17 + v19.Size;
    end;
    return v16, v17;
end;
return v0;