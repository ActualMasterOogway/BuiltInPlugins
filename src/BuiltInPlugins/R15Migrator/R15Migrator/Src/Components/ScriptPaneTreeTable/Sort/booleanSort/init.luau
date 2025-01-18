return function(v0, v1, v2) --[[ Line: 5 ]]
    local v3 = v0 and 1 or 0;
    local v4 = v1 and 1 or 0;
    if v3 == v4 then
        return nil;
    elseif v2 == Enum.SortDirection.Descending then
        return v3 < v4;
    else
        return v4 < v3;
    end;
end;