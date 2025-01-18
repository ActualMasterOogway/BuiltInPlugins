local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local _ = require(l_script_FirstAncestor_0.Types);
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: applySymmetryMap ]]
    local v4 = {};
    for v5, v6 in v3 do
        for v7, v8 in v6 do
            if v2[v5] ~= nil then
                local v9 = v2[v5][v7];
                if v9 ~= nil then
                    for _, v11 in v9 do
                        if v4[v11.targetName] == nil then
                            v4[v11.targetName] = {};
                        end;
                        if v4[v11.targetName][v11.vertex] == nil then
                            v4[v11.targetName][v11.vertex] = v8;
                        end;
                    end;
                end;
            end;
        end;
    end;
    for v12, v13 in v4 do
        if v3[v12] == nil then
            v3[v12] = {};
        end;
        for v14, v15 in v13 do
            if v3[v12] == nil or v3[v12][v14] == nil then
                v3[v12][v14] = -v15;
            end;
        end;
    end;
end;