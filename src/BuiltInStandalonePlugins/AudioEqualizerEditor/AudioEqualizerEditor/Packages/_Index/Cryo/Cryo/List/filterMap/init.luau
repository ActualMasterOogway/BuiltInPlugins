return function(v0, v1) --[[ Line: 7 ]] --[[ Name: filterMap ]]
    local v2 = {};
    local v3 = 1;
    for v4 = 1, #v0 do
        local v5 = v1(v0[v4], v4);
        if v5 ~= nil then
            v2[v3] = v5;
            v3 = v3 + 1;
        end;
    end;
    return v2;
end;