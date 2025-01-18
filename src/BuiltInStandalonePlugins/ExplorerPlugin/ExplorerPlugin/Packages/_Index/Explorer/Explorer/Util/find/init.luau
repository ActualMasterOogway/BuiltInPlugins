return function(v0, v1) --[[ Line: 1 ]] --[[ Name: find ]]
    for v2, v3 in v0 do
        if v1(v3) then
            return v3, v2;
        end;
    end;
    return nil, nil;
end;