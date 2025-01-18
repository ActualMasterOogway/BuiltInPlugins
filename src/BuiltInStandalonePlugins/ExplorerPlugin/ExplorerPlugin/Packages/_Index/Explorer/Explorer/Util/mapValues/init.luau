return function(v0, v1) --[[ Line: 1 ]] --[[ Name: mapValues ]]
    local v2 = {};
    for v3, v4 in v0 do
        v2[v3] = v1(v4, v3);
    end;
    return v2;
end;