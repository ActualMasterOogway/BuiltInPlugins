local l_insert_0 = table.insert;
return function(v1, v2) --[[ Line: 16 ]] --[[ Name: groupBy ]]
    -- upvalues: l_insert_0 (copy)
    local v3 = {};
    for v4, v5 in pairs(v1) do
        local v6 = nil;
        v6 = if typeof(v2) == "function" then v2(v5, v4) else v5[v2];
        if v6 ~= nil then
            if v3[v6] ~= nil then
                l_insert_0(v3[v6], v5);
            else
                v3[v6] = {
                    v5
                };
            end;
        end;
    end;
    return v3;
end;