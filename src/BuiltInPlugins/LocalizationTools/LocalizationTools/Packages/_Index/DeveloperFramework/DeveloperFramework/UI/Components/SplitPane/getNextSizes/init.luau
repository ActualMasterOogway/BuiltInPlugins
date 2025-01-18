local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3, v4, v5, v6) --[[ Line: 14 ]] --[[ Name: getNextSizes ]]
    local v7 = {};
    local v8 = #v2.Sizes;
    local v9 = v5 and 1 or -1;
    local function _(v10) --[[ Line: 26 ]] --[[ Name: toOffset ]]
        -- upvalues: v4 (copy)
        if v10 then
            return v10.Scale * v4 + v10.Offset;
        else
            return 0;
        end;
    end;
    local v12 = v2.MaxSizes or {};
    local v13 = 0;
    local v14 = 0;
    local v15 = 0;
    local v16 = 0;
    for v17 = 1, v8 do
        local v18 = v2.MinSizes[v17];
        local v19 = if v18 then v18.Scale * v4 + v18.Offset else 0;
        if v12[v17] then
            local v20 = v12[v17];
            v18 = if v20 then v20.Scale * v4 + v20.Offset else 0;
        else
            v18 = 1e999;
        end;
        if if v5 then v6 < v17 else v17 < v6 then
            v13 = v13 + v19;
            v14 = v14 + v18;
        else
            v15 = v15 + v19;
            v16 = v16 + v18;
        end;
    end;
    local v21 = math.min(v16, (math.max(v15, (math.min(v4 - v13, (math.max(if v14 then v4 - v14 else 0, v3)))))));
    local v22 = v5 and 1 or v8;
    local v23 = 0;
    for v24 = v6, v22, -v9 do
        local v25 = v2.Sizes[v24];
        v23 = v23 + if v25 then v25.Scale * v4 + v25.Offset else 0;
    end;
    local v26 = v21 - v23;
    local l_v26_0 = v26;
    local v28 = v6 + v9;
    local v29 = if v5 then v8 else 1;
    for v30 = v28, v29, v9 do
        local v31 = not v2.ClampSize and v5;
        local v32 = v2.Sizes[v30];
        local v33 = if v32 then v32.Scale * v4 + v32.Offset else 0;
        local v34 = v2.MinSizes[v30];
        v32 = if v34 then v34.Scale * v4 + v34.Offset else 0;
        v34 = if not v31 and v26 > 0 then math.max(v33 - v26, v32) else v33;
        v26 = v26 - (v33 - v34);
        v7[v30] = if v2.UseScale then UDim.new(v34 / v4, 0) else UDim.new(0, v34);
    end;
    for v35 = v6, v22, -v9 do
        local v36 = not v2.ClampSize and not v5;
        local v37 = v2.Sizes[v35];
        local v38 = if v37 then v37.Scale * v4 + v37.Offset else 0;
        if v12[v35] then
            local v39 = v12[v35];
            v37 = if v39 then v39.Scale * v4 + v39.Offset else 0;
        else
            v37 = 1e999;
        end;
        local v40 = if not v36 and l_v26_0 > 0 then math.min(v38 + l_v26_0, v37) else v38;
        l_v26_0 = l_v26_0 - (v40 - v38);
        v7[v35] = if v2.UseScale then UDim.new(v40 / v4, 0) else UDim.new(0, v40);
    end;
    if v2.UseDeficit and v2.ClampSize and not v2.UseScale then
        v7[v8] = UDim.new(1, v7[v8].Offset - v4);
    end;
    return v7;
end;