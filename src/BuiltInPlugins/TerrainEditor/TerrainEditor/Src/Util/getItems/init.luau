local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_EnumTypeIndices_0 = require(l_script_FirstAncestor_0.Src.Types).EnumTypeIndices;
return function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: getItems ]]
    -- upvalues: l_EnumTypeIndices_0 (copy)
    local v5 = {};
    for _, v7 in l_EnumTypeIndices_0[v4] do
        table.insert(v5, {
            Icon = if v3 then v3:get(v4, {})[v4][v7] else nil, 
            Id = v7, 
            Label = if v2 then v2:getText(v4, v7) else nil
        });
    end;
    return v5;
end;