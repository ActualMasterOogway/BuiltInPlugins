return function(v0) --[[ Line: 1 ]] --[[ Name: ComputeMasterSeed ]]
    local v1 = 0;
    for v2 = 1, #v0 do
        local v3 = v0:sub(v2, v2);
        local v4 = tonumber(v3);
        v1 = (if v4 then (v1 + 6) * (v4 + 5) else (v1 + 7) * (v3:byte() + 3)) % 61803;
    end;
    return v1;
end;