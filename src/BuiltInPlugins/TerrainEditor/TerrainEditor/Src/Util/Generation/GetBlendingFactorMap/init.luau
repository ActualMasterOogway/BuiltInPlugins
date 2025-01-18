local function _(v0, v1, v2, v3) --[[ Line: 8 ]] --[[ Name: mapToGaussianCurve ]]
    assert(v3 > 0, "w should be greater than 0");
    return v1 - math.exp(-(v0 * v0) / v3) * v2;
end;
return function(v5, v6) --[[ Line: 13 ]] --[[ Name: GetBlendingFactorMap ]]
    local l_PreserveRatio_0 = v6.PreserveRatio;
    local l_PreserveDistance_0 = v6.PreserveDistance;
    local l_BlendingStrength_0 = v6.BlendingStrength;
    local v10 = Vector2.new(v5.X / 2, v5.Y / 2);
    local l_Magnitude_0 = v10.Magnitude;
    local v12 = math.min(v10.X, v10.Y);
    local v13 = table.create(v5.X * v5.Y, 0);
    for v14 = 1, v5.X do
        for v15 = 1, v5.Y do
            local l_Magnitude_1 = (Vector2.new(v14, v15) - v10).Magnitude;
            local v17 = l_Magnitude_1 / l_Magnitude_0;
            local v18 = l_Magnitude_1 / v12;
            v17 = 1 * v17 + 0 * v18;
            if v17 > 0 and v17 < 1 then
                local l_v17_0 = v17;
                assert(l_PreserveRatio_0 > 0, "w should be greater than 0");
                v17 = math.clamp(1 - math.exp(-(l_v17_0 * l_v17_0) / l_PreserveRatio_0) * l_PreserveDistance_0, 0, 1) * l_BlendingStrength_0;
            end;
            v13[(v14 - 1) * v5.Y + v15] = math.clamp(v17, 0, 1);
        end;
    end;
    return v13;
end;