return function(v0, v1) --[[ Line: 4 ]]
    local l_index_0 = v1.trail.index;
    local l_id_0 = v1.trail.id;
    local l_index_1 = v1.anchor.index;
    local l_id_1 = v1.anchor.id;
    local l_index_2 = v1.lead.index;
    local l_id_2 = v1.lead.id;
    local v8 = #v0.itemList;
    if v8 < l_index_0 then
        l_index_0 = v8;
    end;
    if v8 < l_index_1 then
        l_index_1 = v8;
    end;
    if v8 < l_index_2 then
        l_index_2 = v8;
    end;
    local function _(v9) --[[ Line: 27 ]]
        -- upvalues: v0 (copy)
        return v0.identifier(v0.itemList[v9]);
    end;
    local v11 = v0.identifier(v0.itemList[l_index_0]) == l_id_0;
    local v12 = v0.identifier(v0.itemList[l_index_1]) == l_id_1;
    local v13 = v0.identifier(v0.itemList[l_index_2]) == l_id_2;
    if v11 and v12 and v13 then
        return l_index_0, l_index_1, l_index_2;
    else
        local v14 = 0;
        local v15 = v11 and l_index_0 or nil;
        local v16 = nil;
        local v17 = v13 and l_index_2 or nil;
        local v18 = {
            top = -1, 
            bottom = 1
        };
        repeat
            for _, v20 in pairs(v18) do
                local v21 = l_index_1 + v20 * v14;
                if v21 >= 1 and v21 <= v8 then
                    local v22 = v0.identifier(v0.itemList[v21]);
                    if v22 == l_id_0 then
                        v15 = v21;
                    end;
                    if v22 == l_id_1 then
                        v16 = v21;
                    end;
                    if v22 == l_id_2 then
                        v17 = v21;
                    end;
                end;
            end;
            v14 = v14 + 1;
        until v15 and v16 and v17 or v0.maximumSearchDistance < v14;
        return v15, v16, v17;
    end;
end;