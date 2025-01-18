local l_CollectionService_0 = game:GetService("CollectionService");
return function(...) --[[ Line: 3 ]] --[[ Name: getAny ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v1 = select("#", ...);
    assert(v1 ~= 0, "getAny should receive at least one tag");
    if v1 == 1 then
        return l_CollectionService_0:GetTagged((...));
    else
        local v2 = {};
        local v3 = {};
        for v4 = 1, v1 do
            local v5 = select(v4, ...);
            for _, v7 in ipairs(l_CollectionService_0:GetTagged(v5)) do
                if not v2[v7] then
                    v2[v7] = true;
                    table.insert(v3, v7);
                end;
            end;
        end;
        return v3;
    end;
end;