local l_insert_0 = table.insert;
return function(v1, v2) --[[ Line: 13 ]] --[[ Name: collectArray ]]
    -- upvalues: l_insert_0 (copy)
    local v3 = {};
    for v4, v5 in v1 do
        local v6 = v2(v4, v5);
        if v6 ~= nil then
            l_insert_0(v3, v6);
        end;
    end;
    return v3;
end;