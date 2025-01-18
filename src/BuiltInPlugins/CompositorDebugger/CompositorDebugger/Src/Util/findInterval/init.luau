local v0 = {
    0.05, 
    0.1, 
    0.25, 
    0.5, 
    1
};
return function(v1) --[[ Line: 18 ]]
    -- upvalues: v0 (copy)
    local v2 = math.pow(10, (math.floor((math.log10(v1)))));
    local v3 = v1 / v2 / 10;
    local v4 = v0[1];
    for _, v6 in v0 do
        if v3 < v6 then
            v4 = v6;
            break;
        end;
    end;
    return v4 * v2;
end;