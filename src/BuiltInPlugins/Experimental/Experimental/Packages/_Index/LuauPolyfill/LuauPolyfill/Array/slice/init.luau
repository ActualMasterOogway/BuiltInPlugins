return function(v0, v1, v2) --[[ Line: 8 ]]
    if typeof(v0) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(v0))));
    end;
    local v3 = #v0;
    if v1 == nil then
        v1 = 1;
    end;
    if v2 == nil or v3 + 1 < v2 then
        v2 = v3 + 1;
    end;
    if v3 + 1 < v1 then
        return {};
    else
        local v4 = {};
        if v1 < 1 then
            v1 = math.max(v3 - math.abs(v1), 1);
        end;
        if v2 < 1 then
            v2 = math.max(v3 - math.abs(v2), 1);
        end;
        local l_v1_0 = v1;
        local v6 = 1;
        while l_v1_0 < v2 do
            v4[v6] = v0[l_v1_0];
            l_v1_0 = l_v1_0 + 1;
            v6 = v6 + 1;
        end;
        return v4;
    end;
end;