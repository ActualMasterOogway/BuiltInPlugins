return {
    fetchOldColumnSizes = function(v0, v1, v2, v3) --[[ Line: 3 ]]
        local v4 = {};
        for v5 = 1, #v2 do
            v4[v2[v5]] = v3[v5];
        end;
        for v6 = #v2 + 1, v0 do
            v4[v1[v6 - #v2]] = v3[v6];
        end;
        return v4;
    end, 
    fetchDeletedColumnsSize = function(v7, v8, v9, v10, v11) --[[ Line: 16 ]]
        local v12 = 0;
        for v13 = v7 + 1, v8 do
            if v11[v9[v13 - v7]] == nil then
                v12 = v12 + v10[v9[v13 - v7]].Scale;
            end;
        end;
        return v12;
    end, 
    updatedSizesAfterRemovingColumns = function(v14, v15, v16, v17, v18) --[[ Line: 33 ]]
        local v19 = {};
        local v20 = 1 - v15;
        for v21 = 1, v14 do
            local v22 = if v17[v21] then v17[v21] else v18[v21 - #v17];
            table.insert(v19, (UDim.new(v16[v22].Scale / v20, 0)));
        end;
        return v19;
    end, 
    updatedSizesAfterAddingColumns = function(v23, v24, v25, v26, v27) --[[ Line: 50 ]]
        local v28 = {};
        local v29 = v23 - v24;
        local v30 = UDim.new(1 / v23, 0);
        for v31 = 1, v23 do
            local v32 = if v27[v31] then v27[v31] else v26[v31 - #v27];
            if v25[v32] == nil then
                table.insert(v28, v30);
            else
                local v33 = v29 * v30.Scale;
                local v34 = v25[v32].Scale * (1 - v33);
                table.insert(v28, (UDim.new(v34, 0)));
            end;
        end;
        return v28;
    end, 
    fetchScaleFromColumnSizes = function(v35) --[[ Line: 76 ]]
        local v36 = {};
        for _, v38 in ipairs(v35) do
            table.insert(v36, v38.Scale);
        end;
        return v36;
    end, 
    fetchSizesFromColumnScales = function(v39) --[[ Line: 84 ]]
        local v40 = {};
        for _, v42 in ipairs(v39) do
            table.insert(v40, UDim.new(v42, 0));
        end;
        return v40;
    end
};