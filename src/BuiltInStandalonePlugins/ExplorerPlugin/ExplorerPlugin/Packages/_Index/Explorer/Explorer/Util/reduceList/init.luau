return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: reduceList ]]
    local l_v2_0 = v2;
    for _, v5 in v0 do
        l_v2_0 = v1(l_v2_0, v5);
    end;
    return l_v2_0;
end;