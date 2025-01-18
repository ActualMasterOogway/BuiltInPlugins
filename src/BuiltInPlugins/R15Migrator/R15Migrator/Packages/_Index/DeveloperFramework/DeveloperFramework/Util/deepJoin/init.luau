local function v0(v1, v2) --[[ Line: 1 ]] --[[ Name: deepJoin ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for v4, v5 in pairs(v1) do
        if typeof(v5) == "table" then
            if v2[v4] and typeof(v2[v4]) == "table" then
                v3[v4] = v0(v5, v2[v4]);
            else
                v3[v4] = v0(v5, {});
            end;
        else
            v3[v4] = v5;
        end;
    end;
    for v6, v7 in pairs(v2) do
        if typeof(v7) == "table" then
            if not v1[v6] then
                v3[v6] = v0(v7, {});
            end;
        else
            v3[v6] = v7;
        end;
    end;
    return v3;
end;
return v0;