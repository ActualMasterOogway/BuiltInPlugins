local l_CollectionService_0 = game:GetService("CollectionService");
return function(...) --[[ Line: 3 ]] --[[ Name: getAll ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v1 = select("#", ...);
    assert(v1 ~= 0, "getAll should receive at least one tag");
    local v2 = ...;
    if v1 == 1 then
        return l_CollectionService_0:GetTagged(v2);
    else
        local v3 = {};
        for _, v5 in ipairs(l_CollectionService_0:GetTagged(v2)) do
            local v6 = true;
            for v7 = 2, v1 do
                local v8 = select(v7, ...);
                if not l_CollectionService_0:HasTag(v5, v8) then
                    v6 = false;
                    break;
                end;
            end;
            if v6 then
                table.insert(v3, v5);
            end;
        end;
        return v3;
    end;
end;