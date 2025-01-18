return function(v0, v1) --[[ Line: 1 ]] --[[ Name: filterList ]]
    local v2 = {};
    for _, v4 in v0 do
        if v1(v4) then
            table.insert(v2, v4);
        end;
    end;
    if #v2 == #v0 then
        return v0;
    else
        return v2;
    end;
end;