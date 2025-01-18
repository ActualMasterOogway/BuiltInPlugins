local l_insert_0 = table.insert;
return function(v1) --[[ Line: 11 ]] --[[ Name: values ]]
    -- upvalues: l_insert_0 (copy)
    local v2 = {};
    for _, v4 in v1 do
        l_insert_0(v2, v4);
    end;
    return v2;
end;