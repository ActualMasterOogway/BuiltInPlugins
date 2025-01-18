return function(v0) --[[ Line: 12 ]]
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12 = v0:components();
    local v13 = false;
    if v1 == 0 then
        v13 = false;
        if v2 == 0 then
            v13 = v3 == 0;
        end;
    end;
    assert(v13);
    return CFrame.new(0, 0, 0, math.floor(v4 + 0.5), math.floor(v5 + 0.5), math.floor(v6 + 0.5), math.floor(v7 + 0.5), math.floor(v8 + 0.5), math.floor(v9 + 0.5), math.floor(v10 + 0.5), math.floor(v11 + 0.5), (math.floor(v12 + 0.5)));
end;