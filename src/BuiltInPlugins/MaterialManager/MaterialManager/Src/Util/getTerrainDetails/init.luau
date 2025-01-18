return function(v0) --[[ Line: 1 ]]
    local v1 = {};
    for _, v3 in v0:GetChildren() do
        if v3:IsA("TerrainDetail") and not v1[v3.Face] then
            v1[v3.Face] = v3;
        end;
    end;
    return v1;
end;