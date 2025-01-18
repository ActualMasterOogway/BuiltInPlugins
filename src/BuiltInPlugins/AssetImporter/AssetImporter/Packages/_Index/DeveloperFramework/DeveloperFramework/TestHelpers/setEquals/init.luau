return function(v0, v1) --[[ Line: 2 ]]
    for v2 in pairs(v0) do
        if not v1[v2] then
            return false;
        end;
    end;
    for v3 in pairs(v1) do
        if not v0[v3] then
            return false;
        end;
    end;
    return true;
end;