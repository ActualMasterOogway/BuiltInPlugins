return function(v0, v1) --[[ Line: 11 ]] --[[ Name: filter ]]
    local v2 = {};
    for v3, v4 in v0 do
        if v1(v4, v3) then
            table.insert(v2, v4);
        end;
    end;
    return v2;
end;